const express = require('express');
const app = express();
const routes = express.Router();
// const client = require('./connect-database');

require('dotenv').config();
const { Client } = require("cassandra-driver");

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

routes.route('/users').get(async (req,res) => {
    await client.connect();
    // Execute a query
    const rs = await client.execute("SELECT * FROM system.local");
    return res.send(`Your cluster returned ${rs.rowLength} row(s)`);
});

module.exports = routes;
