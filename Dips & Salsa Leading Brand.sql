-- Which is the leading brand in the Dips & Salsa category?
-- Leading Brand was determined based on quantity
SELECT DISTINCT TOP 1 Brand, -- Limiting list to the Top Brand; List can be expanded by removing "Top 1" from this line
	SUM(final_quantity) as Quantity -- Calculating the total quantity
FROM products p
	LEFT JOIN transactions t ON p.barcode=t.barcode -- LEFT JOIN to ensure brands with a quantity of 0 are captured as well
WHERE category_2='Dips & Salsa' and brand IS NOT NULL -- Limiting to Brands that are not null and in the Dips & Salsa Category
GROUP BY brand
ORDER BY quantity DESC -- Placing the brand with the highest quantity at the top of the view