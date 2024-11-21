# 월별 거래 분류 테이블
WITH TransactionByMonth AS (
    SELECT DATE_FORMAT(trans_date, '%Y-%m') AS month
        , country
        , state
        , amount
    FROM Transactions
)

SELECT month
    , country
    , COUNT(*) AS trans_count
    , COUNT(IF(state = 'approved', state, null)) AS approved_count
    , SUM(amount) AS trans_total_amount
    , SUM(IF(state = 'approved', amount, 0)) AS approved_total_amount
FROM TransactionByMonth
GROUP BY country, month
;
    