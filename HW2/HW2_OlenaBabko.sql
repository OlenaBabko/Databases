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




