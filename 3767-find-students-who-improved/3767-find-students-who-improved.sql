SELECT student_id
    , subject
    , first_score
    , latest_score
FROM (
    SELECT DISTINCT student_id
        , subject
        , FIRST_VALUE(score) OVER (PARTITION BY student_id, subject ORDER BY exam_date) AS first_score # 첫번째 날짜값
        , FIRST_VALUE(score) OVER (PARTITION BY student_id, subject ORDER BY exam_date DESC) AS latest_score # 마지막 날짜값
    FROM Scores
) R
WHERE first_score < latest_score;