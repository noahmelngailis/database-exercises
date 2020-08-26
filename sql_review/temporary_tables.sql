USE curie_941;

-- Using the example from the lesson, re-create the employees_with_departments table.
CREATE TEMPORARY TABLE emp AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees.employees
JOIN employees.dept_emp USING(emp_no)
JOIN employees.departments USING(dept_no)
LIMIT 100;

--Add a column named full_name to this table. It should be a VARCHAR whose length is the sum of the lengths of the first name and last name columns
ALTER TABLE emp ADD full_name VARCHAR(100);

-- Update the table so that full name column contains the correct data
UPDATE emp
SET full_name = concat(first_name, " ", last_name);

-- Remove the first_name and last_name columns from the table.
ALTER TABLE emp DROP COLUMN first_name;
ALTER TABLE emp DROP COLUMN last_name;

-- Write the SQL necessary to transform the amount column such that it is stored as an integer representing the number of cents of the payment. For example, 1.99 should become 199.
CREATE TABLE payment AS
SELECT *
FROM sakila.payment;


ALTER TABLE payment
MODIFY COLUMN amount DEC(6,2);

UPDATE payment
SET amount = round(amount*100, 0);

ALTER TABLE payment
MODIFY COLUMN amount INT;

-- Find out how the current average pay in each department compares to the overall, historical average pay. 
-- In order to make the comparison easier, you should use the Z-score for salaries. 
-- In terms of salary, what is the best department right now to work for? The worst?

USE curie_941;

CREATE TABLE historical_avg AS
SELECT AVG(salary) AS historical_avg, STDDEV(salary) AS historical_stddev
FROM employees.salaries;

CREATE TABLE salary_by_department AS 
SELECT AVG(salary) AS avg_salary, dept_no, dept_name
FROM employees.salaries
JOIN employees.dept_emp USING (emp_no)
JOIN employees.departments USING (dept_no)
WHERE employees.salaries.to_date > curdate()
GROUP BY dept_no;

ALTER TABLE salary_by_department ADD historical_avg FLOAT;
UPDATE salary_by_department SET historical_avg = (SELECT historical_avg FROM historical_avg);

ALTER TABLE salary_by_department ADD historical_stddev FLOAT;
UPDATE salary_by_department SET historical_stddev = (SELECT historical_stddev FROM historical_avg);

ALTER TABLE salary_by_department ADD z_score FLOAT;
UPDATE salary_by_department SET z_score = (avg_salary - historical_avg) / historical_stddev;

SELECT dept_name, z_score, avg_salary
FROM salary_by_department
ORDER BY z_score DESC;