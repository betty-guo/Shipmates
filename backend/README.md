# Backend Instructions

1. Ask for the `secure-connect-tohacks2021.zip` and add to the root of the `backend` folder
2. Set up your `.env` file in the root of the `backend` folder:
```
CLIENT_ID=
CLIENT_SECRET=
PORT=5000 (for localhost)
ASTRA_DB_ID=<database_id>
ASTRA_DB_REGION=<database_region>
ASTRA_DB_KEYSPACE=<keyspace_name>
ASTRA_DB_APPLICATION_TOKEN=<app_token>
```
Ask for values in the `.env`.

3. `node server.js` to run the express server.