CREATE TABLE film (
	film_id INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(50) NOT NULL,
	description VARCHAR(255) NOT NULL,
	release_year YEAR NOT NULL
);

DROP TABLE film;
DROP TABLE actor;
DROP TABLE film_actor;

CREATE TABLE actor (
	actor_id INT PRIMARY KEY AUTO_INCREMENT,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(25) NOT NULL
);

CREATE TABLE film_actor (
	film_id INT NOT NULL,
	actor_id INT NOT NULL
);

ALTER TABLE film_actor 
	ADD CONSTRAINT fk_filmactor_film 
		FOREIGN KEY (film_id) 
		REFERENCES film (film_id);

ALTER TABLE film_actor 
	ADD CONSTRAINT fk_filmactor_actor 
		FOREIGN KEY (actor_id) 
		REFERENCES actor (actor_id);
		
ALTER TABLE film ADD COLUMN last_update DATETIME DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE actor ADD COLUMN last_update DATETIME DEFAULT CURRENT_TIMESTAMP;

INSERT INTO film
(title, description, release_year)
VALUES('El Bardo', 'Not found', '1956');

INSERT INTO film
(title, description, release_year)
VALUES('El Bar', 'Not found', '2000');

INSERT INTO film
(title, description, release_year)
VALUES('El Bote', 'Not found', '1989');

INSERT INTO film
(title, description, release_year)
VALUES('Piratas del Caribe', 'Not found', '2015');

INSERT INTO film
(title, description, release_year)
VALUES('El Hombre Araña', 'Not found', '2016');

INSERT INTO actor
(first_name, last_name)
VALUES('Jhon', 'Deep');

INSERT INTO actor
(first_name, last_name)
VALUES('Nicolas', 'Cage');

INSERT INTO actor
(first_name, last_name)
VALUES('Adam', 'Sandler');

INSERT INTO actor
(first_name, last_name)
VALUES('Tobey', 'Maguire');

INSERT INTO actor
(first_name, last_name)
VALUES('Brad', 'Pit');

INSERT INTO imdb.film_actor
(film_id, actor_id)
VALUES(1, 5);

INSERT INTO imdb.film_actor
(film_id, actor_id)
VALUES(2, 2);

INSERT INTO imdb.film_actor
(film_id, actor_id)
VALUES(3, 3);

INSERT INTO imdb.film_actor
(film_id, actor_id)
VALUES(4, 1);

INSERT INTO imdb.film_actor
(film_id, actor_id)
VALUES(5, 4);

INSERT INTO imdb.film_actor
(film_id, actor_id)
VALUES(4, 3);

INSERT INTO imdb.film_actor
(film_id, actor_id)
VALUES(1, 2);

INSERT INTO imdb.film_actor
(film_id, actor_id)
VALUES(1, 1);
