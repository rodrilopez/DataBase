-- 1 
-- a
SELECT country, (SELECT COUNT(*)
					FROM city c2
					WHERE c1.country_id = c2.country_id) as cant
FROM country c1;
-- b
SELECT country, COUNT(*)
FROM city b, country a
WHERE b.country_id = a.country_id
GROUP BY country;

-- 2
-- a
SELECT country, (SELECT COUNT(*) av
					FROM city c2
					WHERE c1.country_id = c2.country_id) as cant
FROM country c1
WHERE (SELECT COUNT(*) av
					FROM city c2
					WHERE c1.country_id = c2.country_id) > 10
ORDER BY 2 DESC;
-- b
SELECT country, COUNT(*)
FROM city b, country a
WHERE b.country_id = a.country_id
GROUP BY country
HAVING COUNT(*) > 10
ORDER BY 2 DESC;

-- 3

SELECT c1.first_name, c1.last_name, a1.address, COUNT(*), SUM(p1.amount) AS total
FROM customer c1 
INNER JOIN address a1 USING(address_id)
INNER JOIN rental USING(customer_id)
INNER JOIN payment p1 USING(rental_id)
GROUP BY 1, 2, 3
ORDER BY 5 DESC;

-- 4

SELECT f1.title
FROM film f1 
WHERE f1.film_id NOT IN (SELECT film_id
						   FROM inventory);
						   
-- 5

SELECT


