USE employees;
-- 2. Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. 

SELECT first_name, last_name
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;

-- Write a query to to find all current employees whose last name starts and ends with 'E'. 
-- Sort the results by their employee number descending.

SELECT * 
FROM employees
WHERE last_name LIKE 'E%'
ORDER BY emp_no DESC; 

-- Write a query to to find all current employees whose last name starts and ends with 'E'. 
-- Sort the results by their hire date, so that the newest employees are listed first.

SELECT * 
FROM employees
WHERE last_name LIKE 'E%'
ORDER BY hire_date, last_name;

-- Find all previous employees hired in the 90s and born on Christmas. 
--Sort the results so that the oldest employee who was hired last is the first result.
SELECT *
FROM employees
WHERE birth_date LIKE '%%%%-12-25'
AND (hire_date BETWEEN '1990-01-01' AND '1999-12-31')
ORDER BY birth_date, hire_date DESC;

