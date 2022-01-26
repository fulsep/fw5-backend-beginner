const vehicleModel = require('../models/vehicles')

const getVehicles = (req, res) => {
  vehicleModel.getVehicles(results => {
    return res.json({
      success: true,
      message: 'List Vehicles',
      results: results
    })
  })
}

const getVehicle = (req, res) => {
  const {
    id
  } = req.params
  vehicleModel.getVehicle(id, results => {
    if (results.length > 0) {
      return res.json({
        success: true,
        message: 'Detail Vehicle',
        results: results[0]
      })
    } else {
      return res.status(404).json({
        success: false,
        message: 'Vehicle not found'
      })
    }
  })
}

module.exports = {
  getVehicles,
  getVehicle
}