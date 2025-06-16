
-- ================================================================================================================
-- Dimensions Exploration
-- ================================================================================================================

/* Identifying the unique values (or category) in each dimension.
   Recognizing how data might be grouped or segmented which useful for later analysis
*/
-- Explore all Customers country of origin

-- Retrieve a list of unique countries from which customers originate
SELECT DISTINCT country 
FROM gold.dim_customers
ORDER BY country;

-- Retrieve a list of unique categories, subcategories, and products
SELECT DISTINCT category, 
				        subcategory, 
				        product_name 
FROM gold.dim_products
ORDER BY category, subcategory, product_name;
