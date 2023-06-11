const express = require('express');

const app = express();

const {query, IdByToken} = require('./database.js');

app.post('/submit', async (req, res) => {
    const DATA = req.body;
    const check = [
        DATA?.username,
        DATA?.score
    ]
    if (check.includes(undefined)) {
        return res.status(400);
    }

    const userlookup = await query('SELECT * FROM User WHERE username = ?', [DATA.username]);

    if(userlookup.err) {
        return res.status(500);
    }

    const newuser = userlookup.rows.length === 0;
    let id ;
    if(newuser) {
        const userinsert = await query('INSERT INTO User (username) VALUES (?)', [DATA.username]);
        if(userinsert.err) {
            return res.status(500);
        }
        id = userinsert.rows.insertId;
    }else {
        id = userlookup.rows[0].id;
    }

    const insertscore = await query('INSERT INTO Score (score, userid) VALUES (?, ?)', [DATA.score, id]);

    if(insertscore.err) {
        return res.status(500);
    }

    const placequery = await query('SELECT COUNT(*) FROM Score WHERE score > ?', [DATA.score]);

    if(placequery.err) {
        return res.status(500);
    }

    const place = placequery.rows[0]['COUNT(*)'] + 1;

    return res.status(200).json({place});
});

app.get('/leaderboard', async (req, res) => {
    const leaderboard = query('SELECT User.username, Score.score FROM Score INNER JOIN User ON Score.userid = User.id ORDER BY Score.score DESC LIMIT 25');
    if(leaderboard.err) {
        return res.status(500);
    }
    return res.status(200).json(leaderboard.rows);
});

app.get('/user/:username', async (req, res) => {
    const username = req.params.username;
    const userlookup = await query('SELECT * FROM User WHERE username = ?', [username]);
    if(userlookup.err) {
        return res.status(500);
    }
    if(userlookup.rows.length === 0) {
        return res.status(404);
    }
    const id = userlookup.rows[0].id;
    const scorelookup = await query('SELECT score FROM Score WHERE userid = ? ORDER BY score DESC LIMIT 1', [id]);
    if(scorelookup.err) {
        return res.status(500);
    }
    const score = scorelookup.score;
    return res.status(200).json({username, score});
});

