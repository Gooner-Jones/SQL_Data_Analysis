
-- ================================================================================================================
-- Date Exploration 
-- ================================================================================================================
/* Script used:
    - To determine the temporal boundaries of key data points.
    - To understand the scope of date and the timespan of historical data.
*/

-- Determine the first and last order date and the total duration in months
SELECT MIN(order_date) first_order_date,
       MAX(order_date) last_order_date,
       DATEDIFF(year, MIN(order_date), MAX(order_date)) order_range_year
FROM gold.fact_sales


-- Find the youngest and oldest customer based on birthdate
SELECT MIN(birthdate) oldest_birthdate,
       DATEDIFF(YEAR,MIN(birthdate), GETDATE()) oldest_customer_age,
       MAX(birthdate) youngest_birthdate,
       DATEDIFF(YEAR, MAX(birthdate), GETDATE()) youngest_customer_age
FROM gold.dim_customers
