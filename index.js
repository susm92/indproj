"use strict"

const express = require("express");
const port = 8002;
const app = express();
const indexRoutes = require("./routes/indexroutes.js");

app.use(express.static("views"));

app.use(indexRoutes);

app.listen(port, () => {
    console.log(`Listening on port: ${port}`);
});