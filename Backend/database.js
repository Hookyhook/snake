/*
Creating database connection over the my mysql2 module.
*/
const mysql = require("mysql2");
const connection = mysql.createConnection({
  host: "lsglab.ddns.net",
  user: "lab",
  password: "92&kPAcEe9",
  database: "snake",
});
/*
IMPORTANT! crashes backend if DB connection cant be established
*/
connection.connect((err) => {
  if (err) throw err;
});

/*
Function that sends query to database. Returns sucess in a boolean and fields (will be empty if the statement does not select data from DB)
*/
exports.query = (QUERY, DATA) => {
  return new Promise((resolve) => {
    connection.execute(QUERY, DATA, (err, results) => {
      resolve({ err: Boolean(err), rows: results });
    });
  });
};
