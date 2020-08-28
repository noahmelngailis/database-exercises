-- How much do the current managers of each department get paid, relative to the average salary for the department? Is there any department where the department manager gets paid less than the average salary?
CREATE TEMPORARY TABLE mean_salary AS 
SELECT AVG(SALARY) AS avg_salary, dept_no
FROM employees.salaries
JOIN employees.dept_emp USING (emp_no)
WHERE employees.salaries.to_date > curdate()
GROUP BY dept_no;


SELECT dept_name, salary AS manager_salary, avg_salary,
	IF (salary < avg_salary, TRUE, FALSE) AS is_underpaid
FROM employees.dept_manager
JOIN employees.salaries USING (emp_no)
JOIN employees.departments USING (dept_no)
JOIN mean_salary USING (dept_no)
WHERE employees.salaries.to_date > curdate()
AND employees.dept_manager.to_date > curdate()
AND salary < avg_salary;