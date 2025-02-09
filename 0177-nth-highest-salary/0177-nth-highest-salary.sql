CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  SET N = N - 1;   # 0부터 시작한다.
  RETURN (
    # Write your MySQL query statement below.
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC  # 내림차순으로 정렬하면 N번째로 큰 점수순으로 정렬 가능
    LIMIT 1
    OFFSET N   # 몇 번째 ROW부터 출력할 것인지?
  );
END