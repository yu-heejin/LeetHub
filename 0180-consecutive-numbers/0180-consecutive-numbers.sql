SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT *
        , LEAD(num, 1) OVER(ORDER BY id) AS next_num
        , LAG(num, 1) OVER(ORDER BY id) AS before_num
    FROM Logs
) L
WHERE next_num = num
    AND before_num = num
;