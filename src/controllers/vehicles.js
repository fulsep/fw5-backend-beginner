const vehicleModel = require('../models/vehicles');
const {APP_URL} = process.env
const upload = require('../helpers/upload').single('image');
const fs = require('fs');
const response = require('../helpers/response');

const getVehicles = (req, res) => {
    vehicleModel.getVehicles(results => {
        const processedResult = results.map((obj)=> {
            if(obj.image !==null){
                obj.image = `${APP_URL}/${obj.image}`
            }
            return obj
        })
        return res.json({
            success: true,
            message: 'List Vehicles',
            results: processedResult
        });
    });
};

const getVehicle = (req, res) => {
    const {
        id
    } = req.params;
    vehicleModel.getVehicle(id, results => {
        if (results.length > 0) {
            // fs.rm(results[0].image, {}, function(err){
                // if(err) {
                //     return res.status(500).json({
                //         success: false,
                //         message: 'File not found'
                //     })
                // }
                const data = results[0]
                return res.json({
                    success: true,
                    message: 'Detail Vehicle',
                    results: data
                });
            // })
        } else {
            return res.status(404).json({
                success: false,
                message: 'Vehicle not found'
            });
        }
    });
};

const createVehicle = (req, res) => {
    upload(req, res, function(err){
        if(err){
            return res.status(400).json({
                success: false,
                message: err.message
            })
        }
        const data = {
            name: req.body.name,
            price: req.body.price,
            qty: req.body.qty,
            category_id: req.body.categoryId
        }
        if(req.file){
            data.image = req.file.path
        }
        vehicleModel.createVehicle(data, (results)=>{
            vehicleModel.getVehicle(results.insertId, (fin)=> {
                const mapResults = fin.map(o => {
                    if(o.image!== null){
                        o.image = `${APP_URL}/${o.image}`
                    }
                    return o
                })
                return res.send({
                    success: true,
                    message: 'Vehicle data created!',
                    results: mapResults[0]
                })
            })
        })
    })
}

const updateVehicle = async(req, res)=> {
  const {id} = req.params
  const result = await vehicleModel.getVehicleAsync(id)
  if(result.length >= 1){
    const data = {
    }
    // data["discount"] == data.discount
    const fillable = ["price", "name", "qty", "image", "category_id"]
    fillable.forEach(field => {
      if(req.body[field]){
        data[field] = req.body[field] // data.qty = req.body.qty
      }
    })
    try{
      const resultUpdate = await vehicleModel.updateVehicleAsync(data, id)
      if(resultUpdate.affectedRows){
        const fetchNew = await vehicleModel.getVehicleAsync(id)
        return response(res, "Update Success", fetchNew[0])
      }
    }catch(err){
      return response(res, "Unexpected Error", null, 400)
    }
  }else{
    return res.status(400).json({
      success: false,
      message: 'Unexpected data'
    })
  }
}

module.exports = {
    getVehicles,
    getVehicle,
    createVehicle,
    updateVehicle
};