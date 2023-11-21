#1 Вивести адресу і місто до якого відноситься ця адреса
# (таблиці address, city).

#1 subquery
SELECT
	ad.address,
    (SELECT city FROM city AS c
	WHERE c.city_id = ad.city_id) AS city
FROM address AS ad;

#1 join
SELECT ad.address, c.city
FROM address AS ad
JOIN city AS c
	ON ad.city_id = c.city_id;    




#2 Вивести список міст Аргентини і Австрії. 
# (таблиці city, country). Відсортувати за алфавітом.

#2 subquery
SELECT city FROM city
WHERE country_id in (
	SELECT country_id FROM country
    WHERE country.country_id = city.country_id
    AND country in ("Argentina", "Australia")
)
ORDER BY city ASC;

#2  join
SELECT city FROM city
JOIN country
	ON city.country_id = country.country_id
WHERE country in ("Argentina", "Australia")
ORDER BY city ASC;



#3 Вивести список акторів, що знімалися в фільмах категорій Music,
# Sports. (використати таблиці actor, film_actor, film_category, category).

#3 subquery
SELECT DISTINCT first_name, last_name FROM actor
WHERE actor_id in (
	SELECT actor_id FROM film_actor
    WHERE film_id in (
		SELECT film_id FROM film_category
        WHERE category_id in (
			SELECT category_id FROM category
            WHERE name in ("Music", "Sports")
        )
    )
);

#3 join
SELECT DISTINCT first_name, last_name
FROM actor AS a
JOIN film_actor AS fa ON a.actor_id = fa.actor_id
JOIN film_category AS fc ON fa.film_id = fc.film_id
JOIN category AS c ON fc.category_id = c.category_id
WHERE name in ("Music", "Sports")



#4 Вивести всі фільми, видані в прокат менеджером Mike Hillyer. 
#Для визначення менеджера використати таблицю staff і поле staff_id;
#для визначення фільму скористатися таблицею inventory
#(поле inventory_id), і таблиці film (поле film_id).

#4 subquery
SELECT title FROM film
WHERE film_id in (
	SELECT film_id FROM inventory
    WHERE inventory_id in (
		SELECT inventory_id FROM rental
        WHERE staff_id in (
			SELECT staff_id FROM staff
			WHERE first_name = "Mike" AND last_name = "Hillyer"
        )
    )
);

#4 join
SELECT DISTINCT title FROM film AS f
JOIN inventory AS i ON f.film_id = i.film_id
JOIN rental AS r ON i.inventory_id = r.inventory_id
JOIN staff AS s ON r.staff_id = s.staff_id
WHERE s.first_name = "Mike" AND s.last_name = "Hillyer";



#5 Вивести користувачів, що брали в оренду фільми SWEETHEARTS
# SUSPECTS, TEEN APOLLO, TIMBERLAND SKY, TORQUE BOUND

#5 subquery
SELECT first_name, last_name FROM customer
WHERE customer_id in (
	SELECT customer_id FROM rental
    WHERE inventory_id in (
		SELECT inventory_id FROM inventory
        WHERE film_id in (
			SELECT film_id FROM film
			WHERE title in ("SWEETHEARTS", "SUSPECTS", "TEEN APOLLO", "TIMBERLAND SKY", "TORQUE BOUND")
        )
    )
);
 
#5 join
SELECT DISTINCT first_name, last_name FROM customer AS c
JOIN rental AS r ON c.customer_id = r.customer_id
JOIN inventory AS i ON r.inventory_id = i.inventory_id
JOIN film AS f ON i.film_id = f.film_id
WHERE title in ("SWEETHEARTS", "SUSPECTS", "TEEN APOLLO", "TIMBERLAND SKY", "TORQUE BOUND");



#6 Вивести назву фільму, тривалість фільму і мову фільму.
#Фільтр: мова Англійська або італійська. (таблиці film, language).

#6 subquery
SELECT
	title,
    length,
    (SELECT name FROM language AS l
    WHERE l.language_id = f.language_id) AS name
FROM film AS f;

#6 join
SELECT
	f.title,
    f.length,
    l.name
FROM film AS f
JOIN language AS l ON f.language_id = l.language_id;


#7  Вивести payment_date i amount всіх записів активних клієнтів
#(поле active таблиці customer).

#7 subquery
SELECT payment_date, amount
FROM payment
WHERE customer_id in (
	SELECT customer_id FROM customer
    WHERE active = 1
);

#7 join
SELECT payment_date, amount
FROM payment AS p
JOIN customer  AS c ON p.customer_id = c.customer_id;



