--Author: D M DHERRAJ
WITH total_count AS (
  SELECT count(DISTINCT order_id) AS max_val
  FROM orders
) 
SELECT 
  CASE
    WHEN MOD(order_id, 2) = 1 THEN
      CASE 
        WHEN order_id = max_val THEN order_id 
        ELSE order_id + 1
      END 
    WHEN MOD(order_id, 2) = 0 THEN order_id - 1
  END AS corrected_order_id,
  item
FROM orders, total_count 
ORDER BY corrected_order_id; 