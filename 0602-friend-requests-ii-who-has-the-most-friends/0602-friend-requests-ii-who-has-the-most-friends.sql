# 모든 아이디를 select하면 해당 사용자의 친구 수를 구할 수 있음
WITH friends AS (
    SELECT requester_id AS id
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS id
    FROM RequestAccepted
)
, friends_count AS (
    SELECT id
        , COUNT(id) AS num
    FROM friends
    GROUP BY id
    ORDER BY num DESC
    LIMIT 1
)

SELECT *
FROM friends_count
;