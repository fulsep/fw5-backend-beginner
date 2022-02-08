const vehicles = require('express').Router();

const {getVehicles, getVehicle, createVehicle} = require('../controllers/vehicles');

vehicles.get('/', getVehicles);
vehicles.post('/', createVehicle);
vehicles.get('/:id', getVehicle);


module.exports = vehicles;