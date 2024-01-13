WITH product_id_table AS (
    SELECT DISTINCT product_id
    FROM Products
),
change_date_table AS (
    SELECT PI.product_id
        , MAX(change_date) AS change_date
    FROM Products P
        RIGHT JOIN product_id_table PI ON P.product_id = PI.product_id
        AND P.change_date <= '2019-08-16'
    GROUP BY product_id
)

SELECT CT.product_id
    , IF(P.new_price IS NULL, 10, P.new_price) AS price
FROM change_date_table CT
    LEFT JOIN Products P ON CT.product_id = P.product_id
    AND CT.change_date = P.change_date
;