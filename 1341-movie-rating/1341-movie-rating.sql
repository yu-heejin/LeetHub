# 각 사용자별 평가 수
WITH MaxUser AS (
    SELECT U.user_id
        , U.name
        , COUNT(*) AS max_count
    FROM Users U
        JOIN MovieRating M ON U.user_id = M.user_id
    GROUP BY U.user_id
    ORDER BY name
),
# 2020-02 각 영화별 평점
MaxMovie AS (
    SELECT M.movie_id
        , M.title
        , AVG(R.rating) AS max_rating
    FROM Movies M
        JOIN MovieRating R ON M.movie_id = R.movie_id
    WHERE YEAR(created_at) = 2020
        AND MONTH(created_at) = 2
    GROUP BY M.movie_id
    ORDER BY title
)

(
    SELECT title AS results
    FROM MaxMovie
    WHERE max_rating = (
        SELECT MAX(max_rating)
        FROM MaxMovie
    )
    ORDER BY title
    LIMIT 1
)
UNION ALL
(
    SELECT name AS results
    FROM MaxUser
    WHERE max_count = (
        SELECT MAX(max_count)
        FROM MaxUser
    )
    ORDER BY name
    LIMIT 1
)
;