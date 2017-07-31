-- 1

SELECT first_name, last_name
FROM actor a1
WHERE EXISTS (SELECT *
			  FROM actor a2
			  WHERE a1.last_name = a2.last_name
			  AND a1.last_name = a2.last_name)
ORDER BY last_name;

-- 2

SELECT actor_id
FROM actor
WHERE EXISTS (SELECT DISTINCT actor_id
				  	   FROM film_actor);
				  	   
-- 3

SELECT c.customer_id, c.first_name, c.last_name
FROM rental r1, customer c
WHERE EXISTS (SELECT * 
				  FROM rental r2
				  WHERE r1.customer_id = r2.customer_id
				  AND r1.rental_id <> r2.rental_id )
AND r1.customer_id = c.customer_id
ORDER BY 1;

-- 4 	
				     
SELECT c1.first_name 
FROM customer c1
WHERE c1.customer_id IN (SELECT c2.customer_id 
					     FROM rental, customer c2
					     WHERE c1.customer_id = rental.customer_id
					     AND c1.customer_id = c2.customer_id );
					     
-- 5
	
SELECT DISTINCT a1.first_name, a1.last_name
FROM actor a1, film, film_actor
WHERE film_actor.actor_id = a1.actor_id
AND film_actor.film_id = film.film_id
AND (film.title = 'BETRAYED REAR' OR film.title = 'CATCH AMISTAD');

			  
-- 6

SELECT a1.first_name, a1.last_name
FROM actor a1
WHERE EXISTS (SELECT * 
			  FROM film f1, film f2, film_actor fa1, film_actor fa2
			  WHERE f1.title = 'BETRAYED REAR' AND f2.title = 'CATCH AMISTAD'
			  AND f1.film_id = fa1.film_id AND f2.film_id = fa2.film_id
			  AND fa1.actor_id = a1.actor_id AND fa2.actor_id <> a1.actor_id);
			  
-- 7

SELECT a1.first_name, a1.last_name
FROM actor a1
WHERE EXISTS (SELECT * 
			  FROM film f1, film f2, film_actor fa1, film_actor fa2
			  WHERE f1.title = 'BETRAYED REAR' AND f2.title = 'CATCH AMISTAD'
			  AND f1.film_id = fa1.film_id AND f2.film_id = fa2.film_id
			  AND fa1.actor_id = a1.actor_id AND fa2.actor_id = a1.actor_id);
			  
-- 8

SELECT DISTINCT a1.first_name, a1.last_name
FROM actor a1, film, film_actor
WHERE film_actor.actor_id = a1.actor_id
AND film_actor.film_id = film.film_id
AND (film.title <> 'BETRAYED REAR' OR film.title <> 'CATCH AMISTAD');