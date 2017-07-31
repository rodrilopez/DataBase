-- 1

INSERT INTO sakila.customer
(store_id, first_name, last_name, email, address_id, active)
VALUES(1, 'Pepe', 'Suearez', 'pepesuarez@gmail.com', 599, 1);


#El max da 599
SELECT MAX(a.address_id)
FROM address a
WHERE (SELECT c.country_id
		FROM country c, city c1
		WHERE c.country = "United States"
		AND c.country_id = c1.country_id
		AND c1.city_id = a.city_id);
		
#Corroboro que se haya insertado
SELECT *
FROM customer
WHERE last_name = "Suearez";



-- 2

INSERT INTO sakila.rental
(rental_date, inventory_id, customer_id, return_date, staff_id)
SELECT CURRENT_TIMESTAMP, 
		(SELECT MAX(r.inventory_id)
		 FROM inventory r
		 INNER JOIN film USING(film_id)
		 WHERE film.title = "ARABIA DOGMA"
		 LIMIT 1), 
		 601, 
		 NULL,
		 (SELECT staff_id
		  FROM staff
		  INNER JOIN store USING(store_id)
		  WHERE store.store_id = 2
		  LIMIT 1);

SELECT MAX(r.inventory_id)
FROM inventory r
INNER JOIN film USING(film_id)
WHERE film.title = "ALIEN CENTER";

SELECT staff_id
FROM staff
INNER JOIN store USING(store_id)
WHERE store.store_id = 2
LIMIT 1;


-- 3

UPDATE sakila.film
SET release_year='2001'
WHERE rating = "G";

UPDATE sakila.film
SET release_year='2005'
WHERE rating = "PG";

UPDATE sakila.film
SET release_year='2010'
WHERE rating = "PG-13";

UPDATE sakila.film
SET release_year='2015'
WHERE rating = "R";

UPDATE sakila.film
SET release_year='2020'
WHERE rating = "NC-17";


-- 4

#Rental id devuelto 11496 , el precio 2,99, el customer = 155, staff = 1
SELECT rental_id, rental_rate, customer_id, staff_id
FROM film
INNER JOIN inventory USING(film_id)
INNER JOIN rental USING(inventory_id)
WHERE rental.return_date IS NULL
LIMIT 1;

#Hago un update a rental para decir que la pelicula fue devuelta
UPDATE sakila.rental
SET  return_date=CURRENT_TIMESTAMP
WHERE rental_id=11496;

#Hago un insert en pyment del precio de la pelicula 
INSERT INTO sakila.payment
(customer_id, staff_id, rental_id, amount, payment_date)
VALUES(155, 1, 11496, 2.99, CURRENT_TIMESTAMP);
