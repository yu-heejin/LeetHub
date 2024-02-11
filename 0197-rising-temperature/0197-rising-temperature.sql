# 이전 행 결과가 포함되는 weather 테이블
WITH Weather_LAG AS (
    SELECT *
        , LAG(temperature) OVER(ORDER BY recordDate) AS yester_temperature
        , LAG(recordDate) OVER(ORDER BY recordDate) AS yesterday
    FROM Weather
)

SELECT id
FROM Weather_LAG
WHERE temperature > yester_temperature
    AND DATEDIFF(recordDate, yesterday) = 1
;