-- Write your query below
WITH AB_cust_cte AS (
    SELECT customer_id
    FROM orders
    WHERE product_name IN ('A', 'B')
    GROUP BY customer_id
    HAVING COUNT(DISTINCT product_name) = 2
),
C_cust_cte AS (
    SELECT customer_id
    FROM orders
    WHERE product_name = 'C'
)

SELECT ab.customer_id, cus.customer_name
FROM AB_cust_cte ab
JOIN customers cus ON ab.customer_id = cus.customer_id
WHERE NOT EXISTS (
    SELECT 1
    FROM C_cust_cte c
    WHERE ab.customer_id = c.customer_id 
)
ORDER BY cus.customer_name