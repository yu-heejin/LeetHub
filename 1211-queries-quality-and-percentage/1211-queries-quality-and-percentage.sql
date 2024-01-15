SELECT query_name
    , ROUND(SUM(rating / position) / COUNT(*), 2) AS quality
    , ROUND((COUNT(CASE WHEN rating < 3 THEN 1 END) / COUNT(*)) * 100, 2) AS poor_query_percentage
FROM Queries
WHERE query_name != 'null'
GROUP BY query_name
;