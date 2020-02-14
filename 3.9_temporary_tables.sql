--Using the example from the lesson, re-create the employees_with_departments table.

CREATE TABLE employees_with_departments (
	SELECT *
	FROM employees.employees_with_departments
);

-- Add a column named full_name to this table. 
--It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
ALTER TABLE employees_with_departments ADD full_name VARCHAR(30);
-- Update the table so that full name column contains the correct data
UPDATE employees_with_departments
SET full_name = concat(first_name, " ", last_name);

-- Remove the first_name and last_name columns from the table.
ALTER TABLE employees_with_departments 
DROP COLUMN first_name, 
DROP COLUMN last_name;

-- What is another way you could have ended up with this same table?

SE employees;
USE curie_941;
SELECT emp_no, dept_no, dept_name, (SELECT 
    CONCAT(first_name, " ", last_name)
    FROM employees.employees_with_departments
) AS full_name
FROM employees_with_departments
;

-- Create a temporary table based on the payment table from the sakila database.
-- Write the SQL necessary to transform the amount column
-- such that it is stored as an integer representing the
-- number of cents of the payment. For example, 1.99 should become 199.

CREATE TABLE payment2 (
    SELECT amount * 100 AS amount
    FROM sakila.payment);
    
ALTER TABLE payment2 CHANGE amount amount INT;

#3
CREATE TABLE STDev (
	SELECT STD(SALARY) AS stddev
	FROM employees.salaries
);

CREATE TABLE cur_STDev (
	SELECT STD(SALARY) AS stddev
	FROM employees.salaries
    WHERE to_date > curdate()
);


CREATE TABLE a_sal (
	SELECT AVG(SALARY) AS avg_sal
	FROM employees.salaries
);

CREATE TABLE cur_a_sal (
	SELECT AVG(SALARY) AS avg_sal
	FROM employees.salaries
    WHERE to_date > now()
);


CREATE TABLE salaries (
	SELECT *
	FROM employees.salaries);

SELECT edep.dept_name, salary	
FROM salaries s 
JOIN employees_with_departments ewd USING (emp_no)
JOIN employees.departments edep USING (dept_no)
WHERE s.to_date > CURDATE();

SELECT dept_name, AVG((salary - (
	SELECT cur_a_sal.avg_sal
	FROM cur_a_sal))/ (
	SELECT STDev.stddev
	FROM STDev))
FROM holding
GROUP BY dept_name;



SELECT dept_name, AVG((salary - (
	SELECT a_sal.stddev
	FROM a_sal))/ (
	SELECT STDev.stddev
	FROM STDev))
FROM holding
GROUP BY dept_name;
