WITH
student2 AS (
SELECT * FROM `handy-coil-457005-r4.bk_dataset.student_2`),

ae AS ( 
SELECT 
    student_id,
    course_id,
    course_name,
    credits,
    grade,
    updated_at
FROM student2
)

SELECT * FROM ae
