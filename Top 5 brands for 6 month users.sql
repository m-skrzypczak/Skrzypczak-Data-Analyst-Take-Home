--What are the top 5 brands by sales among users that have had their account for at least six months?
SELECT TOP 5 p.Brand, -- Limiting to the top 5 brands
    ROUND(SUM(Final_Sale),2) as Total_Sales
FROM Transactions t
	LEFT JOIN products p ON t.barcode=p.barcode
	LEFT JOIN Users u ON t.user_id=u.id
WHERE t.barcode IS NOT NULL AND p.brand IS NOT NULL -- Excluding receipts without barcodes and barcodes without brands
	AND DATEDIFF(month,u.created_date,GETDATE())>=6 -- Limiting to users with account 6 months older or more
GROUP BY p.brand
ORDER BY total_sales DESC -- Placing the brands with the most sales at the top of the view