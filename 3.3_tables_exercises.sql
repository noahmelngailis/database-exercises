#3
USE employees; 
#4
SHOW TABLES;
#5
DESCRIBE employees;
# CHAR, VARCHAR, INT, DATE, ENUM
#6
# The tables that contain numeric type columns are: "dept_emp", "dept_manager", "employees", "employees_with_departments", "salaries", "titles"
#7 
# The tables that would feature strings are "departments",  "dept_emp", "employees", "titles", "dept_manager", "employees_with_department"
#8 
# The tables that contain a date type are "dept_emp", "dept_manager", "employees_with_departments", "salaries", and "titles" and "employees"
#9
# There is no direct relationship.  However, the relationship between "employees" and "department" is the table "dept_emp" where the columns "emp_no" and "dept_no" are linked.
#10 
SHOW CREATE TABLE dept_manager;
dept_manager	
-- CREATE TABLE `dept_manager` (↵  `emp_no` INT(11) NOT NULL,↵  `dept_no` CHAR(4) NOT NULL,↵  `from_date` DATE NOT NULL,↵  `to_date` DATE NOT NULL,↵  PRIMARY KEY (`emp_no`,`dept_no`),↵  KEY `dept_no` (`dept_no`),↵  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE,↵  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE↵) ENGINE=INNODB DEFAULT CHARSET=latin1
