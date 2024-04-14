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


\qecho 'Problem 2'
-- Find each pair (d, m) where d is the name of a department and m is a
-- major of a student who is employed by that department and who earns a
-- salary of at least 20000.

select distinct d.deptName, m.major
from   department d, Major m
where  exists (select 1
               from   Student s
               where  (s.sid, m.major) in (select * from studentMajor) and
                      exists (select 1
                              from   employedBy w
                              where  w.sid = s.sid and 
                                     w.deptName = d.deptName and w.salary >= 20000));

/* 
Alternatively,
select distinct d.deptName, m.major
from   department d, Major m
where  true = some (select (s.sid, m.major) in (select * from studentMajor) and
                           true = some (select w.sid = s.sid and 
                                               w.deptName = d.deptName and w.salary >= 20000
                                        from   employedBy w)
                     from   Student s);

*/
                  



/*
Alternatively,
select distinct d.deptName, m.major
from   department d, Major m
where  m.major in (select sm.major
                   from   studentMajor sm
                   where  sm.major = m.major and
                          sm.sid in (select w.sid
                                     from   employedBy w
                                     where  w.deptName = d.deptName and w.salary >= 20000));
*/


\qecho 'Problem 3'
-- Find each pair (s1,s2) of sids of different students who have the same
-- (set of) friends who work for the CS department.

select s1.sid as "sid1", s2.sid as "sid2"
from   Student s1, Student s2
where  true = all (select ((s1.sid,w.sid) in (select * from hasFriend) and
                           (s2.sid,w.sid) in (select * from hasFriend)) OR
                          ((s1.sid,w.sid) not in (select * from hasFriend) and
                           (s2.sid,w.sid) not in (select * from hasFriend))
                   from   employedBy w            
                   where  w.deptName = 'CS') and
       s1.sid <> s2.sid;

/*
Alternatively,
select s1.sid as "sid1", s2.sid as "sid2"
from   Student s1, Student s2
where  not true = some (select ((s1.sid,w.sid) in (select * from hasFriend) and
                               (s2.sid,w.sid) not in (select * from hasFriend)) OR
                               ((s1.sid,w.sid) not in (select * from hasFriend) and
                               (s2.sid,w.sid) in (select * from hasFriend))
                        from   employedBy w
                        where  w.deptName = 'CS') and
       s1.sid <> s2.sid;
*/

/*
Alternatively,
select s1.sid as "sid1", s2.sid as "sid2"
from   Student s1, Student s2
where  not exists (select 1
                   from   employedBy w            
                   where  w.deptName = 'CS' and
                          (((s1.sid,w.sid) in (select * from hasFriend) and
                            (s2.sid,w.sid) not in (select * from hasFriend)) or
                           ((s2.sid,w.sid) in (select * from hasFriend) and
                            (s1.sid,w.sid) not in (select * from hasFriend)))) and
       s1.sid <> s2.sid;
*/

/*
Alternatively,
select s1.sid as "sid1", s2.sid as "sid2"
from   Student s1, Student s2
where  'CS' not in (select w.deptName
                    from   employedBy w            
                    where  (((s1.sid,w.sid) in (select * from hasFriend) and
                            (s2.sid,w.sid) not in (select * from hasFriend)) or
                           ((s2.sid,w.sid) in (select * from hasFriend) and
                            (s1.sid,w.sid) not in (select * from hasFriend)))) and
       s1.sid <> s2.sid;
*/



\qecho 'Problem 4'
-- Find each major for which there exists a student with that major and
-- who does not only have friends who also have that major.

select m.major
from   Major m
where  true = some (select (s.sid,m.major) in (select * from studentMajor) and
                           true = some (select f.sid1 = s.sid and
			                       not (f.sid2,m.major) in (select * from studentMajor)
			                from   hasFriend f)
                    from   Student s);


/*
Alternatively,
select m.major
from   Major m
where  exists (select 1
               from   Student s1, Student s2
               where  (s1.sid,m.major) in (select * from studentMajor) and
                      (s1.sid,s2.sid) in (select * from hasFriend) and
                      (s2.sid,m.major) not in (select * from studentMajor));


*/


\qecho 'Problem 5'
-- Find the sid, sname of each student who (a) has home homeCity Bloomington, (b)
-- works for a department where he or she earns a salary that is higher than
-- 20000, and (c) has at least one friend.

select s.sid, s.sname
from   Student s
where  s.homeCity = 'Bloomington' and
       s.sid in (select  w.sid
                 from    employedBy w
                 where   w.salary > 20000) and
       exists (select 1
               from   hasFriend f
               where  f.sid1 = s.sid) 
order by 1,2;

\qecho 'Problem 6'
-- Find the pairs $(d_1, d_2)$ of names of different departments whose main offices
-- are located in the same building.

select d1.deptName, d2.deptName
from   Department d1, Department d2
where  d1.deptName <> d2.deptName and
       d1.mainOffice = d2.mainOffice 
order by 1,2;


\qecho 'Problem 7'



-- Find the sid and sname of each student whose home homeCity
-- different than those of his or her friends.

select s.sid, s.sname
from   Student s
where  exists (select 1
               from   hasFriend f
               where  f.sid1 =  s.sid) and
       s.homeCity not in (select f.homeCity
                      from   Student f
                      where  (s.sid, f.sid) in (select f.sid1, f.sid2
                                                from   hasFriend f))
order by  1;

\qecho 'Problem 8'
-- Find each major that is the major of at most 2 students.

select m.major
from   Major m
except
select m.major
from   Major m
where  exists (select 1
               from   studentMajor sm1, 
                      studentMajor sm2, 
                      studentMajor sm3
               where  sm1.major = m.major and 
                      sm2.major = m.major and
                      sm3.major = m.major and
                      sm1.sid <> sm2.sid and 
                      sm2.sid <> sm3.sid and 
                      sm1.sid <> sm3.sid)
order by 1;		      


\qecho 'Problem 9'
-- Find the sid, sname, and salary of each student who has at least two
-- friends such that these friends have a common major but provided that
-- it is not the ‘Mathematics’ major.

select  s.sid, s.sname, w.salary
from    Student s, employedBy w
where   s.sid = w.sid and
        exists (select 1
                from   hasFriend hf1, hasFriend hf2
                where  hf1.sid1 = s.sid and
                       hf2.sid1 = s.sid and
                       hf1.sid2 <> hf2.sid2 and
                       (hf1.sid2, hf2.sid2) in (select sm1.sid, sm2.sid
                                                from   studentMajor sm1, studentMajor sm2
                                                where  sm1.major = sm2.major and sm1.major <> 'Mathematics'))
order by 1;



\qecho 'Problem 10'
-- Find the deptName of each department that not only employs students
-- whose home homeCity is Indianapolis.  (In other words, there exists at
-- least one student who is employed by such a department whose home homeCity
-- is not Indianapolis.)


select d.deptName
from   Department d
where  exists (select w.sid
               from   employedBy w
               where  w.deptName = d.deptName and
                      w.sid not in  (select s.sid
                                     from   student s
                                     where  s.homeCity = 'Indianapolis'))
order by 1;

\qecho 'Problem 11'
-- For each department, list its name along with the highest salary made
-- by students who are employed by it.

select w.deptName, w.salary
from   employedBy w
where  w.salary >= all (select w1.salary
                        from   employedBy w1
                        where  w1.deptName = w.deptName)
order by 1;

\qecho 'Problem 12'
-- Find the sid and sname of each student $s$ who is employed by a
-- department $d$ and who has a salary that is strictly higher than the
-- salary of each of his friends who is employed by that department $d$.


select s.sid, s.sname
from   Student s
where  exists (select 1
               from   employedBy w
               where  w.sid = s.sid and
                      exists (select 1
                              from   employedBy  w1
                              where  w1.deptName = w.deptName and
                                     exists (select 1
                                             from   hasFriend f
                                             where  f.sid1 = w.sid and
                                                    f.sid2 = w1.sid) and
                      w.salary > all (select w1.salary
                                      from   employedBy w1
                                      where  (w.sid, w1.sid) in (select f.sid1, f.sid2
                                                                 from   hasFriend f) and
                                             w1.deptName = w.deptName)))
order by 1;


\qecho 'Problem 13'

-- Using 'true = some' 

select s1.sid, s1.sname
from   Student s1
where  true = some (select d.deptName = w.deptName and d.mainOffice = 'LuddyHall' and
                           w.sid = s1.sid and
                           true = some (select (s1.sid, s2.sid) in (select * from hasFriend) and
                                                s2.homeCity <> 'Bloomington'
				       from Student s2)
                    from   Department d, employedBy w);




-- Using 'exists'

select s1.sid, s1.sname
from   Student s1
where  exists (select 1
               from   Department d, employedBy w
               where  d.deptName = w.deptName and d.mainOffice = 'LuddyHall' and
                      w.sid = s1.sid and
                      exists (select 1
                              from   Student s2
                              where  (s1.sid, s2.sid) in (select * from hasFriend) and
                                     s2.homeCity <> 'Bloomington'));

-- Using 'in'

select s1.sid, s1.sname
from   Student s1
where  s1.sid in (select w.sid
                  from   Department d, employedBy w
                  where  d.deptName = w.deptName and d.mainOffice = 'LuddyHall'  and
                         true in (select (s1.sid, s2.sid) in (select * from hasFriend) and
                                         s2.homeCity <> 'Bloomington'
                                  from   Student s2));



\qecho 'Problem 14'

-- Using 'true = all' and 'true = some'

select s1.sid 
from   Student s1
where  true = all (select true = some (select sm1.sid = s1.sid and
                                              sm2.sid = s2.sid and
                                              sm1.major = sm2.major and
                                              sm1.sid <> sm2.sid
                                       from   studentMajor sm1, studentMajor sm2)
                   from   Student s2
                   where  (s1.sid, s2.sid) in (select * from hasFriend));


-- Using 'not exists' and 'exists'

select s1.sid 
from   Student s1
where  not exists (select 1
                   from   Student s2
                   where  (s1.sid, s2.sid) in (select * from hasFriend) and
		          not exists (select 1
                                      from   studentMajor sm1, studentMajor sm2
		                       where sm1.sid = s1.sid and
                                             sm2.sid = s2.sid and
                                             sm1.major = sm2.major and
                                             sm1.sid <> sm2.sid));
					

-- Using 'not in' and 'in'
                                       
select s1.sid 
from   Student s1
where  not true in (select (s1.sid, s2.sid) in (select * from hasFriend) and
		            s1.sid not in (select sm1.sid
                                           from   studentMajor sm1, studentMajor sm2
		                           where  sm2.sid = s2.sid and
                                                  sm1.major = sm2.major and
                                                  sm1.sid <> sm2.sid)
                    from   Student s2);


\qecho 'Problem 15'

-- using 'true = all' and 'true = some'

select s1.sid as "sid1", s2.sid as "sid2"
from   Student s1, Student s2
where  s1.sid <> s2.sid and
       true = all (select true = some (select f2.sid1 = s2.sid and f2.sid2 = f1.sid2
                                       from   hasFriend f2)
                   from   hasFriend f1
                   where  s1.sid = f1.sid1);
		   

-- using 'not exists' and 'exists'

select s1.sid as "sid1", s2.sid as "sid2"
from   Student s1, Student s2
where  s1.sid <> s2.sid and
       not exists (select 1
                   from   hasFriend f1
		   where  s1.sid = f1.sid1 and
		          not exists (select 1
		                      from   hasFriend f2
				      where f2.sid1 = s2.sid and f2.sid2 = f1.sid2));
				      

-- using 'not in'

select s1.sid as "sid1", s2.sid as "sid2"
from   Student s1, Student s2
where  s1.sid <> s2.sid and
       true not in (select f1.sid2 not in (select f2.sid2
                                           from   hasFriend f2
					   where  f2.sid1 = s2.sid)
                    from   hasFriend f1
                    where  s1.sid = f1.sid1);





\qecho 'Problem 16'
select distinct s.sid, s.sname, w.deptName, w.salary
from   Student s, employedBy w
where  s.sid = w.sid and
       s.homeCity = 'Bloomington' and
       10000 <= w.salary and
       w.deptName <> 'Mathematics'
order by 1;


\qecho 'Problem 17'
select s.sid, s.sname
from   Student s
where  exists (select 1
               from  Department d, employedBy w
               where d.deptName = w.deptName and 
                     s.sid = w.sid and 
                     d.mainOffice = 'LuddyHall' and 
                     exists (select 1
                             from   hasFriend f, Student s1
                             where  f.sid1 = s.sid and 
                                    f.sid2 = s1.sid and 
                                    s1.homeCity <> 'Bloomington'))
order by 1;


\qecho 'Problem 18'
select m.major
from   Major m
where  not exists (select 1
                   from   Student s, studentMajor sm
                   where  s.sid = sm.sid and 
                          sm.major = m.major and 
                          s.homeCity = 'Bloomington')
order by 1;

\qecho 'Problem 19'
select s.sid, s.sname
from   Student s
where  not exists (select 1
                   from   hasFriend f
                   where  f.sid2 = s.sid and 
                          not exists (select 1
                                      from   Student s1
                                      where  f.sid1 = s1.sid and 
                                             s.homeCity = s1.homeCity))
order by 1;


\qecho 'Problem 22.b'
-- Some major has fewer than 2 students with that major.

select true = some (select true = all (select s1.sid = s2.sid
                                       from  Student s1, Student s2
                                       where (s1.sid, m.major) in (select * from studentMajor) and
                                             (s2.sid, m.major) in (select * from studentMajor))
                    from Major m) as "constraintSatisfied";




\qecho 'Problem 23.b'
-- Each student who works for a department has a friend who also works
-- for that department and who earns the same salary

select true = all (select true = some (select (w.sid,w1.sid) in (select * from hasFriend) and
                                              (w1.deptname, w1.salary) = (w.deptname, w.salary)
                                       from   employedBy w1)
                   from  Student s, Department d, employedBy w
                   where (w.sid,w.deptName) = (s.sid,d.deptName)) as "constraintSatisfied";;


\qecho 'Problem 24.b'
-- All students working in a same department share a major and earn the
-- same salary.

select true = all (select w1.salary = w2.salary and
                          true = some (select (s1.sid,m.major) in (select * from studentMajor) and
                                              (s2.sid,m.major) in (select * from studentMajor)
                                       from   Major m)
                   from   Student s1, Student s2, employedBy w1, employedBy w2
                   where  (w1.sid,w1.deptName,w2.sid) = (s1.sid,w2.deptName,s2.sid))  as "constraintSatisfied";


\qecho 'Problem 25.b'
-- Each student is employed by a department and has at least two majors

select not exists (select 1
                   from   Student s
                   where  not(exists (select 1
                                      from   employedBy w
                                      where  w.sid = s.sid)
                              and
                              not exists (select 1
                                          from   studentMajor sm1, studentMajor sm2
                                          where  sm1.sid = s.sid and sm2.sid = s.sid and
                                                 sm1.major <> sm2.major))) as "constraintSatisfied";


\qecho 'Problem 26.b'
-- Each student and his or her friends work for the same department

select not exists (select 1
                   from   hasFriend f, employedBy wf1, employedBy wf2
                   where  f.sid1 = wf1.sid and
                          f.sid2 = wf2.sid and
                          wf1.deptName <> wf2.deptName) as "constaintSatisfied";


\qecho 'Problem 27.b'
-- Some employed student has a salary that is strictly higher than the
-- salary of each of his or her employed friends

select exists (select 1
               from   Student s, employedBy w
               where  s.sid = w.sid and
                      not exists (select 1
                                  from   hasFriend f, employedBy fw
                                  where  f.sid1 = s.sid and f.sid2 = fw.sid and
                                         w.salary <= fw.salary)) as "constraintSatisfied";




-- Connect to default database
\c postgres;

-- Drop database created for this assignment
DROP DATABASE dirkassignment;





