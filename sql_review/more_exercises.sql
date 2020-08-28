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


--What languages are spoken in Santa Monica?
SELECT `Language`, Percentage
FROM city
JOIN countrylanguage USING (CountryCode)
WHERE NAME LIKE "Santa Monica"

--How many different countries are in each region?
SELECT Region, count(Region) AS num_countries
FROM country
GROUP BY Region
ORDER BY num_countries

-- What is the population for each region?
SELECT Region, sum(Population) AS population
FROM country
GROUP BY Region
ORDER BY population DESC

-- What is the population for each continent?
SELECT continent, sum(Population) AS population
FROM country
GROUP BY continent
ORDER BY population DESC

-- What is the average life expectancy globally?
SELECT AVG(LifeExpectancy)
FROM country

SELECT sum(LifeExpectancy * Population) / sum(population)
FROM country

-- What is the average life expectancy for each region, each continent? Sort the results from shortest to longest

SELECT continent, sum(LifeExpectancy * Population) / sum(Population) AS life_expectancy
FROM country
GROUP BY continent
ORDER BY life_expectancy

SELECT Region, sum(LifeExpectancy * Population) / sum(Population) AS life_expectancy
FROM country
GROUP BY Region
ORDER BY life_expectancy

-- Find all the countries whose local name is different from the official name
SELECT NAME, LocalName,
	IF (NAME = LocalName, FALSE, TRUE) AS is_named_dif
FROM country
WHERE NAME != LocalName