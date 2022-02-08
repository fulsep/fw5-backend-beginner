const route = require('express').Router();

route.use('/vehicles', require('./vehicles'));

route.get('/', (req, res)=> {
    return res.json({
        success: true,
        message: 'Backend is running well!'
    })
})

module.exports = route;