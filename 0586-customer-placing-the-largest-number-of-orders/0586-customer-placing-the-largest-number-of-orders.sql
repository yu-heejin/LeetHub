# MAX는 집계 결과가 없으면 항상 null을 반환한다.
-- SELECT MAX(customer_number) AS customer_number
-- FROM Orders;

# 가장 많은 주문을 한 고객넘버
SELECT customer_number
FROM (
    SELECT COUNT(*) AS count
        , customer_number
    FROM Orders
    GROUP BY customer_number
) T
ORDER BY count DESC
LIMIT 1;