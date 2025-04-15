SELECT
	NVL(l.category, 'Unknown') AS category,
	COUNT(DISTINCT t.transaction_id) AS sales_count
FROM 
	transactions_v2 AS t
	LEFT OUTER JOIN logs_v2 AS l
	ON t.transaction_id = l.transaction_id
GROUP BY 
	NVL(l.category, 'Unknown')
ORDER BY
	sales_count DESC