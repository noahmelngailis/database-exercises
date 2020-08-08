USE employees;

SHOW TABLES;

SELECT * 
FROM `employees`;

DESCRIBE employees;

#6 
emp_no is a numeric type column
#7
firs_name, last_name, gender are string type columns
#8
birth_date and hire_date are date columns

#9
DESCRIBE dept_emp;

#10
The sql that created dept_manager table:

CREATE TABLE `dept_manager` (
  `emp_no` int(11) NOT NULL,
  `dept_no` char(4) NOT NULL,
  `from_date` date NOT NULL,
  `to_date` date NOT NULL,
  PRIMARY KEY (`emp_no`,`dept_no`),
  KEY `dept_no` (`dept_no`),
  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE,
  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1