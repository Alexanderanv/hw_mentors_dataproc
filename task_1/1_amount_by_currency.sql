SELECT
	currency,
	SUM(amount) AS amount
FROM 
	transactions_v2
WHERE
	currency != '???'
GROUP BY 
	currency