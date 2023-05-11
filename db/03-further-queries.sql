\c flix

\echo '\n The number of films in stock for each genre:'
WITH available_movies_junction AS (
    SELECT * FROM movies_genres
WHERE movie_id IN (
    SELECT movie_id FROM stock
)
)
SELECT DISTINCT 
genres.genre_slug,
COUNT(available_movies_junction.movie_id) OVER (PARTITION BY available_movies_junction.genre_id) AS available_movies
FROM available_movies_junction
JOIN genres ON available_movies_junction.genre_id = genres.genre_id
;

\echo '\n Here is the average rating for films in stock in Newcastle:'
SELECT ROUND(AVG(movies.rating), 2) AS average_rating_newcastle FROM stock
JOIN movies ON stock.movie_id = movies.movie_id
JOIN stores ON stock.store_id = stores.store_id
WHERE stores.city = 'Newcastle'
;

\echo '\n Here are all the films made in 90s with above average rating available in Leeds'

SELECT * FROM movies
WHERE release_date > '1989-12-31'
AND release_date < '2000-01-01'
AND rating > (SELECT AVG(COALESCE(rating, 0)) FROM movies)
;

\echo '\n Here is the number of copies of the top rated film of the 5 most recently released films we have in stock across all stores:'

WITH latest_five_films AS (
    SELECT movie_id, title, COALESCE(rating, 0) as rating FROM movies 
    ORDER BY release_date DESC
    LIMIT 5
)
SELECT DISTINCT stock.movie_id, 
COUNT(stock.stock_id) OVER (PARTITION BY movie_id) AS number_of_copies
FROM stock 
WHERE movie_id = (SELECT movie_id FROM latest_five_films
ORDER BY rating DESC
LIMIT 1)

;

\echo '\n These are the locations where our customers live which dont have stores:'

SELECT DISTINCT customers.location, 
COUNT(customers.customer_id) OVER (PARTITION BY customers.location) AS number_of_customers
FROM customers
WHERE 
customers.location NOT IN (SELECT city FROM stores)
;
\echo  '\n or \n'
SELECT DISTINCT customers.location 
FROM customers
EXCEPT 
SELECT city 
FROM stores
;




\echo '\n locations we have influence over '

SELECT stores.city AS locations_under_influance
FROM stores
UNION
SELECT customers.location
FROM customers
;


\echo '\n all stores which exist in locations we have influance on have equal amount of stock:'
WITH stores_with_local_customers AS
(SELECT stores.*
    FROM stores
    WHERE stores.city IN (SELECT customers.location FROM customers))
SELECT DISTINCT stock.store_id, stores.city,
COUNT(stock_id) OVER (PARTITION BY stock.store_id) AS total_stock
FROM stock
JOIN stores ON stock.store_id = stores.store_id
WHERE stock.store_id IN (SELECT store_id FROM stores_with_local_customers)
ORDER BY stock.store_id
;

\echo '\n ...and this is the most abundant genre in that store:'


-- ORDER BY stores.store_id




