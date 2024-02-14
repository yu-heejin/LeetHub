SELECT E.employee_id
    , E.name
    , R.reports_count
    , R.average_age
FROM Employees E
    JOIN (
        SELECT reports_to
            , COUNT(reports_to) AS reports_count
            , ROUND(AVG(age)) AS average_age
        FROM Employees
        GROUP BY reports_to
        HAVING reports_count > 0
    ) R ON E.employee_id = R.reports_to
ORDER BY E.employee_id
;