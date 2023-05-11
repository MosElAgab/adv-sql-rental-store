\c flix

\echo '\n movies table:'
SELECT * FROM movies;

\echo '\n customers table:'
SELECT * FROM customers;

\echo '\n stock table:'
SELECT * FROM stock;

\echo '\n stores table:'
SELECT * FROM stores;

\echo '\n movies_genres table:'
SELECT * FROM movies_genres;

\echo '\n movies_genres "JOINED" table:'
SELECT movies.*, genres.* FROM movies_genres
JOIN movies ON movies_genres.movie_id = movies.movie_id
JOIN genres ON movies_genres.genre_id = genres.genre_id
;

