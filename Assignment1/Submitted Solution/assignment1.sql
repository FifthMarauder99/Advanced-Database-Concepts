-- Creating database with full name

CREATE DATABASE dirkassignment;

-- Connecting to database 
\c dirkassignment;

-- Relation schemas and instances for assignment 1

\qecho 'Problem 1'

-- Provide 4 conceptually different examples that illustrate how the
-- presence or absence of primary and foreign keys affect insert and
-- deletes in these relations.  To solve this problem, you will need to
-- experiment with the relation schemas and instances for this
-- assignment.  For example, you should consider altering primary keys
-- and foreign key constraints and then consider various sequences of
-- insert and delete operations.  You may need to change some of the
-- relation instances to observe the desired effects.  Certain inserts
-- and deletes should succeed but other should generate error
-- conditions.  (Consider the lecture notes about keys, foreign keys,
-- and inserts and deletes as a guide to solve this problem.)

-- Relation schemas and instances for assignment 1
 
CREATE TABLE Student(sid integer,
                     sname text,
                     homeCity text,
                     primary key (sid));

CREATE TABLE Department(deptName text,
                        mainOffice text,
                        primary key (deptName));

CREATE TABLE Major(major text,
                   primary key (major));


CREATE TABLE employedBy(sid integer,
                        deptName text,
                        salary integer,
                        primary key (sid),
                        foreign key (sid) references Student (sid));


CREATE TABLE departmentLocation(deptName text,
                                building text,
                                primary key (deptName, building),
                                foreign key (deptName) references Department (deptName));


CREATE TABLE studentMajor(sid integer,
                          major text,
                          primary key (sid, major),
                          foreign key (sid) references Student (sid),
                          foreign key (major) references Major (major));


CREATE TABLE hasFriend(sid1 integer,
                       sid2 integer,
                       primary key(sid1,sid2),
                       foreign key (sid1) references Student (sid),
                       foreign key (sid2) references Student (sid));


INSERT INTO Student VALUES
     (1001,'Jean','Cupertino'),
     (1002,'Vidya', 'Cupertino'),
     (1003,'Anna', 'Seattle'),
     (1004,'Qin', 'Seattle'),
     (1005,'Megan', 'MountainView'),
     (1006,'Ryan', 'Chicago'),
     (1007,'Danielle','LosGatos'),
     (1008,'Emma', 'Bloomington'),
     (1009,'Hasan', 'Bloomington'),
     (1010,'Linda', 'Chicago'),
     (1011,'Nick', 'MountainView'),
     (1012,'Eric', 'Cupertino'),
     (1013,'Lisa', 'Indianapolis'), 
     (1014,'Deepa', 'Bloomington'), 
     (1015,'Chris', 'Denver'),
     (1016,'YinYue', 'Chicago'),
     (1017,'Latha', 'LosGatos'),
     (1018,'Arif', 'Bloomington'),
     (1019,'John', 'NewYork');


INSERT INTO Department VALUES
     ('CS', 'LuddyHall'),
     ('DataScience', 'LuddyHall'),
     ('Mathematics', 'RawlesHall'),
     ('Physics', 'SwainHall'),
     ('Biology', 'JordanHall'),
     ('Chemistry', 'ChemistryBuilding'),
     ('Astronomy', 'SwainHall');


INSERT INTO employedBy VALUES
     (1001,'CS', 65000),
     (1002,'CS', 45000),
     (1003,'DataScience', 55000),
     (1004,'DataScience', 55000),
     (1005,'Mathematics', 60000),
     (1006,'DataScience', 55000),
     (1007,'Physics', 50000),
     (1008,'DataScience', 50000),
     (1009,'CS',60000),
     (1010,'DataScience', 55000),
     (1011,'Mathematics', 70000), 
     (1012,'CS', 50000),
     (1013,'Physics', 55000),
     (1014,'CS', 50000), 
     (1015,'DataScience', 60000),
     (1016,'DataScience', 55000),
     (1017,'Physics', 60000),
     (1018,'CS', 50000),
     (1019,'Biology', 50000);

INSERT INTO departmentLocation VALUES
   ('CS', 'LindleyHall'),
   ('DataScience', 'LuddyHall'),
   ('DataScience', 'Kinsey'),
   ('DataScience', 'WellsLibrary'),
   ('Mathematics', 'RawlesHall'),
   ('Physics', 'SwainHall'),
   ('Physics', 'ChemistryBuilding'),
   ('Biology', 'JordanHall'),
   ('CS', 'LuddyHall'),
   ('Mathematics', 'SwainHall'),
   ('Physics', 'RawlesHall'),
   ('Biology', 'MultiDisciplinaryBuilding'),
   ('Chemistry', 'ChemistryBuilding');

INSERT INTO Major VALUES
   ('CS'),
   ('DataScience'),
   ('Physics'),
   ('Chemistry'),
   ('Biology');

INSERT INTO studentMajor VALUES
 (1001,'CS'),
 (1001,'DataScience'),
 (1002,'CS'),
 (1002,'DataScience'),
 (1004,'DataScience'),
 (1004,'CS'),
 (1005,'DataScience'),
 (1005,'CS'),
 (1005,'Physics'),
 (1006,'CS'),
 (1006,'Chemistry'),
 (1007,'Chemistry'),
 (1007,'CS'),
 (1009,'Chemistry'),
 (1009,'Physics'),
 (1010,'Physics'),
 (1011,'Physics'),
 (1011,'Chemistry'),
 (1011,'DataScience'),
 (1011,'CS'),
 (1012,'DataScience'),
 (1012,'Chemistry'),
 (1012,'CS'),
 (1013,'CS'),
 (1013,'DataScience'),
 (1013,'Chemistry'),
 (1013,'Physics'),
 (1014,'Chemistry'),
 (1014,'DataScience'),
 (1014,'Physics'),
 (1015,'CS'),
 (1015,'DataScience'),
 (1016,'Chemistry'),
 (1016,'DataScience'),
 (1017,'Physics'),
 (1017,'CS'),
 (1018,'DataScience'),
 (1019,'Physics');

INSERT INTO hasFriend VALUES
 (1001,1008),
 (1001,1012),
 (1001,1014),
 (1001,1019),
 (1002,1001),
 (1002,1002),
 (1002,1011),
 (1002,1014),
 (1002,1015),
 (1003,1004),
 (1004,1002),
 (1004,1003),
 (1004,1012),
 (1004,1013),
 (1004,1014),
 (1004,1019),
 (1005,1015),
 (1006,1003),
 (1006,1004),
 (1006,1006),
 (1007,1008),
 (1007,1013),
 (1007,1016),
 (1007,1017),
 (1008,1001),
 (1008,1007),
 (1008,1015),
 (1008,1019),
 (1009,1001),
 (1009,1005),
 (1009,1013),
 (1010,1008),
 (1010,1013),
 (1010,1014),
 (1011,1005),
 (1011,1009),
 (1011,1010),
 (1011,1011),
 (1012,1011),
 (1013,1002),
 (1013,1007),
 (1013,1018),
 (1014,1005),
 (1014,1006),
 (1014,1012),
 (1014,1017),
 (1015,1002),
 (1015,1003),
 (1015,1005),
 (1015,1011),
 (1015,1015),
 (1015,1018),
 (1016,1004),
 (1016,1006),
 (1016,1015),
 (1017,1013),
 (1017,1014),
 (1017,1019),
 (1018,1004),
 (1018,1007),
 (1018,1009),
 (1018,1010),
 (1018,1013),
 (1019,1001),
 (1019,1006),
 (1019,1008),
 (1019,1013);


-- Problem 1

-- Provide 4 conceptually different examples that illustrate how the
-- presence or absence of primary and foreign keys affect insert and
-- deletes in these relations.  To solve this problem, you will need to
-- experiment with the relation schemas and instances for this
-- assignment.  For example, you should consider altering primary keys
-- and foreign key constraints and then consider various sequences of
-- insert and delete operations.  You may need to change some of the
-- relation instances to observe the desired effects.  Certain inserts
-- and deletes should succeed but other should generate error
-- conditions.  (Consider the lecture notes about keys, foreign keys,
-- and inserts and deletes as a guide to solve this problem.)

/*
\qecho 'Problem 1 conceptual example 1'
INSERT INTO Department VALUES ('CS', 'SwainHall');

\qecho 'Problem 1 conceptual example 2'
INSERT INTO employedBy VALUES ('1001', 'CS', 10000);

\qecho 'Problem 1 conceptual example 3'
DELETE FROM Student WHERE sid = 1001;

\qecho 'Problem 1 conceptual example 4'
DELETE FROM Major WHERE Major = 'CS';
*/

/* https://www.postgresql.org/docs/current/ddl-constraints.html */

/* 
1. Inserting null for primary key
2. Inserting foreign key with no corressponding primary key
3. Deleting primary key tuple when foreign references are present
4. Altering table to delete foreign key references on primary key tuple deletion
*/

\qecho 'Problem 1 conceptual example 1'
-- Primary key sid in student can not be null
INSERT INTO student (sname,homecity) VALUES ('Nikhil', 'Hyderabad');
/* 
ERROR:  null value in column "sid" of relation "student" violates not-null constraint
DETAIL:  Failing row contains (null, Nikhil, Hyderabad)
*/

\qecho 'Problem 1 conceptual example 2'
-- Student can not study Geology as that major is not present
INSERT INTO studentmajor (sid, major) VALUES ('1011', 'Geology');
/*
ERROR:  insert or update on table "studentmajor" violates foreign key constraint "studentmajor_major_fkey"
DETAIL:  Key (major)=(Geology) is not present in table "major".
*/

\qecho 'Problem 1 conceptual example 3'
-- Can not delete department if some student is employed in that department
INSERT INTO student (sid, sname, homecity) VALUES(1020, 'Nikhil', 'Hyderabad');
ALTER TABLE employedBy
ADD CONSTRAINT fk_deptname
FOREIGN KEY (deptname) REFERENCES department(deptname);
INSERT INTO department (deptname, mainoffice) VALUES ('Geology', 'GeologyBuilding');
INSERT INTO employedBy (sid, deptname, salary) VALUES('1020', 'Geology', '105120');
DELETE FROM department WHERE deptname='Geology';
/*
ERROR:  update or delete on table "department" violates foreign key constraint "fk_deptname" on table "employedby"
DETAIL:  Key (deptname)=(Geology) is still referenced from table "employedby".
*/
DELETE FROM employedBy WHERE sid=1020;
DELETE FROM department WHERE deptname='Geology';

/* RESET SCHEMA BACK */
ALTER TABLE employedBy DROP CONSTRAINT fk_deptname;
DELETE FROM student WHERE sid=1020;

\qecho 'Problem 1 conceptual example 4'
-- Deleting a student should delete employedBy tuples through cascade
ALTER TABLE employedBy
DROP CONSTRAINT employedby_sid_fkey,
ADD CONSTRAINT employedby_sid_fkey
FOREIGN KEY (sid) REFERENCES student(sid) ON DELETE CASCADE;

INSERT INTO student (sid, sname, homecity) VALUES(1020, 'Nikhil', 'Hyderabad');
INSERT INTO department (deptname, mainoffice) VALUES ('Geology', 'GeologyBuilding');
INSERT INTO employedBy (sid, deptname, salary) VALUES(1020, 'Geology', '105120');
/* Deleting student is deleting the employedBy tuple but it is not reflecting in terminal. interesting!! */
DELETE FROM student WHERE sid=1020;

/* RESET SCHEMA BACK */
DELETE FROM department WHERE deptname='Geology';

\qecho 'Problem 2'
-- Find each pair (d, m) where d is the name of a department and m is a
-- major of a student .

-- Using joins
-- select E.deptname, M.major from employedBy as E, studentMajor as M where E.sid = M.sid AND E.salary>=20000;
-- Using sub query in from clause
select distinct E.deptname, M.major from studentMajor M, (select sid,deptname from employedBy where salary>=20000) E where M.sid=E.sid order by deptname;



\qecho 'Problem 3'
-- Find each pair (s1,s2) of sids of different students who have the same
-- (set of) friends who work for the CS department.
select s1.sid, s2.sid from student s1, student s2 where s1.sid<>s2.sid and
true = all(select (s2.sid, s3.sid) in (select * from hasFriend) from student s3, employedBy e1 where (s1.sid, s3.sid) in (select * from hasFriend) and s3.sid=e1.sid and e1.deptName='CS') and
true = all(select (s1.sid, s4.sid) in (select * from hasFriend) from student s4, employedBy e2 where (s2.sid, s4.sid) in (select * from hasFriend) and s4.sid=e2.sid and e2.deptName='CS');

\qecho 'Problem 4'
-- Find each major for which there exists a student with that major and
-- who does not only have friends who also have that major.
select distinct A.major from studentmajor A, hasFriend B, studentmajor C where A.sid=B.sid1 and B.sid2=C.sid and A.major!=C.major;

/*
∃ t ∈ r (Q(t)) = ”there exists” a tuple in t in relation r such that predicate Q(t) is true. 
∀ t ∈ r (Q(t)) = Q(t) is true “for all” tuples in relation r. 
*/
/*
P → Q ≡¬P ∨Q
∀t ∈R (P →Q) ≡ ¬∃t ∈R (P ∧ ¬Q)
′true = some′≡ ′exists′
‘and not’ can be algebratized using ‘except’
*/
\qecho 'Problem 13'
/*
{(s1.sid, s1.sname) | Student(s1)∧
∃d ∈ Department ∃w ∈ employedBy(d.deptName = w.deptName ∧ s1.sid = w.sid ∧ d.mainOffice = LuddyHall∧
∃s2 ∈ Student(hasFriend(s1.sid, s2.sid) ∧ s2.homeCity != Bloomington))}.
*/
-- select s1.sid, s1.sname from student s1 where true = some (select d.deptName=w.deptName and s1.sid=w.sid 
-- and d.mainOffice = 'LuddyHall' from department d, employedBy w where true = some(select  s2.homeCity<>'Bloomington' from student s2, hasFriend where sid1=s1.sid and sid2=s2.sid));

select s1.sid, s1.sname from student s1 where true = some (
     select d.deptName=w.deptName and s1.sid=w.sid and d.mainOffice = 'LuddyHall' 
     from department d, employedBy w where true = some( 
          select  s2.homeCity<>'Bloomington' 
          from student s2, hasFriend where sid1=s1.sid and sid2=s2.sid
     )
);

-- Using in clause instead of true = some
select s1.sid, s1.sname from student s1 where 'LuddyHall' in (
     select d.mainOffice 
     from department d, employedBy w where d.deptName=w.deptName and s1.sid=w.sid and true = some(
          select  s2.homeCity<>'Bloomington' 
          from student s2, hasFriend where sid1=s1.sid and sid2=s2.sid
     )
);

-- ′true = some′≡ ′exists′
select s1.sid, s1.sname from student s1 where exists (
     select 1 from department d, employedBy w where d.deptName=w.deptName and s1.sid=w.sid and d.mainOffice = 'LuddyHall' and exists (
          select 1 from student s2, hasFriend where sid1=s1.sid and sid2=s2.sid and s2.homeCity<>'Bloomington'
     )
);

\qecho 'Problem 14'
/*
{s1.sid | Student(s1) ∧ ∀s2 ∈ Student(s2) (hasFriend(s1.sid, s2.sid) →
∃sm1 ∈ studentMajor ∃sm2 ∈ studentMajor(sm1.sid = s1.sid ∧ sm2.sid = s2.sid ∧ sm1.major = sm2.major ∧ sm1.sid ̸= sm2.sid))}
*/
select s1.sid from student s1 where true = all(
     select (
          select true = some(
               select sm1.sid = s1.sid and sm2.sid = s2.sid and sm1.major=sm2.major and sm1.sid <> sm2.sid 
               from studentmajor sm1, studentmajor sm2
          )
     ) from student s2 where (s1.sid,s2.sid) in (select * from hasFriend)
);

-- P → Q ≡ ¬P ∨Q
select s1.sid from student s1 where true = all(
     select (
          (s1.sid,s2.sid) not in (select * from hasFriend) or true = some(
               select sm1.sid = s1.sid and sm2.sid = s2.sid and sm1.major=sm2.major and sm1.sid <> sm2.sid 
               from studentmajor sm1, studentmajor sm2
          )
     ) from student s2 
);

-- ∀t ∈R (P →Q) ≡ ¬∃t ∈R (P ∧ ¬Q)
/*
{s1.sid | Student(s1) ∧ ∀s2 ∈ Student(s2) (hasFriend(s1.sid, s2.sid) ^
~∃sm1 ∈ studentMajor ∃sm2 ∈ studentMajor(sm1.sid = s1.sid ∧ sm2.sid = s2.sid ∧ sm1.major = sm2.major ∧ sm1.sid ̸= sm2.sid))}
*/
select s1.sid from student s1 where not exists(
     select 1 from student s2 where (s1.sid,s2.sid) in (select * from hasFriend) and not true = some(
               select sm1.sid = s1.sid and sm2.sid = s2.sid and sm1.major=sm2.major and sm1.sid <> sm2.sid 
               from studentmajor sm1, studentmajor sm2
     )
);

\qecho 'Problem 15'
/*
{(s1.sid, s2.sid) | Student(s1) ∧ Student(s2) ∧ s1.sid != s2.sid∧
∀f1 ∈ hasFriend(s1.sid1 = f1.sid1 → ∃f2 ∈ hasFriend(f2.sid1 = s2.sid ∧ f1.sid2 = f2.sid2))}
*/
select s1.sid, s2.sid from student s1, student s2 where s1.sid != s2.sid and true = all(
     select (
          true = some(select f2.sid1=s2.sid and f1.sid2=f2.sid2 from hasFriend f2)
     ) 
     from hasFriend f1 where s1.sid = f1.sid1
);

-- ′true = some′≡ ′exists′
-- select s1.sid, s2.sid from student s1, student s2 where s1.sid != s2.sid and true = all(
--      select (
--           exists(select 1 from hasFriend f2 where f2.sid1=s2.sid and f1.sid2=f2.sid2)
--      ) 
--      from hasFriend f1 where s1.sid = f1.sid1
-- );

-- P → Q ≡ ¬P ∨Q
select s1.sid, s2.sid from student s1, student s2 where s1.sid != s2.sid and true = all(
     select (
          s1.sid<>f1.sid1 or true = some(select f2.sid1=s2.sid and f1.sid2=f2.sid2 from hasFriend f2)
     ) 
     from hasFriend f1
);

-- ∀t ∈R (P →Q) ≡ ¬∃t ∈R (P ∧ ¬Q)
select s1.sid, s2.sid from student s1, student s2 where not exists(
     select 1 from hasFriend f1 where s1.sid=f1.sid1 and not true = some(select f2.sid1=s2.sid and f1.sid2=f2.sid2 from hasFriend f2)
) and s1.sid != s2.sid ;


-- 20.c
-- select distinct sm1.major from studentmajor sm1 where true = some(
--      select sm1.sid = s.sid from student s where true = some(
--           select h.sid1 = s.sid and h.sid2=sm2.sid and sm2.major <> sm1.major from hasFriend h, studentmajor sm2
--      )
-- );

\qecho 'Problem 22.b'
-- Some major has fewer than 2 students with that major.
-- Major with zero students enrolled
-- select m.major from major m where not true = some(
--      select sm.sid = s.sid and sm.major = m.major from student s, studentmajor sm
-- );

-- Major with exactly one student enrolled
-- select m.major from major m where true = some(
--      select sm.sid = s.sid and sm.major = m.major and not true = some(
--           select s1.sid<>s.sid and sm1.sid=s1.sid and sm1.major = m.major from student s1, studentmajor sm1
--      ) from student s, studentmajor sm
-- );

select true = some(
     select not true = some(
          select sm1.sid = s1.sid and sm1.major = m.major from student s1, studentmajor sm1
     ) or true = some(
          select sm2.sid = s2.sid and sm2.major = m.major and not true = some(
                    select s3.sid<>s2.sid and sm3.sid=s3.sid and sm3.major = m.major 
                    from student s3, studentmajor sm3
               )from student s2, studentmajor sm2 
          )
     from major m
) as constraintSatisfied;


\qecho 'Problem 23.b'
-- Each student who works for a department has a friend who also works
-- for that department and who earns the same salary

-- select s.sid from student s, employedBy e where s.sid = e.sid and true = some(
--      select (s.sid, s1.sid) in (select * from hasFriend) and s.sid<>s1.sid and e1.sid=s1.sid and e1.salary=e.salary and e1.deptName=e.deptName from student s1, employedBy e1
-- );

select true=all(
     select (
          true = some(
               select (s.sid, s1.sid) in (select * from hasFriend) and s.sid<>s1.sid and e1.sid=s1.sid and e1.salary=e.salary and e1.deptName=e.deptName from student s1, employedBy e1 
          )
     )from student s, employedBy e where s.sid = e.sid
) as constraintSatisfied;

\qecho 'Problem 24.b'
-- All students working in a same department share a major and earn the
-- same salary.

-- select * from student s1, employedBy e1, studentmajor sm1 where s1.sid=e1.sid and sm1.sid=s1.sid and true = all(
--      select (
--           e1.salary=e2.salary and sm1.major=sm2.major
--      ) from student s2, employedBy e2, studentmajor sm2 where s1.sid<>s2.sid and s2.sid=e2.sid and sm2.sid=s2.sid and e2.deptName=e1.deptName
-- );

select true = all(
     select true = all(
          select (
               e1.salary=e2.salary and sm1.major=sm2.major
          ) from student s2, employedBy e2, studentmajor sm2 where s1.sid<>s2.sid and s2.sid=e2.sid and sm2.sid=s2.sid and e2.deptName=e1.deptName
     )from student s1, employedBy e1, studentmajor sm1 where s1.sid=e1.sid and sm1.sid=s1.sid
) as constraintSatisfied;

-- Connect to default database
\c postgres;

-- Drop database created for this assignment
DROP DATABASE dirkassignment;





