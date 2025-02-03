--What are the top 5 brands by sales among users that have had their account for at least six months?
SELECT TOP 5 b.brand, -- Limiting to the top 5 brands
    SUM(Final_Sale) as total_sales
FROM Transactions a
	LEFT JOIN products b ON a.barcode=b.barcode
	LEFT JOIN Users c ON a.user_id=c.id
WHERE a.barcode IS NOT NULL AND b.brand IS NOT NULL -- Excluding receipts without barcodes and barcodes without brands
	AND DATEDIFF(month,c.created_date,GETDATE())>=6 -- Limiting to users with account 6 months older or more
GROUP BY b.brand
ORDER BY total_sales DESC