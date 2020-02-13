use join_example_db;
#1 
SELECT *
FROM roles;

SELECT *
FROM users;

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

#3
SELECT roles.name, count(users.id)
FROM roles
LEFT JOIN users ON users.role_id = roles.id
GROUP BY roles.name;

Use employees;
 
 #2
 SELECT departments.dept_name AS "Department Name", 
 CONCAT(employees.first_name, " ", employees.last_name) AS "Department Manager"
 FROM departments 
 JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
 JOIN employees ON dept_manager.emp_no = employees.emp_no
 WHERE to_date > now() ;

 #3
 SELECT departments.dept_name AS "Department Name", CONCAT(employees.first_name, " ", employees.last_name)
 AS "Department Manager"
FROM departments
JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
JOIN employees ON dept_manager.emp_no = employees.emp_no
WHERE to_date > curdate() AND employees.gender = 'F'
ORDER BY dept_name;

 #4
 SELECT title, count(*)
 FROM departments d
 JOIN dept_emp de ON de.dept_no = d.dept_no
 JOIN titles t ON t.emp_no = de.emp_no
 WHERE t.to_date > CURDATE() 
 AND de.to_date > CURDATE()
 AND d.dept_name = "Customer Service"
 GROUP BY title;

  #5
 SELECT departments.dept_name AS "Department Name", 
 CONCAT(employees.first_name, " ", employees.last_name) AS "Department Manager",
 salaries.salary AS "Salary"
 FROM departments
 JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
 JOIN employees ON dept_manager.emp_no = employees.emp_no
 JOIN salaries ON  employees.emp_no = salaries.emp_no
 WHERE salaries.to_date > curdate() AND dept_manager.to_date > curdate()
 ORDER BY dept_name;

 #6 
  SELECT 
dept_emp.dept_no,
 departments.dept_name,
 count(dept_emp.dept_no) AS num_employees
 FROM dept_emp
 JOIN departments ON dept_emp.dept_no = departments.dept_no
 WHERE YEAR(dept_emp.to_date) LIKE '9999'
 GROUP BY dept_emp.dept_no;

#7
SELECT 
departments.dept_name,
AVG(salaries.salary) as average_salary
FROM dept_emp
JOIN salaries ON salaries.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE YEAR(salaries.to_date) LIKE '9999' 
AND YEAR(dept_emp.to_date) LIKE '9999'
GROUP BY departments.dept_name
ORDER BY average_salary DESC
LIMIT 1;

#8
SELECT 
first_name,
last_name
FROM employees_with_departments
JOIN salaries ON salaries.emp_no = employees_with_departments.emp_no
JOIN departments ON departments.dept_no = employees_with_departments.dept_no
WHERE departments.dept_name LIKE 'Marketing' 
ORDER BY salaries.salary DESC
LIMIT 1;

#9
SELECT
employees.first_name,
employees.last_name,
salaries.salary,
departments.dept_name
FROM employees
JOIN salaries ON salaries.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = employees.dept_no
JOIN dept_manager ON dept_manager.emp_no = employees.emp_no
WHERE employees.emp_no = dept_manager.emp_no AND YEAR(dept_manager.to_date) LIKE '9999'
ORDER BY salaries.salary DESC
LIMIT 1;

#10
SELECT
CONCAT(emp.first_name, ' ',emp.last_name) AS "Employee Name",
departments.dept_name "Department Name",
CONCAT(emp2.first_name, " ", emp2.last_name) AS "Manager Name"
FROM employees AS emp
JOIN dept_emp ON emp.emp_no = dept_emp.emp_no
JOIN dept_manager ON dept_manager.dept_no = dept_emp.dept_no
JOIN departments  ON dept_emp.dept_no = departments.dept_no
JOIN titles ON titles.emp_no = emp.emp_no
JOIN salaries ON salaries.emp_no = emp.emp_no
JOIN employees AS emp2 ON dept_manager.emp_no = emp2.emp_no
WHERE YEAR(dept_emp.to_date) LIKE '9999' 
AND YEAR(dept_manager.to_date) LIKE '9999'
AND YEAR(titles.to_date) LIKE '9999'
AND YEAR(salaries.to_date) LIKE '9999';

