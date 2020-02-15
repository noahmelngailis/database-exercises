
--What languages are spoken in Santa Monica?

SELECT LANGUAGE, Percentage 
FROM countrylanguage
WHERE CountryCode IN (
	SELECT CountryCode
	FROM city
	WHERE NAME = "Santa Monica")
ORDER BY Percentage;

-- How many different countries are in each region?

SELECT region Region, count(region) num_countries
FROM country
GROUP BY region 
ORDER BY num_countries ASC;

-- What is the population for each region?

SELECT region Region, sum(population) `population`
FROM country
GROUP BY region
ORDER BY `population`;

-- What is the population for each continent?

SELECT continent Continent, sum(population) population
FROM country
GROUP BY continent
ORDER BY population DESC;

-- What is the average life expectancy globally?

SELECT sum(population * LifeExpectancy)/sum(population)
FROM country;

SELECT AVG(LifeExpectancy)
FROM country;

-- What is the average life expectancy for each 
-- region, each continent? Sort the results 
-- from shortest to longest

SELECT continent, AVG(LifeExpectancy)
FROM country
GROUP BY continent
ORDER BY AVG(LifeExpectancy);

SELECT Region, AVG(LifeExpectancy)
FROM country
GROUP BY Region
ORDER BY AVG(LifeExpectancy);

--Find all the countries whose local name 
--is different from the official name

SELECT 
	CASE
		WHEN localName != NAME THEN localName
		WHEN localName = " " THEN NULL
		ELSE ""
	END AS Stupid_Americans
FROM country;

--How many countries have a life expectancy
-- less than x?
SELECT count(IF(lifeExpectancy > 70, 1, 0)) AS howlong
FROM country;

--Sakila Database
--Display the first and last names in all lowercase of all the actors.
SELECT lower(first_name) , lower(last_name)
FROM customer;

-- You need to find the ID number, first name, and last name 
-- of an actor, of whom you know only the first name, "Joe." 
-- What is one query would you could use to obtain this information?

SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name LIKE 'Joe' OR first_name LIKE 'Joseph';

-- Find all actors whose last name contain the letters "gen":
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE '%gen%';

-- Find all actors whose last names contain the letters 
-- "li". This time, order the 
-- rows by last name and first name, in that order.
SELECT first_name, last_name
FROM actor
WHERE last_name LIKE '%li%'
ORDER BY last_name ASC, first_name ASC;

-- Using IN, display the country_id and
-- country columns for the following countries:
-- Afghanistan, Bangladesh, and China:
SELECT country_id, country
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

-- List the last names of all the actors, 
-- as well as how many actors have that last name.

SELECT last_name, count(*)
FROM actor
GROUP BY last_name;

-- You cannot locate the schema of the address table.
-- Which query would you use to re-create it?
DESCRIBE address;

--Use JOIN to display the first and last names,
-- as well as the address, of each staff member.

SELECT first_name, last_name, address
FROM staff
JOIN address USING(address_id);

-- Use JOIN to display the total amount 
-- rung up by each staff member in August of 2005.

SELECT concat(first_name, " ", last_name) AS NAME, sum(amount) AS total
FROM payment
JOIN staff USING(staff_id)
WHERE payment_date BETWEEN '2005-08-01' AND '2005-09-01' 
GROUP BY NAME;

-- List each film and the number of actors
--  who are listed for that film.

