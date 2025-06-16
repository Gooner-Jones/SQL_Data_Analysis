-- ================================================================================================================
-- Changes Over Time Analysis
-- ================================================================================================================
/* Script used:
    - To track trends, growth, and changes in key metrics over time.
    - For time-series analysis and identifying seasonality.
    - To measure growth or decline over specific periods.
	- A high-level overview insights that helps with strategic decision-making.
*/

-- Analyse sales performance over time

-- Quick Date Functions
SELECT YEAR(order_date) 'Order Year',
	   MONTH(order_date) 'Oder Month',
       SUM(sales_amount) 'Total Sales',
       COUNT(DISTINCT customer_key) 'Total Customers',
       SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date);

-- DATETRUNC()
SELECT DATETRUNC(month, order_date) 'Order Date',
	   SUM(sales_amount) 'Total Sales',
       COUNT(DISTINCT customer_key) 'Total Customers',
       SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATETRUNC(month, order_date)
ORDER BY DATETRUNC(month, order_date);

-- FORMAT()
SELECT FORMAT(order_date, 'yyyy-MMM') 'Order Date',
       SUM(sales_amount) 'Total Sales',
       COUNT(DISTINCT customer_key) 'Total Customers',
       SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY FORMAT(order_date, 'yyyy-MMM')
ORDER BY FORMAT(order_date, 'yyyy-MMM');

-- How many new customers were added each year
SELECT DATETRUNC(YEAR, create_date) 'Create Year',
	   COUNT(customer_key) 'Total Customers'
FROM gold.dim_customers
GROUP BY DATETRUNC(YEAR, create_date)
ORDER BY 1;
