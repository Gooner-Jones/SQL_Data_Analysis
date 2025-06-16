-- ================================================================================================================
-- Part-to-Whole Analysis
-- ================================================================================================================
/* Script used:
    - To compare performance or metrics across dimensions or time periods.
    - To evaluate differences between categories.
    - Useful for A/B testing or regional comparisons.
*/

-- Which categories contribute the most to overall sales?

WITH category_sales AS (	
	SELECT category,
	       SUM(sales_amount) total_sales
	FROM gold.fact_sales f
	LEFT JOIN gold.dim_products p
	ON 	  f.product_key = p.product_key
	GROUP BY category
)
SELECT category,
       total_sales,
       SUM(total_sales) OVER() overall_sales,
       CONCAT(ROUND((CAST(total_sales AS FLOAT) / SUM(total_sales) OVER())* 100, 2), '%') AS 'Percentage of total'
FROM category_sales
ORDER BY total_sales DESC
