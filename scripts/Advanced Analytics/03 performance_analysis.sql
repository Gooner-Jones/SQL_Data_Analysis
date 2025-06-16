-- ================================================================================================================
-- Performance Analysis
-- ================================================================================================================
/* Script used:
    - To measure the performance of products, customers, or regions over time.
    - For benchmarking and identifying high-performing entities.
    - To track yearly trends and growth.
*/

-- Analyze the yearly performance of products by comparing their sales
-- to both the average sales performance of the product and the previous year's sales

WITH yearly_product_sales AS 
(
	SELECT YEAR(order_date) order_year,
		   p.product_name,
		   SUM(f.sales_amount) current_sales
	FROM gold.fact_sales f
	LEFT JOIN gold.dim_products p
	ON 	  f.product_key = p.product_key
	WHERE f.order_date IS NOT NULL
	GROUP BY YEAR(order_date), p.product_name
)
SELECT order_year,
       product_name,
       current_sales,
       AVG(current_sales) OVER(PARTITION BY product_name) 'Average Sales',
       current_sales - AVG(current_sales) OVER(PARTITION BY product_name) 'Diff Average',
       CASE WHEN current_sales - AVG(current_sales) OVER(PARTITION BY product_name) > 0 THEN 'Above Average'
	    WHEN current_sales - AVG(current_sales) OVER(PARTITION BY product_name) < 0 THEN 'Below Average'
	    ELSE 'Average'
       END AS 'Average Change',
       -- Year Over Year Change/ analysis
       LAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_year) 'Previou Year Sales',
       current_sales - LAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_year) 'Diff Previous Year',
       CASE WHEN current_sales - LAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_year) > 0 THEN 'Increase'
	    WHEN current_sales - LAG(current_sales) OVER(PARTITION BY product_name ORDER BY order_year) < 0 THEN 'Decrease'
	    ELSE 'No change'
       END AS 'Previous Year Change'
FROM yearly_product_sales
ORDER BY product_name, order_year
