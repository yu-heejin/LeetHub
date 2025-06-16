# 삼각부등식 - 삼각형 임의의 변은 나머지 두 변의 길이의 합보다 작다.

SELECT x, y, z,
    CASE WHEN x + y > z AND y + z > x AND x + z > y THEN 'Yes'
    ELSE 'No'
    END AS triangle
FROM Triangle;