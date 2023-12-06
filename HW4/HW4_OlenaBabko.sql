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




