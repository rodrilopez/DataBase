#ej1

SELECT CONCAT_WS(" ", first_name, last_name) AS "Nombre", address_id 
FROM customer;

# saco id de arg
SELECT country, country_id FROM country;

SELECT CONCAT_WS(" ", first_name, last_name) AS "Nombre", CONCAT_WS(", ", address, city) AS "Domicilio"
FROM customer 
INNER JOIN address USING(address_id)
INNER JOIN city USING (city_id)
INNER JOIN country USING (country_id)
WHERE country_id="6";

#ej2

SELECT title, name AS "Idioma",
CASE rating
    WHEN "PG" THEN "PG (Parental Guidance Suggested) – Some Material May Not Be Suitable For Children."
    WHEN "G" THEN "G (General Audiences) – All Ages Are Admitted."
	WHEN "NC-17" THEN "NC-17 (Adults Only) – No One 17 and Under Admitted."
	WHEN "PG-13" THEN "PG-13 (Parents Strongly Cautioned) – Some Material May Be Inappropriate For Children Under 13."
	WHEN "R" THEN "R (Restricted) – Under 17 Requires Accompanying Parent Or Adult Guardian."
END AS "Rating"
FROM film
INNER JOIN `language` USING (language_id)
ORDER BY rating;

#ej3

SELECT title AS "Pelicula", `release_year` AS "Año de Esteno",CONCAT_WS(" ", first_name, last_name) AS Nombre
FROM film
INNER JOIN film_actor USING (film_id)
INNER JOIN actor USING (actor_id)
WHERE UPPER(CONCAT_WS(' ', first_name, last_name)) 
LIKE TRIM(UPPER("  %Bob Fawc%  "));




#ej4

SELECT title,CONCAT_WS(" ", first_name,last_name) AS Nombre,
    CASE WHEN rental.return_date IS NOT NULL THEN 'YES Baby'
    ELSE 'NO!!! (Send Hitman)' END AS Returned,
	MONTHNAME(rental.rental_date) AS month
  FROM film
  	INNER JOIN inventory USING(film_id)
  	INNER JOIN rental USING(inventory_id)
  	INNER JOIN customer USING(customer_id)
WHERE MONTHNAME(rental.rental_date) LIKE 'May'
   OR MONTHNAME(rental.rental_date) LIKE 'June';