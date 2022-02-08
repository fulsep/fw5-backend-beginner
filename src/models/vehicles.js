const db = require('../helpers/db');

exports.getVehicles = (cb) => {
    db.query('SELECT * FROM vehicles', (err, res) => {
        if (err) throw err;
        cb(res);
    });
};

exports.getVehicle = (id, cb) => {
    db.query('SELECT * FROM vehicles WHERE id=?', [id], (err, res) => {
        if (err) throw err;
        cb(res);
    });
};

exports.createVehicle = (data, cb) => {
    db.query('INSERT INTO `vehicles` (name, image, price, qty, category_id) VALUES (?, ?, ?, ?, ?)', [data.name, data.image, data.price, data.qty, data.category_id], (err, res)=> {
        if(err) throw err;
        cb(res)
    })
}