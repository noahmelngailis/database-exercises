use join_example_db;
# Employees Database
#1 
select *
FROM roles
JOIN users on users.role_id = roles.id

#2
SELECT *
FROM roles
JOIN users ON users.role_id = roles.id;

SELECT *
FROM roles
LEFT JOIN users ON users.role_id = roles.id;

SELECT *
FROM roles
RIGHT JOIN users ON users.role_id = roles.id;

SELECT *
FROM users
JOIN roles ON users.role_id = roles.id;

SELECT *
FROM users
LEFT JOIN roles ON users.role_id = roles.id;

SELECT *
FROM users
RIGHT JOIN roles ON users.role_id = roles.id;

#3
SELECT roles.name, count(*)
FROM roles
LEFT JOIN users ON users.role_id = roles.id
GROUP BY roles.name;

#Employees
Use employees;

-- Using the example in the Associative Table Joins section
-- as a guide, write a query that shows each department along
-- with the name of the current manager for that department.
 
 #2
 SELECT departments.dept_name AS "Department Name", CONCAT(employees.first_name, " ", employees.last_name) AS "Department Manager"
 FROM departments
 JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
 JOIN employees ON dept_manager.emp_no = employees.emp_no
 WHERE YEAR(to_date) = '9999' ;

 #3
 SELECT departments.dept_name AS "Department Name", CONCAT(employees.first_name, " ", employees.last_name) AS "Department Manager"
 FROM departments
 JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
 JOIN employees ON dept_manager.emp_no = employees.emp_no
 WHERE YEAR(to_date) = '9999' AND employees.gender = 'F';

 #4
   SELECT title, count(*)
 FROM titles
 JOIN employees_with_departments ON titles.emp_no = employees_with_departments.emp_no
 WHERE employees_with_departments.dept_no = 'd009' AND YEAR(titles.to_date) = '9999'
 GROUP BY title;

 #5

 SELECT departments.dept_name AS "Department Name", 
 CONCAT(employees.first_name, " ", employees.last_name) AS "Department Manager",
 salaries.salary AS "Salary"
 FROM departments
 JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
 JOIN employees ON dept_manager.emp_no = employees.emp_no
 JOIN salaries ON  employees.emp_no = salaries.emp_no
 WHERE YEAR(salaries.to_date) = '9999' AND YEAR(dept_manager.to_date) = '9999';

 #6 
 SELECT 
 employees_with_departments.dept_no,
 departments.dept_name,
 count(employees_with_departments.dept_no) AS num_employees
 FROM employees_with_departments
 JOIN departments ON employees_with_departments.dept_no = departments.dept_no
 JOIN dept_emp ON dept_emp.dept_no = employees_with_departments.dept_no
 WHERE YEAR(dept_emp.to_date) LIKE '9999'
 GROUP BY dept_no;