const route = require('express').Router();

route.use('/vehicles', require('./vehicles'));
route.use('/users', require('./users'));
route.use('/auth', require('./auth'));

route.get('/', (req, res) => {
  return res.json({
    success: true,
    message: 'Backend is running well!'
  });
});

module.exports = route;