-- Who are Fetch's power users?
--Power users were defined as users with 3 transactions (the max number with the data provided); In a more complex dataset the definitions would be based off of ranges rather then single numbers (i.e. low would be 1-5, mid would be 6-10, etc.) based off of the numbers present

SELECT a.id,
	COUNT(DISTINCT receipt_id) as transaction_count,
	CASE WHEN COUNT(DISTINCT receipt_id)=0 THEN 'non-user' --start definition of user_type
		WHEN COUNT(DISTINCT receipt_id)=1 THEN 'low user'
		WHEN COUNT(DISTINCT receipt_id)=2 THEN 'mid-user'
		WHEN COUNT(DISTINCT receipt_id)=3 THEN 'power user' END AS user_type --end definition of user_type
FROM users a
	LEFT JOIN transactions b on A.id=b.user_id -- LEFT JOIN to capture all users, including those with 0 transactions
GROUP BY a.id
ORDER BY transaction_count DESC