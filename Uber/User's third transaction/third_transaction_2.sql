--Author: D M DHERRAJ
aggr AS (
  SELECT 
    user_id, 
    ARRAY_AGG(spend ORDER BY transaction_date) AS spend, 
    ARRAY_AGG(transaction_date ORDER BY transaction_date) AS transaction_date
  FROM transactions
  GROUP BY user_id
  HAVING count(user_id) >=3
)
SELECT 
  user_id, 
  spend[3] AS spend,
  transaction_date[3] AS transaction_date
FROM aggr
ORDER BY user_id