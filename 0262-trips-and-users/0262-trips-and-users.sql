# 차단되지 않은 드라이버/사용자의 요청
# COUNT(status LIKE 'cancelled%')는 결과가 True/False이므로 모두 세어버린다.
SELECT request_at AS 'Day'
    , ROUND(SUM(status LIKE 'cancelled%') / COUNT(*), 2) AS 'Cancellation Rate'    # two decimal points
FROM Trips
WHERE client_id NOT IN (
    SELECT users_id
    FROM Users
    WHERE banned = 'Yes'
) AND driver_id NOT IN (
    SELECT users_id
    FROM Users
    WHERE banned = 'Yes'
)
AND request_at BETWEEN '2013-10-01' AND '2013-10-03'
GROUP BY request_at;