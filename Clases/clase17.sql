SELECT * FROM customers;

CREATE INDEX postalCode ON customers(postalCode);

-- DROP INDEX postalCode ON customers;

ALTER TABLE products 
ADD FULLTEXT(productline);

SELECT * FROM products;

SELECT productName, productline
FROM products
WHERE MATCH(productline) AGAINST('Classic');

SELECT productName, productline
FROM products
WHERE MATCH(productline) AGAINST('Classic,Vintage');

ALTER TABLE products 
ADD FULLTEXT(productName);

SELECT productName, productline
FROM products
WHERE MATCH(productName) AGAINST('1932,Ford');


-- ej1

SELECT customer_id, first_name, address
FROM customer
INNER JOIN address USING(address_id);

SELECT * 
FROM address
WHERE postal_code IN (SELECT postal_code
						FROM address AS addre 
					   WHERE addre.postal_code LIKE "%515%");
					   
CREATE INDEX address_code ON address(postal_code);

-- ej2

SELECT first_name FROM actor WHERE first_name LIKE "%Christian%";

SELECT last_name FROM actor WHERE last_name LIKE "%Grey%";