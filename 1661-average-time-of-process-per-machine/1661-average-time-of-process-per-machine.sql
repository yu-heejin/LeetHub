WITH end_time AS (
    SELECT machine_id
        , process_id
        , timestamp
    FROM Activity
    WHERE activity_type = 'end'
)
, start_time AS (
    SELECT machine_id
        , process_id
        , timestamp
    FROM Activity
    WHERE activity_type = 'start'
)

SELECT E.machine_id
    , ROUND(SUM(E.timestamp - S.timestamp) / COUNT(E.machine_id), 3) AS processing_time
FROM end_time E
    JOIN start_time S ON E.machine_id = S.machine_id
        AND E.process_id = S.process_id
GROUP BY E.machine_id
;