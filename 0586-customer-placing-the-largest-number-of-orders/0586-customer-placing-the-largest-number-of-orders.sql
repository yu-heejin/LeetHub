SELECT customer_number
FROM (
    SELECT COUNT(order_number) AS order_count
        , customer_number
    FROM Orders
    GROUP BY customer_number
) R
ORDER BY order_count DESC
LIMIT 1;