# TOHacks2021

**A mobile app that allows nearby individuals to group online orders into one shipment to reduce their carbon footprint, split the cost of shipping, and save money through bulk purchasing.**

## Inspiration 🌈
* the carbon footprint of individually mailed packages from the packaging and environmental cost of individually transporting items
* the rise of eCommerce and online consumerism with the digital age and accelerated by the COVID-19 pandemic
* living in proximity with many friends on a University campus with no platform to coordinate group purchases
* the undercover group purchases that happen on platforms like Reddit and WeChat with no platform formally and securely conduct these transactions
* our passion for trying to achieve _free shipping status_ on our online purchases 

## What it does 🚢
* Allow users to join and create sessions based on non-urgent online shopping purchases to reduce their environmental footprint from ordering numerous smaller packages, potentially save some money through bulk purchases, and split the cost of shipping 
* **Home Page** all of the users hosted sessions and sessions they have contributed to keeping track of their state
* **Browse Page** allows users to browse active sessions with their details and join sessions to contribute to 
* **Create Page** allows users to create and host a new session filling out a form with the details of their new session
* **Profile Page** allows users to view the details of their profile

## How we built it 📦
##### Backend
* `Express` server written using `Nodejs` that implements the `Axios` library to interact with our `DataStax` tables
* REST API endpoints for CRUD operations to interact with the database 
* `POST` endpoint hits Courier API to send text message notifications on update using the Courier x Twilio integration

**users table**:
```
id: uuid,
name: text,
phone_number: text,
email: text,
address: text, 
pfp: text,
rating: int
```

**active_sessions table**
```
active_sessions
id: uuid,
deadline: text,
current_shipping_price: float,
current_cart_price: float,
num_people: int,
max_people: int,
emial: text,
users: list<uuid>,
items: list<list<text>>,
host: uuid,
state
```
(Also, a `past_sessions` table with the same columns as the `active_sessions` table)

`active_sessions` states and their meaning: 
* `collecting`: open session and others are free to join
* `pending`: a new user joined the session and the prices/info is pending approval and update from the host of the session
* `closed`: no one else can join the session and waiting for the host to prompt for payments
* `payments`: host is collecting payments to hold in the application for all users who joined the session
* `ordered`: all payments have been collected and stored in the application and the host verifies that they have ordered the product
* `pickup`: items have arrived and the host indicates that they are ready for pickup

##### Frontend
* Cross-platform application written using Flutter
* Leverages Material UI theme for cohesive look
* State management and state passing using MobX
* Live and dynamic based on server side logic

## Challenges we ran into 👊
* the learning curve associated with using Flutter, DataStax, and Courier for the first time
* collaborating virtually to complete the project by making good use of Git
* working on documentation to pass over backend config to help with integration frontend <> backend integration
* storing and preserving state in `Flutter` across pages
* creating custom queries to retrieve data in the backend: e.g. getting all contributors to a session who are not hosting 
* setting up our environment to develop in Flutter in different operating systems 😅
* ~~Android Studio emulators~~

## Accomplishments that we're proud of 🏅
* successfully integrating `DataStax` into our application 
* utilizing built-in Flutter components for a clean (relative to our past hackathon projects) UI
* maintaining backend documentation throughout the hackathon
* taking on a very large project for the hackathon and planning out a realistic POC to complete for the 24 hours of hacking
* compartmentalizing and delegating tasks to best make use of our individual skillsets
* successfully pair programming virtually using Live Share (not really an accomplishment but this was fun) 😀

## What we learned 🤔
* how to manage and preserve state through `Flutter` components and pages
* how to make and interact with `DataStax` tables
* a lot of planning and initial prioritization of tasks to reflect on 

## What's next for Shipmates ⏭ 
##### warning: many ideas for this section - contribute some too 😊
* integrating with a service to allow for secure payment sending, holding in the application, and transfer upon state change in the application (we thought about using `Stripe` for this)
* refining user table related operations: allow the user to update fields in their profile
* adding a social aspect to the application: allow users to add friends, set sessions to private (only for friends to see)
* more filters on the browse page: by geographic location, by store, by type of store, and eventually providing recommendations based on past purchases
* incentivize hosts to create sessions: determining and creating a model for hosts to gain a bit of commission for efforts in hosting the sessions
* automating and integrating with eCommerce websites to import images and prices directly from URL's to avoid as much manual input of prices (another idea is to make a browser extension to automatically host sessions from )
* extending from mobile to also have a web application for ease of access
* allowing users to select what kind of notifications they would like to receive (email, push, text) and supporting them - also more custom messages based on state (adding the actionable in the notification e.g. ready for pickup)

Domain.com domain name idea:  💡
```
shipmates.tech
```
