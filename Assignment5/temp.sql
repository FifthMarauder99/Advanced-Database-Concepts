with E as (
  select cno, grade, jsonb_agg(json_build_object('sid', sid)) as students from enroll group by (cno, grade)
),
F as (
  select json_build_object('cno', cno, 'gradeInfo', json_build_object('grade', grade, 'students', students)) as courseInfo from E
)

select * from courseGrades cg, jsonb_array_elements(cg.gradeInfo) g, jsonb_array_elements(g->'students');