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