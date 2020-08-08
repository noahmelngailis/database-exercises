USE albums_db;

DESCRIBE albums;

-- #4 write queries for the following:
-- The name of all albums by Pink Floyd
SELECT NAME AS "Pink FLoyd Albums"
FROM albums
WHERE artist = 'Pink Floyd';
-- The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT release_date  AS 'Year Sgt Pepper Released'
FROM albums
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";
-- The genre for the album Nevermind
SELECT genre AS 'Genre of Nevermind'
FROM albums
WHERE NAME = 'Nevermind';
-- Which albums were released in the 1990s
SELECT artist, NAME AS 'ALbums Released in the 1990s'
FROM albums
WHERE release_date BETWEEN 1990 AND 1999;
-- Which albums had less than 20 million certified sales
SELECT artist, NAME AS '20 million sold'
FROM albums
WHERE sales > 20;
-- All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
SELECT artist, NAME
FROM albums
WHERE genre = 'Rock';

SELECT artist, NAME, genre
FROM albums
WHERE genre = 'Rock' OR genre = 'Progressive Rock' OR genre = 'Hard rock'