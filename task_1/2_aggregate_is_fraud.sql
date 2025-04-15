SELECT
	is_fraud,
	count(*) AS count,
	SUM(amount) AS sum,
	AVG(amount) AS average
FROM 
	transactions_v2
WHERE
	currency != '???'
	AND is_fraud = 0
GROUP BY 
	is_fraud
	
UNION ALL

SELECT
	is_fraud,
	count(*) AS count,
	SUM(amount) AS sum,
	AVG(amount) AS average
FROM 
	transactions_v2
WHERE
	currency != '???'
	AND is_fraud = 1
GROUP BY 
	is_fraud