# 각 월급 별 카테고리
WITH AccountsCategory AS (
    SELECT CASE WHEN income < 20000 THEN 'Low Salary'
        WHEN income >= 20000 AND income <= 50000 THEN 'Average Salary'
        WHEN income > 50000 THEN 'High Salary'
        ELSE null
        END AS category
    FROM Accounts
),
Category AS (
    SELECT 'Low Salary' AS category
    UNION
    SELECT 'Average Salary' AS category
    UNION
    SELECT 'High Salary' AS category
)

SELECT C.category
    , COUNT(AC.category) AS accounts_count
FROM AccountsCategory AC
    RIGHT JOIN Category C ON AC.category = C.category
GROUP BY C.category
;