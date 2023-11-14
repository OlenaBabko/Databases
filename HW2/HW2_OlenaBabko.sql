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



