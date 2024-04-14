-- Assignment 6
-- 1, 2, 5, 6

create database dvgfall2022assignment6;

\c dvgfall2022assignment6

\qecho 'Problem 1'

-- Inverse transform sampling in python
-- from random import random
-- U = [random() for i in range(1000)]
-- P = [[1, 0.4], [2, 0.3], [3, 0.2], [4, 0.1]]
-- CDF = [0]*len(P)
-- for i in range(len(P)):
--   CDF[i] = (P[i][0], sum([p[1] for p in P if p[0] < P[i][0]]),sum([p[1] for p in P if p[0] <= P[i][0]]))
-- distribution = [c[0] for u in U for c in CDF if c[1] < u and u <= c[2]]
-- for i in range(1, 5):
--   print(i, distribution.count(i))

-- select p.outcome, 
--   coalesce((select sum(probability) from P p1 where p1.outcome < p.outcome), 0) as a,
--   (select sum(probability) from P p1 where p1.outcome <= p.outcome) as b
-- from P p; 

-- with U as (
--   select random() from generate_series(1, 10)
-- )

create table if not exists P (
  outcome integer,
  probability float
);

create or replace function 
RelationOverProbabilityFunction(n int, l_1 int, u_1 int, l_2 int, u_2 int)
returns table (x int, y int) as
$$
  with  U as (
    select random() as u1, random() as u2 from generate_series(1, n)
  ),
  CDF as (
      select p.outcome, 
        coalesce((select sum(probability) from P p1 where p1.outcome < p.outcome), 0) as a,
        (select sum(probability) from P p1 where p1.outcome <= p.outcome) as b
      from P p
  )
  select floor(u1 * (u_1-l_1+1) + l_1)::int as x,  (select outcome from CDF where a < u2 and u2 <= b) as y from U;
$$ language sql;

delete from P;

insert into P(outcome, probability) values
  (1, 0.125),
  (2, 0.125),
  (3, 0.125),
  (4, 0.125),
  (5, 0.125),
  (6, 0.125),
  (7, 0.125),
  (8, 0.125);

select * from RelationOverProbabilityFunction(10, 1, 150, 1, 8);

-- Test distribution
-- select q.x, count(1) from (select x from RelationOverProbabilityFunction(1000, 1, 8, 1, 8)) q group by q.x;
-- select q.y, count(1) from (select y from RelationOverProbabilityFunction(1000, 1, 8, 1, 8)) q group by q.y;

delete from P;

insert into P(outcome, probability) values
  (1, 0.25),
  (2, 0.10),
  (3, 0.40),
  (4, 0.10),
  (5, 0.15),
  (6, 0.05),
  (7, 0.10),
  (8, 0.20);

select * from RelationOverProbabilityFunction(10, 1, 150, 1, 8);

-- Test distribution
-- select q.x, count(1) from (select x from RelationOverProbabilityFunction(1000, 1, 8, 1, 8)) q group by q.x;
-- select q.y, count(1) from (select y from RelationOverProbabilityFunction(1000, 1, 8, 1, 8)) q group by q.y order by 2 desc;

\qecho 'Problem 2'

create table if not exists Skill(
  skill text
);

insert into Skill values 
('AI'),
('Databases'),
('Networks'),
('OperatingSystems'),
('Programming');

create table if not exists SkillProbability (
  skill_number int,
  probability float
);

create or replace function GeneratepersonSkillRelation(n int, l int, u int)
returns table (pid int, skill text) as
$$
  with skillNumber(skill, index) as (
    select skill, row_number() over (order by skill) as index from Skill
  ), pS as (
    select x, y from RelationOverProbabilityFunction(n, l, u, 1, (select count(1) from Skill)::int)
  )
  select x as pid, (select skill from skillNumber where index = y) from pS
  group by (x, skill) order by 1,2;
$$ language sql;

delete from P;

insert into P(outcome, probability) values
  (1, 0.6),
  (2, 0.1),
  (3, 0.1),
  (4, 0.1),
  (5, 0.1);

select q.skill, count(1) as cnt from (select skill from GeneratepersonSkillRelation(1000, 1, 1000)) q group by q.skill order by cnt desc;

delete from P;

insert into P(outcome, probability) values
  (1, 0.6),
  (2, 0.2),
  (3, 0.1),
  (4, 0.05),
  (5, 0.05);

select q.skill, count(1) as cnt from (select skill from GeneratepersonSkillRelation(1000, 1, 1000)) q group by q.skill order by cnt desc;

-- Data for problem 5 and 6

CREATE TABLE Student(
    sid TEXT,
    sname TEXT,
    major TEXT,
    byear INTEGER,
    PRIMARY KEY(sid)
);

INSERT INTO STUDENT VALUES
  ('s100','Eric','CS',1998),
  ('s101','Nick','Math',1991),
  ('s102','Chris','Biology',1997),
  ('s103','Dinska','CS',1978),
  ('s104','Zanna','Math',2001),
  ('s105','Vince','CS',2001);

CREATE TABLE Enroll(
    sid TEXT,
    cno TEXT,
    grade TEXT
);

INSERT INTO ENROLL VALUES
  ('s100','c200','A'),
  ('s100','c201','B'),
  ('s100','c202','A'),
  ('s101','c200','B'),
  ('s101','c201','A'),
  ('s101','c202','A'),
  ('s101','c301','C'),
  ('s101','c302','A'),
  ('s102','c200','B'),
  ('s102','c202','A'),
  ('s102','c301','B'),
  ('s102','c302','A'),
  ('s103','c201','A'),
  ('s104','c201','D');

create table EnrollTid (
  tid int,
  sid text,
  cno text,
  grade text
);

insert into EnrollTid select row_number() over(order by sid, cno, grade) as tid, sid, cno, grade from Enroll;

\qecho 'Problem 5'

CREATE TABLE indexOnCno(
    cno TEXT,
    cno_bucket int[],
    PRIMARY KEY(cno)
);

INSERT INTO indexOnCno SELECT cno, array_agg(cno_bucket)
                        FROM (SELECT cno, row_number() OVER (ORDER BY (sid,cno, grade)) as cno_bucket  FROM Enroll) as foo
                        GROUP BY cno;

CREATE TABLE indexOnGrade(
    grade TEXT,
    grade_bucket int[],
    PRIMARY KEY(grade)
);

INSERT INTO indexOnGrade SELECT grade, array_agg(grade_bucket)
                        FROM (SELECT grade, row_number() OVER (ORDER BY (sid,cno, grade)) as grade_bucket  FROM Enroll) as gee
                        GROUP BY grade;

CREATE OR REPLACE FUNCTION FindTids(booleanExpression TEXT, ccno TEXT, ggrade TEXT)
RETURNS TABLE(tid INT) AS
$$
WITH Array_ans as 
(SELECT CASE
    WHEN booleanExpression = 'and' THEN
    (SELECT ARRAY(SELECT unnest(cno_bucket) from indexOnCno where cno=ccno
                INTERSECT
                SELECT unnest(grade_bucket) from indexOnGrade where grade=ggrade ORDER BY 1))
    WHEN booleanExpression = 'or' THEN
    (SELECT ARRAY(SELECT unnest(cno_bucket) from indexOnCno where cno=ccno
                UNION
                SELECT unnest(grade_bucket) from indexOnGrade where grade=ggrade ORDER BY 1))
    WHEN booleanExpression = 'and not' THEN
    (SELECT ARRAY(SELECT unnest(cno_bucket) from indexOnCno where cno=ccno
                EXCEPT
                SELECT unnest(grade_bucket) from indexOnGrade where grade=ggrade ORDER BY 1))
    END AS Tids
)
SELECT unnest (Tids) FROM Array_ans
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION FindStudents(booleanOperation TEXT, ccno TEXT, ggrade TEXT)
RETURNS TABLE(sid TEXT, sname TEXT, major TEXT, byear int) AS
$$
select sid, sname, major, byear
from Student
where sid in (select sid
            from EnrollTid NATURAL JOIN FindTids(booleanOperation, ccno, ggrade))
$$ LANGUAGE SQL;

select * from FindStudents('and', 'c202', 'A');
select * from FindStudents('or', 'c202', 'A');
select * from FindStudents('and not', 'c202', 'A');


\qecho 'Problem 6'

drop function FindStudents;

create table bitmapIndexOnCno (
  cno text,
  bitmap text
);

create or replace function get_cno_bit_map(ccno text)
returns text as
$$
  select array_to_string(array_agg(v), '') from ( 
    select tid, cno, '1' as v from EnrollTid where cno = ccno
    union
    select tid, cno, '0' as v from EnrollTid where cno <> ccno
    order by tid
  ) q;
$$ language sql;

insert into bitmapIndexOnCno select distinct cno, get_cno_bit_map(cno) from EnrollTid;

create table bitmapIndexOnGrade (
  grade text,
  bitmap text
);

create or replace function get_grade_bit_map(ggrade text)
returns text as
$$
  select array_to_string(array_agg(v), '') from ( 
    select tid, grade, '1' as v from EnrollTid where grade = ggrade
    union
    select tid, grade, '0' as v from EnrollTid where grade <> ggrade
    order by tid
  ) q;
$$ language sql;

insert into bitmapIndexOnGrade select distinct grade, get_grade_bit_map(grade) from EnrollTid;

-- https://stackoverflow.com/questions/8760419/postgresql-unnest-with-element-number
-- select q.tid, q.v from unnest(regexp_split_to_array('10010000100000', '')) with ordinality q(v, tid);

create or replace function bitmap_AND(b1 text, b2 text)
returns table(tid int) as 
$$
  select q.tid from unnest(regexp_split_to_array(b1, '')) with ordinality q(v, tid) where q.v = '1'
  intersect
  select q.tid from unnest(regexp_split_to_array(b2, '')) with ordinality q(v, tid) where q.v = '1'
  order by tid;
$$ language sql;

create or replace function bitmap_OR(b1 text, b2 text)
returns table(tid int) as 
$$
  select q.tid from unnest(regexp_split_to_array(b1, '')) with ordinality q(v, tid) where q.v = '1'
  union
  select q.tid from unnest(regexp_split_to_array(b2, '')) with ordinality q(v, tid) where q.v = '1'
  order by tid;
$$ language sql;

create or replace function bitmap_ANDNOT(b1 text, b2 text)
returns table(tid int) as 
$$
  select q.tid from unnest(regexp_split_to_array(b1, '')) with ordinality q(v, tid) where q.v = '1'
  except
  select q.tid from unnest(regexp_split_to_array(b2, '')) with ordinality q(v, tid) where q.v = '1'
  order by tid;
$$ language sql;


create or replace function FindStudents(booleanOperation text, ccno text, ggrade text)
returns table(sid text, sname text, major text, byear int) as 
$$
  begin
    if booleanOperation = 'and' then
      return query select distinct s.* from student s, EnrollTid t
      where s.sid = t.sid and tid in (
        select * from bitmap_And(
          (select bitmap from bitmapIndexOnCno where cno = ccno),
          (select bitmap from bitmapIndexOnGrade where grade = ggrade)
        )
      );
    end if;

    if booleanOperation = 'or' then
      return query select distinct s.* from student s, EnrollTid t
      where s.sid = t.sid and tid in (
        select * from bitmap_OR(
          (select bitmap from bitmapIndexOnCno where cno = ccno),
          (select bitmap from bitmapIndexOnGrade where grade = ggrade)
        )
      );
    end if;

    if booleanOperation = 'and not' then
      return query select distinct s.* from student s, EnrollTid t
      where s.sid = t.sid and tid in (
        select * from bitmap_ANDNOT(
          (select bitmap from bitmapIndexOnCno where cno = ccno),
          (select bitmap from bitmapIndexOnGrade where grade = ggrade)
        )
      );
    end if;
  end;
$$ language plpgsql;

select * from FindStudents('and', 'c202', 'A');
select * from FindStudents('or', 'c202', 'A');
select * from FindStudents('and not', 'c202', 'A');


\c postgres
drop database dvgfall2022assignment6;
