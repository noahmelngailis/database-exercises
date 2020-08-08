Use employees;

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Maya', 'Vidya');
709 employees

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?
SELECT *
FROM employees
WHERE first_name = 'Irena' OR first_name = 'Maya' OR first_name = 'Vidya';
-- No difference in results (709)

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.
SELECT *
FROM employees
WHERE gender = 'M' AND (first_name = 'Irena' OR first_name = 'Maya' OR first_name = 'Vidya');
-- 441 employees

-- Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.
SELECT *
FROM employees
WHERE last_name LIKE 'E%';
-- 7330

-- Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. 
SELECT *
FROM employees
WHERE last_name LIKE 'E%' OR last_name LIKE '%E';
-- 30723
-- How many employees have a last name that ends with E, but does not start with E?
SELECT *
FROM employees
WHERE last_name LIKE '%E' AND last_name NOT LIKE "E%";
-- 23393
-- Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E.
SELECT *
FROM employees
WHERE last_name LIKE 'E%' AND last_name LIKE '%E';
-- 899 
--  How many employees' last names end with E, regardless of whether they start with E?
SELECT *
FROM employees
WHERE last_name LIKE '%E';
-- 24292

-- Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'

-- Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.
SELECT *
FROM employees
WHERE birth_date LIKE '%%%%-12-25';
-- 842

-- Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.
SELECT *
FROM employees
WHERE birth_date LIKE '%%%%-12-25' 
AND hire_date BETWEEN '1990-01-01' AND '1999-12-31';
-- 362

-- Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.
SELECT *
FROM employees
WHERE last_name LIKE '%q%';
-- Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?
SELECT *
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%'
--- 547