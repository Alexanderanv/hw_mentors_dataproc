SELECT
    ROUND(SUM(o.total_amount), 2) AS total_amount,
    ROUND(SUM(oi.quantity), 2) AS total_quantity,
    ROUND(AVG(oi.product_price), 2) AS avg_product_price
FROM orders o
    JOIN order_items oi
    USING (order_id)
;