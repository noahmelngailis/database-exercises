-- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

SELECT DISTINCT CITY FROM STATION
WHERE CITY REGEXP '^[^aeiou]';

-- Query the list of CITY names from STATION that do not start with vowels and do not end with vowels. Your result cannot contain duplicates.
SELECT DISTINCT CITY FROM STATION
WHERE CITY REGEXP '^[^aeiou].*[^aeiou]$';

-- Query the Name of any student in STUDENTS who scored higher than  Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.
SELECT Name
FROM students
WHERE Marks > 75
ORDER BY RIGHT(Name, 3), id

-- Write a query that prints a list of employee names (i.e.: the name attribute) for employees in Employee having a salary greater than  per month who have been employees for less than  months. Sort your result by ascending employee_id.
SELECT Name
FROM employee
WHERE salary > 2000
AND months < 10
ORDER BY employee_id

-- Given the CITY and COUNTRY tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.
SELECT sum(city.population)
FROM CITY
JOIN COUNTRY
ON city.countrycode = country.code
WHERE continent = 'Asia'

-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.
SELECT city.name
FROM CITY
JOIN COUNTRY
ON city.countrycode = country.code
WHERE continent = 'Africa'

-- Given the CITY and COUNTRY tables, query the names of all the continents (COUNTRY.Continent) and their respective average city populations (CITY.Population) rounded down to the nearest integer.

SELECT continent, floor(avg(city.population))
FROM CITY
JOIN COUNTRY
ON city.countrycode = country.code
GROUP BY continent

-- Query a count of the number of cities in CITY having a Population larger than .
SELECT count(*)
FROM city
WHERE population > 100000

-- Query the total population of all cities in CITY where District is California.
SELECT sum(population)
FROM city
WHERE district = 'California'

--Query the average population for all cities in CITY, rounded down to the nearest integer.
SELECT floor(avg(population))
FROM CITY

-- Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.
SELECT sum(population)
FROM city
WHERE countrycode = "JPN"


-- Query the difference between the maximum and minimum populations in CITY.
SELECT max(population) - min(population)
FROM city

-- Query the sum of Northern Latitudes (LAT_N) from STATION having values greater than  and less than .
SELECT TRUNCATE(SUM(LAT_N), 4)
  FROM STATION
 WHERE LAT_N BETWEEN 38.7880 AND 137.2345

 -- Weather Observation Station 15
 SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (
    SELECT MAX(LAT_N)
    FROM STATION
    WHERE LAT_N < 137.2345)

-- Weather Observation Station 16
SELECT ROUND(LAT_N, 4)
FROM STATION
WHERE LAT_N = (
    SELECT MIN(LAT_N)
    FROM STATION
    WHERE LAT_N < 38.7780)

-- Weather Observation Station 17
SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N = (
    SELECT MIN(LAT_N)
    FROM STATION
    WHERE LAT_N < 38.7780)

-- Weather Observation Station 18
select round(abs(min(lat_n)-max(lat_n)) + abs(min(long_w)-max(long_w)), 4)
FROM STATION

-- Weather Observation Station 19
Select round(sqrt(power((min(lat_n)-max(lat_n)),2) + power((min(long_w)-max(long_w)),2)),4) From station

-- Draw The Triangle 1
set @number = 21;
select repeat('* ', @number := @number - 1) from information_schema.tables;

-- Draw The Triangle 2
set @row := 0;
select repeat('* ', @row := @row + 1) from information_schema.tables where @row < 20