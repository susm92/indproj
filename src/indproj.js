"use strict";

module.exports = {
    showSubjects: showSubjects,
    showSubject: showSubject,
    showDecks: showDecks,
    specificDeck: specificDeck,
    specificSubject: specificSubject,
    createCourse: createCourse,
    showSubjectCourse: showSubjectCourse,
    showCourse: showCourse,
    createDeck: createDeck,
    createQuestion: createQuestion,
    showCourseDeck: showCourseDeck
};

const mysql  = require("promise-mysql");
const config = require("../config/db/indproj.json");
let db;

/**
 * Main function.
 * @async
 * @returns void
 */
(async function() {
    db = await mysql.createConnection(config);

    process.on("exit", () => {
        db.end();
    });
})();

/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showSubjects() {
    let sql = `CALL show_subjects();`;
    let res;

    res = await db.query(sql);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}

/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showSubject(id) {
    let sql = `CALL show_courses(?);`;
    let res;

    res = await db.query(sql, [id]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}


/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showDecks(id) {
    let sql = `CALL show_decks(?);`;
    let res;

    res = await db.query(sql, [id]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}



/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function specificDeck(id) {
    let sql = `CALL specific_deck(?);`;
    let res;

    res = await db.query(sql, [id]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}



/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function specificSubject(id) {
    let sql = `CALL show_specific_subject(?);`;
    let res;

    res = await db.query(sql, [id]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}



/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function createCourse(name, id) {
    let sql = `INSERT INTO Courses (name, subject_id) VALUES (?, ?);`;
    let res;

    res = await db.query(sql, [name, id]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}



/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showSubjectCourse(id) {
    let sql = `SELECT courses.*, subjects.name as s_name
    FROM courses
    INNER JOIN subjects
    ON courses.subject_id = subjects.subject_id
    WHERE courses.course_id = ?;`;
    let res;

    res = await db.query(sql, [id]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}


/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showCourse(id) {
    let sql = `select * from courses where course_id = ?;`;
    let res;

    res = await db.query(sql, [id]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}


/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function createDeck(id, name) {
    let sql = `INSERT INTO decks (course_id, name) VALUES (?, ?);`;
    let res;

    res = await db.query(sql, [id, name]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}


/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function createQuestion(id, text, answer) {
    let sql = `INSERT INTO questions (deck_id, question_text, answer) VALUES (?, ?, ?);`;
    let res;

    res = await db.query(sql, [id, text, answer]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}


/**
 * Show all entries in the account table.
 *
 * @async
 * @returns {RowDataPacket} Resultset from the query.
 */
async function showCourseDeck(id) {
    let sql = `SELECT courses.*, decks.name as d_name, decks.deck_id as d_id
    FROM courses
    INNER JOIN decks ON courses.course_id = decks.course_id
    WHERE decks.deck_id = ?;`;
    let res;

    res = await db.query(sql, [id]);
    //console.log(res);
    console.info(`SQL: ${sql} got ${res.length} rows.`);

    return res[0];
}
