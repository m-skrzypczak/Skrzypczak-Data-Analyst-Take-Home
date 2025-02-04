--At what percent has Fetch grown year over year?
--Growth is defined here as new users
WITH yoy_totals AS ( -- Creating a temporary table with Year over Year totals
	SELECT DISTINCT year(created_DATE) as temp_year,
		COUNT(id) OVER (ORDER BY year(created_date)) as cumul_total
		FROM users) -- End temporary table creation

SELECT YEAR(created_date) as Year, -- Pulling out year from created_date
	COUNT(DISTINCT id) as New_Users, -- Calculating New Users for Each Year; Line can be removed for a final result. Values left in for reference of reviewer
	cumul_total as Last_Year_Total, --Pulling in the running total; Line can be removed for a final result. Values left in for reference of reviewer
	CASE WHEN COUNT(DISTINCT id)*1.0/cumul_total IS NULL THEN NULL -- Setting the first year's change value to "NULL"
		ELSE CONCAT(CAST((COUNT(DISTINCT id)*1.0/cumul_total)*100 AS INTEGER),'%') END AS YoY_Change -- Calculating the percentage growth for each year based on new users and the previous year's total users
FROM users u
	LEFT JOIN yoy_totals y ON year(u.created_date)=y.temp_year+1
GROUP BY year(created_date), cumul_total