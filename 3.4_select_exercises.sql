USE albums_db;

SELECT * FROM albums;

DESCRIBE albums;


SELECT NAME AS 'Albums by Pink Floyd' FROM albums
WHERE artist = 'Pink Floyd';

SELECT release_date AS 'Year of release' FROM albums WHERE NAME = "Sgt. Pepper's Lonely Hearts Club Band";

SELECT genre FROM albums WHERE NAME = 'Nevermind';

SELECT artist AS 'Artist', NAME AS 'Albums released in the 90s', release_date FROM albums WHERE release_date BETWEEN 1990 AND 1999;

SELECT NAME AS 'Albums with less than 20 million sales' FROM albums WHERE sales < 20000000;

SELECT NAME AS albums FROM albums WHERE genre = 'Rock';
#The search for will look for the specific string

SELECT NAME AS albums FROM albums WHERE genre LIKE '% Rock%';