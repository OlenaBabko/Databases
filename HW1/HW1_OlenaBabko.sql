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



#8  Виведіть всю інформацію про фільми з рейтингом “G” і
# replacement_cost більшою ніж 15 доларів.  

SELECT * FROM film
WHERE
	rating = "G"
    AND
    replacement_cost > 15;

#9 Виведіть всю інформацію про фільми з тривалістю від 60 до
# 90 хвилин включно.

-- SELECT * FROM film
-- WHERE length BETWEEN 60 AND 90;

SELECT * FROM film
WHERE length>=60 AND length<=90;



#10 Виведіть всю інформацію про фільми з тривалістю меншою за
# 60 хвилин або більшою за 90 хвилин.

SELECT * FROM film
WHERE length<60 OR length>90;



#11 Виведіть назви всіх фільмів в яких rental duration рівна 6 або 7,
# rental rate не менша 4, а також в special features наявні Trailers або Commentaries

SELECT title 
FROM film
WHERE
	(rental_duration = 6 OR rental_duration = 7)
    AND rental_rate >= 4
    AND
    (special_features LIKE '%Trailers%'
	OR special_features LIKE '%Commentaries%');



#12 Виведіть всі фільми які або мають рейтинг G і тривалість більшу
#ніж 60 хвилин, або мають рейтинг R і містять Commentaries в special
# features    

SELECT * FROM film
WHERE
	(rating = "G" AND length > 60)
    OR
    (rating = "R" AND special_features LIKE '%Commentaries%');