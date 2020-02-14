-- Write a query that returns all employees (emp_no), 
-- their department number, their start date, their end date, 
-- and a new column 'is_current_employee' that is a 1 if the 
-- employee is still with the company and 0 if not.

SELECT e.emp_no, dept_no, hire_date, to_date, 
	CASE
		WHEN to_date > now() THEN 1
		ELSE 0
	END is_current_employee	
FROM employees e
JOIN dept_emp USING (emp_no);

-- Write a query that returns all employee names, and a 
-- new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z'
-- depending on the first letter of their last name.

SELECT first_name, last_name,
	CASE
		WHEN last_name BETWEEN 'a' AND 'hz' THEN 'A-I'
		WHEN last_name  BETWEEN 'i' AND 'qz' THEN 'I-Q'
		WHEN last_name BETWEEN 'r' AND 'zz' THEN 'R-Z'
	END AS 'alpha_group'
	FROM employees;	

--How many employees were born in each decade?

SELECT min(birth_date)
FROM employees;

SELECT max(birth_date)
FROM employees;

USE employees;
SELECT 
	CASE
		WHEN birth_date BETWEEN '1950-1-1' AND '1959-12-31' THEN '50s'
		WHEN birth_date BETWEEN '1960-1-1' AND '1969-12-31'	THEN '60s'
		ELSE 'Oops!'
	END AS decade,
	count(*)
FROM employees
GROUP BY decade;

USE curie_941;
CREATE TEMPORARY TABLE decade2 AS
	SELECT 
	CASE
		WHEN birth_date BETWEEN '1950-1-1' AND '1959-12-31' THEN '50s'
		WHEN birth_date BETWEEN '1960-1-1' AND '1969-12-31'	THEN '60s'
		ELSE 'Oops!'
	END AS decade
FROM employees.employees;


-- What is the average salary for each of the following department groups: 
-- R&D, Sales & Marketing, Prod & QM, Finance & HR, Customer Service?

-- +-------------------+-----------------+
-- | dept_group        | avg_salary      |
-- +-------------------+-----------------+
-- | Customer Service  |                 |
-- | Finance & HR      |                 |
-- | Sales & Marketing |                 |
-- | Prod & QM         |                 |
-- | R&D               |                 |
-- +-------------------+-----------------+

SELECT  
	CASE dept_name
		WHEN 'finance' THEN 'Finance & HR'
		WHEN 'Human Resources' THEN 'Finance & HR'
		WHEN 'Sales' THEN 'Sales & Marketing'
		WHEN 'Marketing' THEN 'Sales & Marketing'
		WHEN 'Production' THEN 'Prod & QM'
		WHEN 'Quality Management' THEN 'Prod & QM'
		WHEN 'Research' THEN 'R&D'
		WHEN 'Development' THEN 'R&D'
		ELSE dept_name
	END AS dept_group,
	AVG(salary) AS salary
FROM departments
JOIN dept_emp USING (dept_no)
JOIN salaries USING (emp_no)
WHERE dept_emp.to_date > now()
GROUP BY dept_group;