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


-- Sakila Database
USE sakila;

-- Display the first and last names in all lowercase of all the actors.
SELECT lower(first_name), lower(last_name)
FROM actor;

--You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you could use to obtain this information?

SELECT first_name, last_name, actor_id
FROM actor
WHERE first_name LIKE "Joe" OR first_name LIKE "Joseph";

-- Find all actors whose last name contain the letters "gen":
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE "%gen%";

-- Find all actors whose last names contain the letters "li". This time, order the rows by last name and first name, in that order.
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE "%li%"
ORDER BY last_name, first_name

-- Use JOIN to display the first and last names, as well as the address, of each staff member.
SELECT first_name, last_name, address, address2, district, postal_code
FROM staff
JOIN address USING (address_id);

--Use JOIN to display the total amount rung up by each staff member in August of 2005.
SELECT username, sum(amount) AS total
FROM staff
JOIN rental USING (staff_id)
JOIN payment USING (rental_id)
WHERE payment_date BETWEEN "2005-08-01" AND "2005-08-31"
GROUP BY username;

-- List each film and the number of actors who are listed for that film.
SELECT title, count(title)
FROM film
JOIN film_actor USING (film_id)
JOIN actor USING (actor_id)
GROUP BY title;

-- How many copies of the film Hunchback Impossible exist in the inventory system?
SELECT title, count(title) AS inventory
FROM film
JOIN inventory USING (film_id)
GROUP BY title

-- The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English
