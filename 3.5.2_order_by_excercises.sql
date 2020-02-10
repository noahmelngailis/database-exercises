USE employees;

#2
SELECT 
first_name, last_name
FROM employees
WHERE first_name IN ("Irena", "Vidya", "Maya")
ORDER BY first_name;

#3
SELECT 
first_name, last_name
FROM employees
WHERE first_name IN ("Irena", "Vidya", "Maya")
ORDER BY first_name, last_name;

#4
SELECT 
first_name, last_name
FROM employees
WHERE first_name IN ("Irena", "Vidya", "Maya")
ORDER BY last_name, first_name;

#5
SELECT
first_name, last_name
FROM employees
WHERE last_name LIKE '%e%'
ORDER BY emp_no;

#6
SELECT
first_name, last_name
FROM employees
WHERE last_name LIKE '%e%'
ORDER BY emp_no DESC;


#7
SELECT
first_name, last_name
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31' 
	AND birth_date LIKE '19%-12-25'
ORDER BY hire_date DESC, birth_date DESC;
