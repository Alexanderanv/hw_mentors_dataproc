SELECT
    user_id,
    ROUND(SUM(total_amount), 2) AS total_amount,
    COUNT(DISTINCT order_id) AS order_count
FROM orders
GROUP BY user_id
ORDER BY total_amount DESC
;
