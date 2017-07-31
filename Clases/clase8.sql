
-- el que menos pago y su appellido comienx¿za en R
SELECT MIN(amount)
FROM  customer, payment
WHERE customer.customer_id = payment.customer_id;
-- AND customer.last_name LIKE 'R%';


-- todas las copias de peliculas

SELECT COUNT(*)
FROM inventory
WHERE store_id = 1;


-- cantidad peliculas

SELECT COUNT(DISTINCT film_id)
FROM inventory
WHERE store_id = 1;


-- promedio de duracion de todas las peliculas

SELECT AVG(length)
FROM inventory, film
WHERE film.film_id = inventory.film_id
AND inventory.store_id = 1;


-- promedio de duracion de las peliculas sin repetir

SELECT AVG(length)
FROM film
WHERE film_id IN(SELECT film_id
				FROM inventory
				WHERE store_id = 1);
				

-- lo mimsmo ^^ + tabla temporal

SELECT str1.av
FROM (SELECT AVG(length) av 
		FROM film
		WHERE film_id IN (SELECT film_id
							FROM inventory
							WHERE store_id = 1)) AS str1;
							
							
-- 2da tabla temporal

SELECT other_stores.av
FROM (SELECT AVG(length) av 
		FROM film
		WHERE film_id NOT IN (SELECT film_id
							FROM inventory
							WHERE store_id = 1)) AS other_stores;


-- resta de las dos tablas

SELECT str1.av - other_stores.av
FROM (SELECT AVG(length) AS av 
		FROM film
		WHERE film_id IN (SELECT film_id
							FROM inventory
							WHERE store_id = 1)) AS str1,
	  (SELECT AVG(length) av 
		FROM film
		WHERE film_id NOT IN (SELECT film_id
							FROM inventory
							WHERE store_id = 1)) AS other_stores;


-- resta de las dos tablas

SELECT DISTINCT(SELECT AVG(length) av 
				FROM film
				WHERE film_id IN (SELECT film_id
									FROM inventory
									WHERE store_id = 1)) -
			  (SELECT AVG(length) av 
				FROM film
				WHERE film_id NOT IN (SELECT film_id
										FROM inventory
										WHERE store_id = 1)) AS dif_avg
FROM film;


