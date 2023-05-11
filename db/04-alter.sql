\c flix

\echo '\n alter original movies table to account for is_sequel\n'
ALTER TABLE movies 
ADD is_sequel BOOLEAN
;
UPDATE movies
SET is_sequel =
CASE WHEN movies.title LIKE '% I %' OR movies.title LIKE '%II%' OR movies.title LIKE '%III%' OR movies.title LIKE '%IV%' OR movies.title LIKE '%IX%'
THEN TRUE
ELSE FALSE 
END
;
\echo '\n The store with the highest total of sequels is:'
-- movises with sequle
-- stock 
WITH sequels_stock as (
    SELECT * FROM stock
    WHERE stock.movie_id IN (SELECT movies.movie_id FROM movies
WHERE movies.is_sequel = TRUE)
)
SELECT DISTINCT
sequels_stock.store_id, stores.city,
COUNT(sequels_stock.stock_id) OVER (PARTITION BY sequels_stock.store_id) AS total_number_of_sequels
FROM sequels_stock
JOIN stores ON sequels_stock.store_id = stores.store_id
ORDER BY total_number_of_sequels DESC
LIMIT 1
;