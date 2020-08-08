USE employees;

-- Write a query to to find all current employees whose last name starts and ends with 'E'.
-- Use concat() to combine their first and last name together as a single column named full_name.

SELECT concat(first_name, " ", last_name) AS full_name
FROM employees
WHERE last_name LIKE "E%e"

-- Convert the names produced in your last query to all uppercase.
SELECT UPPER(concat(first_name, " ", last_name)) AS full_name
FROM employees
WHERE last_name LIKE "E%e"

-- Find all previous employees hired in the 90s and born on Christmas. Use datediff() function to find how many days they have been working at the company
SELECT concat(first_name, " ", last_name) AS full_name, 
datediff(curdate(), hire_date) AS days_employed
FROM employees
WHERE birth_date LIKE "%%%%-12-25"
AND hire_date BETWEEN "1990-01-01" AND "1999-12-31";

-- Find the smallest and largest current salary from the salaries table.
SELECT max(salary) AS max_salary, min(salary) AS min_salary
FROM salaries

--Use your knowledge of built in SQL functions to generate a username for all of the current and previous employees. A username should be all lowercase, and consist of the first character of the employees first name, the first 4 characters of the employees last name, an underscore, the month the employee was born, and the last two digits of the year that they were born.
SELECT lower(concat(substr(first_name, 1, 1), 
substr(last_name, 1, 4), "_", REPLACE()
substr(birth_date, 6, 2), 
substr(birth_date, 3, 2))) AS user_name
FROM employees;

-- Use replace in a query
SELECT REPLACE(
		REPLACE(
			REPLACE(
				REPLACE(
					REPLACE(first_name, 'a', '@')
						, 'e', '3')
							, 'i', '1')
								, 'o', '0')
									,'u', '?')
FROM employees;