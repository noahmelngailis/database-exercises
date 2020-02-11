#2
USE employees;

SELECT DISTINCT title
FROM titles;

#3
SELECT last_name
FROM employees
WHERE last_name like 'e%e'
GROUP BY last_name;

#4
SELECT last_name, first_name
FROM employees
WHERE last_name like 'e%e'
GROUP BY last_name, first_name;

#5
SELECT last_name
FROM employees
WHERE last name like '%q%' and not like '%qu%'
GROUP BY last_name;

#6
SELECT last_name, count(*)
FROM employees
WHERE last_name like '%q%' and not last_name like '%qu%'
GROUP BY last_name
ORDER BY count(*);

#7
SELECT gender, count(*)
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender
ORDER BY gender;

#8
SELECT
	LOWER(
	CONCAT(
		LEFT(first_name, 1),
		LEFT(last_name, 4),
		"_", 
		SUBSTRING(birth_date, 6, 2), 
		SUBSTRING(birth_date, 3, 2))) AS username,
	count(*)
	FROM employees
    GROUP BY username
	LIMIT 10;

      #8 bonus
  SELECT
	LOWER(
	CONCAT(
		LEFT(first_name, 1),
		LEFT(last_name, 4),
		"_", 
		SUBSTRING(birth_date, 6, 2), 
		SUBSTRING(birth_date, 3, 2))) AS username,
	count(*)
	FROM employees
    GROUP BY username
    HAVING count(*) > 1;