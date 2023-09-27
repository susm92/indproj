"use strict"

const express = require("express");
const router = express.Router();
const session = require('express-session');
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

router.get("/about", (req, res) => {
    res.render("pages/about");
});

router.get("/subject-view/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        subject: id
    };

    data.res = await indproj.showSubject(id)

    console.log(data);

    res.render("pages/subject-view", data);
});

router.get("/decks-view/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        subject: id
    };

    data.res = await indproj.showDecks(id)

    console.log(data);

    res.render("pages/decks", data);
});

router.get("/specific-deck/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        subject: id,
        indexCounter: 0
    };

    data.res = await indproj.specificDeck(id)

    console.log(data); 

    res.render("pages/specific-deck", data);
});
