-- Varias Tablas 

SELECT f1.title, f2.title, f1.`length`
FROM film f1, film f2
WHERE f1.`length` = f2.`length`
AND f1.film_id <> f2.film_id;

-- 1

SELECT title, special_features, rating
FROM film 
WHERE rating = 'PG-13';

-- 2

SELECT DISTINCT `length`
FROM film;

-- 3

SELECT title, rental_rate, replacement_cost
FROM film 
WHERE replacement_cost BETWEEN 20.00 AND 24.00;

-- 4

SELECT title, rating, name, special_features
FROM film, category, film_category
WHERE special_features LIKE '%Behind The Scenes%'
AND category.category_id = film_category.category_id
AND film.film_id = film_category.film_id;

-- 5

SELECT first_name, last_name, title
FROM actor, film, film_actor
WHERE film.title LIKE 'ZOOLANDER FICTION'
AND film.film_id = film_actor.film_id
AND film_actor.actor_id = actor.actor_id;

-- 6  

SELECT store_id, city, country, address
FROM store, address, city, country
WHERE store.store_id = 1
AND store.address_id = address.address_id
AND address.city_id = city.city_id
AND city.country_id = country.country_id;

-- 7

SELECT f1.title, f2.title, f1.rating
FROM film f1, film f2
WHERE f1.rating = f2.rating 
AND f1.film_id < f2.film_id;

-- 8



