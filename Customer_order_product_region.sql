drop database if exists sales;
create database sales;
use sales;

show tables;

-- check row count
select count(*) from customers;

select count(*) from orders;

select count(*) from product;

select count(*) from region;

-- check table structure
describe customers;
describe orders;
describe product;
describe region;

select * from customers;
select * from orders;
select * from product;
select * from region;

-- KPI's
-- total sales
select round(sum(sales_amount), 2) as revenue
from orders;

-- total profit
select round(sum(profit), 2) as total_profit
from orders;

-- total quantity
select sum(quantity) as total_quantity
from orders;

-- total order
select count(distinct order_id) as total_order
from orders;

-- total customers
select count(distinct customer_id) as total_customers
from customers;

-- total product
select count(distinct product_id) as total_product
from orders;

-- chart visualization
-- sales vs return
select 
	transaction_type,
    count(*) as transactions,
    sum(quantity) as total_quantity,
	round(sum(sales_amount)) as total_sales,
    round(sum(profit)) as total_profit
from orders
group by transaction_type;
    
-- monthly sales
select
	year(order_date) as year,
    month(order_date) as month,
    round(sum(sales_amount)) as total_sales
from orders
where order_date is not null
group by 
		year(order_date),
		month(order_date)
order by 
		year,
        month;

select
	date_format(order_date, "%Y-%m") months,
    round(sum(sales_amount)) as total_sales
from orders
where order_date is not null
group by date_format(order_date, "%Y-%m")
order by months;

-- valid date and missing date wise sales
select
	order_date_status,
    round(sum(sales_amount)) as total_sales
from orders
group by order_date_status;

-- region wise sales
select 
	r.region,
    round(sum(o.sales_amount),2) as total_sales
from orders as o
join region as r
	on o.region_id = r.region_id
group by r.region
order by total_sales desc;

-- category wise sales
select
	p.category,
    round(sum(o.sales_amount),2) as total_sales
from orders as o
join product as p
	on o.product_id = p.product_id
group by p.category
order by total_sales;

-- sub category wise sales and profit
select
	p.sub_category,
    round(sum(o.sales_amount), 2) as total_Sales,
    round(sum(o.profit), 2) as total_profit
from orders as o
join product as p
	on o.product_id = p.product_id
where o.product_id <> "Unknown"
group by p.sub_category
order by total_Sales desc;

-- top 10 product
select 
	p.product_id,
	p.product_name,
    round(sum(o.sales_amount),2) as total_sales
from orders as o
join product as p
	on o.product_id = p.product_id
where o.product_id <> "Unknown"
group by p.product_id, p.product_name
order by total_sales desc
limit 10;

-- Bottom 10 Products
select
	p.product_id,
    p.product_name,
    round(sum(sales_amount), 2) as total_sales
from orders as o
join product as p
	on o.product_id = p.product_id
where o.product_id <> "Unknown"
group by p.product_id, p.product_name
order by total_sales asc
limit 10;

-- Top 10 Customers wise sales
select
	c.customer_id,
    c.customer_name,
    round(sum(o.sales_amount),2) as total_sales
from orders as o
join customers as c
	on o.customer_id = c.customer_id
where o.customer_id <> "Unknown"
group by c.customer_id, c.customer_name
order by total_sales desc
limit 10;

-- Profit Margin
select
	round(sum(profit), 2) as total_profit,
    round(sum(sales_amount), 2) as total_sales,
    round(
		sum(profit) / nullif(sum(sales_amount), 2) * 100,
        2
	) as profit_margin_percentage
from orders;

-- return rate
SELECT
    COUNT(DISTINCT CASE 
        WHEN transaction_type = 'Return' 
        THEN order_id 
    END) AS returned_orders,

    COUNT(DISTINCT order_id) AS total_orders,

    ROUND(
        COUNT(DISTINCT CASE 
            WHEN transaction_type = 'Return' 
            THEN order_id 
        END)
        / NULLIF(COUNT(DISTINCT order_id), 0) * 100,
        2
    ) AS return_rate_percentage
FROM orders;

-- Month-over-Month Growth
WITH monthly_sales AS (
    SELECT
        DATE_FORMAT(order_date, '%Y-%m') AS month,
        round(SUM(sales_amount),2) AS sales
    FROM orders
    WHERE order_date IS NOT NULL
    GROUP BY DATE_FORMAT(order_date, '%Y-%m')
)
SELECT
    month,
    sales,
    LAG(sales) OVER (ORDER BY month) AS previous_month_sales
FROM monthly_sales
ORDER BY month;

-- Loss-making Products
select
	p.product_id,
    round(sum(o.sales_amount),2) as total_sales,
    round(sum(o.profit),2) as total_profit
from orders as o
join product as p
	on o.product_id = p.product_id
where o.product_id <> "Unknown"
group by p.product_id
having total_profit < 0
order by total_profit asc;

-- Customer Segmentation
select
	c.customer_segment,
    round(sum(o.sales_amount),2) as total_sales,
    round(sum(o.profit),2) as total_profit
from orders as o
join customers as c
	on o.customer_id = c.customer_id
group by c.customer_segment
order by total_sales desc;

