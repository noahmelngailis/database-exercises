
 USE employees;
 
 #2
SELECT
concat(first_name, " ", last_name) AS full_name

FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY emp_no;

#3
SELECT
UPPER(CONCAT(first_name, " ", last_name)) AS upper_full_name
FROM employees
WHERE last_name LIKE 'E%'
ORDER BY emp_no;

#4
SELECT
concat(first_name, " ", last_name) AS full_name, datediff(CURDATE(), hire_date)
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31' 
	AND birth_date LIKE '19%-12-25'
ORDER BY birth_date ASC, hire_date DESC;

#5
SELECT
min(salary), max(salary)
FROM salaries;

#6
SELECT
	LOWER(
	CONCAT(
		LEFT(first_name, 1),
		LEFT(last_name, 4),
		"_", 
		SUBSTRING(birth_date, 6, 2), 
		SUBSTRING(birth_date, 3, 2))) AS username,
	first_name,
	last_name,
	birth_date
	FROM employees
	LIMIT 10;

# BONUS 1
SELECT
	YEAR(curdate()) - YEAR(hire_date) AS years,
	(now() - hire_date),
	(now() - hire_date)  /60 /60 /24 /36.25/ 1970
FROM employees;

SELECT
	now()
	unix_time_stamp();

SELECT
	(now() - hire_date) /60 /60 /24 /36.25
	FROM employees;

# BONUS 2
	SELECT max(hire_date)
	FROM employees;

# BONUS 3
SELECT max(hire_date)
FROM employees;

