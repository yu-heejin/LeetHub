WITH accounts_per_category AS (
    SELECT *
        , CASE
        WHEN income > 50000 THEN 'High Salary'
        WHEN income <= 50000 AND income >= 20000 THEN 'Average Salary'
        WHEN income < 20000 THEN 'Low Salary'
        END AS category
    FROM Accounts
),
category_const AS (
    SELECT 'High Salary' AS category
    UNION ALL
    SELECT 'Average Salary' AS category
    UNION ALL
    SELECT 'Low Salary' AS category
)

SELECT C.category
    , IFNULL(accounts_count, 0) AS accounts_count
FROM (
    SELECT category
        , COUNT(*) AS accounts_count
    FROM accounts_per_category
    GROUP BY category
) A
RIGHT JOIN category_const C ON A.category = C.category;
