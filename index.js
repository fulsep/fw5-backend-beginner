const express = require('express');
require('dotenv').config()

const app = express();

app.use(express.urlencoded({extended: true}));

app.use(require('./src/routes'));
app.use('/uploads', express.static('uploads'))

const {APP_PORT} = process.env

app.listen(APP_PORT, ()=>{
    console.log(`App listening on port ${APP_PORT}`);
});