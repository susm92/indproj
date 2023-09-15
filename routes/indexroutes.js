"use strict"

const express = require("express");
const router = express.Router();
const indproj = require("../src/indproj.js")

module.exports = router;

router.get("/", (req, res) => {
    res.render("pages/index");
});

router.get("/subjects", async (req, res) => {
    let data = {};

    data.res = await indproj.showSubjects();

    console.log(data);

    res.render("pages/subjects", data);
});
