#1 Як би ви написали запит без використання функції OR:
/*
SELECT item_id FROM items 
WHERE item_name = 'Phone' 
	OR item_name = 'Headphones' 
		OR item_name = 'Mouse'
        OR item_name = 'Laptop'
*/
SELECT item_id 
FROM items 
WHERE item_name IN('Phone', 'Headphones', 'Mouse', 'Laptop');


#2 З огляду на схему, наведену на початку тесту, напишіть запит, 
# що поверне інформацію про товари (items) з ціною від 100 до 1000 доларів.
SELECT item_id, item_name, item_price
FROM items
WHERE item_price >=100 AND item_price <1000
ORDER BY item_price ASC;


#3 З огляду на схему, наведену на початку тесту, напишіть запит, 
# що поверне телефон та електрону пошту клієнта і кількість замовлень, 
# що зробив цей клієнт.
SELECT c.customer_phone, c.customer_email, COUNT(order_id) AS num_of_orders
FROM customers AS c
JOIN orders AS o
ON c.customer_id = o.customer_id
GROUP BY o.customer_id
ORDER BY order_id ASC;


