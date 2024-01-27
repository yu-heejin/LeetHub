SELECT MAX(num) AS num
FROM (
    SELECT num
        , COUNT(num) AS number_count
    FROM MyNumbers
    GROUP BY num
    HAVING number_count = 1
) C
;