-- ==========================================================================================================================
-- Ranking Analysis
-- ==========================================================================================================================
/* Script used:
    - To rank items (e.g., products, customers) based on performance or other metrics.
    - To identify top performers or laggards.
*/

-- Which 5 products generate the highest revenue?
SELECT TOP 5
	   p.product_name,
	   SUM(f.sales_amount) 'Total Revenue'
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY product_name
ORDER BY 2 DESC 

-- Which 5 products generate the least revenue?
SELECT TOP 5
	   p.product_name,
	   SUM(f.sales_amount) 'Total Revenue'
FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
GROUP BY product_name
ORDER BY 2

-- Find the top 10 customers who have generated the highest revenue
SELECT TOP 10
	   c.customer_key,
	   c.first_name,
	   c.last_name,
	   SUM(f.sales_amount) 'Total Revenue'
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON	c.customer_key = f.customer_key
GROUP BY c.customer_key,
		 c.first_name,
		 c.last_name
ORDER BY 4 DESC

-- The 3 customers with the fewest orders placed
SELECT TOP 3
	   c.customer_key,
	   c.first_name,
	   c.last_name,
	   COUNT(DISTINCT order_date) 'Total Orders'
FROM gold.fact_sales f
LEFT JOIN gold.dim_customers c
ON	c.customer_key = f.customer_key
GROUP BY c.customer_key,
		 c.first_name,
		 c.last_name
ORDER BY 4
