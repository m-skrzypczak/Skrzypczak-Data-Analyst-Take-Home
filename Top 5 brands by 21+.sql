--What are the top 5 brands by receipts scanned among users 21 and over?
SELECT TOP 5 b.brand, -- Limiting Query to top 5 brands
    COUNT(DISTINCT a.RECEIPT_ID) as receipts_scanned -- Utilizing DISTINCT to ensure each receipt is only counted once
FROM Transactions a
	LEFT JOIN products b ON a.barcode=b.barcode
	LEFT JOIN Users c ON a.user_id=c.id
WHERE a.barcode IS NOT NULL AND b.brand IS NOT NULL -- Excluding receipts without barcodes and barcodes without brands
	AND DATEDIFF(year,c.birth_date,GETDATE())>=21 -- Limiting to users 21+
GROUP BY b.brand
ORDER BY receipts_scanned DESC -- Ordering from smallest to largest