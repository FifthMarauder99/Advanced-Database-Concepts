-- Script for Assignment 6

-- Creating database with full name

CREATE DATABASE dirkassignment6;

-- Connecting to database 
\c dirkassignment6


\qecho 'Problem 1'

-- P is a table to hold a discrete probability mass function.
-- The solution uses the 'Inverse Transform Method.'

-- Given probability mass function P, we first compute its associated
-- Cumulative Distribution Function. (CDF)


-- The CDF function associated with each outcome 'i' in P, a range
-- (lowerbound_i,upperbound_i).

-- If you then consider a pair (x,y), with x is in [l_1,u_1] and y is
-- a random number in the range (0,1), then y will be associated with
-- that outcome 'i' wherefore y \in (lowerbound_i,upperbound_i).



create table P(outcome integer, probability  float);
insert into P values 
     (1, 0.33), 
     (2, 0.17), 
     (3, 0.5);

create or replace function RelationOverProbabilityFunction(n int,l_1 int,u_1 int,l_2 int,u_2 int)
returns table (x int, y int) as
$$
with
cumulativeDistributionFunction as (select p.outcome, coalesce((select sum(p1.probability)
                                                               from   P p1
                                                               where  p1.outcome < p.outcome), 0) as lower_bound_outcome,
                                                              (select sum(p1.probability)
                                                               from   P p1
                                                               where  p1.outcome <= p.outcome) as upper_bound_outcome
                                        from   P p),
pair as (select floor(random() * (u_1-l_1+1) + l_1)::int as x, random() as y    
         from   generate_series(1,n))
select x, outcome
from   pair join cumulativeDistributionFunction on (lower_bound_outcome <= y and y < upper_bound_outcome);
$$ language sql;

\qecho 'Problem 1.a: Test case 1 - uniform mass function'
insert into P values
  (1, 0.2),
  (2, 0.2),
  (3, 0.2),
  (4, 0.2),
  (5, 0.2);

select * from RelationOverProbabilityFunction(100, 1, 150, 1, 5);

delete from P;

\qecho 'Problem 2.a: Test case 2 - non-uniform function'
insert into P values
  (1, 0.25),
  (2, 0.10),
  (3, 0.40),
  (4, 0.10),
  (5, 0.15);

select * from RelationOverProbabilityFunction(100, 1, 150, 1, 5);

/*
select p.y, count(p.x)::float/100.0
from   RelationOverProbabilityFunction(100, 1, 150, 1, 5) p
group by (p.y) order by 1;
*/

\qecho 'Problem 2'
-- The only difference with Problem 1 is that we need to associate
-- with each skill in Skill a number in the range [1,|Skill|] and
-- map forward and back between these.

create table Skill (skill text);
insert into skill values ('Programming'), ('AI'), ('Networks');

create table P_skill(skill text, probability float);
insert into P_skill values 
    ('Programming', 0.5),
    ( 'AI', 0.40),
    ( 'Networks', 0.1);


create or replace function GeneratepersonSkillRelationWithSkillDistribution(n int, l int, u int) 
returns table (pid int, skill text) as
$$
with skillNumber(skill, k) as (select skill, row_number() over (order by skill) 
                               from   Skill),

     P as (select  skillNumber.k as outcome, P_Skill.probability
           from    P_Skill natural join skillNumber),

     cumulativeDistributionFunction as (select p.outcome, coalesce((select sum(p1.probability)
                                                                    from   P p1
                                                                    where  p1.outcome < p.outcome), 0) as lower_bound,
                                                          (select sum(p1.probability)
                                                           from   P p1
                                                           where  p1.outcome <= p.outcome) as upper_bound
                                        from   P p),
pair as (select floor(random() * (u-l+1) + l)::int as x, random() as y    
         from   generate_series(1,n))

select x as pid, sn.skill
from   pair p,
       cumulativeDistributionFunction cdf,
       skillNumber sn
where  lower_bound <= y and y < upper_bound and
       cdf.outcome = sn.k
group by (x,sn.skill);
$$ language sql;


\qecho 'Problem 5'
-- Data
-- Relation schemas and instances for assignment 6

create table Student(sid text,
                     sname text,
                     major text,
                     byear int,
                     primary key(sid));

-- We don't specify any constraints on enroll
create table Enroll (sid text,
                     cno text,
                     grade text);

insert into Student values 
 ('s100','Eric','CS',1988),
 ('s101','Nick','Math',1991),
 ('s102','Chris','Biology',1977),
 ('s103','Dinska','CS',1978),
 ('s104','Zanna','Math',2001),
 ('s105','Vince','CS',2001);


insert into Enroll values 
 ('s100','c200','A'),
 ('s100','c201','B'),
 ('s100','c202','A'),
 ('s101','c200','B'),
 ('s101','c201','A'),
 ('s102','c200','B'),
 ('s103','c201','A'),
 ('s101','c202','A'),
 ('s101','c301','C'),
 ('s101','c302','A'),
 ('s102','c202','A'),
 ('s102','c301','B'),
 ('s102','c302','A'),
 ('s104','c201','D');


-- We will build (simulate) two secondary indexes on Enroll
-- (1) a secondary index 'indexOnCno' on attribute 'cno' of Enroll
-- (2) a secondary index 'indexOnGrade' on attribute 'grade' of Enroll

-- To do, we need to first associate a unique tid with each tuple in Enroll.
-- We can use the PostgreSQL funtion 'row_number()' for this task.

create table EnrollWithTid (tid bigint, sid text, cno text, grade text, primary key(tid));


insert into EnrollWithTid select row_number() over (order by (sid,cno,grade)) as tid, sid, cno, grade
                          from   Enroll;

-- To simulate 'indexOnCno', we will associate with each cno value 'c' the set (i.e., the bucket)
-- of all tids of tuples in Enroll that have 'c' has the cno component.

create table indexOnCno (cno text,
                         cno_bucket int[],
                         primary key(cno));

insert into indexOnCno select cno, array_agg(tid) as cno_bucket
                       from   EnrollWithTid
                       group by(cno);


-- To simulate 'indexOnGrade', we will associate with each grade value 'g' the set (i.e., the bucket)
-- of all tids of tuples in Enroll that have 'g' has the grade component.

create table indexOnGrade (grade text,
                           grade_bucket int[],
                           primary key (grade));


insert into indexOnGrade select grade, array_agg(tid) as grade_bucket
                         from   EnrollWithTid
                         group by(grade);


-- We will also need functions to do
--    intersection of two buckets     (for 'and' queries)
--    union of two buckets            (for 'or' queries)
--    set difference of two bucket    (for 'and not' queries)

-- Set intersection $A\cap B$:
create or replace function set_intersection(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) intersect select unnest(B) order by 1);
$$ language sql;


-- Set union $A \cup B$:
create or replace function set_union(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) union select unnest(B) order by 1);
$$ language sql;


-- Set difference $A-B$:
create or replace function set_difference(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) except select unnest(B) order by 1);
$$ language sql;


create or replace function FindEnrollTids(booleanOperation text, c text, g text)
returns table (tid int) as
$$
with Answer as
   (select case 
       when booleanOperation = 'and' then  
            (select set_intersection((select cno_bucket from indexOnCno where cno = c),
      	                             (select grade_bucket from indexOnGrade where grade = g)))
       when booleanOperation = 'or' then  
            (select set_union((select cno_bucket from indexOnCno where cno = c),
      	                      (select grade_bucket from indexOnGrade where grade = g)))       
       when booleanOperation = 'and not' then  
            (select set_difference((select cno_bucket from indexOnCno where cno = c),
      	                           (select grade_bucket from indexOnGrade where grade = g)))       

          end as Tids)
select unnest(Tids) from Answer;
$$ language sql;


create or replace function FindStudents(booleanOperation text, c text, g text) 
returns table(sid text, sname text, major text, byear int) as
$$
select sid, sname, major, byear
from   student s
where  sid in (select sid
               from   EnrollWithTid natural join FindEnrollTids(booleanOperation, c, g));
$$ language sql;



\qecho 'Problem 5.a'
select * from FindStudents('and', 'c202', 'A');

\qecho 'Problem 5.b'
select * from FindStudents('or', 'c202', 'A');

\qecho 'Problem 5.c'
select * from FindStudents('and not', 'c202', 'A');


\qecho 'Problem 6'
-- To simulate 'bitmapIndexOnCno', we will associate with each cno value 'c' the bitmap
-- for 'c' in accordance with the Enroll (actually, the EnrollWithTid) relation.

create table bitmapIndexOnCno (cno text,
                               cno_bitmap text,
                               primary key (cno));


-- The function 'BitMapCno' makes a bitmap for a 'cno' value in the Enroll table
create or replace function BitMapCno(c  text) 
returns text as
$$
  with T as
    (select tid, case 
                   when cno = c then '1'
                                else '0'
                 end as bitvalue
 from   EnrollWithTid
 order by tid)

 select (array_to_string(array_agg(bitvalue), ''))
 from   T 
 group by ();
$$ language sql;

-- Build the bitmapIndexOnCno
insert into bitmapIndexOnCno   select cno, BitMapCno(cno)
                               from   Enroll e
                               group by(cno)
                               order by cno;

-- To simulate 'bitmapIndexOnGrade', we will associate with each grade value 'g' the bitmap
-- for 'g' in accordance with the Enroll (actually, the EnrollWithTid) relation.

create table bitmapIndexOnGrade (grade text,
                                 grade_bitmap text,
                                 primary key(grade));


-- The function 'BitMapGrade' makes a bitmap for a 'cno' value in the Enroll table
create or replace function BitMapGrade(g  text) 
returns text as
$$
  with T as
    (select tid, case 
                   when grade = g then '1'
                                  else '0'
                 end as bitvalue
 from   EnrollWithTid
 order by tid)

 select (array_to_string(array_agg(bitvalue), ''))
 from   T 
 group by ();
$$ language sql;

-- Build the bitmapIndexOnCno
insert into bitmapIndexOnGrade   select grade, BitMapGrade(grade)
                                 from   Enroll e
                                 group by(grade)
                                 order by grade;



-- The function '_and' returns (in an array) each tid where A has bit value 1 and B has bit value 1

create or replace function _and(A text, B text) 
returns int[] as
$$
     select array(select tid
                  from   (select letter, ordinality as tid 
                          from   unnest((select regexp_split_to_array(A,''))) with ordinality as letter) q
                  where  letter = '1'
                  intersect
                  select tid
                  from   (select letter, ordinality as tid 
                          from   unnest((select regexp_split_to_array(B,''))) with ordinality as letter) q
                  where  letter = '1'
                  order by 1);
$$ language sql;

-- The function '_or' returns (in an array) each tid where A has bit value 1 or B has bit value 1

create or replace function _or(A text, B text) 
returns int[] as
$$
     select array(select tid
                  from   (select letter, ordinality as tid 
                          from   unnest((select regexp_split_to_array(A,''))) with ordinality as letter) q
                  where  letter = '1'
                  union
                  select tid
                  from   (select letter, ordinality as tid 
                          from   unnest((select regexp_split_to_array(B,''))) with ordinality as letter) q
                  where  letter = '1'
                  order by 1);
$$ language sql;


-- The function '_and_not' returns (in an array) each tid where A has bit value 1 and B has bit value 0

create or replace function _and_not(A text, B text) 
returns int[] as
$$
     select array(select tid
                  from   (select letter, ordinality as tid 
                          from   unnest((select regexp_split_to_array(A,''))) with ordinality as letter) q
                  where  letter = '1'
                  intersect
                  select tid
                  from   (select letter, ordinality as tid 
                          from   unnest((select regexp_split_to_array(B,''))) with ordinality as letter) q
                  where  letter = '0'
                  order by 1);
$$ language sql;


create or replace function FindEnrollTids(booleanOperation text, c text, g text)
returns table (tid int) as
$$
with Answer as
   (select case 
       when booleanOperation = 'and' then  
            (select _and((select cno_bitmap from bitmapIndexOnCno where cno = c),
                         (select grade_bitmap from bitmapIndexOnGrade where grade = g)))
       when booleanOperation = 'or' then  
            (select _or((select cno_bitmap from bitmapIndexOnCno where cno = c),
      	                (select grade_bitmap from bitmapIndexOnGrade where grade = g)))       
       when booleanOperation = 'and not' then  
            (select _and_not((select cno_bitmap  from bitmapIndexOnCno where cno = c),
                             (select grade_bitmap from bitmapIndexOnGrade where grade = g)))       

          end as Tids)
select unnest(Tids) from Answer;
$$ language sql;


create or replace function FindStudents(booleanOperation text, c text, g text) 
returns table(sid text, sname text, major text, byear int) as
$$
select sid, sname, major, byear
from   student s
where  sid in (select sid
               from   EnrollWithTid natural join FindEnrollTids(booleanOperation, c, g));
$$ language sql;


\qecho 'Problem 6.a'
select * from FindStudents('and', 'c202', 'A');

\qecho 'Problem 6.b'
select * from FindStudents('or', 'c202', 'A');

\qecho 'Problem 6.c'
select * from FindStudents('and not', 'c202', 'A');

\c postgres

drop database dirkassignment6;







