
# 1) TOTAL NO.of Orders ( 48620 )

SELECT DISTINCT 
	count(order_details.order_id) 
AS 
	"Total Orders"
FROM 
	order_details 
JOIN
	orders ON order_details.order_id = orders.order_id
GROUP BY
	"Total Orders";

# 2) Total No.of Pizzas sold ( 48620 )

SELECT DISTINCT 
	count(pizzas.pizza_id) 
AS 
	"Total products sold"
FROM 
	order_details
JOIN
	pizzas ON order_details.pizza_id = pizzas.pizza_id
GROUP BY 
	"Total Products Sold";

# 3) No.Of Categories ( 4 )

SELECT DISTINCT 
	category 
AS 
	"Pizza Category"
From 
	pizza_types;

# 4) No.of Orders in Each Category

SELECT DISTINCT
    category,
    COUNT(pizza_types.pizza_type_id*order_details.quantity) AS "No of Orders in each Category"
FROM
    pizza_types
JOIN
	pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN
	order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY 
	Category
ORDER BY 
	COUNT(pizza_types.pizza_type_id*order_details.quantity) DESC;

# 5) No.of Orders in each SIZES ( S,M,L,XL,XXL)

SELECT DISTINCT 
	size, 
    count(pizza_type_id*quantity) 
AS 
	"No of Orders in each size"
FROM
	pizzas
JOIN
	order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY 
	size
ORDER BY 
	count(pizza_type_id*quantity)  DESC;

# 6) Pizza High in Price ( The Greek Pizza )

SELECT DISTINCT
	Name,
	sum(price)
AS 
	Price
FROM
	pizzas
JOIN
	pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY 
	Name
Order BY
	Price DESC ;
    
# 7) Profitable Pizza ( The Thai Chicken Pizza )
    
SELECT DISTINCT 
	pizzas.pizza_id , 
    pizza_types.Name ,
	sum(price*quantity) AS "Total Profit"
FROM 
	pizzas
INNER JOIN
	order_details ON pizzas.pizza_id = order_details.pizza_id
INNER JOIN
	pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY 
	pizza_id
ORDER BY 
	 sum(price*quantity) DESC;
    
# 8) Profitless Pizza ( The Greek Pizza )

SELECT DISTINCT 
	pizzas.pizza_id , 
    pizza_types.Name ,
	sum(price*quantity) AS "Total Profit"
FROM 
	pizzas
INNER JOIN
	order_details ON pizzas.pizza_id = order_details.pizza_id
INNER JOIN
	pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY 
	pizza_id
ORDER BY 
	sum(price*quantity) ASC;

# 9) Price of Profitable Pizza ( The Thai Chicken Pizza )

SELECT DISTINCT
	NAME,
    Price,
    size
FROM 
	pizza_types
JOIN
	pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
WHERE
	Name LIKE "The Thai Chicken Pizza"
GROUP BY 
	Name,
    Price,
    size
ORDER BY
	price DESC;
    
# 10) Price of Profitless Pizza ( The Greek Pizza )

SELECT DISTINCT
	NAME,
    Size,
    Price
FROM 
	pizza_types
JOIN
	pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
WHERE
	Name LIKE "The Greek Pizza"
GROUP BY 
	Name,
    Size,
    Price
ORDER BY
	size DESC;
    
# 11) Average Selling Pizza ( The Brie Carre Pizza )

SELECT DISTINCT 
	Name,
    avg(price*quantity) AS "Average Selling Pizza"
FROM
	pizza_types
JOIN 
	pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
Join
	order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY
	Name
Order BY
    avg(price*quantity) DESC;
		
# 12) Price of Average Selling Pizza

SELECT DISTINCT 
	Name,
	Size,
	Price
FROM
	pizza_types
JOIN
	pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
WHERE
	Name LIKE "The Brie Carre Pizza"
GROUP BY
	Name,
	Size,
	Price
ORDER BY 
    Size DESC;
    
# 13) Date of Orders ( 01/2015 - 12/2015 )

SELECT distinct
    (date) 
FROM 
	orders;

# 14) Highest Order per Day ( 2015-11-27 - 115 )

SELECT DISTINCT 
	Date,
    count(order_id) AS "Total Orders"
FROM
	orders
GROUP BY 
	Date
Order BY
	count(order_id) DESC;
    
# 15) Average Cost of Pizzas under each Size ( S,M,L,XL,XXL )

SELECT DISTINCT 
	size,
    avg(price) AS "Average Cost"
FROM 
	pizzas
GROUP BY
	size
ORDER BY 
	avg(price) DESC;
    
# 16) Highest Selling Category ( Veggie )

SELECT DISTINCT
    category,
    count(order_details.order_id) AS "Total Orders"
FROM 
	order_details
JOIN
	pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN 
	pizza_types ON pizzas.pizza_type_id = pizzas.pizza_type_id
GROUP BY
    category
Order BY
	count(order_details.order_id) DESC;
    
# 17) Total No.of Pizzas

SELECT DISTINCT
    count(pizza_id) AS "Total Type of Pizzas"
FROM
	pizzas 
GROUP BY
	 "Total Type of Pizzas";

# 18) Total no.of Ingredients

SELECT DISTINCT
	count(ingredients) AS "Total Ingredients"
FROM
	pizza_types
GROUP BY 
	"Total Ingredients";
	
    
# 19) Find the pizza categories where the pizza size is "M" and the total number of orders is > 50

SELECT DISTINCT 
	Category,
    Size,
    count(order_id) AS "Total Orders"
FROM
	pizza_types
JOIN
	pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN
	order_details ON pizzas.pizza_id = order_details.pizza_id
WHERE
 size LIKE "M"
GROUP BY
	Category,
    Size
HAVING
	count(order_id) > 50
ORDER BY
	count(order_id) DESC;

# 20) Find the Pizza Category where total Sales is > 100000

SELECT DISTINCT
	Category,
    sum(price*quantity) AS "Total Sales"
FROM 
	pizza_types
JOIN
	pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN
	order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY
	Category
HAVING
	sum(price*quantity) > 100000
ORDER BY
	sum(price*quantity) DESC;