USE employees;

--In your script, use DISTINCT to find the unique titles in the titles table
SELECT DISTINCT(title), count(*)
FROM titles
GROUP BY title

-- Write a query to to find a list of all unique last names of current or previous employees that start and end with 'E' using GROUP BY.
SELECT last_name, count(*)
FROM employees
WHERE last_name LIKE "E%e"
GROUP BY last_name

-- Write a query to to find all unique combinations of first and last names of previous employees whose last names start and end with 'E'.
SELECT DISTINCT(concat(first_name, " ", last_name )) AS distinct_names, count(*)
FROM employees
JOIN titles AS t USING(emp_no) 
WHERE last_name LIKE "E%e"
AND t.to_date < curdate()
GROUP BY distinct_names;

-- Write a query to find the unique last names with a 'q' but not 'qu'. Include those names in a comment in your sql code.
SELECT last_name
FROM employees
WHERE last_name LIKE '%q%'
AND NOT last_name LIKE "%qu%"
GROUP BY last_name

-- Add a COUNT() to your results (the query above) and use ORDER BY to make it easier to find employees whose unusual name is shared with others.
SELECT last_name, count(*) AS number
FROM employees
WHERE last_name LIKE '%q%'
AND NOT last_name LIKE "%qu%"
GROUP BY last_name
ORDER BY number

-- Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya'. Use COUNT(*) and GROUP BY to find the number of employees for each gender with those names.
SELECT first_name, gender, count(*) AS number
FROM employees
WHERE first_name IN ('Irena', "Vidya", "Maya")
GROUP BY first_name, gender
ORDER BY number DESC ;

-- Using youre query that generates a username for all of the current and previous employees, generate a count employees for each unique username.
-- Are there any duplicate usernames?
SELECT lower(concat(substr(first_name, 1, 1), 
substr(last_name, 1, 4), "_", 
substr(birth_date, 6, 2), 
substr(birth_date, 3, 2))) AS user_name, 
count(*) AS number
FROM employees
GROUP BY user_name
ORDER BY number DESC


-- BONUS: How many duplicate usernames are there?
SELECT sum(duplicates)
FROM(
SELECT lower(concat(substr(first_name, 1, 1), 
substr(last_name, 1, 4), "_", 
substr(birth_date, 6, 2), 
substr(birth_date, 3, 2))) AS user_name, 
count(*) AS number, 
count(*) - 1 AS duplicates 
FROM employees
GROUP BY user_name) AS temp;
