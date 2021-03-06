CREATE TABLE `employees` (
  `employeeNumber` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int(11) DEFAULT NULL,
  `jobTitle` varchar(50) NOT NULL,
  PRIMARY KEY (`employeeNumber`)
);


insert  into `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`) values 
(1002,'Murphy','Diane','x5800','dmurphy@classicmodelcars.com','1',NULL,'President'),
(1056,'Patterson','Mary','x4611','mpatterso@classicmodelcars.com','1',1002,'VP Sales'),
(1076,'Firrelli','Jeff','x9273','jfirrelli@classicmodelcars.com','1',1002,'VP Marketing');


CREATE TABLE employees_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);


DELIMITER $$
CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
BEGIN
    INSERT INTO employees_audit (action, employeeNumber, lastname, changedat)
                         VALUES ('update', OLD.employeeNumber, OLD.lastname, NOW())
END $$
DELIMITER ;


UPDATE employees 
SET lastName = 'Phan'
WHERE employeeNumber = 1056;
    
SELECT *
FROM employees_audit;

-- ej1

insert  into `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`) values 
(1002,'Murphy','Diane','x5800', NULL,'1',NULL,'President');
-- you get an error SQL Error [1048] [23000]: Column 'email' cannot be null

-- ej2

UPDATE employees set employeeNumber = employeeNumber - 20;
SELECT * FROM employees;

-- Then run this other
UPDATE employees set employeeNumber = employeeNumber + 20;

-- El mensaje que me devuelve es: SQL Error [1062] [23000]: Duplicate entry '1056' for key 'PRIMARY'
-- Al sumarle 20 dos empleados quedan con el mmismo employeeNumber y no puede haber dos iguales.

-- ej3

ALTER TABLE employees
	ADD `age` INT NOT NULL CHECK (age >=16 AND age <=70);
	
	
