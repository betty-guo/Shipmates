const express = require('express');
const app = express();
const routes = express.Router();

require('dotenv').config();
const { Client } = require("cassandra-driver");
const { v4: uuidv4 } = require('uuid');
const axios = require('axios');

const client = new Client({
    cloud: {
      secureConnectBundle: "./secure-connect-toHacks2021.zip",
    },
    credentials: {
      username: process.env.CLIENT_ID,
      password: process.env.CLIENT_SECRET,
    },
  });

// Testing route
routes.route('/').get((req,res) => {
	return res.send('TOHacks2021');
});

// POST user to users table
routes.route('/users').post((req,res) => {
    axios.post(`https://${process.env.ASTRA_DB_ID}-${process.env.ASTRA_DB_REGION}.apps.astra.datastax.com/api/rest/v2/keyspaces/dev/users`, 
    {
        id: uuidv4(),
        name: req.body.name, 
        phone_numeber: req.body.phone_numeber,
        email: req.body.email,
        address: req.body.address,
        pfp: req.body.pfp,
        rating: req.body.rating
    },
    {
        headers: {
            "X-Cassandra-Token": process.env.ASTRA_DB_APPLICATION_TOKEN,
            "Content-Type": "application/json"
        }
    })
        .then(response => {
            return res.send(response.data);
        })
        .catch((err) => {
            return res.send(err);
        });
});

// Get USER by email
routes.route('/users').get((req,res) => {
    axios.get(`https://${process.env.ASTRA_DB_ID}-${process.env.ASTRA_DB_REGION}.apps.astra.datastax.com/api/rest/v2/keyspaces/dev/users/${req.body.primary_key}`, 
    {
        headers: {
            "X-Cassandra-Token": process.env.ASTRA_DB_APPLICATION_TOKEN,
            "Content-Type": "application/json"
        }
    })
        .then(response => {
            return res.send(response.data);
        })
        .catch((err) => {
            return res.send(err);
        });
});


module.exports = routes;
