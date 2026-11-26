-- Write your query below
WITH crimson_orders_cte AS (
    SELECT o.sales_id
    FROM orders o
    JOIN company c ON o.com_id = c.com_id
    WHERE c.name = 'CRIMSON'
)

SELECT sp.name
FROM sales_person sp 
WHERE NOT EXISTS (
    SELECT 1
    FROM crimson_orders_cte cte
    WHERE cte.sales_id = sp.sales_id
)