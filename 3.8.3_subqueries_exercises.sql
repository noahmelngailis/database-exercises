USE employees;

#1
SELECT *
FROM employees
WHERE hire_date IN (
    SELECT hire_date
    FROM employees
    WHERE emp_no LIKE '101010' 
    )

#2
SELECT title, count(*)
FROM titles
WHERE emp_no IN (
    SELECT emp_no
    FROM employees
    WHERE first_name LIKE "Aamod"
)
GROUP BY title

#3
select *
FROM employees
WHERE NOT emp_no IN (
    SELECT emp_no
    FROM dept_emp
    WHERE to_date > curdate();


#4  
-- Find all the employees that 
SELECT first_name, last_name
FROM  employees
WHERE emp_no IN (
    SELECT emp_no
    FROM dept_manager
    WHERE to_date > CURDATE()
)
AND gender LIKE 'F'

#5
SELECT first_name, last_name, s.salary
FROM salaries s
JOIN employees e ON s.emp_no AND e.emp_no
WHERE salary > (SELECT AVG(salary)
					FROM salaries)
AND s.to_date > now()					
LIMIT 5;


#6
SELECT count(*)
FROM salaries
WHERE salary >
(SELECT MAX(salary) - STD(salary) AS 1std
FROM salaries)
AND to_date > curdate();

SELECT count(*) / (
	SELECT count(*)
	FROM salaries
	WHERE to_date > curdate())
FROM salaries
WHERE salary > (
    SELECT MAX(salary) - STD(salary) AS 1std
    FROM salaries)
AND to_date > curdate()
;

-- BONUS
SELECT dept_name
FROM departments
WHERE dept_no IN (
	SELECT dept_no
	FROM dept_emp
	WHERE emp_no IN (
		SELECT emp_no
		FROM employees
		WHERE gender IN (
			SELECT gender
			FROM employees
			WHERE gender LIKE 'f')
		AND emp_no IN (
			SELECT emp_no
			FROM dept_manager
			WHERE to_date > now())))
;