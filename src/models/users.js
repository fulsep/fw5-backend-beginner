const db = require('../helpers/db');

exports.createUser = (data) => new Promise((resolve, reject) => {
  db.query(`INSERT INTO users (name, username, email, password, phone, birthdate, gender, address) VALUES ("${data.name}", "${data.username}", "${data.email}", "${data.password}", "${data.phone}", "${data.birthdate}", "${data.gender}", "${data.address}")`, (err, res) => {
    if (err) reject(err);
    resolve(res);
  });
});

exports.getUserByUsername = (username) => new Promise((resolve, reject) => {
  db.query('SELECT id, username, password FROM users WHERE username=?', [username], (err, res) => {
    if (err) reject(err);
    resolve(res);
  });
});