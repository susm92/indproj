"use strict";

const express = require("express");
const router = express.Router();
const bodyParser = require("body-parser");
const urlencodedParser = bodyParser.urlencoded({ extended: false });
const indproj = require("../src/indproj.js");

module.exports = router;

router.get("/", (req, res) => {
    res.render("pages/index");
});

router.get("/subjects", async (req, res) => {
    let data = {};

    data.res = await indproj.showSubjects();

    //console.log(data);

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

    data.res = await indproj.showSubject(id);
    data.city = await indproj.specificSubject(id);


    //console.log(data);

    res.render("pages/subject-view", data);
});

router.get("/decks-view/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        subject: id
    };

    data.res = await indproj.showDecks(id);
    data.city = await indproj.showSubjectCourse(id);

    //console.log(data);

    res.render("pages/decks", data);
});

/* ---------------------------------------- */
/* -------------- QUIZ MODE --------------- */
/* ---------------------------------------- */

router.get("/quiz-deck/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        subject: id
    };

    data.res = await indproj.specificDeck(id);
    data.course = await indproj.showCourseDeck(id);

    console.log(data);

    res.render("pages/quiz-deck", data);
});

router.post("/quiz-deck/:id", urlencodedParser, async (req, res) => {
    console.log(JSON.stringify(req.body, null, 4));
    //console.log(JSON.stringify(req.params.id));
    
    let data = await indproj.specificDeck(req.params.id);
    let answer = req.body.q_answer;
    let counter = 0;

    for (let i=0; i < data.length; i++) {
        if (data[i].answer == answer[i]) {
            counter++;
        }
    }

    console.log(counter);
});

/* ---------------------------------------- */
/* -------------- STUDY MODE -------------- */
/* ---------------------------------------- */

router.get("/study-deck/:id", async (req, res) => {
    let id = req.params.id;
    let data = {
        subject: id
    };

    data.res = await indproj.specificDeck(id);
    data.course = await indproj.showCourseDeck(id);

    //console.log(data);

    res.render("pages/study-deck", data);
});

/* ---------------------------------------- */
/* ------------- CHOSEN MODE -------------- */
/* ---------------------------------------- */

router.get("/mode/:id", (req, res) => {
    let id = req.params.id;
    let data = {
        subject: id
    };

    //console.log(data);
    res.render("pages/mode", data);
});

router.post("/mode/:id", urlencodedParser, async (req, res) => {
    //console.log(JSON.stringify(req.body, null, 4));

    if (req.body.mode == 'study') {
        res.redirect(`/study-deck/${req.body.deck_id}`);
    } else {
        res.redirect(`/quiz-deck/${req.body.deck_id}`);
    }
});

/* ---------------------------------------- */
/* ------------ CREATE SUBJECT ------------ */
/* ---------------------------------------- */

router.get("/create-subject", async (req, res) => {
    res.render("pages/create-subject");
});

router.post("/create-subject", urlencodedParser, async (req, res) => {
    //console.log(JSON.stringify(req.body, null, 4));
    await indproj.createSubject(req.body.subject);
    res.redirect(`subjects`);
});


/* ---------------------------------------- */
/* ------------ CREATE COURSE ------------- */
/* ---------------------------------------- */

router.get("/create-course/:subject", async (req, res) => {
    let subject = req.params.subject;
    let data = {
        subject: subject,
    };

    data.res = await indproj.specificSubject(subject);

    //console.log(data);

    res.render("pages/create-course", data);
});

router.post("/create-course", urlencodedParser, async (req, res) => {
    //console.log(JSON.stringify(req.body, null, 4));
    await indproj.createCourse(req.body.name, req.body.subject);
    res.redirect(`subject-view/${req.body.subject}`);
});


/* ---------------------------------------- */
/* ------------- CREATE DECK -------------- */
/* ---------------------------------------- */

router.get("/create-deck/:subject", async (req, res) => {
    let subject = req.params.subject;
    let data = {
        subject: subject,
    };

    data.res = await indproj.showCourse(subject);

    //console.log(data);

    res.render("pages/create-deck", data);
});

router.post("/create-deck", urlencodedParser, async (req, res) => {
    //console.log(JSON.stringify(req.body, null, 4));
    await indproj.createDeck(req.body.course_id, req.body.name);
    res.redirect(`decks-view/${req.body.course_id}`);
});

/* ---------------------------------------- */
/* ----------- CREATE QUESTION ------------ */
/* ---------------------------------------- */

router.get("/create-question/:subject", async (req, res) => {
    let subject = req.params.subject;
    let data = {
        subject: subject,
    };

    //console.log(data);

    res.render("pages/create-question", data);
});

router.post("/create-question", urlencodedParser, async (req, res) => {
    //console.log(JSON.stringify(req.body, null, 4));
    await indproj.createQuestion(req.body.deck_id, req.body.question_text, req.body.answer);
    res.redirect(`study-deck/${req.body.deck_id}`);
});
