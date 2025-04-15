SELECT
	dayofweek(transaction_date) AS day_of_week,
	SUM(amount) AS amount
FROM 
	transactions_v2
GROUP BY 
	dayofweek(transaction_date)
ORDER BY 
	amount DESC
LIMIT 1