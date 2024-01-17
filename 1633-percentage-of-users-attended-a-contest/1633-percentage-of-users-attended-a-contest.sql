# Users에 있는 모든 사람들이 콘테스트에 등록한 비율
SELECT contest_id
    , ROUND((COUNT(*) / (SELECT COUNT(*) FROM Users)) * 100, 2) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC
    , contest_id ASC
;