-- ej 1

CREATE FUNCTION GetCountOfFilmByID(p_id_film INT, p_id_store INT) RETURNS INT(11)
	DETERMINISTIC
BEGIN
	DECLARE amount_films INT(11);
	
	SELECT COUNT(*) INTO amount_films
	FROM film
	INNER JOIN inventory USING(film_id)
	INNER JOIN store USING(store_id)
	WHERE film_id = p_id_film
	AND store_id = p_id_store;
	
	RETURN (amount_films);
END

SELECT GetCountOfFilmByID(1,1);

-- ej 2

CREATE PROCEDURE build_names_list (IN country VARCHAR(100),INOUT names_list TEXT)
BEGIN
	
	DECLARE v_finished INTEGER DEFAULT 0;
	DECLARE v_fn varchar(100) DEFAULT "";
	DECLARE v_ln varchar(100) DEFAULT "";
	
	DECLARE names_cursor CURSOR FOR 
        SELECT first_name,last_name FROM customer
        INNER JOIN address USING(address_id)
        INNER JOIN city USING(city_id)
        INNER JOIN country USING(country_id)
        WHERE country = country;
   	
    DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET v_finished = 1;
	
	OPEN names_cursor;
	
	get_names: LOOP

        FETCH names_cursor INTO v_fn,v_ln;

        IF v_finished = 1 THEN 
            LEAVE get_names;
        END IF;

        -- build names list
        SET names_list = CONCAT(" ",v_fn," ",v_ln,";",names_list);

    END LOOP get_names;

    CLOSE names_cursor;
END

SET @names_list = "";
CALL build_names_list('Argentina',@names_list);
SELECT @names_list;


-- ej 3

-- Debido a que esta película no se ha devuelto todavía, no está disponible. Entonces la función devuelve 0..
SELECT inventory_in_stock(4106);

-- Esta película está en stock, por lo que la función devuelve 1.
SELECT inventory_in_stock(327);

-- La funcion recive el id de la pelicula y del store, de ahi muestra el numero de copias de esa pelicula que estan en stock en ese store.
-- Lo logra al verificar el estado de stock de las entradas en el inventario con la función inventory_in_stock.

CALL film_in_stock(167, 1, @film_stock);
SELECT @film_stock;
