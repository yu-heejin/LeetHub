# 2019-08-16 까지의 가격을 찾기
WITH OriginalPrice AS (
    SELECT product_id
        , new_price
        , change_date
        , RANK() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS date_rank
    FROM Products
    WHERE change_date <= '2019-08-16'
),
ProductIds AS (
    SELECT DISTINCT product_id
    FROM Products
)

SELECT P1.product_id
    , IFNULL(P2.new_price, 10) AS price
FROM ProductIds P1
    LEFT JOIN OriginalPrice P2 ON P1.product_id = P2.product_id
    AND P2.date_rank = 1
;