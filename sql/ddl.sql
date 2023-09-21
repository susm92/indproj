--
-- 2023-09-15
-- susm20, creates and updates tables
--

drop database if exists indproj;

create database indproj;

use indproj;

drop table if exists subjects;
drop table if exists courses;
drop table if exists decks;
drop table if exists questions;

CREATE TABLE subjects (
    subject_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(70) UNIQUE
);

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    name CHAR(70),
    subject_id INT,
    FOREIGN KEY (subject_id) REFERENCES subjects (subject_id)
);

CREATE TABLE decks (
	deck_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    name CHAR(70),
	FOREIGN KEY (course_id) REFERENCES courses (course_id)
);

CREATE TABLE questions (
    question_id INT AUTO_INCREMENT PRIMARY KEY,
    deck_id INT,
    question_text TEXT,
    answer TEXT,
    FOREIGN KEY (deck_id) REFERENCES decks (deck_id)
);

-- Insert subjects
INSERT INTO Subjects (name, subject_id) VALUES ('Mathematics', 1);
INSERT INTO Subjects (name, subject_id) VALUES ('History', 2);

-- Insert courses and associate them with subjects
INSERT INTO Courses (name, subject_id) VALUES ('Algebra', 1); -- Algebra is associated with Mathematics (subject_id 1)
INSERT INTO Courses (name, subject_id) VALUES ('Linear Algebra', 1); -- Algebra is associated with Mathematics (subject_id 1)
INSERT INTO Courses (name, subject_id) VALUES ('Discreet Mathematics', 1); -- Algebra is associated with Mathematics (subject_id 1)
INSERT INTO Courses (name, subject_id) VALUES ('Statistical Analysis', 1); -- Algebra is associated with Mathematics (subject_id 1)
INSERT INTO Courses (name, subject_id) VALUES ('Geometry', 1); -- Algebra is associated with Mathematics (subject_id 1)
INSERT INTO Courses (name, subject_id) VALUES ('World History', 2); -- World History is associated with History (subject_id 2)

-- Create decks for testing
INSERT INTO decks (course_id, name) VALUES (2, 'Linear Algebra test 1');
INSERT INTO decks (course_id, name) VALUES (2, 'Linear Algebra test 2');
INSERT INTO decks (course_id, name) VALUES (3, 'World History test 1');

select * from decks;

-- Insert questions and associate them with courses
INSERT INTO Questions (deck_id, question_text, answer) VALUES (1, 'What is 2 + 2?', '4');
INSERT INTO Questions (deck_id, question_text, answer) VALUES (1, 'What is 30 + 2?', '32');
INSERT INTO Questions (deck_id, question_text, answer) VALUES (2, 'What is 2 + 4?', '6');
INSERT INTO Questions (deck_id, question_text, answer) VALUES (3, 'Who was the first President of the United States?', 'George Washington');

-- creates a user to read from the database
CREATE USER 'user'@'localhost'
IDENTIFIED BY 'pass'
;

GRANT ALL PRIVILEGES
ON *.* TO 'user'@'localhost'
WITH GRANT OPTION
;

-- If you can't read from database, please run this command
-- ALTER USER 'user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'pass';

FLUSH privileges;

-- Just used to test querys
-- select * from subjects;
-- select * from courses;
-- select * from questions;
-- select * from decks;
-- select * from questions;
-- select * from courses;