-- stored procedure
 DELIMITER //
 CREATE PROCEDURE GetAllProducts()
   BEGIN
   SELECT *  FROM products;
   END //
 DELIMITER ;
 
 CALL GetAllProducts();
 
 DECLARE total_sale INT DEFAULT 0;
 

CREATE PROCEDURE GetOfficeByCountry(IN countryName VARCHAR(255))
    BEGIN
        SELECT * 
        FROM offices
        WHERE country = countryName;
    END 
    
 CALL GetOfficeByCountry('USA');
 
 SELECT * FROM offices;
 
 

CREATE PROCEDURE CountOrderByStatus(
        IN orderStatus VARCHAR(25),
        OUT total INT)
BEGIN
    SELECT count(orderNumber)
    INTO total
    FROM orders
    WHERE status = orderStatus;

CALL CountOrderByStatus('Shipped',@total);
SELECT @total;

CALL CountOrderByStatus('in process',@total);
SELECT @total AS  total_in_process;


-- ej1

