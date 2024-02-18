# prefix name은 대문자, 소문자로만 시작해야한다
# _, ., - 가 포함될 수 있다
SELECT *
FROM Users
WHERE mail REGEXP '^[a-zA-Z][a-zA-Z0-9\._\-]*@leetcode[\.]com$'