SELECT COUNT(*) FROM public.inventory_fact;


-- 1
SELECT fat_content 
FROM (
  SELECT DISTINCT fat_content 
  FROM product_dimension 
  WHERE department_description 
  IN ('Dairy') ) AS food 
  ORDER BY fat_content
  LIMIT 5;
  
-- Devuelve las 5 cantidades de grasa de lacteos mas chicas
  
-- 2
SELECT order_number, date_ordered
FROM store.store_orders_fact orders
WHERE orders.store_key IN (
  SELECT store_key
  FROM store.store_dimension
  WHERE store_state = 'MA') 
AND orders.vendor_key NOT IN (
    SELECT vendor_key
    FROM public.vendor_dimension
    WHERE vendor_state = 'MA')
AND date_ordered < '2003-03-01';

-- Devuelve numero de orden y la fecha de la orden, donde el estado 
-- del setore sea MA, el vendedor no sea del estado MA y la fecha de la 
-- orden no sea mayor a 2003/03/01.

-- 3
SELECT customer_name, annual_income
FROM public.customer_dimension
WHERE (customer_gender, annual_income) IN
      (SELECT customer_gender, MAX(annual_income)
       FROM public.customer_dimension
       GROUP BY customer_gender);
       
-- 4       
SELECT DISTINCT s.product_key, p.product_description
FROM store.store_sales_fact s, public.product_dimension p
WHERE s.product_key = p.product_key
    AND s.product_version = p.product_version
    AND s.store_key IN
      (SELECT store_key
       FROM store.store_dimension
       WHERE store_state = 'MA')
ORDER BY s.product_key;
       


-- 5
-- EXISTS predicate
-- Get a list of all the orders placed by all stores on 
-- January 2, 2003 for the vendors with records in the 
-- vendor_dimension table 

SELECT order_number, date_ordered
FROM store.store_orders_fact f
WHERE EXISTS (SELECT 1
		      FROM vendor_dimension d 
		      WHERE d.vendor_key=f.vendor_key)
		      AND date_ordered='2003-01-02';


SELECT order_number, date_ordered
FROM store.store_orders_fact f, public.vendor_dimension d 
WHERE f.vendor_key=d.vendor_key
AND date_ordered = '2003-01-02';


-- 6

-- Orders placed by the vendor who got the best deal 
-- on January 4, 2004





-- 7
-- Multicolumn subquery
-- Which products have the highest cost, 
-- grouped by category and department 
---no hacerrrr

-- 8
-- Using pre-join projections to answer subqueries
-- between online_sales_fact and online_page_dimension


-- 9
-- Equi join
-- Joins online_sales_fact table and the call_center_dimension 
-- table with the ON clause