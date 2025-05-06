{{ config(
    materialized = 'incremental',
    unique_key = 'student_id',
    incremental_strategy = 'merge',
    post_hook=[
        "DELETE FROM {{ target }} WHERE student_id NOT IN (SELECT student_id FROM {{ ref('stg_student_1') }} WHERE student_id IS NOT NULL)"
    ]
) }}

with source_data as (
    select
        s1.student_id,
        s1.first_name,
        s1.last_name,
        s1.age,
        s1.email,
        s1.enrollment_date,
        s1.created_at,
        s2.course_id,
        s2.course_name,
        s2.credits,
        s2.grade,
        s1.updated_at
    from {{ ref('stg_student_1') }} s1
    inner join {{ ref('stg_student_2') }} s2
        on s1.student_id = s2.student_id
)

select *
from source_data
