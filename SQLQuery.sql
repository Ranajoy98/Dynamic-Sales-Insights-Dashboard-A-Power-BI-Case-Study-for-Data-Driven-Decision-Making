
-- Creating sales database
CREATE DATABASE  sales

use sales;

select* from customers;

select* from date;

select* from markets;

select* from products;

select* from transactions;

-- Ckecking number of records
select count(*) from transactions;

--Setecting transactions with specific market code
select* from transactions where market_code='Mark001';

select count(*) from transactions where market_code='Mark001';

--Transactions with USD currency
select * from transactions where currency='USD';

select* from date;

--Inner join
SELECT transactions.*, date.* FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2019;

--Total revenue in 2019
SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2019;

--Total revenue in 2020
SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020;

--Total revenue in 2020 January
SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020 and date.month_name='January';

--Total revenue in year 2020 in Mumbai
SELECT SUM(transactions.sales_amount) FROM transactions INNER JOIN date ON transactions.order_date=date.date where date.year=2020
and transactions.market_code='Mark002';

--Unique products Mumbai
select distinct product_code from transactions where market_code='Mark002';

--Total Sales Amount and Quantity by Product
SELECT 
    product_code,
    SUM(sales_qty) AS total_sales_qty,
    SUM(sales_amount) AS total_sales_amount
FROM 
    transactions
GROUP BY 
    product_code
ORDER BY 
    total_sales_amount DESC;

--Monthly Sales Amount by Product
SELECT 
    t.product_code,
    d.year,
    d.month_name,
    SUM(t.sales_amount) AS monthly_sales_amount
FROM 
    transactions t
INNER JOIN 
    date d
ON 
    t.order_date = d.date
GROUP BY 
    t.product_code, d.year, d.month_name
ORDER BY 
    d.year, d.month_name, t.product_code;

--Customers Contributing the Most Sales
SELECT 
    customer_code,
    SUM(sales_amount) AS total_sales_amount
FROM 
    transactions
GROUP BY 
    customer_code
ORDER BY 
    total_sales_amount DESC;

--Sales Performance by Market
SELECT 
    market_code,
    SUM(sales_qty) AS total_sales_qty,
    SUM(sales_amount) AS total_sales_amount
FROM 
    transactions
GROUP BY 
    market_code
ORDER BY 
    total_sales_amount DESC;

--Yearly Sales Summary
SELECT 
    d.year,
    SUM(t.sales_qty) AS total_sales_qty,
    SUM(t.sales_amount) AS total_sales_amount
FROM 
    transactions t
INNER JOIN 
    date d
ON 
    t.order_date = d.date
GROUP BY 
    d.year
ORDER BY 
    d.year;

--Top 5 Best-Selling Products
SELECT TOP 5
    product_code,
    SUM(sales_qty) AS total_sales_qty
FROM 
    transactions
GROUP BY 
    product_code
ORDER BY 
    total_sales_qty DESC;

--Customers with Multiple Orders for the Same Product
SELECT 
    customer_code,
    product_code,
    COUNT(*) AS order_count
FROM 
    transactions
GROUP BY 
    customer_code, product_code
HAVING 
    COUNT(*) > 1;

--Top 5 least-selling products
SELECT TOP 5 
    product_code,
    SUM(sales_qty) AS total_sales_qty
FROM 
    transactions
GROUP BY 
    product_code
ORDER BY 
    total_sales_qty ASC;

--Top 5 least-selling markets
SELECT TOP 5 
    market_code,
    SUM(sales_qty) AS total_sales_qty
FROM 
    transactions
GROUP BY 
    market_code
ORDER BY 
    total_sales_qty ASC;



