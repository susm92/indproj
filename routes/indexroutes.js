"use strict"

const express = require("express");
const router = express.Router();
const indproj = require("../src/indproj.js")

module.exports = router;

router.get("/", (req, res) => {
    res.render("pages/index.ejs");
});

router.get("/courses", async (req, res) => {
    let data = {};

    data.res = await indproj.showSubjects();

    res.render("pages/all-subjects", data);
});
