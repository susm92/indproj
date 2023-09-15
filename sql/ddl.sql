--
-- creation of tables & insertion of data
-- susm20
--

use indproj;

drop table if exists subjects;
drop table if exists courses;
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

CREATE TABLE questions (
    question_id INT AUTO_INCREMENT PRIMARY KEY,
    course_id INT,
    question_text TEXT,
    answer TEXT,
    FOREIGN KEY (course_id) REFERENCES Courses (course_id)
);

-- Insert subjects
INSERT INTO Subjects (name) VALUES ('Mathematics');
INSERT INTO Subjects (name) VALUES ('History');

-- Insert courses and associate them with subjects
INSERT INTO Courses (name, subject_id) VALUES ('Algebra', 1); -- Algebra is associated with Mathematics (subject_id 1)
INSERT INTO Courses (name, subject_id) VALUES ('World History', 2); -- World History is associated with History (subject_id 2)

-- Insert questions and associate them with courses
INSERT INTO Questions (course_id, question_text, answer) VALUES (1, 'What is 2 + 2?', '4');
INSERT INTO Questions (course_id, question_text, answer) VALUES (2, 'Who was the first President of the United States?', 'George Washington');


select * from subjects;
select * from courses;
select * from questions;
