
-- ==========================================================================================================================
-- Measures Exploration (Key Metrics)
-- ==========================================================================================================================
/* Script used:
    - To calculate aggregated metrics (e.g., totals, averages) for quick insights.
    - To identify overall trends or spot anomalies.
*/

-- Find the Total Sales
SELECT SUM(sales_amount) 'Total Sales'
FROM gold.fact_sales

-- Find how many items are sold
SELECT SUM(quantity) 'Total Items Sold'
FROM gold.fact_sales

-- Find the average selling price
SELECT AVG(price) 'Average Price'
FROM gold.fact_sales

-- Find the total number of orders
SELECT COUNT(DISTINCT(order_number)) 'Total Orders'
FROM gold.fact_sales

-- Find the total number of products
SELECT COUNT(product_key) 'Total Products'
FROM gold.dim_products

-- Find the total number of customers
SELECT COUNT(customer_key) 'Total Customers'
FROM gold.dim_customers

-- Find the total number of customers that has placed an order
SELECT COUNT(DISTINCT(customer_id)) 'Total number of placed orders'
FROM gold.fact_sales

--Generate a Report that shows all key metrics of the business
SELECT 'Total Sales' as measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Items Sold' as measure_name, SUM(quantity) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Average Price' as measure_name, COUNT(DISTINCT(order_number)) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Orders' as measure_name, AVG(price) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Products' as measure_name, COUNT(product_key) AS measure_value FROM gold.dim_products
UNION ALL
SELECT 'Total Customers' as measure_name, COUNT(customer_key) AS measure_value FROM gold.dim_customers
UNION ALL
SELECT 'Total number of placed orders' as measure_name, COUNT(DISTINCT(customer_id)) AS measure_value FROM gold.fact_sales

