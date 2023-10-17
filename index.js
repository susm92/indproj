"use strict";

const port    = 8002;
const express = require('express');
//const session = require('express-session');
const path = require('path');
const app = express();
const indexRoutes = require('./routes/indexroutes.js');
const middleware = require('./middleware/index.js');

app.set('view engine', 'ejs');

// Configure session middleware
//app.use(
//  session({
//    secret: 'your-secret-key',
//    resave: false,
//    saveUninitialized: true
//  })
//);

app.use(middleware.logIncomingToConsole);
app.use(express.static(path.join(__dirname, 'views')));
app.use('/', indexRoutes);
app.listen(port, logStartUpDetailsToConsole);

/**
 * Log app details to console when starting up.
 *
 * @return {void}
 */
function logStartUpDetailsToConsole() {
  let routes = [];

  // Find what routes are supported
  app._router.stack.forEach((middleware) => {
    if (middleware.route) {
      // Routes registered directly on the app
      routes.push(middleware.route);
    } else if (middleware.name === 'router') {
      // Routes added as router middleware
      middleware.handle.stack.forEach((handler) => {
        let route;

        route = handler.route;
        route && routes.push(route);
      });
    }
  });

  console.info(`Server is listening on port ${port}.`);
  console.info('Available routes are:');
  console.info(routes);
}
