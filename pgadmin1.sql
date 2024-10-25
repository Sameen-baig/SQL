-- INSERT INTO customer
-- ("ID", "Name", "Age", "City", "Salary")
-- VALUES
-- (1, 'Sam', 26, 'Delhi', 9000),
-- (2, 'Ram', 19, 'Bangalore', 11000),
-- (3, 'Pam', 31, 'Mumbai', 6000),
-- (4, 'Jam', 42, 'Pune', 10000);

SELECT * FROM customer;

-- UPDATE customer
-- SET "Name" = 'Xam', "Age"= 32
-- WHERE "ID" = 4

-- DELETE FROM customer
-- WHERE "ID" = 3;

--commit;

--CREATE TABLE classroom
--(
	rollno int8 PRIMARY KEY,
	name varchar(50) NOT NULL,
	house char(12) NOT NULL,
	grade char(1)
--);
--SELECT * FROM classroom;
--
--INSERT INTO classroom
--(rollno, name, house, grade)
--VALUES
--(1, 'Sam', 'Akash', 'B'),
--(2, 'Ram', 'Agni', 'A'),
--(3, 'Shyam', 'Jal', 'B'),
--(4, 'Sundar', 'Agni', 'A'),
--(5, 'Ram', 'Yayu', 'B');

--SELECT rollno,name FROM classroom WHERE rollno=1;

--SELECT * FROM classroom 
--ORDER BY name ASC;
--LIMIT 5;

csv files
-- CREATE TABLE customer
-- (
-- 	customer_id int8 PRIMARY KEY,
-- 	first_name varchar(50),
-- 	last_name varchar(100),
-- 	address_id int8
-- );

-- COPY customer(customer_id, first_name, last_name, address_id)
-- FROM 'C:\Program Files.csv'
-- DELIMITER ','
-- CSV HEADER;
C:\Program Files\PostgreSQL\16\pgAdmin 4\runtime\Downloads\psql.exe

CREATE TABLE payment
(
	customer_id int8 PRIMARY KEY,
	amount int8 NOT NULL,
	mode varchar(50),
	payment_date date
);

INSERT INTO customer
(customer_id,first_name,last_name,address_id)
VALUES
(1,'Mary','Smith',5),
(2,'Lary','Dmith',6),
(3,'pat','jones',7);


SELECT * FROM customer;
SELECT UPPER(first_name) FROM customer;
SELECT LOWER(first_name) FROM customer;
SELECT LENGTH(first_name), first_name FROM customer;
SELECT SUBSTRING(first_name, 1, 3), first_name FROM customer;
SELECT REPLACE(first_name,'Mary','carry'), first_name, last_name FROM customer;
SELECT CONCAT(first_name,Last_name), first_name, last_name FROM customer;

SELECT ROUND(AVG(amount),2) FROM payment;
SELECT AVG(amount) FROM payment;


-- SELECT * FROM payment;
-- SELECT mode, SUM(amount) AS total
-- FROM payment
-- GROUP BY mode
-- ORDER BY total ASC

-- SHOW TIMEZONE
-- SELECT NOW()
-- SELECT TIMEOFDAY()
-- SELECT CURRENT_TIME , CURRENT_DATE
-- SELECT CURRENT_DATE

SELECT EXTRACT(MONTH FROM payment_date) AS payment_month, payment_date
FROM payment

SELECT *
FROM customer AS c
INNER JOIN payment AS p
ON c.customer_id = p.customer_id
