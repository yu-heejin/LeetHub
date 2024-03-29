SELECT customer_number
FROM (
    SELECT customer_number
        , COUNT(customer_number) AS count
    FROM Orders
    GROUP BY customer_number
    ORDER BY count DESC
    LIMIT 1
) C
;