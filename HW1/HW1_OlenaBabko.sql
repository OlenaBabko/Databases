#1 Виведіть вміст таблиці customer
SELECT * FROM sakila.customer;



#2 З таблиці customer виведіть лише ім’я, прізвище та електронну пошту.
# В результуючій таблиці колонки мають називатися “First Name”, 
# “Last Name”,“Email”

SELECT 
	first_name AS "First Name", 
    last_name AS "Last Name",
    email AS "Email"
FROM customer;



#3 З таблиці address виведіть колонки address, district, postal_code. 
# Назви в результуючому запиті: “Address”, “District”, “Postal Code”.
# Відсортуйте результат за колонкою district (за зростанням) та
# address (за спаданням).

SELECT 
	address AS "Address", 
    district AS "District",
    postal_code AS "Postal Code"
FROM address
ORDER BY district ASC, address DESC;



