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



