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
SELECT category, total_sales

