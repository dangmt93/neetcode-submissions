-- Write your query below
WITH score_rk_cte AS (
    SELECT
        student_id,
        exam_id,
        score,
        DENSE_RANK() OVER(PARTITION BY student_id ORDER BY score DESC, exam_id) AS score_rk
    FROM exam_results
)

SELECT student_id, exam_id, score
FROM score_rk_cte
WHERE score_rk = 1
ORDER BY student_id