const db = require('../helpers/db');

exports.createRequest = (user_id, code) => new Promise((resolve, reject) => {
  db.query('INSERT INTO forgot_request (user_id, code) VALUES (?,?)', [user_id, code], (err, res) => {
    if (err) reject(err);
    resolve(res);
  });
});

exports.updateRequest = (data, id) => new Promise((resolve, reject) => {
  db.query('UPDATE `forgot_request` SET ? WHERE id=?', [data, id], (err, res) => {
    if (err) reject(err);
    resolve(res);
  });
});

exports.getRequest = (code) => new Promise((resolve, reject) => {
  db.query('SELECT * FROM forgot_request WHERE code=?', [code], (err, res) => {
    if (err) reject(err);
    resolve(res);
  });
});