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



#4 З таблиці фільмів виведіть назву фільму і ціну прокату таких
# фільмів, ціна прокату яких більша ніж 3 долари.

SELECT title, rental_rate
FROM film
WHERE 
	rental_rate >= 3;



#5  З таблиці фільмів виведіть інформацію про фільми з рейтингом 
# “G”, “PG”, “R”. Колонки які потрібно вивести: назва, опис
# і рейтинг.

SELECT title, description, rating
FROM film
WHERE rating in ("G", "PG", "R");



#6 Виведіть всі записи з таблиці film_text в описі яких є
# слово database.

SELECT * FROM film_text
WHERE description LIKE "database";



#7 Виведіть всю інформацію про фільми, в яких тривалість прокату
# рівна 3, а replacement_cost менша ніж 12 доларів.

SELECT * FROM film
WHERE
	rental_duration = 3
    AND
    replacement_cost < 12;



