const response = require('../helpers/response');
const bcrypt = require('bcrypt');
const userModel = require('../models/users');

exports.createUser = async (req, res) => {
  const { name, username, email, password: plainPassword, phone, birthdate, gender, address } = req.body;
  const salt = await bcrypt.genSalt(10);
  const password = await bcrypt.hash(plainPassword, salt);
  const results = await userModel.createUser({ name, username, email, password, phone, birthdate, gender, address });
  if (results.affectedRows >= 1) {
    return response(res, 'User created successfully!');
  }
  // return response(res, 'User created successfully!');
};