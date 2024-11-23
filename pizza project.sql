SHOW VARIABLES LIKE 'secure_file_priv';

create database pizza_Shop;
use pizza_Shop;

create table order_details (order_details_id int ,order_id int ,pizza_id varchar(50),quantity int);



-- Modify pizza_types table
ALTER TABLE pizza_types 
MODIFY pizza_type_id VARCHAR(50);

-- Modify pizzas table
ALTER TABLE pizzas 
MODIFY pizza_type_id VARCHAR(50);

-- Add foreign key relationship
ALTER TABLE pizzas 
ADD CONSTRAINT fk_pizza_type_id 
FOREIGN KEY (pizza_type_id) 
REFERENCES pizza_types(pizza_type_id);

ALTER TABLE order_details 
ADD CONSTRAINT fk_pizza_id 
FOREIGN KEY (pizza_id) 
REFERENCES pizzas(pizza_id);


ALTER TABLE pizza_types 
ADD UNIQUE (pizza_type_id);

show create table pizza_types;
show create table pizzas;


select * from order_details;
select * from orders;
select * from pizza_types;
select * from pizzas;
---------------------------------------------------------------------------------------

select 
	p.pizza_id, p.pizza_type_id, pt.name, pt.category, p.size, p.price,
    o.order_id, o.date, od.order_details_id, sum(od.quantity) as quantity   
from 
	pizzas as p
join pizza_types as pt
	on p.pizza_type_id = pt.pizza_type_id
join order_details as od
	on p.pizza_id = od.pizza_id
join orders as o
	on o.order_id = od.order_id
group by
	p.pizza_id, p.pizza_type_id, pt.name, pt.category, p.size, p.price,
    o.order_id, o.date, od.order_details_id;



select * from (select 
	p.pizza_id, p.pizza_type_id, pt.name, pt.category, p.size, p.price,
    o.order_id, o.date, od.order_details_id, od.quantity  
from pizzas as p
join pizza_types as pt
on p.pizza_type_id = pt.pizza_type_id
join order_details as od
on p.pizza_id = od.pizza_id
join orders as o
on o.order_id = od.order_id
group by
	p.pizza_id, p.pizza_type_id, pt.name, pt.category, p.size, p.price,
    o.order_id, o.date, od.order_details_id, od.quantity) as pizza_data
order by
	quantity desc
limit 100;





















-- Basic:
-- Retrieve the total number of orders placed.
select count(*) as Total_orders from orders;



-- Calculate the total revenue generated from pizza sales.
select round(sum(pizzas.price*order_details.quantity),2) as total_price
from pizzas
join order_details
on pizzas.pizza_id = order_details.pizza_id
order by total_price desc;



-- Identify the highest-priced pizza.
select pizza_types.name, pizzas.price
from pizza_types
join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
order by pizzas.price desc
limit 1;



-- Identify the most common pizza size ordered.
select pizzas.size, count(order_details.quantity)as order_count
from pizzas
join order_details
where pizzas.pizza_id = order_details.pizza_id
group by pizzas.size
order by order_count desc;



-- List the top 5 most ordered pizza types along with their quantities.
select pizza_types.name,sum(order_details.quantity) as order_count
from pizza_types
join pizzas 
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on pizzas.pizza_id = order_details.pizza_id
group by pizza_types.name
order by order_count desc
limit 5;



-- Intermediate:
-- Join the necessary tables to find the total quantity of each pizza category ordered.
select 	
		pizza_types.category,
	   sum(order_details.quantity) as Total_quantity
from pizza_types
	join pizzas
		on pizza_types.pizza_type_id = pizzas.pizza_type_id
	join order_details
		on pizzas.pizza_id = order_details.pizza_id
group by pizza_types.category
order by Total_quantity desc;



-- Determine the distribution of orders by hour of the day.
select hour(time) , count(order_id) as order_count
from orders
group by hour(time);


-- Join relevant tables to find the category-wise distribution of pizzas.
SELECT 
    pt.category,          -- Category from the pizza_types table
    COUNT(p.pizza_id) AS pizza_count  -- Count of pizzas in each category
FROM 
    pizzas p
JOIN 
    pizza_types pt
ON 
    p.pizza_type_id = pt.pizza_type_id  -- Joining on the pizza_type_id
GROUP BY 
    pt.category;  -- Grouping by category to get the count for each

select * from pizza_types;
select * from pizzas;



-- Group the orders by date and calculate the average number of pizzas ordered per day.


SELECT 
    date,                              -- Date of the order
    AVG(pizza_count) AS avg_pizzas_per_day  -- Average pizzas ordered per day
FROM (
    SELECT 
        o.date, 
        COUNT(od.pizza_id) AS pizza_count   -- Count of pizzas per order
    FROM 
        orders o
    JOIN 
        order_details od ON o.order_id = od.order_id  -- Joining orders and order_details tables
    GROUP BY 
        o.order_id, o.date      -- Grouping by order and date to get pizzas per order
) AS daily_orders
GROUP BY 
    date;                        -- Grouping by date to calculate average per day


SELECT 
    ROUND(AVG(Quantity), 0) AS Avg_pizza_Per_day
FROM 
    (
        SELECT 
            o.date AS order_date, 
            SUM(od.quantity) AS Quantity
        FROM 
            orders o
        JOIN 
            order_details od ON o.order_id = od.order_id
        GROUP BY 
            o.date
    ) AS order_Quantity;

-- Determine the top 3 most ordered pizza types based on revenue.

select
	pizza_types.name, sum(pizzas.price * order_details.quantity) as revenue
from 
	pizzas
join
	pizza_types
on
	pizzas.pizza_type_id = pizza_types.pizza_type_id
join
	order_details
on
	pizzas.pizza_id = order_details.pizza_id
group by
	pizza_types.name
order by 
	revenue desc
limit 3;

-- Advanced:
-- Calculate the percentage contribution of each pizza type to total revenue.
-- Analyze the cumulative revenue generated over time.
-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.












-- --------------------------------------------------------------------------------------------------


-- Basic:
-- Retrieve the total number of orders placed.
select count(*) from orders;

-- Calculate the total revenue generated from pizza sales.
select round(sum(order_details.quantity*pizzas.price),2) as total_revenue
from order_details
join pizzas
on pizzas.pizza_id = order_details.pizza_id;


-- Identify the highest-priced pizza.
select pt.name, p.price
from pizza_types as pt
join pizzas as p
on pt.pizza_type_id = p.pizza_type_id
order by p.price desc
limit 1;


-- Identify the most common pizza size ordered.
select p.size, count(od.pizza_id) as order_count
from pizzas as p
join order_details as od
on p.pizza_id = od.pizza_id
group by p.size
order by order_count desc;


-- List the top 5 most ordered pizza types along with their quantities.
select * from order_details;
select * from orders;
select * from pizza_types;
select * from pizzas;

select pt.name, sum(od.quantity) as total_quantity
from pizza_types as pt
join pizzas as p
on p.pizza_type_id = pt.pizza_type_id
join order_details as od
on p.pizza_id = od.pizza_id
group by pt.name
order by total_quantity desc
limit 5;


-- Intermediate:
-- Join the necessary tables to find the total quantity of each pizza category ordered.
select pt.category, sum(od.quantity) as total_quantity
from pizza_types as pt
join pizzas as p
on p.pizza_type_id = pt.pizza_type_id
join order_details as od
on p.pizza_id = od.pizza_id
group by pt.category
order by total_quantity desc
limit 5;


-- Determine the distribution of orders by hour of the day.

-- Join relevant tables to find the category-wise distribution of pizzas.

-- Group the orders by date and calculate the average number of pizzas ordered per day.

-- Determine the top 3 most ordered pizza types based on revenue.

-- Advanced:
-- Calculate the percentage contribution of each pizza type to total revenue.
-- Analyze the cumulative revenue generated over time.
-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.



