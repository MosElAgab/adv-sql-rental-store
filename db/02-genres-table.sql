\c flix

DROP TABLE IF EXISTS genres;

CREATE TABLE genres (genre_id SERIAL PRIMARY KEY, genre_slug VARCHAR(40), genre_description TEXT);

INSERT INTO genres (genre_slug, genre_description)
VALUES
('family', 'Fun for everyone!'),
('comedy', 'A giggle a minute'),
('romance', 'I feel it in my fingers, I feel it in my toes'),
('fantasy', 'There be elves and witches'),
('action', 'Shooty shooty, punchy punchy'),
('drama', 'Plot driven story time'),
('crime', 'Watch out, there''s gangsters about'),
('sci-fi', 'Your scientists were so preoccupied with whether they could...')
RETURNING *
;

DROP TABLE IF EXISTS movies_genres;

CREATE TABLE movies_genres (
    movie_genre_id SERIAL PRIMARY KEY, 
    movie_id INT REFERENCES movies(movie_id),
    genre_id INT REFERENCES genres(genre_id)
)
;

INSERT INTO movies_genres
(movie_id, genre_id)
VALUES 
(1, 1),
(1, 2),
(2, 2),
(2, 6),
(3, 2),
(3, 6),
(4, 1),
(5, 1),
(6, 4),
(6, 5),
(7, 4),
(7, 5),
(8, 3),
(8, 6),
(9, 2),
(9, 6),
(9, 7),
(10, 6),
(10, 7),
(11, 2),
(11, 3),
(12, 6),
(13, 4),
(13, 5),
(14, 5),
(14, 8),
(15, 5),
(15, 8),
(16, 5),
(16, 8),
(17, 2),
(17, 8),
(18, 2),
(18, 8),
(19, 6),
(19, 7),
(20, 4),
(20, 5),
(21, 7),
(22, 1),
(23, 2),
(23, 3), 
(24, 2),
(24, 7),
(25, 5),
(25, 8)
RETURNING *
;
