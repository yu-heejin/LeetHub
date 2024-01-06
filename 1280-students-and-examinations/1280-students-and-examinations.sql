WITH result AS (
    SELECT student_id
        , student_name
        , subject_name
    FROM Students, Subjects
),
count_exam AS (
    SELECT student_id
        , subject_name
        , COUNT(*) AS attended_exams
    FROM Examinations
    GROUP BY student_id
        , subject_name
)

SELECT R.student_id
    , R.student_name
    , R.subject_name
    , IFNULL(C.attended_exams, 0) AS attended_exams
FROM count_exam C
    RIGHT JOIN result R ON C.student_id = R.student_id
        AND C.subject_name = R.subject_name
ORDER BY R.student_id
    , R.subject_name
;