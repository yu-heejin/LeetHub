DELETE FROM Person
WHERE id NOT IN (
    SELECT MIN(id)
    FROM (
        SELECT *
        FROM Person
    ) P
    GROUP BY email
);
