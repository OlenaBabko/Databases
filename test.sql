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


