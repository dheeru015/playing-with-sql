WITH numbered_transac AS (
  SELECT 
    *, 
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY transaction_date) AS index
  FROM transactions
)
SELECT 
  user_id,
  spend,
  transaction_date
FROM numbered_transac
WHERE index = 3