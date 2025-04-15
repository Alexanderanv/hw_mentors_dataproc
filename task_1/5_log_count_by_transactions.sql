SELECT
	t.transaction_id AS transaction_id,
	COUNT(l.transaction_id)
FROM 
	transactions_v2 AS t
	LEFT OUTER JOIN logs_v2 AS l
	ON t.transaction_id = l.transaction_id
GROUP BY 
	t.transaction_id
ORDER BY
	transaction_id