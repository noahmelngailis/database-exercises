Use employees;

-- Find all the current employees with the same hire date as employee 101010 using a sub-query.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date IN
 (SELECT hire_date
 FROM `employees`
 WHERE emp_no = 101010)

-- Find all the titles ever held by all current employees with the first name Aamod.
SELECT DISTINCT(title)
FROM employees
JOIN titles USING (emp_no)
WHERE first_name IN (
	SELECT first_name
	FROM `employees`
	WHERE first_name = "Aamod"
)
AND to_date > curdate()

-- How many people in the employees table are no longer working for the company?
SELECT *
FROM employees
JOIN titles USING (emp_no)
WHERE to_date IN (
	SELECT to_date
	FROM titles
	WHERE to_date < curdate()
)

-- Find all the current department managers that are female. 
SELECT first_name, last_name, dept_name
FROM employees
JOIN dept_manager USING (emp_no)
JOIN departments USING (dept_no)
WHERE gender = 'F'
AND to_date > curdate()


-- Find all the employees who currently have a higher salary than the companies overall, historical average salary.