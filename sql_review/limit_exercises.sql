USE employees;

-- List the first 10 distinct last name sorted in descending order.
SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;

-- Find all previous or current employees hired in the 90s and born on Christmas. 
--Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records.
SELECT first_name, last_name
FROM employees
WHERE birth_date LIKE '%%%%-12-25'
AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
ORDER BY hire_date
LIMIT 5;

-- Update the query to find the tenth page of results.
SELECT first_name, last_name
FROM employees
WHERE birth_date LIKE '%%%%-12-25'
AND hire_date BETWEEN '1990-01-01' AND '1999-12-31'
ORDER BY hire_date
LIMIT 5 OFFSET 50 ;