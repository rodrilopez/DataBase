SELECT *
FROM film 
JOIN `language`
	ON film.language_id = `language`.language_id;
	

SELECT *
FROM film, `language` 
WHERE film.language_id = `language`.language_id;


SELECT *
FROM film a 
INNER JOIN film b 
ON (a.film_id);


SELECT *
FROM film
	INNER JOIN film_category
			ON film.film_id = film_category.film_id
	INNER JOIN category 
			ON film_category.category_id = category.category_id
		   AND film.title LIKE 'a%';
		   
		   
SELECT *
FROM film
	INNER JOIN film_category
			ON film.film_id = film_category.film_id
	INNER JOIN category 
			ON film_category.category_id = category.category_id
WHERE film.title LIKE 'a%';


SELECT *
FROM film, film_category, category
WHERE film.film_id = film_category.film_id
AND film_category.category_id = category.category_id;

SELECT *
FROM film
	INNER JOIN film_category
		USING ( film_id )
	INNER JOIN category 
		USING (category_id);
		

SELECT *
FROM film
	NATURAL JOIN `language`
	
	
SELECT *
FROM film
	INNER JOIN `language`
		USING (language_id);
		
		
SELECT *
FROM actor a
	NATURAL JOIN actor b;
	
	
INSERT INTO inventory
(film_id, store_id, last_update)
VALUES(1,1,'2017-02-15 05:09:17.000');