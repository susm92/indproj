--
-- 2023-09-15
-- susm20, SELECT querys and others
--

use indproj;

DROP PROCEDURE IF EXISTS show_subjects;
DELIMITER ;;
CREATE PROCEDURE show_subjects()
BEGIN
	SELECT * from subjects;
END
;;
DELIMITER ;

call show_subjects();



CREATE USER 'user'@'localhost'
IDENTIFIED BY 'pass'
;

GRANT ALL PRIVILEGES
ON *.* TO 'user'@'localhost'
WITH GRANT OPTION
;

ALTER USER 'user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'pass';
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';

FLUSH privileges;