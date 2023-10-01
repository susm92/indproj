--
-- 2023-09-15
-- susm20, SELECT querys and others
--

use indproj;

--
-- procedure to show all available subjects
--
DROP PROCEDURE IF EXISTS show_subjects;
DELIMITER ;;
CREATE PROCEDURE show_subjects()
BEGIN
	SELECT * from subjects;
END
;;
DELIMITER ;


--
-- Procedure to show specific courses
--
DROP PROCEDURE IF EXISTS show_courses;
DELIMITER ;;
CREATE PROCEDURE show_courses(
    a_id int
)
BEGIN
    SELECT * FROM courses WHERE subject_id = a_id;
END
;;
DELIMITER ;

--
-- Procedure to show course
--
DROP PROCEDURE IF EXISTS show_specific_subject;
DELIMITER ;;
CREATE PROCEDURE show_specific_subject(
    a_id int
)
BEGIN
    SELECT * FROM subjects WHERE subject_id = a_id;
END
;;
DELIMITER ;

call show_specific_subject(1);

--
-- Procedure to show specific subject
--
DROP PROCEDURE IF EXISTS show_decks;
DELIMITER ;;
CREATE PROCEDURE show_decks(
    a_id int
)
BEGIN
    SELECT * FROM decks WHERE course_id = a_id;
END
;;
DELIMITER ;

--
-- Procedure to show specific subject
--
DROP PROCEDURE IF EXISTS specific_deck;
DELIMITER ;;
CREATE PROCEDURE specific_deck(
    a_id int
)
BEGIN
    SELECT * FROM questions WHERE deck_id = a_id;
END
;;
DELIMITER ;


-- Just used to test querys
-- call show_subjects();
-- select * from courses;
-- select * from subjects;
-- call show_courses(2);
select * from questions;
select * from decks;