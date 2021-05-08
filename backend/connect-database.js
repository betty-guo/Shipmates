require('dotenv').config();
const { Client } = require("cassandra-driver");

async function run() {
    const client = new Client({
      cloud: {
        secureConnectBundle: "./secure-connect-toHacks2021.zip",
      },
      credentials: {
        username: process.env.CLIENT_ID,
        password: process.env.CLIENT_SECRET,
      },
    });
  
    await client.connect();
  
    // Execute a query
    const rs = await client.execute("SELECT * FROM system.local");
    console.log(`Your cluster returned ${rs.rowLength} row(s)`);
  
    await client.shutdown();
  }
  
  // Run the async function
  run();
  