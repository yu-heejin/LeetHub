SELECT Department
    , Employee
    , salary AS Salary
FROM (
    SELECT E.id
        , E.name AS Department
        , E.salary
        , D.name AS Employee
        , DENSE_RANK() OVER(PARTITION BY D.id ORDER BY E.salary DESC) salary_rank
    FROM Employee E
        JOIN Department D ON E.departmentId = D.id
) S
WHERE salary_rank <= 3