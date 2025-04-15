SELECT
	to_date(transaction_date) AS start_of_day,
	count(*) AS transaction_count,
	SUM(amount) AS amount,
	AVG(amount) AS average
FROM 
	transactions_v2
WHERE
	currency != '???'
GROUP BY 
	to_date(transaction_date)
ORDER BY 
	start_of_day