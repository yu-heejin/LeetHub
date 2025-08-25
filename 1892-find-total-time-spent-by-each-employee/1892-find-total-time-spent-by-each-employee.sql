SELECT event_day AS day
    , emp_id
    , SUM(out_time - in_time) AS total_time
FROM Employees
GROUP BY emp_id
    , event_day;      # 순서를 바꿔도 오류가 나지 않는다.