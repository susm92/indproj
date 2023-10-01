--
-- Only used for testing
-- 2023-09-29
-- @susm20
--

use indproj;

select * from courses where course_id = 9;
select * from subjects;

SELECT courses.*, subjects.name as s_name
FROM courses
INNER JOIN subjects ON courses.subject_id = subjects.subject_id
WHERE courses.course_id = 2;

select * from decks;
select * from courses;
select * from courses;

select * from courses where course_id = 3;

select * from questions;
select * from decks;


SELECT courses.*, decks.name as d_name, decks.deck_id as d_id
FROM courses
INNER JOIN decks ON courses.course_id = decks.course_id
WHERE decks.deck_id = 5;


select * from questions where question_id = 5;

UPDATE questions
SET question_text = 'test1'
WHERE question_id = 5;

