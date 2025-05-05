SELECT E.employee_id
    , E.name
    , R.reports_count
    , R.average_age
FROM Employees E
JOIN (
    SELECT reports_to
        , ROUND(AVG(age)) AS average_age
        , COUNT(*) AS reports_count
    FROM Employees
    WHERE reports_to IN (
        SELECT DISTINCT reports_to
        FROM Employees
    )
    GROUP BY reports_to
) R ON E.employee_id = R.reports_to
ORDER BY E.employee_id
;