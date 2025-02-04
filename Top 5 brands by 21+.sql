--What are the top 5 brands by receipts scanned among users 21 and over?
SELECT TOP 5 p.Brand, -- Limiting Query to top 5 brands
    COUNT(DISTINCT t.RECEIPT_ID) as Receipts_Scanned -- Utilizing DISTINCT to ensure each receipt is only counted once
FROM Transactions t
	LEFT JOIN products p ON t.barcode=p.barcode
	LEFT JOIN Users u ON t.user_id=u.id
WHERE t.barcode IS NOT NULL AND p.brand IS NOT NULL -- Excluding receipts without barcodes and barcodes without brands
	AND DATEDIFF(year,u.birth_date,GETDATE())>=21 -- Limiting to users 21+
GROUP BY p.brand
ORDER BY receipts_scanned DESC -- Ordering from smallest to largest