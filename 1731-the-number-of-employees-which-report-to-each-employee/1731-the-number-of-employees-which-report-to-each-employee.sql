# reports_to employee_id
WITH ReportEmployee AS (
    SELECT reports_to
        , COUNT(reports_to) AS reports_count
        , ROUND(AVG(age)) AS average_age
    FROM Employees
    GROUP BY reports_to
    HAVING reports_to IS NOT NULL
)

SELECT E.employee_id
    , E.name
    , R.reports_count
    , R.average_age
FROM ReportEmployee R
    JOIN Employees E ON R.reports_to = E.employee_id
ORDER BY E.employee_id
;