USE employees;

#1
SELECT 
first_name, last_name
FROM employees
WHERE first_name = "Irena" OR first_name = "Vidya" OR first_name =  "Maya";

#2
SELECT
first_name, last_name
FROM employees
WHERE gender = "M" AND (first_name = "Irena" OR first_name = "Vidya" OR first_name =  "Maya");

#3
SELECT
first_name, last_name
FROM employees
WHERE last_name LIKE 'e%' OR last_name LIKE '%e';

#4
SELECT
first_name, last_name
FROM employees
WHERE last_name LIKE 'e%' AND last_name LIKE '%e';

#5
SELECT
first_name, last_name
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31' AND birth_date LIKE '19%-12-25';

#6
SELECT
first_name, last_name
FROM employees
WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';

### First Work
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