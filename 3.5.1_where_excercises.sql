USE employees;

#2
SELECT 
first_name, last_name
FROM employees
WHERE first_name IN ("Irena", "Vidya", "Maya");

#3
SELECT
first_name, last_name
FROM employees
WHERE last_name LIKE 'e%';

#4
SELECT
first_name, last_name
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';

#5
SELECT
first_name, last_name
FROM employees
WHERE birth_date LIKE '19%-12-25';

#6
SELECT
first_name, last_name
FROM employees
WHERE last_name LIKE '%q%';