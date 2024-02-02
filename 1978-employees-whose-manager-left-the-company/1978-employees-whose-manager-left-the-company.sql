WITH e1 AS (
    SELECT *
    FROM Employees
    WHERE salary < 30000
)

SELECT employee_id
FROM e1
WHERE manager_id NOT IN (
    SELECT employee_id
    FROM Employees
)
ORDER BY employee_id
;