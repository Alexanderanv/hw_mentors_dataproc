SELECT
    toStartOfDay(order_date) AS order_date,
    COUNT(DISTINCT order_id) AS order_count,
    ROUND(SUM(total_amount), 2) AS total_amount
FROM orders
GROUP BY order_date
ORDER BY order_date
;