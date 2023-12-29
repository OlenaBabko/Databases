# 1 Вивести всі фільми, видані в прокат менеджером Mike Hillyer. Для
# визначення менеджера використати таблицю staff і поле staff_id; для
# визначення фільму скористатися таблицею inventory (поле inventory_id), і
# таблиці film (поле film_id).
#(за допомогою cte = common table expression)

WITH staff_cte AS (
	SELECT staff_id
    FROM staff
	WHERE first_name = "Mike" AND last_name = "Hillyer"
),
	rental_cte AS (
    SELECT inventory_id
    FROM rental
    WHERE staff_id IN (SELECT staff_id FROM staff_cte)
),    
    inventory_cte AS (
	SELECT film_id
    FROM inventory
    WHERE inventory_id IN (SELECT inventory_id FROM rental_cte)
),
	film_cte AS (
	SELECT title
    FROM film
    WHERE film_id IN (SELECT film_id FROM inventory_cte)
)
SELECT title FROM film_cte;




# 2 Вивести користувачів, що брали в оренду фільми SWEETHEARTS
# SUSPECTS, TEEN APOLLO, TIMBERLAND SKY, TORQUE BOUND.
# (за допомогою cte = common table expression)

WITH film_cte AS (
	SELECT film_id
    FROM film
    WHERE title in ("SWEETHEARTS", "SUSPECTS", "TEEN APOLLO", "TIMBERLAND SKY", "TORQUE BOUND")
),
	inventory_cte AS (
    SELECT inventory_id
    FROM inventory
    WHERE film_id IN (SELECT film_id FROM film_cte)
),
	customer_cte AS (
	SELECT customer_id
    FROM rental
    WHERE inventory_id IN (SELECT inventory_id FROM inventory_cte)
)
SELECT first_name, last_name FROM customer
WHERE customer_id IN (SELECT customer_id FROM customer_cte);




# 3 Вивести список фільмів, неповернених в прокат, replacement_cost
# яких більший 10 доларів.
WITH rental_cte AS (
	SELECT inventory_id
    FROM rental
    WHERE return_date IS NULL
),
	inventory_cte AS (
	SELECT film_id
    FROM inventory
    WHERE inventory_id IN (SELECT inventory_id FROM rental_cte)
),
	film_cte AS (
	SELECT title
    FROM film
    WHERE film_id IN (SELECT film_id FROM inventory_cte)
    AND replacement_cost > 10
)
SELECT title FROM film_cte;





# 4 Виведіть назву фільму та загальну кількість грошей отриманих від 	
# здачі цього фільму в прокат (таблиці payment, rental, inventory, film)

-- title, film_id FROM film - 
-- film_id, inventory_id FROM inventory -
-- inventory_id, rental_id FROM rental -
-- amount, rental_id FROM payment

WITH payment_cte AS (
	SELECT rental_id, SUM(amount) AS total_rental_amount
    FROM payment
    GROUP BY rental_id
    ORDER BY total_rental_amount DESC
)
SELECT f.title, cte.total_rental_amount FROM payment_cte AS cte
JOIN rental AS r ON r.rental_id = cte.rental_id
JOIN inventory AS i ON i.inventory_id = r.inventory_id
JOIN film AS f ON f.film_id = i.film_id;




