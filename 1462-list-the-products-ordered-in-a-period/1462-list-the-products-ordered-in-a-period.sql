SELECT product_name
    , SUM(unit) AS unit
FROM Products P
    JOIN Orders O ON P.product_id = O.product_id
    AND O.order_date LIKE '2020-02%'
GROUP BY P.product_id
HAVING SUM(unit) >= 100
;