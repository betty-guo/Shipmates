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
routes.route('/users')
.post((req,res) => {
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
})

// GET user by id
.get((req,res) => {
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

// POST active session to active sessions table
routes.route('/active-sessions')
.post((req,res) => {
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
})

// GET active session by id
.get((req,res) => {
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
})
// Update active session by id
.patch((req,res) => {
    axios.patch(`https://${process.env.ASTRA_DB_ID}-${process.env.ASTRA_DB_REGION}.apps.astra.datastax.com/api/rest/v2/keyspaces/dev/active_sessions/${req.query.id}`, 
    req.body, 
    {
        headers: {
            "X-Cassandra-Token": process.env.ASTRA_DB_APPLICATION_TOKEN,
            "Content-Type": "application/json"
        },
    })
        .then(response => {
            return res.send(response.data);
        })
        .catch((err) => {
            return res.send(err);
        });
});

// GET all active sessions
routes.route('/all-active-sessions')
.get((req,res) => {
    axios.get(`https://${process.env.ASTRA_DB_ID}-${process.env.ASTRA_DB_REGION}.apps.astra.datastax.com/api/rest/v2/keyspaces/dev/active_sessions/rows`, 
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

// GET active sessions by host
routes.route('/active-sessions-by-host')
.get((req,res) => {
    axios.get(`https://${process.env.ASTRA_DB_ID}-${process.env.ASTRA_DB_REGION}.apps.astra.datastax.com/api/rest/v2/keyspaces/dev/active_sessions/rows`, 
    {
        headers: {
            "X-Cassandra-Token": process.env.ASTRA_DB_APPLICATION_TOKEN,
            "Content-Type": "application/json"
        }
    })
        .then(response => {
            var arr = response.data.data;
            var newArr = [];
            for (var i in arr){
                if (arr[i].host == req.query.host_id) {
                    newArr.push(arr[i]);
                }
            }
            return res.send(newArr);
        })
        .catch((err) => {
            return res.send(err);
        });
});

// GET active sessions by you are involved but not host
routes.route('/active-sessions-by-contrib')
.get((req,res) => {
    axios.get(`https://${process.env.ASTRA_DB_ID}-${process.env.ASTRA_DB_REGION}.apps.astra.datastax.com/api/rest/v2/keyspaces/dev/active_sessions/rows`, 
    {
        headers: {
            "X-Cassandra-Token": process.env.ASTRA_DB_APPLICATION_TOKEN,
            "Content-Type": "application/json"
        }
    })
        .then(response => {
            var arr = response.data.data;
            var newArr = [];
            for (var i in arr){
                if (arr[i].users.includes(req.query.user_id) && arr[i].host != req.query.user_id) {
                    newArr.push(arr[i]);
                }
            }
            return res.send(newArr);
        })
        .catch((err) => {
            return res.send(err);
        });
});

// POST send SMS notification to given phone number through Courier
routes.route('/send-notification')
.post((req, res) => {
    axios.post(`https://api.courier.com/send`,
    {
        "event": process.env.COURIER_EVENT_ID,
        "data": {
            "name": req.body.name,
        },
        "profile": {
            "phone_number": req.body.phone_number
        },
        "recipient": req.body.phone_number
    },
    {
        headers: {
            "Authorization": process.env.COURIER_AUTHORIZE_TOKEN
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
