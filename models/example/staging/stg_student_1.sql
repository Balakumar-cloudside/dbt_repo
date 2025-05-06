WITH
student AS (
SELECT * FROM `handy-coil-457005-r4.bk_dataset.student_1`),

ae AS ( 
SELECT 
    student_id,
    first_name,
    last_name,
    age,
    email,
    enrollment_date,
    created_at,
    updated_at
FROM student
)

select * from ae
