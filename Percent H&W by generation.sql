--What is the percentage of sales in the Health & Wellness category by generation?
SELECT DISTINCT CONCAT(floor(YEAR(birth_date)/20)*20,'-',floor(YEAR(birth_date)/20)*20 + 19) as Generation, -- Defining each generation as a 20-year window
	CONCAT(ROUND(SUM(hw.final_sale)/SUM(t.final_sale)*100,2),'%') as HW_Percent -- Calculating the percent of sales attributed ot Health & Wellness
FROM Transactions t
	LEFT JOIN products p ON t.barcode=p.barcode
	LEFT JOIN Users u ON t.user_id=u.id
	LEFT JOIN (SELECT a.* FROM Transactions a LEFT JOIN products b ON a.barcode=b.barcode WHERE category_1='Health & Wellness') hw ON t.receipt_id=hw.receipt_id -- Building a Health & Wellness only Transaction table
WHERE t.barcode IS NOT NULL AND p.category_1 IS NOT NULL -- excluding NULL barcodes and categories; Null birthdates are included as a separate group
	GROUP BY CONCAT(floor(YEAR(birth_date)/20)*20,'-',floor(YEAR(birth_date)/20)*20 + 19)
	ORDER BY generation ASC