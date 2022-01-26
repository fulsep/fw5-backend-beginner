const db = require('../helpers/db')

exports.getVehicles = (cb) => {
  db.query('SELECT * FROM vehicles', (err, res) => {
    if (err) throw err;
    cb(res)
  })
}

exports.getVehicle = (id, cb) => {
  db.query('SELECT * FROM vehicles WHERE id=?', [id], (err, res) => {
    if (err) throw err;
    cb(res)
  })
}