-- ej1

CREATE OR REPLACE VIEW list_of_customers AS
SELECT customer_id AS 'Customer ID', CONCAT_WS(' ',first_name,last_name) AS 'Name', address, postal_code AS 'Zip Code', phone, city, country, store_id,
CASE active
	WHEN "1" THEN "active"
ELSE "inactive"
END AS 'Status'
FROM customer
INNER JOIN address USING(address_id)
INNER JOIN city USING(city_id)
INNER JOIN country USING(country_id)
INNER JOIN store USING(store_id);

SELECT * FROM list_of_customers;


-- ej2

SELECT film_id, title, description, name, amount, `length`, rating, GROUP_CONCAT(first_name,last_name)
FROM film
INNER JOIN film_category USING(film_id)
INNER JOIN category USING(category_id)
INNER JOIN inventory USING(film_id)
INNER JOIN rental USING(inventory_id)
INNER JOIN payment USING(rental_id)
INNER JOIN film_actor USING(film_id)
INNER JOIN actor USING(actor_id)
GROUP BY 1,2,3,4,5,6,7;


-- ej3

DROP VIEW IF EXISTS sales_by_film_category2

CREATE VIEW sales_by_film_category2 AS
SELECT name, SUM(amount) AS total_rental
FROM category
JOIN film_category USING (category_id)
JOIN film USING (film_id)
JOIN inventory USING (film_id)
JOIN rental USING (inventory_id)
JOIN payment USING (rental_id)
GROUP BY name

SELECT *
FROM sales_by_film_category2


-- ej4 
DROP VIEW IF EXISTS actor_information

CREATE VIEW actor_information AS
SELECT actor_id, CONCAT_WS(' ', first_name, last_name) AS actor, COUNT(film.film_id) AS total_films
FROM actor
JOIN film_actor USING (actor_id)
JOIN film USING (film_id)
GROUP BY actor_id

SELECT *
FROM actor_information
