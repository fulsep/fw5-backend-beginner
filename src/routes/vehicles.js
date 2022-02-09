const vehicles = require('express').Router();

const {getVehicles, getVehicle, createVehicle, updateVehicle} = require('../controllers/vehicles');

vehicles.get('/', getVehicles);
vehicles.post('/', createVehicle);
vehicles.get('/:id', getVehicle);
vehicles.patch('/:id', updateVehicle);


module.exports = vehicles;