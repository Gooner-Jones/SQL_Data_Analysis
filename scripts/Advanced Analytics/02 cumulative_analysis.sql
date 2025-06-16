-- ================================================================================================================
-- Cumulative Analysis
-- ================================================================================================================
/* Script used:
    - To calculate running totals or moving averages for key metrics.
    - To track performance over time cumulatively.
    - Useful for growth analysis or identifying long-term trends.
*/

-- Calculate the total sales per Month/Year and the running total of sales over time
SELECT order_date,
       total_sales,
       SUM(total_sales) OVER(ORDER BY order_date) 'Running Total'
FROM (SELECT DATETRUNC(YEAR, order_date) AS order_date,
	     SUM(sales_amount) AS total_sales
      FROM gold.fact_sales
      WHERE order_date IS NOT NULL
      GROUP BY DATETRUNC(YEAR, order_date)
      )t
