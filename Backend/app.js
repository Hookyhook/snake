const express = require("express"); // Import the Express framework

const app = express(); // Create an Express application

const cors = require("cors"); // Import the CORS middleware

const { query } = require("./database.js"); // Import the database query function

app.use(express.json()); // Middleware to parse JSON data in the request body
app.use(cors()); // Enable CORS for cross-origin requests

app.get("/", (req, res) => {
  res.status(200).send("Snake API"); // Define the root route that returns a simple message
});

app.get("/submit/:username/:score", async (req, res) => {
  const DATA = req.params; // Extract the username and score from the request parameters

  const check = [DATA?.username, DATA?.score]; // Create an array to check if any required data is missing
  if (check.includes(undefined)) {
    return res.status(400); // If any required data is missing, return a 400 Bad Request status
  }

  const userlookup = await query("SELECT * FROM user WHERE username = ?", [
    DATA.username,
  ]); // Query the database to lookup the user based on the provided username

  console.log(userlookup); // Log the userlookup result

  if (userlookup.err) {
    return res.status(500); // If an error occurred during the query, return a 500 Internal Server Error status
  }

  const newuser = userlookup.rows.length === 0; // Check if the user is new or existing
  console.log(newuser); // Log whether the user is new or existing

  let id;
  if (newuser) {
    // If the user is new, insert a new user into the database
    const userinsert = await query("INSERT INTO user (username) VALUES (?)", [
      DATA.username,
    ]);

    if (userinsert.err) {
      return res.status(500); // If an error occurred during the user insertion, return a 500 Internal Server Error status
    }

    id = userinsert.rows.insertId; // Get the inserted user's ID
  } else {
    id = userlookup.rows[0].id; // Get the existing user's ID
  }

  console.log(id); // Log the user's ID

  const insertscore = await query(
    "INSERT INTO score (score, userid) VALUES (?, ?)",
    [DATA.score, id]
  ); // Insert the user's score into the database, associating it with the user's ID

  console.log(insertscore); // Log the insertscore result

  if (insertscore.err) {
    return res.status(500); // If an error occurred during the score insertion, return a 500 Internal Server Error status
  }

  const placequery = await query("SELECT COUNT(*) FROM score WHERE score > ?", [
    DATA.score,
  ]); // Query the database to determine the user's rank based on their score

  if (placequery.err) {
    return res.status(500); // If an error occurred during the query, return a 500 Internal Server Error status
  }

  const place = placequery.rows[0]["COUNT(*)"] + 1; // Calculate the user's rank

  console.log(place); // Log the user's rank

  return res.status(200).send({ place }); // Return a 200 OK status along with the user's rank
});

app.get("/leaderboard", async (req, res) => {
  const leaderboard = await query(
    "SELECT user.username, score.score FROM score INNER JOIN user ON score.userid = user.id ORDER BY score.score DESC LIMIT 25"
  ); // Query the database to retrieve the top 25 scores with usernames

  console.log(leaderboard); // Log the leaderboard result

  if (leaderboard.err) {
    return res.status(500); // If an error occurred during the query, return a 500 Internal Server Error status
  }

  return res.status(200).send(leaderboard.rows); // Return a 200 OK status along with the leaderboard data
});

app.get("/user/:username", async (req, res) => {
  const username = req.params.username; // Extract the username from the request parameters

  const userlookup = await query("SELECT * FROM user WHERE username = ?", [
    username,
  ]); // Query the database to lookup the user based on the provided username

  if (userlookup.err) {
    return res.status(500); // If an error occurred during the query, return a 500 Internal Server Error status
  }

  if (userlookup.rows.length === 0) {
    return res.status(404); // If the user was not found, return a 404 Not Found status
  }

  const id = userlookup.rows[0].id; // Get the user's ID

  console.log(id); // Log the user's ID

  const scorelookup = await query(
    "SELECT score FROM score WHERE userid = ? ORDER BY score DESC LIMIT 1",
    [id]
  ); // Query the database to retrieve the user's highest score

  console.log(scorelookup); // Log the scorelookup result

  if (scorelookup.err) {
    return res.status(500); // If an error occurred during the query, return a 500 Internal Server Error status
  }

  const score = scorelookup.score; // Get the user's highest score

  return res
    .status(200)
    .send({ username: username, highscore: scorelookup.rows[0].score }); // Return a 200 OK status along with the user's information and highest score
});

app.listen(2457); // Start the server on port 2457
