SELECT SecondHighestSalary
FROM (
    SELECT *
        , LEAD(salary) OVER(ORDER BY salary DESC) AS SecondHighestSalary
    FROM Employee
    LIMIT 2
) R
WHERE salary != SecondHighestSalary
    OR SecondHighestSalary IS NULL
LIMIT 1
;