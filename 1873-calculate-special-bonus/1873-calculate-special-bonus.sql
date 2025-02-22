SELECT employee_id
    , IF(LEFT(name, 1) != 'M'
            AND employee_id % 2 != 0, salary, 0) AS bonus
FROM Employees
ORDER BY employee_id;