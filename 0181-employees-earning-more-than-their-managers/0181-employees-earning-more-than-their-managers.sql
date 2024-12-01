# 본인 매니저랑 join해서 더 큰값을 가진 사람
SELECT E1.name AS Employee
FROM Employee E1
    JOIN Employee E2 ON E1.managerId = E2.id
        AND E1.salary > E2.salary
;