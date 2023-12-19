SELECT person_name
FROM (
    SELECT weight
        , SUM(weight) OVER(ORDER BY turn) weight_sum
        , person_name
    FROM Queue
) Q
WHERE weight_sum <= 1000
ORDER BY weight_sum DESC
LIMIT 1
;