# To create data tables

### Set up your .env file to hold tokens/secrets:
```
ASTRA_DB_ID=<database_id>
ASTRA_DB_REGION=<database_region>
ASTRA_DB_KEYSPACE=<keyspace_name>
ASTRA_DB_APPLICATION_TOKEN=<app_token>
```

### Users table:
```
curl -s --location \
--request POST http://$ASTRA_CLUSTER_ID-$ASTRA_REGION.apps.astra.datastax.com/api/rest/v2/schemas/keyspaces/dev/tables \
--header "X-Cassandra-Token: $ASTRA_DB_APPLICATION_TOKEN" \
--header "Content-Type: application/json" \
--header "Accept: application/json" \
--data '{
	"name": "users",
    "primaryKey": {"partitionKey":["id"]},
    "columnDefinitions":
	    {
            "name": "id",
            "typeDefinition": "uuid"
        },
        {
	      "name": "name",
	      "typeDefinition": "text"
	    },
        {
	      "name": "phone_number",
	      "typeDefinition": "text"
	    },
        {
	      "name": "email",
	      "typeDefinition": "text"
	    },
        {
	      "name": "address",
	      "typeDefinition": "text"
	    },
        {
	      "name": "pfp",
	      "typeDefinition": "text"
	    },
        {
	      "name": "rating",
	      "typeDefinition": "int"
	    }
	  ],
    "ifNotExists": true
}'
```

### Active sessions table
```
curl -s --location \
--request POST http://$ASTRA_CLUSTER_ID-$ASTRA_REGION.apps.astra.datastax.com/api/rest/v2/schemas/keyspaces/dev/tables \
--header "X-Cassandra-Token: $ASTRA_DB_APPLICATION_TOKEN" \
--header "Content-Type: application/json" \
--header "Accept: application/json" \
--data '{
	"name": "active_sessions",
    "primaryKey": {"partitionKey":["id"]},
    "columnDefinitions":
	  [
        {
            "name": "id",
            "typeDefinition": "uuid"
        },
        {
	      "name": "url",
	      "typeDefinition": "text"
	    },
        {
	      "name": "deadline",
	      "typeDefinition": "text"
	    },
        {
	      "name": "email",
	      "typeDefinition": "text"
	    },
        {
	      "name": "current_shipping_price",
	      "typeDefinition": "text"
	    },
        {
	      "name": "current_cart_price",
	      "typeDefinition": "text"
	    },
        {
	      "name": "num_people",
	      "typeDefinition": "int"
	    },
        {
	      "name": "max_people",
	      "typeDefinition": "int"
	    },
        {
	      "name": "users",
	      "typeDefinition": "list<uuid>"
	    },
        {
	      "name": "items",
	      "typeDefinition": "list<list<text>>"
	    },
        {
	      "name": "host",
	      "typeDefinition": "uuid"
	    },
        {
	      "name": "state",
	      "typeDefinition": "text"
	    }
	  ],
    "ifNotExists": true
}'
```
Note: past sessions has the same body as active_sessions
