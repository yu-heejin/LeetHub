WITH all_count AS (
    SELECT user_id
        , COUNT(*) AS all_action
    FROM Confirmations
    GROUP BY user_id
),
confirmed_count AS (
    SELECT user_id
        , COUNT(*) AS confirmed_action
    FROM Confirmations
    WHERE action = 'confirmed'
    GROUP BY user_id
)

SELECT S.user_id
    , IFNULL(ROUND(confirmed_action / all_action, 2), 0) AS confirmation_rate
FROM all_count A
    JOIN confirmed_count C ON A.user_id = C.user_id
    RIGHT JOIN Signups S ON S.user_id = A.user_id