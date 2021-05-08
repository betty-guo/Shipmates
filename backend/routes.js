const express = require('express');
const app = express();
const routes = express.Router();

routes.route('/').get((req,res)=>{
	res.send('TOHacks2021');
});

module.exports = routes;
