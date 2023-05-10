\c flix



\echo '\n Here are all the movie titles which were released in the 21st century:'
SELECT title FROM movies
WHERE release_date > '1999-12-31'
;


\echo '\n This is our oldest customer:'
SELECT * FROM customers
ORDER BY date_of_birth ASC
LIMIT 1;


\echo '\n Customers beginning with D (youngest to oldest):'

SELECT * FROM customers
WHERE customer_name LIKE 'D%'
ORDER BY date_of_birth DESC
;

\echo '\n This is the average rating of the all the movies made in the 80s:'
SELECT AVG(COALESCE(rating, 0)) AS rating FROM movies;
\echo '\n or using common table expressions'
WITH rated_movies AS (
    SELECT COALESCE(rating, 0) as rating FROM movies
)
SELECT AVG(rating) FROM rated_movies;

\echo '\n After decreasing the price of the movie rentals, the movie table now looks like:'

UPDATE movies
SET 
cost = cost * 1.05
RETURNING *;
