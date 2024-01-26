# Write your MySQL query statement below
SELECT Department
    , Employee
    , Salary
FROM (
    SELECT D.name AS Department
        , E.name AS Employee
        , E.salary AS Salary
        , DENSE_RANK() OVER(PARTITION BY D.id ORDER BY E.salary DESC) salary_rank
    FROM Employee E
        JOIN Department D ON E.departmentId = D.id
) R
WHERE salary_rank = 1
;