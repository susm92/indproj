"use strict";

module.exports = {
    showSubjects: showSubjects,
    showSubject: showSubject,
    showDecks: showDecks,
    specificDeck: specificDeck
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