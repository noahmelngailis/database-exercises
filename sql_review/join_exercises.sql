-- Join Example DB

SELECT *
FROM users
JOIN roles 
ON roles.id = users.role_id;

SELECT *
FROM users
LEFT JOIN roles 
ON roles.id = users.role_id;

SELECT *
FROM users
RIGHT JOIN roles 
ON roles.id = users.role_id;

-- a list of roles along with the number of users that has the role. Hint: You will also need to use group by in the query.
SELECT roles.name, count(*) AS number
FROM roles
LEFT JOIN users
ON roles.id = users.role_id 
GROUP BY roles.name;



USE employees;

-- write a query that shows each department along with the name of the current manager for that department.
SELECT dept_name AS 'Department Name', concat(first_name, " ", last_name) AS 'Department Manager'
FROM employees
JOIN dept_manager USING(emp_no)
JOIN departments USING (dept_no)
WHERE to_date > curdate()
ORDER BY dept_name;

-- Find the name of all departments currently managed by women.

SELECT dept_name AS 'Department Name', concat(first_name, " ", last_name) AS 'Department Manager'
FROM employees
JOIN dept_manager USING(emp_no)
JOIN departments USING (dept_no)
WHERE to_date > curdate()
AND gender = "F"
ORDER BY dept_name;

-- Find the current titles of employees currently working in the Customer Service department.
SELECT title, count(title) AS count
FROM titles
JOIN dept_emp USING(emp_no)
JOIN departments USING (dept_no)
WHERE dept_name = 'Customer Service'
AND titles.to_date > curdate()
GROUP BY title;

-- Find the current salary of all current managers.
SELECT dept_name AS 'Department Name', concat(first_name, " ", last_name) AS 'Department Manager', salary
FROM employees
JOIN dept_manager USING(emp_no)
JOIN departments USING (dept_no)
JOIN salaries USING(emp_no)
WHERE dept_manager.to_date > curdate()
AND salaries.to_date > curdate()
ORDER BY dept_name;

-- Find the number of current employees in each department.
SELECT dept_emp.dept_no AS dept_no, dept_name, count(*)
FROM employees
JOIN dept_emp USING (emp_no)
JOIN departments USING (dept_no)
WHERE to_date > curdate()
GROUP BY dept_name
ORDER BY dept_no;

-- Which department has the highest average salary? Hint: Use current not historic information.
SELECT dept_name, AVG(salary) AS average_salary
FROM salaries
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE dept_emp.to_date > curdate()
AND salaries.to_date > curdate()
GROUP BY dept_name
ORDER BY average_salary DESC
LIMIT 1;

-- Who is the highest paid employee in the Marketing department?
SELECT first_name, last_name
FROM employees
JOIN salaries USING (emp_no)
JOIN dept_emp USING (emp_no)
JOIN departments USING (dept_no)
WHERE dept_name = 'Marketing'
AND salaries.to_date > curdate()
ORDER BY salary DESC
LIMIT 1;

-- Which current department manager has the highest salary?

SELECT first_name, last_name, salary, dept_name
FROM employees
JOIN dept_manager USING (emp_no)
JOIN salaries USING (emp_no)
JOIN departments USING (dept_no)
WHERE dept_manager.to_date > curdate()
AND salaries.to_date > curdate()
ORDER BY salary DESC
LIMIT 1;

-- Find the names of all current employees, their department name, and their current manager's name.

SELECT concat(e.first_name, " ", e.last_name) AS 'Employee Name',
		d.dept_name AS 'Department Name',
		concat(a.first_name, ' ', a.last_name) AS 'Manager Name'
FROM employees e
JOIN dept_emp de USING (emp_no)
LEFT JOIN dept_manager m ON m.dept_no = de.dept_no
LEFT JOIN employees a ON a.emp_no = m.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE de.to_date > curdate()
AND m.to_date > curdate()
ORDER BY d.dept_name;

-- Who is the highest paid employee within each department.
SELECT e.first_name, e.last_name, d.dept_name, max(s.salary) AS max_salary
FROM employees e 
JOIN salaries s USING (emp_no)
JOIN dept_emp de USING (emp_no)
JOIN departments d USING (dept_no)
WHERE de.to_date > curdate()
AND s.to_date > curdate()
GROUP BY dept_name, first_name, last_name