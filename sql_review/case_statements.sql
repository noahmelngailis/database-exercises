-- From our employees database, we can use this example query to pull the research department 
-- under the development department, and pull marketing under sales

"""Simple Case Statement, can only be used testing equality from a single column"""

USE employees;

SELECT dept_name, 
		CASE dept_name
				WHEN 'research' THEN 'Development'
				WHEN 'marketing' THEN 'Sales'
				ELSE dept_name
				END AS dept_group
FROM departments;

""" Basic Syntax which allows for multiple comparators (=, >, like, in) and multiple columns"""

SELECT dept_name,
	CASE 
		WHEN dept_name IN ('research', 'development') THEN 'R&D'
		WHEN dept_name IN ('sales', 'marketing') THEN 'sales & marketing'
		WHEN dept_name IN ('production', 'Quality Management') THEN "Prod & QM"
		ELSE dept_name
		END AS dept_group
FROM departments;

"""Use IF only if evaluating True and False"""

SELECT dept_name, 
	IF (dept_name = "Research", TRUE, FALSE) AS is_research
FROM departments;

 """conditional without if statement"""

SELECT dept_name, dept_name = "Research" AS is_research
FROM departments;

-- Write a query that returns all employees (emp_no), their department number, their start date, their end date, and a new column 
-- 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.

SELECT emp_no, dept_no, hire_date, to_date,
	IF(to_date > curdate(), TRUE, FALSE) AS is_current_employee
FROM employees

-- Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' depending on the first letter of their last name.
SELECT first_name, last_name,
	CASE
		WHEN LEFT(last_name, 1) IN ('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h') THEN "A-H"
		WHEN LEFT(last_name, 1) IN ("i", 'j', 'k','l', 'm', 'n', 'o', 'p', 'q') THEN "I-Q"
		ELSE "R-Z"
		END AS alpha_group
FROM employees;

-- How many employees (current or previous) were born in each decade?

SELECT count(*),
	CASE
		WHEN birth_date BETWEEN "1940-01-01" AND "1949-12-31" THEN '40s'
		WHEN birth_date BETWEEN "1950-01-01" AND "1959-12-31" THEN '50s'
		WHEN birth_date BETWEEN "1960-01-01" AND "1969-12-31" THEN '60s'
		WHEN birth_date BETWEEN "1970-01-01" AND "1979-12-31" THEN '70s'
		ELSE "Too old or too young"
		END AS birth_decade
FROM employees
GROUP BY birth_decade

-- What is the current average salary for each of the following department groups: R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

SELECT 
	CASE 
		WHEN dept_name IN ('research', 'development') THEN 'R&D'
		WHEN dept_name IN ('sales', 'marketing') THEN 'sales & marketing'
		WHEN dept_name IN ('production', 'Quality Management') THEN "Prod & QM"
		WHEN dept_name IN ('finance', 'hr') THEN 'Finance and HR'
		ELSE dept_name
		END AS dept_group, 
	AVG(salary) AS avg_salary
FROM departments
JOIN dept_emp USING (dept_no)
JOIN salaries USING (emp_no)
WHERE salaries.to_date > curdate()
GROUP BY dept_group;