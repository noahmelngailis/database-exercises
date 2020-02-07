USE albums_db;
DESCRIBE albums;

SELECT NAME AS albums FROM albums
WHERE artist = 'Pink Floyd';

SELECT release_date AS YEAR FROM albums WHERE NAME = "Sgt. Pepper's Lonely Hearts Club Band";

SELECT genre FROM albums WHERE NAME = 'Nevermind';

SELECT NAME AS albums FROM albums WHERE release_date BETWEEN 1990 AND 1999;

SELECT NAME AS albums FROM albums WHERE sales < 20000000;

SELECT NAME AS albums FROM albums WHERE genre = 'Rock';
#The search for will look for exclusively what is in between 'Rock'