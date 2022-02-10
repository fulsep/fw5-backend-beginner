const db = require('../helpers/db');

exports.getVehicles = (cb) => {
  db.query('SELECT * FROM vehicles', (err, res) => {
    if (err) throw err;
    cb(res);
  });
};

exports.getVehicle = (id, cb) => {
  db.query('SELECT id, name, image, price, (price * 20/100) as minPrepayment, qty, category_id, createdAt, updatedAt FROM vehicles WHERE id=?', [id], (err, res) => {
    if (err) throw err;
    cb(res);
  });
};

exports.getVehicleAsync = (id) => new Promise((resolve, reject)=> {
  db.query('SELECT * FROM vehicles WHERE id=?', [id], (err, res) => {
    if (err) reject(err);
    resolve(res);
  });
});

exports.createVehicle = (data, cb) => {
  db.query('INSERT INTO `vehicles` (name, image, price, qty, category_id) VALUES (?, ?, ?, ?, ?)', [data.name, data.image, data.price, data.qty, data.category_id], (err, res)=> {
    if(err) throw err;
    cb(res);
  });
};

exports.updateVehicle = (data, id, cb) => {
  db.query('UPDATE `vehicles` SET ? WHERE id=?', [data, id], (err, res)=> {
    if(err) throw err;
    cb(res);
  });
};

exports.updateVehicleAsync = (data, id) => new Promise((resolve, reject)=> {
  db.query('UPDATE `vehicles` SET ? WHERE id=?', [data, id], (err, res)=> {
    if(err) reject(err);
    resolve(res); // Object => affectedRows
  });
});