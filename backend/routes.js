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

// GET user by id
routes.route('/users').get((req,res) => {
    axios.get(`https://${process.env.ASTRA_DB_ID}-${process.env.ASTRA_DB_REGION}.apps.astra.datastax.com/api/rest/v2/keyspaces/dev/users/${req.query.id}`, 
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

// GET user by email
// routes.route('/users').get((req,res) => {
//     axios.get(`https://${process.env.ASTRA_DB_ID}-${process.env.ASTRA_DB_REGION}.apps.astra.datastax.com/api/rest/v2/keyspaces/dev/users/${req.body.primary_key}`, 
//     {
//         headers: {
//             "X-Cassandra-Token": process.env.ASTRA_DB_APPLICATION_TOKEN,
//             "Content-Type": "application/json"
//         }
//     })
//         .then(response => {
//             return res.send(response.data);
//         })
//         .catch((err) => {
//             return res.send(err);
//         });
// });


// POST active session to active sessions table
routes.route('/active-sessions').post((req,res) => {
    axios.post(`https://${process.env.ASTRA_DB_ID}-${process.env.ASTRA_DB_REGION}.apps.astra.datastax.com/api/rest/v2/keyspaces/dev/active_sessions`, 
    {
        id: uuidv4(),
        url: req.body.url, 
        deadline: req.body.deadline,
        current_shipping_price: req.body.current_shipping_price,
        current_cart_price: req.body.current_cart_price,
        num_people: req.body.num_people,
        max_people: req.body.max_people,
        email: req.body.email,
        users: req.body.users,
        items: req.body.items,
        host: req.body.host,
        state: req.body.state
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

// GET active sessions by id
routes.route('/active-sessions').get((req,res) => {
    axios.get(`https://${process.env.ASTRA_DB_ID}-${process.env.ASTRA_DB_REGION}.apps.astra.datastax.com/api/rest/v2/keyspaces/dev/active_sessions/${req.query.id}`, 
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
