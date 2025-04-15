WITH
  order_stats AS (
    SELECT
      payment_status,
      COUNT(*) AS order_count,
      SUM(total_amount) AS total_amount
    FROM
      orders
    GROUP BY
      payment_status
  )
SELECT
  payment_status,
  order_count,
  total_amount,
  ROUND(total_amount/order_count, 2) AS avg_order_amount
FROM
  order_stats;