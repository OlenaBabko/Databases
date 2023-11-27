#1 Вивести прізвища та імена всіх клієнтів (customer), які не повернули
#фільми в прокат.

#1 subquery
 SELECT first_name, last_name
FROM customer
WHERE customer_id in (
	SELECT customer_id FROM rental
    WHERE return_date is null
);

#1 join
SELECT DISTINCT first_name, last_name
FROM customer c
JOIN rental AS r
	ON r.customer_id = c.customer_id
    WHERE return_date is null;



