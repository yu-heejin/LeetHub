# Write your MySQL query statement below
SELECT *
FROM Patients
WHERE conditions LIKE 'DIAB1%'
    OR conditions LIKE '% DIAB1%'
;

# 아래 쿼리는 안됨
-- WHERE conditions LIKE 'DIAB1%'
--     OR '% DIAB1%'