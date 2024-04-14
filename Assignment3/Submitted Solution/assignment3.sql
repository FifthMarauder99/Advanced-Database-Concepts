-- Script for Assignment 3

-- Creating database with full name

CREATE DATABASE dvgassignment3;

-- Connecting to database 
\c dvgassignment3

-- Relation schemas and instances for assignment 2

CREATE TABLE Person(pid integer,
                    pname text,
                    city text,
                    primary key (pid));

CREATE TABLE Company(cname text,
                     headquarter text,
                     primary key (cname));

CREATE TABLE Skill(skill text,
                   primary key (skill));


CREATE TABLE worksFor(pid integer,
                      cname text,
                      salary integer,
                      primary key (pid),
                      foreign key (pid) references Person (pid),
                      foreign key (cname) references Company(cname));


CREATE TABLE companyLocation(cname text,
                             city text,
                             primary key (cname, city),
                             foreign key (cname) references Company (cname));


CREATE TABLE personSkill(pid integer,
                         skill text,
                         primary key (pid, skill),
                         foreign key (pid) references Person (pid) on delete cascade,
                         foreign key (skill) references Skill (skill) on delete cascade);


CREATE TABLE hasManager(eid integer,
                        mid integer,
                        primary key (eid, mid),
                        foreign key (eid) references Person (pid),
                        foreign key (mid) references Person (pid));

CREATE TABLE Knows(pid1 integer,
                   pid2 integer,
                   primary key(pid1, pid2),
                   foreign key (pid1) references Person (pid),
                   foreign key (pid2) references Person (pid));



INSERT INTO Person VALUES
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

INSERT INTO Company VALUES
     ('Apple', 'Cupertino'),
     ('Amazon', 'Seattle'),
     ('Google', 'MountainView'),
     ('Netflix', 'LosGatos'),
     ('Microsoft', 'Redmond'),
     ('IBM', 'NewYork'),
     ('ACM', 'NewYork'),
     ('Yahoo', 'Sunnyvale');


INSERT INTO worksFor VALUES
     (1001,'Apple', 65000),
     (1002,'Apple', 45000),
     (1003,'Amazon', 55000),
     (1004,'Amazon', 55000),
     (1005,'Google', 60000),
     (1006,'Amazon', 60000),
     (1007,'Netflix', 50000),
     (1008,'Amazon', 50000),
     (1009,'Apple',60000),
     (1010,'Amazon', 55000),
     (1011,'Google', 70000), 
     (1012,'Apple', 45000),
     (1013,'Yahoo', 55000),
     (1014,'Apple', 50000), 
     (1015,'Amazon', 60000),
     (1016,'Amazon', 55000),
     (1017,'Netflix', 60000),
     (1018,'Apple', 50000),
     (1019,'Microsoft', 50000);

INSERT INTO companyLocation VALUES
   ('Apple', 'Bloomington'),
   ('Amazon', 'Chicago'),
   ('Amazon', 'Denver'),
   ('Amazon', 'Columbus'),
   ('Google', 'NewYork'),
   ('Netflix', 'Indianapolis'),
   ('Netflix', 'Chicago'),
   ('Microsoft', 'Bloomington'),
   ('Apple', 'Cupertino'),
   ('Amazon', 'Seattle'),
   ('Google', 'MountainView'),
   ('Netflix', 'LosGatos'),
   ('Microsoft', 'Redmond'),
   ('IBM', 'NewYork'),
   ('Yahoo', 'Sunnyvale');

INSERT INTO Skill VALUES
   ('Programming'),
   ('AI'),
   ('Networks'),
   ('OperatingSystems'),
   ('Databases');

INSERT INTO personSkill VALUES
 (1001,'Programming'),
 (1001,'AI'),
 (1002,'Programming'),
 (1002,'AI'),
 (1004,'AI'),
 (1004,'Programming'),
 (1005,'AI'),
 (1005,'Programming'),
 (1005,'Networks'),
 (1006,'Programming'),
 (1006,'OperatingSystems'),
 (1007,'OperatingSystems'),
 (1007,'Programming'),
 (1009,'OperatingSystems'),
 (1009,'Networks'),
 (1010,'Networks'),
 (1011,'Networks'),
 (1011,'OperatingSystems'),
 (1011,'AI'),
 (1011,'Programming'),
 (1012,'AI'),
 (1012,'OperatingSystems'),
 (1012,'Programming'),
 (1013,'Programming'),
 (1013,'OperatingSystems'),
 (1013,'Networks'),
 (1014,'OperatingSystems'),
 (1014,'AI'),
 (1014,'Networks'),
 (1015,'Programming'),
 (1015,'AI'),
 (1016,'OperatingSystems'),
 (1016,'AI'),
 (1017,'Networks'),
 (1017,'Programming'),
 (1018,'AI'),
 (1019,'Networks');

INSERT INTO hasManager VALUES
 (1004, 1003),
 (1006, 1003),
 (1015, 1003),
 (1016, 1004),
 (1016, 1006),
 (1008, 1015),
 (1010, 1008),
 (1013, 1007),
 (1017, 1013),
 (1002, 1001),
 (1009, 1001),
 (1014, 1012),
 (1011, 1005);


INSERT INTO Knows VALUES
 (1011,1009),
 (1007,1016),
 (1011,1010),
 (1003,1004),
 (1006,1004),
 (1002,1014),
 (1009,1005),
 (1018,1009),
 (1007,1017),
 (1017,1019),
 (1019,1013),
 (1016,1015),
 (1001,1012),
 (1015,1011),
 (1019,1006),
 (1013,1002),
 (1018,1004),
 (1013,1007),
 (1014,1006),
 (1004,1014),
 (1001,1014),
 (1010,1013),
 (1010,1014),
 (1004,1019),
 (1018,1007),
 (1014,1005),
 (1015,1018),
 (1014,1017),
 (1013,1018),
 (1007,1008),
 (1005,1015),
 (1017,1014),
 (1015,1002),
 (1018,1013),
 (1018,1010),
 (1001,1008),
 (1012,1011),
 (1002,1015),
 (1007,1013),
 (1008,1007),
 (1004,1002),
 (1015,1005),
 (1009,1013),
 (1004,1012),
 (1002,1011),
 (1004,1013),
 (1008,1001),
 (1008,1019),
 (1019,1008),
 (1001,1019),
 (1019,1001),
 (1004,1003),
 (1006,1003),
 (1015,1003),
 (1016,1004),
 (1016,1006),
 (1008,1015),
 (1010,1008),
 (1017,1013),
 (1002,1001),
 (1009,1001),
 (1011,1005),
 (1014,1012);





\qecho 'Problem 1'

\qecho 'Problem 1.a'

-- Write an RA expression in standard notation that expresses this
-- if-then-else query

\qecho 'Problem 1.b'

-- Test you solution for the following E1, E2, and F

create table E1 (x integer);
create table E2 (x integer);
create table F (c text);


insert into E1 values (1), (2);
insert into E2 values (3), (4);
-- Note F is the empty set

select q.x from (
     select e1.x from E1 e1
     except
     select e1.x from E1 e1 cross join F
) q
union 
select distinct e2.x from E2 e2 cross join F;

\qecho 'Problem 1.c'

-- Test you solution for the following E1, E2, and F

insert into F values ('a'), ('b'), ('c');

-- Note that F is not an empty set.

select q.x from (
     select e1.x from E1 e1
     except
     select e1.x from E1 e1 cross join F
) q
union 
select distinct e2.x from E2 e2 cross join F;

\qecho 'Problem 2'

-- Consider the following boolean SQL query:

drop table F;

create table F(x integer, y integer);

select true = all (select p1 = p2 from   F p1, F p2 where  p1.x = p2.x)  "isaFunction";

\qecho 'Problem 2.a'

-- Using the insights you gained from Problem 1, write an RA SQL query
-- that expresses the above boolean SQL query.

select q.isaFunction from (select true as isaFunction) q where true = all (select p1=p2 from F p1, F p2 where  p1.x = p2.x)
union
select q.isaFunction from (select false as isaFunction) q where true = some(select p1<>p2 from F p1, F p2 where p1.x = p2.x);


\qecho 'Problem 2.b'

-- Test your query for F = {}

select q.isaFunction from (select true as isaFunction) q where true = all (select p1=p2 from F p1, F p2 where  p1.x = p2.x)
union
select q.isaFunction from (select false as isaFunction) q where true = some(select p1<>p2 from F p1, F p2 where p1.x = p2.x);

\qecho 'Problem 2.c'

-- Test your query for F = {(1,10),(2,20)}

insert into F values (1,10), (2,20);

select q.isaFunction from (select true as isaFunction) q where true = all (select p1=p2 from F p1, F p2 where  p1.x = p2.x)
union
select q.isaFunction from (select false as isaFunction) q where true = some(select p1<>p2 from F p1, F p2 where p1.x = p2.x);


\qecho 'Problem 2.d'

-- Test your query for F = {(1,10),(1,20),(2,20)}

insert into F values (1,20);

select q.isaFunction from (select true as isaFunction) q where true = all (select p1=p2 from F p1, F p2 where  p1.x = p2.x)
union
select q.isaFunction from (select false as isaFunction) q where true = some(select p1<>p2 from F p1, F p2 where p1.x = p2.x);


\qecho 'Problem 6'

/*
Consider the query “Find the pid and pname of each persons who knows
no-one who works for the Apple company.” 

A possible way to write this
query in Pure SQL is
*/

select p.pid, p.pname
from   Person p
where  false = all (select exists (select 1
                                   from   worksFor w
                                   where  p1.pid = w.pid and w.cname = 'Apple') and
                           (p.pid,p1.pid) = some (select k.pid1, k.pid2
                                                  from   Knows k)                                            
                    from   Person p1);

\qecho 'Problem 6a.'

-- Using the Pure SQL to RA SQL translation algorithm, translate this
-- Pure SQL query to an equivalent RA SQL query.  Show the translation
-- steps you used to obtain your solution.

select p.pid, p.pname from Person p where false=all(
     select exists (
          select 1 from worksFor w where  p1.pid = w.pid and w.cname = 'Apple'
     ) and (p.pid,p1.pid) = some(
               select k.pid1, k.pid2 from   Knows k
     )from   Person p1
);

-- Rewrite with true=all
select p.pid, p.pname from Person p where true=all(
     select not (exists (
          select 1 from worksFor w where  p1.pid = w.pid and w.cname = 'Apple'
     ) and (p.pid,p1.pid) = some(
               select k.pid1, k.pid2 from   Knows k
     )) from   Person p1
);

-- Translate true=all
select q.pid, q.pname from (
     select p.pid, p.pname from Person p
     except
     select p.pid, p.pname from Person p, Person  P1 where exists (
          select 1 from worksFor w where  p1.pid = w.pid and w.cname = 'Apple'
     ) and 
     (p.pid,p1.pid) = some(
          select k.pid1, k.pid2 from   Knows k
     )
) q;

--  Translate And to intersect
select q.pid, q.pname from (
     select p.pid, p.pname from Person p
     except
     select q1.ppid, q1.ppname from (
          select p.pid as ppid, p.pname as ppname, p1.pid from Person p, Person  P1 where exists (
               select 1 from worksFor w where  p1.pid = w.pid and w.cname = 'Apple'
          )
          intersect
          select p.pid as ppid, p.pname as ppname, p1.pid from Person p, Person  P1 where (p.pid,p1.pid) = some(
               select k.pid1, k.pid2 from Knows k
          )
     ) q1
) q;

-- Tranlsate exists
select q.pid, q.pname from (
     select p.pid, p.pname from Person p
     except
     select q1.ppid, q1.ppname from (
          select p.pid as ppid, p.pname as ppname, p1.pid from Person p, Person  P1, worksFor w where p1.pid = w.pid and w.cname = 'Apple'
          intersect
          select p.pid as ppid, p.pname as ppname, p1.pid from Person p, Person  P1 where (p.pid,p1.pid) = some(
               select k.pid1, k.pid2 from Knows k
          )
     ) q1
) q;

-- Traslate θ some
select q.pid, q.pname from (
     select p.pid, p.pname from Person p
     except
     select q1.ppid, q1.ppname from (
          select p.pid as ppid, p.pname as ppname, p1.pid from Person p, Person  P1, worksFor w where p1.pid = w.pid and w.cname = 'Apple'
          intersect
          select p.pid as ppid, p.pname as ppname, p1.pid from Person p, Person P1, Knows k where p.pid=k.pid1 and p1.pid=k.pid2
     ) q1
) q;

-- Use joins
select q.pid, q.pname from (
     select p.pid, p.pname from Person p
     except
     select q1.ppid, q1.ppname from (
          select p.pid as ppid, p.pname as ppname, p1.pid from Person p join Person P1 natural join worksFor w on w.cname = 'Apple'
          intersect
          select p.pid as ppid, p.pname as ppname, p1.pid from Person p join Knows k on p.pid=k.pid1 join Person P1 on p1.pid=k.pid2
     ) q1
) q;

\qecho 'Problem 6b.'

-- Using Approach 2, optimize this RA SQL query and provide the optimized
-- expression in RA SQL.  Specify at least three conceptually different
-- rewrite rules that you used during the optimization.
select q.pid, q.pname from (
     select p.pid, p.pname from Person p
     except
     select q1.ppid, q1.ppname from (
          select p.pid as ppid, p.pname as ppname, p1.pid from Person p join Person P1 natural join worksFor w on w.cname = 'Apple'
          intersect
          select p.pid as ppid, p.pname as ppname, p1.pid from Person p join Knows k on p.pid=k.pid1 join Person P1 on p1.pid=k.pid2
     ) q1
) q;

-- Convert theta join to selection and push selection over joins
select q.pid, q.pname from (
     select p.pid, p.pname from Person p
     except
     select q1.ppid, q1.ppname from (
          select p.pid as ppid, p.pname as ppname, q2.pid from Person p cross join (select p1.pid from Person P1 natural join (select pid from worksFor where cname='Apple') w) q2
          intersect
          select p.pid as ppid, p.pname as ppname, p1.pid from Person p join Knows k on p.pid=k.pid1 join Person P1 on p1.pid=k.pid2
     ) q1
) q;

-- Convert theta join to natural join for applying the foreign key of Knows and Person in next step

select q.pid, q.pname from (
     select p.pid, p.pname from Person p
     except
     select q1.ppid, q1.ppname from (
          select p.pid as ppid, p.pname as ppname, q2.pid from Person p cross join (select p1.pid from Person P1 natural join (select pid from worksFor where cname='Apple') w) q2
          intersect
          select p.pid as ppid, p.pname as ppname, q2.pid from Person p join (select q3.pid, q3.pid1 from Person p1 natural join (select pid1, pid2 as pid from knows) q3) q2 on p.pid=q2.pid1
     ) q1
) q;

-- Use foreign key of worksFor and Person to eliminate the Person p1 in first query
-- Use foreign key of Knows and Person to eliminate the Person p1 in second query
select q.pid, q.pname from (
     select p.pid, p.pname from Person p
     except
     select q1.ppid, q1.ppname from (
          select p.pid as ppid, p.pname as ppname, q2.pid from Person p cross join (select pid from worksFor where cname='Apple') q2
          intersect
          select p.pid as ppid, p.pname as ppname, k.pid2 from Person p join knows k on p.pid=k.pid1
     ) q1
) q;


\qecho 'Problem 7a.'

/*
Find each pair $(c,p)$ where $c$ is the cname of a company and $p$ is
the pid of a person who works for that company and who earns strictly
more than all other persons who work for that company and who earns
more than 60000


A possible way to write this
query in Pure SQL is*/

select c.cname, p.pid
from   Company c, Person p
where  p.pid in (select w.pid
                 from   worksFor w
                 where  w.cname = c.cname and
                        true = all (select w1.salary <= 60000
                                    from   worksFor w1
                                    where  p.pid != w1.pid and 
                                           w1.cname = c.cname and
                                           w.salary <= w1.salary));

-- Using the Pure SQL to RA SQL translation algorithm, translate this
-- Pure SQL query to an equivalent RA SQL query.  Show the translation
-- steps you used to obtain your solution.

select c.cname, p.pid from Company c, Person p where p.pid in (
     select w.pid from worksFor w where w.cname = c.cname and true = all (
          select w1.salary <= 60000 from  worksFor w1 where p.pid != w1.pid and w1.cname = c.cname and w.salary <= w1.salary
     )
);

-- Translate IN clause
select distinct c.cname, p.pid from Company c, Person p, worksFor w where w.cname = c.cname and p.pid=w.pid and true = all (
     select w1.salary <= 60000 from  worksFor w1 where p.pid != w1.pid and w1.cname = c.cname and w.salary <= w1.salary
);

-- Translate And to intersect clause
select q.ccname, q.ppid from (
     select distinct c.cname as ccname, p.pid as ppid, w.pid as wpid, w.cname as wcname from Company c, Person p, worksFor w where w.cname = c.cname
     intersect
     select distinct c.cname as ccname, p.pid as ppid, w.pid as wpid, w.cname as wcname from Company c, Person p, worksFor w where p.pid=w.pid
     intersect
     select distinct c.cname as ccname, p.pid as ppid, w.pid as wpid, w.cname as wcname from Company c, Person p, worksFor w where true = all (
          select w1.salary <= 60000 from  worksFor w1 where p.pid != w1.pid and w1.cname = c.cname and w.salary <= w1.salary
     )
) q;

-- Translate true=all

select q.ccname, q.ppid from (
     select distinct c.cname as ccname, p.pid as ppid, w.pid as wpid, w.cname as wcname from Company c, Person p, worksFor w where w.cname = c.cname
     intersect
     select distinct c.cname as ccname, p.pid as ppid, w.pid as wpid, w.cname as wcname from Company c, Person p, worksFor w where p.pid=w.pid
     intersect
     select q1.ccname, q1.ppid, q1.wpid, q1.wcname from (
          select distinct c.cname as ccname, p.pid as ppid, w.pid as wpid, w.cname as wcname from Company c, Person p, worksFor w
          except
          select distinct c.cname as ccname, p.pid as ppid, w.pid as wpid, w.cname as wcname from Company c, Person p, worksFor w, worksFor w1 where p.pid != w1.pid and w1.cname = c.cname and w.salary <= w1.salary and not  w1.salary <= 60000
     ) q1
) q;

-- Use natural joins and joins

select q.ccname, q.ppid from (
     select distinct c.cname as ccname, p.pid as ppid, w.pid as wpid, w.cname as wcname from Person p cross join Company c natural join worksFor w
     intersect
     select distinct c.cname as ccname, p.pid as ppid, w.pid as wpid, w.cname as wcname from Company c cross join Person p natural join worksFor w
     intersect
     select q1.ccname, q1.ppid, q1.wpid, q1.wcname from (
          select distinct c.cname as ccname, p.pid as ppid, w.pid as wpid, w.cname as wcname from Company c cross join Person p, worksFor w
          except
          select distinct c.cname as ccname, p.pid as ppid, w.pid as wpid, w.cname as wcname from Company c natural join worksFor w1 join Person p on p.pid != w1.pid join worksFor w on w.salary <= w1.salary where w1.salary > 60000
     ) q1
) q;

\qecho 'Problem 7b.'


-- Using Approach 2, optimize this RA SQL query and provide the optimized
-- expression in RA SQL.  Specify at least three conceptually different
-- rewrite rules that you used during the optimization.

select q.ccname, q.ppid from (
     select distinct c.cname as ccname, p.pid as ppid, w.pid as wpid, w.cname as wcname from Person p natural join Company c natural join worksFor w
     intersect
     select distinct c.cname as ccname, p.pid as ppid, w.pid as wpid, w.cname as wcname from Company c natural join Person p natural join worksFor w
     intersect
     select q1.ccname, q1.ppid, q1.wpid, q1.wcname from (
          select distinct c.cname as ccname, p.pid as ppid, w.pid as wpid, w.cname as wcname from Company c cross join Person p, worksFor w
          except
          select distinct c.cname as ccname, p.pid as ppid, w.pid as wpid, w.cname as wcname from Company c natural join worksFor w1 join Person p on p.pid != w1.pid join worksFor w on w.salary <= w1.salary where w1.salary > 60000
     ) q1
) q;

--A intersect A is A
select q.ccname, q.ppid from (
     select distinct c.cname as ccname, p.pid as ppid, w.pid as wpid, w.cname as wcname from Person p natural join Company c natural join worksFor w
     intersect
     select q1.ccname, q1.ppid, q1.wpid, q1.wcname from (
          select distinct c.cname as ccname, p.pid as ppid, w.pid as wpid, w.cname as wcname from Company c cross join Person p, worksFor w
          except
          select distinct c.cname as ccname, p.pid as ppid, w.pid as wpid, w.cname as wcname from Company c natural join worksFor w1 join Person p on p.pid != w1.pid join worksFor w on w.salary <= w1.salary where w1.salary > 60000
     ) q1
) q;


--Using foreign key constraints between company and worksfor and person and worksfor
select q.ccname, q.wpid from (
     select distinct w.cname as ccname, w.pid as wpid from worksFor w
     intersect
     select q1.ccname, q1.wpid from (
          select distinct w.cname as ccname, w.pid as ppid, w.pid as wpid from worksFor w
          except
          select distinct w1.cname as ccname, p.pid as ppid, w.pid as wpid from worksFor w1 join Person p on p.pid != w1.pid join worksFor w on w.salary <= w1.salary where w1.salary > 60000
     ) q1
) q;

--Pushing selection over join
select q.ccname, q.wpid from (
     select distinct w.cname as ccname, w.pid as wpid from worksFor w
     intersect
     select q1.ccname, q1.wpid from (
          select distinct w.cname as ccname, w.pid as ppid, w.pid as wpid from worksFor w
          except
          select distinct w1.cname as ccname, p.pid as ppid, w.pid as wpid from (select * from worksFor where salary > 60000)w1 join Person p on p.pid != w1.pid join worksFor w on w.salary <= w1.salary
     ) q1
) q;


\qecho 'Problem 8a.'

/*Find the pid of each person who has all-but-one job skill

A possible way to write this
query in Pure SQL is*/

select p.pid from person p
where exists(
     select 1 from skill s where  not (p.pid, s.skill) in (select ps.pid, ps.skill from personSkill ps)
     ) and true=all(
          select s1.skill = s2.skill from skill s1, skill s2 where 
          (p.pid, s1.skill) not in (select ps.pid, ps.skill from personSkill ps) and
          (p.pid, s2.skill) not in (select ps.pid, ps.skill from   personSkill ps)
     );

-- Using the Pure SQL to RA SQL translation algorithm, translate this
-- Pure SQL query to an equivalent RA SQL query.  Show the translation
-- steps you used to obtain your solution.

select p.pid from person p
where exists(
     select 1 from skill s where  not (p.pid, s.skill) in (select ps.pid, ps.skill from personSkill ps)
     ) and true=all(
          select s1.skill = s2.skill from skill s1, skill s2 where 
          (p.pid, s1.skill) not in (select ps.pid, ps.skill from personSkill ps) and
          (p.pid, s2.skill) not in (select ps.pid, ps.skill from   personSkill ps)
     );

-- Translate AND to INTERSECT
select q.pid from (
     select p.pid from person p 
     where exists(select 1 from skill s where not (p.pid, s.skill) in (select ps.pid, ps.skill from personSkill ps))
     intersect
     select p.pid from person p 
     where true=all(
          select s1.skill = s2.skill from skill s1, skill s2 where 
          (p.pid, s1.skill) not in (select ps.pid, ps.skill from personSkill ps) and
          (p.pid, s2.skill) not in (select ps.pid, ps.skill from   personSkill ps)
     )
) q;

-- Translate EXISTS

select q.pid from (
     select distinct p.pid from person p, skill s where not (p.pid, s.skill) in (select ps.pid, ps.skill from personSkill ps)
     intersect
     select p.pid from person p 
     where true=all(
          select s1.skill = s2.skill from skill s1, skill s2 where 
          (p.pid, s1.skill) not in (select ps.pid, ps.skill from personSkill ps) and
          (p.pid, s2.skill) not in (select ps.pid, ps.skill from   personSkill ps)
     )
) q;

-- Translate true=all

select q.pid from (
     select distinct p.pid from person p, skill s where not (p.pid, s.skill) in (select ps.pid, ps.skill from personSkill ps)
     intersect
     select q1.pid from (
          select p.pid from person p, skill s1, skill s2
          except
          select p.pid from person p, skill s1, skill s2 where (p.pid, s1.skill) not in (select ps.pid, ps.skill from personSkill ps) and 
          (p.pid, s2.skill) not in (select ps.pid, ps.skill from personSkill ps) and s1.skill <> s2.skill
     ) q1
) q;

-- Translate And to intersect
select q.pid from (
     select distinct p.pid from person p, skill s where not (p.pid, s.skill) in (select ps.pid, ps.skill from personSkill ps)
     intersect
     select q1.pid from (
          select p.pid from person p, skill s1, skill s2
          except
          select q2.ppid from (
               select p.pid as ppid, s1.skill, s2.skill from person p, skill s1, skill s2 where (p.pid, s1.skill) not in (select ps.pid, ps.skill from personSkill ps)
               intersect
               select p.pid as ppid, s1.skill, s2.skill from person p, skill s1, skill s2 where (p.pid, s2.skill) not in (select ps.pid, ps.skill from personSkill ps)
               intersect 
               select p.pid as ppid, s1.skill, s2.skill from person p, skill s1, skill s2 where s1.skill <> s2.skill
          ) q2
     ) q1
) q;

-- Translate not in
select q.ppid from (
     select distinct q6.ppid from (
          select p.pid as ppid, s.*, ps.* from person p, skill s, personSkill ps
          except
          select p.pid as ppid, s.*, ps.* from person p, skill s, personSkill ps where p.pid=ps.pid and s.skill=ps.skill
     ) q6
     intersect
     select q1.pid from (
          select p.pid from person p, skill s1, skill s2
          except
          select q2.ppid from (
               select q3.ppid, q3.skill1, q3.skill2 from (
                    select p.pid as ppid, s1.skill as skill1, s2.skill as skill2 from person p, skill s1, skill s2
                    except
                    select p.pid as ppid, s1.skill as skill1, s2.skill as skill2 from person p, skill s1, skill s2, personSkill ps where  p.pid=ps.pid and s1.skill=ps.skill
               ) q3
               intersect
               select q4.ppid, q4.skill1, q4.skill2 from (
                    select p.pid as ppid, s1.skill as skill1, s2.skill as skill2 from person p, skill s1, skill s2
                    except
                    select p.pid as ppid, s1.skill as skill1, s2.skill as skill2 from person p, skill s1, skill s2, personSkill ps where  p.pid=ps.pid and s2.skill=ps.skill
               ) q4
               intersect 
               select p.pid as ppid, s1.skill, s2.skill from person p, skill s1, skill s2 where s1.skill <> s2.skill
          ) q2
     ) q1
) q;

-- Traslate And to intersect
select q.ppid from (
     select distinct q6.ppid from (
               select p.pid as ppid, s.skill, ps.pid, ps.skill from person p, skill s, personSkill ps
               except
               select q7.ppid, q7.sskill, q7.pspid, q7.psskill from (
               select p.pid as ppid, s.skill as sskill, ps.pid as pspid, ps.skill as psskill from person p, skill s, personSkill ps where p.pid=ps.pid
               intersect
               select p.pid as ppid, s.skill as sskill, ps.pid as pspid, ps.skill as psskill from person p, skill s, personSkill ps where s.skill=ps.skill
          ) q7
     ) q6
     intersect
     select q1.pid from (
          select p.pid from person p, skill s1, skill s2
          except
          select q2.ppid from (
               select q3.ppid, q3.skill1, q3.skill2 from (
                    select p.pid as ppid, s1.skill as skill1, s2.skill as skill2 from person p, skill s1, skill s2
                    except
                    select q5.ppid, q5.skill1, q5.skill2 from (
                         select p.pid as ppid, s1.skill as skill1, s2.skill as skill2, ps.* from person p, skill s1, skill s2, personSkill ps where p.pid=ps.pid
                         intersect
                         select p.pid as ppid, s1.skill as skill1, s2.skill as skill2, ps.* from person p, skill s1, skill s2, personSkill ps where s1.skill=ps.skill
                    ) q5
               ) q3
               intersect
               select q4.ppid, q4.skill1, q4.skill2 from (
                    select p.pid as ppid, s1.skill as skill1, s2.skill as skill2 from person p, skill s1, skill s2
                    except
                    select q6.ppid, q6.skill1, q6.skill2 from (
                         select p.pid as ppid, s1.skill as skill1, s2.skill as skill2, ps.* from person p, skill s1, skill s2, personSkill ps where p.pid=ps.pid
                         intersect
                         select p.pid as ppid, s1.skill as skill1, s2.skill as skill2, ps.* from person p, skill s1, skill s2, personSkill ps where s2.skill=ps.skill
                    ) q6
               ) q4
               intersect 
               select p.pid as ppid, s1.skill, s2.skill from person p, skill s1, skill s2 where s1.skill <> s2.skill
          ) q2
     ) q1
) q;

-- Move where clause to from
select q.ppid from (
     select distinct q6.ppid from (
               select p.pid as ppid, s.skill, ps.pid, ps.skill from person p cross join skill s cross join personSkill ps
               except
               select q7.ppid, q7.sskill, q7.pspid, q7.psskill from (
               select p.pid as ppid, s.skill as sskill, ps.pid as pspid, ps.skill as psskill from person p join personSkill ps on p.pid=ps.pid cross join skill s 
               intersect
               select p.pid as ppid, s.skill as sskill, ps.pid as pspid, ps.skill as psskill from person p, skill s join personSkill ps on s.skill=ps.skill 
          ) q7
     ) q6
     intersect
     select q1.pid from (
          select p.pid from person p, skill s1, skill s2
          except
          select q2.ppid from (
               select q3.ppid, q3.skill1, q3.skill2 from (
                    select p.pid as ppid, s1.skill as skill1, s2.skill as skill2 from person p cross join skill s1 cross join skill s2
                    except
                    select q5.ppid, q5.skill1, q5.skill2 from (
                         select p.pid as ppid, s1.skill as skill1, s2.skill as skill2, ps.* from person p join personSkill ps on p.pid=ps.pid cross join skill s1 cross join skill s2 
                         intersect
                         select p.pid as ppid, s1.skill as skill1, s2.skill as skill2, ps.* from person p cross join skill s1 cross join skill s2 join personSkill ps on s1.skill=ps.skill
                    ) q5
               ) q3
               intersect
               select q4.ppid, q4.skill1, q4.skill2 from (
                    select p.pid as ppid, s1.skill as skill1, s2.skill as skill2 from person p cross join skill s1 cross join skill s2
                    except
                    select q6.ppid, q6.skill1, q6.skill2 from (
                         select p.pid as ppid, s1.skill as skill1, s2.skill as skill2, ps.* from person p join personSkill ps on p.pid=ps.pid cross join skill s1 cross join skill s2 
                         intersect
                         select p.pid as ppid, s1.skill as skill1, s2.skill as skill2, ps.* from person p cross join skill s1 cross join skill s2 join personSkill ps on s2.skill=ps.skill
                    ) q6
               ) q4
               intersect 
               select p.pid as ppid, s1.skill, s2.skill from person p, skill s1 join skill s2 on s1.skill <> s2.skill
          ) q2
     ) q1
) q;

\qecho 'Problem 8b.'

-- Using Approach 2, optimize this RA SQL query and provide the optimized
-- expression in RA SQL.  Specify at least three conceptually different
-- rewrite rules that you used during the optimization.

select q.ppid from (
     select distinct q6.ppid from (
               select p.pid as ppid, s.skill, ps.pid, ps.skill from person p cross join skill s cross join personSkill ps
               except
               select q7.ppid, q7.sskill, q7.pspid, q7.psskill from (
               select p.pid as ppid, s.skill as sskill, ps.pid as pspid, ps.skill as psskill from person p join personSkill ps on p.pid=ps.pid cross join skill s 
               intersect
               select p.pid as ppid, s.skill as sskill, ps.pid as pspid, ps.skill as psskill from person p, skill s join personSkill ps on s.skill=ps.skill 
          ) q7
     ) q6
     intersect
     select q1.pid from (
          select p.pid from person p, skill s1, skill s2
          except
          select q2.ppid from (
               select q3.ppid, q3.skill1, q3.skill2 from (
                    select p.pid as ppid, s1.skill as skill1, s2.skill as skill2 from person p cross join skill s1 cross join skill s2
                    except
                    select q5.ppid, q5.skill1, q5.skill2 from (
                         select p.pid as ppid, s1.skill as skill1, s2.skill as skill2, ps.* from person p join personSkill ps on p.pid=ps.pid cross join skill s1 cross join skill s2 
                         intersect
                         select p.pid as ppid, s1.skill as skill1, s2.skill as skill2, ps.* from person p cross join skill s1 cross join skill s2 join personSkill ps on s1.skill=ps.skill
                    ) q5
               ) q3
               intersect
               select q4.ppid, q4.skill1, q4.skill2 from (
                    select p.pid as ppid, s1.skill as skill1, s2.skill as skill2 from person p cross join skill s1 cross join skill s2
                    except
                    select q6.ppid, q6.skill1, q6.skill2 from (
                         select p.pid as ppid, s1.skill as skill1, s2.skill as skill2, ps.* from person p join personSkill ps on p.pid=ps.pid cross join skill s1 cross join skill s2 
                         intersect
                         select p.pid as ppid, s1.skill as skill1, s2.skill as skill2, ps.* from person p cross join skill s1 cross join skill s2 join personSkill ps on s2.skill=ps.skill
                    ) q6
               ) q4
               intersect 
               select p.pid as ppid, s1.skill, s2.skill from person p, skill s1 join skill s2 on s1.skill <> s2.skill
          ) q2
     ) q1
) q;

-- Use foreign constraint
select q.ppid from (
     -- query 1
     select distinct q6.ppid from (
               select p.pid as ppid, ps.skill, ps.pid from person p cross join personSkill ps
               except
               select q7.ppid, q7.sskill, q7.pspid from (
                    select ps.pid as ppid, s.skill as sskill, ps.pid as pspid from personSkill ps cross join skill s 
                    intersect
                    select p.pid as ppid, ps.skill as sskill, ps.pid as pspid from person p cross join personSkill ps
          ) q7
     ) q6
     intersect
     select q1.pid from (
          select distinct p.pid from person p
          except
          select q2.ppid from (
               select q3.ppid, q3.skill1, q3.skill2 from (
                    select p.pid as ppid, s1.skill as skill1, s2.skill as skill2 from person p cross join skill s1 cross join skill s2
                    except
                    select q5.ppid, q5.skill1, q5.skill2 from (
                         select ps.pid as ppid, s1.skill as skill1, s2.skill as skill2 from personSkill ps cross join skill s1 cross join skill s2 
                         intersect
                         select p.pid as ppid, ps.skill as skill1, s2.skill as skill2 from person p cross join personSkill ps cross join skill s2 
                    ) q5
               ) q3
               intersect
               select q4.ppid, q4.skill1, q4.skill2 from (
                    select p.pid as ppid, s1.skill as skill1, s2.skill as skill2 from person p cross join skill s1 cross join skill s2
                    except
                    select q6.ppid, q6.skill1, q6.skill2 from (
                         select ps.pid as ppid, s1.skill as skill1, s2.skill as skill2, ps.pid, ps.skill from personSkill ps cross join skill s1 cross join skill s2 
                         intersect
                         select p.pid as ppid, s1.skill as skill1, ps.skill as skill2, ps.pid, ps.skill from person p cross join personSkill ps cross join skill s1
                    ) q6
               ) q4
               intersect 
               select p.pid as ppid, s1.skill, s2.skill from person p, skill s1 join skill s2 on s1.skill <> s2.skill
          ) q2
     ) q1
) q;

-- A - (A ∩ B) = A - B at query 1
select q.ppid from (
     select distinct q6.ppid from (
          select p.pid as ppid, ps.skill, ps.pid from person p cross join personSkill ps
          except
          select ps.pid as ppid, s.skill as sskill, ps.pid as pspid from personSkill ps cross join skill s 
     ) q6
     intersect
     select q1.pid from (
          select distinct p.pid from person p
          except
          select q2.ppid from (
               select q3.ppid, q3.skill1, q3.skill2 from (
                    select p.pid as ppid, s1.skill as skill1, s2.skill as skill2 from person p cross join skill s1 cross join skill s2
                    except
                    select q5.ppid, q5.skill1, q5.skill2 from (
                         select ps.pid as ppid, s1.skill as skill1, s2.skill as skill2 from personSkill ps cross join skill s1 cross join skill s2 
                         intersect
                         select p.pid as ppid, ps.skill as skill1, s2.skill as skill2 from person p cross join personSkill ps cross join skill s2 
                    ) q5
               ) q3
               intersect
               select q4.ppid, q4.skill1, q4.skill2 from (
                    select p.pid as ppid, s1.skill as skill1, s2.skill as skill2 from person p cross join skill s1 cross join skill s2
                    except
                    select q6.ppid, q6.skill1, q6.skill2 from (
                         select ps.pid as ppid, s1.skill as skill1, s2.skill as skill2, ps.pid, ps.skill from personSkill ps cross join skill s1 cross join skill s2 
                         intersect
                         select p.pid as ppid, s1.skill as skill1, ps.skill as skill2, ps.pid, ps.skill from person p cross join personSkill ps cross join skill s1
                    ) q6
               ) q4
               intersect 
               select p.pid as ppid, s1.skill, s2.skill from person p, skill s1 join skill s2 on s1.skill <> s2.skill
          ) q2
     ) q1
) q;

-- Using (A - B) ∩ (A - C) = A - (B ∪ C)
select q.ppid from (
     select distinct q6.ppid from (
          select p.pid as ppid, ps.skill, ps.pid from person p cross join personSkill ps
          except
          select ps.pid as ppid, s.skill as sskill, ps.pid as pspid from personSkill ps cross join skill s 
     ) q6
     intersect
     select q1.pid from (
          select distinct p.pid from person p
          except
          select q2.ppid from (
               select q3.ppid, q3.skill1, q3.skill2 from (
                    select p.pid as ppid, s1.skill as skill1, s2.skill as skill2 from person p cross join skill s1 cross join skill s2
                    except
                    select q4.ppid, q4.skill1, q4.skill2 from (
                         select q5.ppid, q5.skill1, q5.skill2 from (
                              select ps.pid as ppid, s1.skill as skill1, s2.skill as skill2 from personSkill ps cross join skill s1 cross join skill s2 
                              intersect
                              select p.pid as ppid, ps.skill as skill1, s2.skill as skill2 from person p cross join personSkill ps cross join skill s2 
                         ) q5
                         union 
                         select q6.ppid, q6.skill1, q6.skill2 from (
                              select ps.pid as ppid, s1.skill as skill1, s2.skill as skill2, ps.pid, ps.skill from personSkill ps cross join skill s1 cross join skill s2 
                              intersect
                              select p.pid as ppid, s1.skill as skill1, ps.skill as skill2, ps.pid, ps.skill from person p cross join personSkill ps cross join skill s1
                         ) q6
                    ) q4
               ) q3
               intersect 
               select p.pid as ppid, s1.skill, s2.skill from person p, skill s1 join skill s2 on s1.skill <> s2.skill
          ) q2
     ) q1
) q;

\qecho 'Problem 9a.'

/*
Consider the query ``\emph{Find the cname of each company that (1) is
not located in Chicago, (2) employs at least one person and (3) whose
workers who make strictly less 60000 neither have the programming
skill nor the AI skill

A possible way to write this
query in Pure SQL is*/

select c.cname
from   company c
where  c.cname in (select w.cname
                   from   worksfor w 
                   where  not exists (select 1
                                      from   companyLocation cl 
                                      where  w.cname = cl.cname and 
                                             cl.city = 'Chicago')) and
       true = all (select p.pid not in (select ps.pid
                                         from   personSkill ps
                                         where  ps.skill = 'Programming' or
                                                ps.skill = 'AI')
                   from   Person p
                   where  p.pid in (select w.pid
                                     from   worksFor w
                                     where  w.cname = c.cname and
                                            w.salary < 60000));

-- Using the Pure SQL to RA SQL translation algorithm, translate this
-- Pure SQL query to an equivalent RA SQL query.  Show the translation
-- steps you used to obtain your solution.

select c.cname from   company c where c.cname in (
     select w.cname from worksfor w where not exists (
          select 1 from   companyLocation cl where  w.cname = cl.cname and cl.city = 'Chicago')
     ) and true = all (
               select p.pid not in (select ps.pid from   personSkill ps where  ps.skill = 'Programming' or ps.skill = 'AI')
               from   Person p where  p.pid in (select w.pid from   worksFor w where  w.cname = c.cname and w.salary < 60000
     )
);

-- Eliminate IN
select distinct c.cname from company c, worksfor w where c.cname=w.cname and not exists (
     select 1 from   companyLocation cl where  w.cname = cl.cname and cl.city = 'Chicago'
     ) and true = all (
          select p.pid not in (select ps.pid from   personSkill ps where  ps.skill = 'Programming' or ps.skill = 'AI')
          from   Person p where  p.pid in (select w.pid from   worksFor w where  w.cname = c.cname and w.salary < 60000)
     );

-- Translate And to Intersect
select distinct q.ccname from (
     select c.cname as ccname, w.cname, w.pid from company c, worksfor w where c.cname=w.cname
     intersect
     select c.cname as ccname, w.cname, w.pid from company c, worksfor w where not exists (
          select 1 from   companyLocation cl where  w.cname = cl.cname and cl.city = 'Chicago'
     )
     intersect
     select c.cname as ccname, w.cname, w.pid from company c, worksfor w where true = all (
          select p.pid not in (select ps.pid from   personSkill ps where  ps.skill = 'Programming' or ps.skill = 'AI')
          from   Person p where  p.pid in (select w.pid from   worksFor w where  w.cname = c.cname and w.salary < 60000)
     )
) q;

-- Eliminate not exits
select distinct q.ccname from (
     select c.cname as ccname, w.cname, w.pid from company c, worksfor w where c.cname=w.cname
     intersect
     select q1.ccname, q1.cname, q1.pid from ( 
          select c.cname as ccname, w.cname, w.pid from company c, worksfor w
          except
          select c.cname as ccname, w.cname, w.pid from company c, worksfor w, companyLocation cl where w.cname = cl.cname and cl.city = 'Chicago'
     ) q1
     intersect
     select c.cname as ccname, w.cname, w.pid from company c, worksfor w where true = all (
          select p.pid not in (select ps.pid from   personSkill ps where  ps.skill = 'Programming' or ps.skill = 'AI')
          from   Person p where  p.pid in (select w.pid from   worksFor w where  w.cname = c.cname and w.salary < 60000)
     )
) q;

-- Eliminate true=all
select distinct q.ccname from (
     select c.cname as ccname, w.cname, w.pid from company c, worksfor w where c.cname=w.cname
     intersect
     select q1.ccname, q1.cname, q1.pid from ( 
          select c.cname as ccname, w.cname, w.pid from company c, worksfor w
          except
          select c.cname as ccname, w.cname, w.pid from company c, worksfor w, companyLocation cl where w.cname = cl.cname and cl.city = 'Chicago'
     ) q1
     intersect
     select q2.ccname, q2.cname, q2.pid from (
          select c.cname as ccname, w.cname, w.pid from company c, worksfor w
          except
          select c.cname as ccname, w.cname, w.pid from company c, worksfor w, Person p where p.pid in (select w.pid from   worksFor w where  w.cname = c.cname and w.salary < 60000) and  
          p.pid in (select ps.pid from personSkill ps where ps.skill = 'Programming' or ps.skill = 'AI')
     ) q2
) q;

-- Eliminate And using intersect

select distinct q.ccname from (
     select c.cname as ccname, w.cname, w.pid from company c, worksfor w where c.cname=w.cname
     intersect
     select q1.ccname, q1.cname, q1.pid from ( 
          select c.cname as ccname, w.cname, w.pid from company c, worksfor w
          except
          select c.cname as ccname, w.cname, w.pid from company c, worksfor w, companyLocation cl where w.cname = cl.cname and cl.city = 'Chicago'
     ) q1
     intersect
     select q2.ccname, q2.cname, q2.pid from (
          select c.cname as ccname, w.cname, w.pid from company c, worksfor w
          except
          select q3.ccname, q3.cname, q3.wpid from (
               select c.cname as ccname, w.cname, w.pid as wpid, p.pid from company c, worksfor w, Person p where p.pid in (select w.pid from   worksFor w where  w.cname = c.cname and w.salary < 60000)
               intersect
               select c.cname as ccname, w.cname, w.pid as wpid, p.pid from company c, worksfor w, Person p where p.pid in (select ps.pid from personSkill ps where ps.skill = 'Programming' or ps.skill = 'AI')
          ) q3
     ) q2
) q;

-- Eliminate IN

select distinct q.ccname from (
     select c.cname as ccname, w.cname, w.pid from company c, worksfor w where c.cname=w.cname
     intersect
     select q1.ccname, q1.cname, q1.pid from ( 
          select c.cname as ccname, w.cname, w.pid from company c, worksfor w
          except
          select c.cname as ccname, w.cname, w.pid from company c, worksfor w, companyLocation cl where w.cname = cl.cname and cl.city = 'Chicago'
     ) q1
     intersect
     select q2.ccname, q2.cname, q2.pid from (
          select c.cname as ccname, w.cname, w.pid from company c, worksfor w
          except
          select q3.ccname, q3.cname, q3.wpid from (
               select distinct c.cname as ccname, w.cname, w.pid as wpid, p.pid from company c, worksfor w, Person p, worksFor w1 where w1.cname = c.cname and w1.salary < 60000 and w1.pid=p.pid
               intersect
               select distinct c.cname as ccname, w.cname, w.pid as wpid, p.pid from company c, worksfor w, Person p, personSkill ps  where (ps.skill = 'Programming' or ps.skill = 'AI') and p.pid=ps.pid
          ) q3
     ) q2
) q;

-- Use joins
select distinct q.ccname from (
     select c.cname as ccname, w.cname, w.pid from company c natural join worksfor w
     intersect
     select q1.ccname, q1.cname, q1.pid from ( 
          select c.cname as ccname, w.cname, w.pid from company c natural join worksfor w
          except
          select c.ccname as ccname, w.cname, w.pid from (select cname as ccname from company) c cross join worksfor w natural join (select * from companyLocation where city = 'Chicago') cl 
     ) q1
     intersect
     select q2.ccname, q2.cname, q2.pid from (
          select c.cname as ccname, w.cname, w.pid from company c natural join worksfor w
          except
          select q3.ccname, q3.wcname, q3.wpid from (
               select distinct c.cname as ccname, w.wcname, w.wpid as wpid, p.pid from (select cname as wcname, pid as wpid from worksFor) w cross join company c natural join worksfor w1 natural join Person p where w1.salary < 60000
               intersect
               select distinct c.cname as ccname, w.wcname, w.wpid as wpid, p.pid from company c cross join (select cname as wcname, pid as wpid from worksFor) w cross join Person p natural join personSkill ps where ps.skill = 'Programming' or ps.skill = 'AI'
          ) q3
     ) q2
) q;

\qecho 'Problem 9b.'
	       
-- Using Approach 2, optimize this RA SQL query and provide the optimized
-- expression in RA SQL.  Specify at least three conceptually different
-- rewrite rules that you used during the optimization.

select distinct q.ccname from (
     -- query 1
     select c.cname as ccname, w.cname, w.pid from company c natural join worksfor w
     intersect
     select q1.ccname, q1.cname, q1.pid from ( 
          select c.cname as ccname, w.cname, w.pid from company c natural join worksfor w
          except
          select c.ccname as ccname, w.cname, w.pid from (select cname as ccname from company) c natural join worksfor w natural join (select * from companyLocation where city = 'Chicago') cl 
     ) q1
     intersect
     -- query 2
     select q2.ccname, q2.cname, q2.pid from (
          select c.cname as ccname, w.cname, w.pid from company c natural join worksfor w
          except
          select q3.ccname, q3.wcname, q3.wpid from (
               select distinct c.cname as ccname, w.wcname, w.wpid as wpid, p.pid from (select cname as wcname, pid as wpid from worksFor) w cross join company c natural join worksfor w1 natural join Person p where w1.salary < 60000
               intersect
               select distinct c.cname as ccname, w.wcname, w.wpid as wpid, p.pid from company c cross join (select cname as wcname, pid as wpid from worksFor) w cross join Person p natural join personSkill ps where ps.skill = 'Programming' or ps.skill = 'AI'
          ) q3
     ) q2
) q;

-- Apply associativity of - and intersect on query 1 E ∩ (E -  X) = E - X
select distinct q.ccname from (
     select q1.ccname, q1.cname, q1.pid from ( 
          select c.cname as ccname, w.cname, w.pid from company c natural join worksfor w
          except
          select c.ccname as ccname, w.cname, w.pid from (select cname as ccname from company) c natural join worksfor w natural join (select * from companyLocation where city = 'Chicago') cl 
     ) q1
     intersect
     select q2.ccname, q2.cname, q2.pid from (
          select c.cname as ccname, w.cname, w.pid from company c natural join worksfor w
          except
          select q3.ccname, q3.wcname, q3.wpid from (
               select distinct c.cname as ccname, w.wcname, w.wpid as wpid, p.pid from (select cname as wcname, pid as wpid from worksFor) w cross join company c natural join worksfor w1 natural join Person p where w1.salary < 60000
               intersect
               select distinct c.cname as ccname, w.wcname, w.wpid as wpid, p.pid from company c cross join (select cname as wcname, pid as wpid from worksFor) w cross join Person p natural join personSkill ps where ps.skill = 'Programming' or ps.skill = 'AI'
          ) q3
     ) q2
) q;

-- Push selection over join in query 2
select distinct q.ccname from (
     select q1.ccname, q1.cname, q1.pid from ( 
          select c.cname as ccname, w.cname, w.pid from company c natural join worksfor w
          except
          select c.ccname as ccname, w.cname, w.pid from (select cname as ccname from company) c natural join worksfor w natural join (select * from companyLocation where city = 'Chicago') cl 
     ) q1
     intersect
     select q2.ccname, q2.cname, q2.pid from (
          select c.cname as ccname, w.cname, w.pid from company c natural join worksfor w
          except
          select q3.ccname, q3.wcname, q3.wpid from (
               select distinct c.cname as ccname, w.wcname, w.wpid as wpid, p.pid from (select cname as wcname, pid as wpid from worksFor) w cross join company c natural join (select * from worksfor where salary < 60000) w1 natural join Person p 
               intersect
               select distinct c.cname as ccname, w.wcname, w.wpid as wpid, p.pid from company c cross join (select cname as wcname, pid as wpid from worksFor) w cross join Person p natural join personSkill ps where ps.skill = 'Programming' or ps.skill = 'AI'
          ) q3
     ) q2
) q;

-- Push project over join and use foreign key for worksFor w1 and Person in query 2
-- Use foreign key for personSkill and person in query 2
select distinct q.ccname from (
     select q1.ccname, q1.cname, q1.pid from ( 
          select c.cname as ccname, w.cname, w.pid from company c natural join worksfor w
          except
         select c.ccname as ccname, w.cname, w.pid from (select cname as ccname from company) c natural join worksfor w natural join (select * from companyLocation where city = 'Chicago') cl 
     ) q1
     intersect
     select q2.ccname, q2.cname, q2.pid from (
          select c.cname as ccname, w.cname, w.pid from company c natural join worksfor w
          except
          select q3.ccname, q3.wcname, q3.wpid from (
               select distinct c.cname as ccname, w.wcname, w.wpid as wpid, w1.pid from (select cname as wcname, pid as wpid from worksFor) w cross join (select cname from company) c natural join (select pid, cname from worksfor where salary < 60000) w1
               intersect
               select distinct c.cname as ccname, w.wcname, w.wpid as wpid, ps.pid from company c cross join (select cname as wcname, pid as wpid from worksFor) w cross join personSkill ps where ps.skill = 'Programming' or ps.skill = 'AI'
          ) q3
     ) q2
) q;

\qecho 'Problem 10a'

-- Consider the following Pure SQL query.

select p.pid, exists (select 1
                      from   hasManager hm1, hasManager hm2
                      where  hm1.mid = p.pid and hm2.mid = p.pid and
                             hm1.eid <> hm2.eid)
from   Person p;

-- This query returns a pair (p,t) if p is the pid of a person who
-- manages at least two persons and returns the pair (p,f) other- wise.11

-- Using the Pure SQL to RA SQL translation algorithm, translate this
-- Pure SQL query to an equivalent RA SQL query.  Show the translation
-- steps you used to obtain your solution.

select p.pid, p.pid in (select hm1.mid from hasManager hm1, hasManager hm2 where  hm1.mid = hm2.mid and hm1.eid <> hm2.eid)
from   Person p;

-- Rewrite query using union
select p.pid, true from person p 
where p.pid in (select hm1.mid from hasManager hm1, hasManager hm2 where  hm1.mid = hm2.mid and hm1.eid <> hm2.eid)
union
select p.pid, false from person p 
where p.pid not in (select hm1.mid from hasManager hm1, hasManager hm2 where hm1.mid = hm2.mid and hm1.eid <> hm2.eid);

-- Translate IN and not in subquery expression
select distinct p.pid, true from person p, hasManager hm1, hasManager hm2 where hm1.mid = hm2.mid and hm1.eid <> hm2.eid and p.pid=hm1.mid
union
select p.pid, false from person p, hasManager hm1, hasManager hm2
except
select p.pid, false from person p, hasManager hm1, hasManager hm2 where hm1.mid = hm2.mid and hm1.eid <> hm2.eid and p.pid=hm1.mid;

-- Use joins and cross joins
select distinct p.pid, true from person p join hasManager hm1 on p.pid=hm1.mid join hasManager hm2 on hm1.mid = hm2.mid and hm1.eid <> hm2.eid 
union
select p.pid, false from person p cross join hasManager hm1 cross join hasManager hm2
except
select p.pid, false from person p join hasManager hm1 on p.pid=hm1.mid join hasManager hm2 on hm1.mid = hm2.mid and hm1.eid <> hm2.eid;

-- Move constant to from clause
select distinct p.pid, managesAtLeastTwoPersons from person p join hasManager hm1 on p.pid=hm1.mid join hasManager hm2 on hm1.mid = hm2.mid and hm1.eid <> hm2.eid cross join (select true as managesAtLeastTwoPersons) b
union
select p.pid, managesAtLeastTwoPersons from person p cross join hasManager hm1 cross join hasManager hm2 cross join (select false as managesAtLeastTwoPersons) b
except
select p.pid, managesAtLeastTwoPersons from person p join hasManager hm1 on p.pid=hm1.mid join hasManager hm2 on hm1.mid = hm2.mid and hm1.eid <> hm2.eid cross join (select false as managesAtLeastTwoPersons) b;

\qecho 'Problem 10b'

-- Using Approach 2, optimize this RA SQL query and provide the optimized
-- expression in RA SQL.  Specify at least three conceptually different
-- rewrite rules that you used during the optimization.

select distinct p.pid, managesAtLeastTwoPersons from person p join hasManager hm1 on p.pid=hm1.mid join hasManager hm2 on hm1.mid = hm2.mid and hm1.eid <> hm2.eid cross join (select true as managesAtLeastTwoPersons) b
union
select p.pid, managesAtLeastTwoPersons from person p cross join hasManager hm1 cross join hasManager hm2 cross join (select false as managesAtLeastTwoPersons) b
except
select p.pid, managesAtLeastTwoPersons from person p join hasManager hm1 on p.pid=hm1.mid join hasManager hm2 on hm1.mid = hm2.mid and hm1.eid <> hm2.eid cross join (select false as managesAtLeastTwoPersons) b;

-- Pushing down projection over joins
select distinct p.pid, managesAtLeastTwoPersons from (select pid from person) p join (select hm1.mid from hasManager hm1 join hasManager hm2 on hm1.mid = hm2.mid and hm1.eid <> hm2.eid) q on p.pid=q.mid cross join (select true as managesAtLeastTwoPersons) b
union
select p.pid, managesAtLeastTwoPersons from (select pid from person) p cross join hasManager hm1 cross join hasManager hm2 cross join (select false as managesAtLeastTwoPersons) b
except
select p.pid, managesAtLeastTwoPersons from (select pid from person) p join (select hm1.mid from hasManager hm1 join hasManager hm2 on hm1.mid = hm2.mid and hm1.eid <> hm2.eid) q on p.pid=q.mid cross join (select false as managesAtLeastTwoPersons) b;

-- Consider foreign key relation
select distinct q.mid, managesAtLeastTwoPersons from (select hm1.mid from hasManager hm1 join hasManager hm2 on hm1.mid = hm2.mid and hm1.eid <> hm2.eid) q cross join (select true as managesAtLeastTwoPersons) b
union
select p.pid, managesAtLeastTwoPersons from (select pid from person) p cross join hasManager hm1 cross join hasManager hm2 cross join (select false as managesAtLeastTwoPersons) b
except
select q.mid, managesAtLeastTwoPersons from (select hm1.mid from hasManager hm1 join hasManager hm2 on hm1.mid = hm2.mid and hm1.eid <> hm2.eid) q cross join (select false as managesAtLeastTwoPersons) b;

\qecho 'Problem 11'

/*
Find each pair (c, a, l, u) where ‘c’ is the cname of a company that
pays each of its employees a salary between 50000 and 60000, ‘a′ is
the average salary of the employees who work for company ‘c’, ‘l’ is
the number of employees who earn a salary strictly below this average,
and ‘u’ is the number of employees who earn at least this average.
*/

with interested_companies as (
     select distinct cname from worksFor c where true=all(select salary >= 50000 and salary <= 60000 from worksFor w where w.cname=c.cname)
),
average_salaries as (
     select cname, avg(salary) as avg_salary from worksFor w group by w.cname
     union
     select c.cname, 0 from company c where c.cname not in (select w.cname from worksFor w)
),
cnt_low as (
     select w.cname, count(w) as cnt_l from worksFor w 
     where w.salary < (select avg_salary from average_salaries a where a.cname=w.cname)
     group by w.cname
),
count_low_salaries as (
     select cname, cnt_l from cnt_low
     union
     select cname, 0 from company c where c.cname not in (select cname from cnt_low)
),
cnt_high as (
     select w.cname, count(w) as cnt_h from worksFor w 
     where w.salary >= (select avg_salary from average_salaries a where a.cname=w.cname)
     group by w.cname
),
count_high_salaries as (
     select cname, cnt_h from cnt_high
     union
     select cname, 0 from company c where c.cname not in (select cname from cnt_high)
)

select ic.cname as c, 
(select avg_salary from average_salaries avs where avs.cname=ic.cname) as a, 
(select cnt_l from count_low_salaries cls where cls.cname=ic.cname) as l,
(select cnt_h from count_high_salaries chs where chs.cname=ic.cname) as h
from interested_companies ic;

\qecho 'Problem 12'

/*
Find each skill that is the skill of at least 3 persons who each know
at least 2 persons who work for Apple and whose salary is at most 50000.
*/

select s.skill from skill s where (
     select count(ps) from personskill ps where ps.skill = s.skill and (
          select count(k) from knows k, worksFor w where pid1=ps.pid and k.pid2=w.pid and w.cname='Apple' and w.salary <= 50000
     ) >= 2
) >= 3;

\qecho 'Problem 13'

/*
Find the pid and name of each person p who has at least 3 job skills
in combined set of job skills of the persons who are managed by p.
*/

select p.pid, p.pname from person p where (
     select count(1) from personskill ps where p.pid=ps.pid and 
     ps.skill in (select distinct ps.skill from hasManager h, personSkill ps where h.mid=p.pid and ps.pid=h.eid)
) >= 3;

\qecho 'Problem 14'

/*
Find the cname of each company that employs at least 4 persons and
that pays the highest average salary among such companies.
*/

with interested_companies as (
     select c.cname from company c where (select count(1) from worksFor w where w.cname=c.cname) >= 4
),
average_salaries as (
     select ic.cname, avg(salary) as avg_salary from interested_companies ic, worksFor w where ic.cname=w.cname group by ic.cname
)
select cname from average_salaries where avg_salary = (select max(avg_salary) from average_salaries);


\qecho 'Problem 15'

/*
Without using subquery expressions, find each pid of a person who
knows each person who earns the highest salary at company Amazon.
*/
-- drop function max_salary(cname text);

select p.pid from person p where (select count(q) from (
          select pid from worksFor where cname='Amazon' and salary = (select max(salary) from worksFor where cname='Amazon')
          except
          select pid2 from knows where pid1=p.pid
     ) q
) = 0;

\qecho 'Problem 16'

/*
Without using subquery expressions, find each pairs (p1,p2) of pids of
different persons such that if s is a job skill of p1 then s is not a 
job skill of person p2.
*/

select p1.pid, p2.pid from person p1, person p2 
where p1.pid <> p2.pid 
     and (select count(q) from (
          select ps.skill from personSkill ps where ps.pid=p1.pid
          intersect
          select ps.skill from personSkill ps where ps.pid=p2.pid
     ) q
) = 0;

\qecho 'Problem 17'

/* Find each pairs (p1,p2) of different pids of persons p1 and p2
and such that (1) the number of skills of person s1 is strictly less
than the number of skills of person s2 and (2) such that the gap
between these numbers is the largest among all such possible gaps.
 */

create or replace function NoOfSkills(ppid integer)
returns integer as 
$$
select count(1) as cnt_s from personSkill where pid=ppid
$$ language sql;

with max_diff as (
     select max(NoOfSkills(p2.pid) - NoOfSkills(p1.pid)) as m_diff from person p1, person p2 where p1.pid<>p2.pid and NoOfSkills(p2.pid) > NoOfSkills(p1.pid)
)

select p1.pid, p2.pid from person p1, person p2 where p1.pid<>p2.pid and NoOfSkills(p2.pid) > NoOfSkills(p1.pid) and (NoOfSkills(p2.pid) - NoOfSkills(p1.pid)) = (select * from max_diff);

\qecho 'Problem 18'

-- select c.cname, q1.type from company c, (select * from (values ('low'), ('medium'), ('high')) q (type)) q1;
-- select c.cname, (select count from low_salaries where cname=c.cname) as, (select count from low_salaries where cname=c.cname), (select count from low_salaries where cname=c.cname) 
-- from company c;

with low_salaries as (
     select cname, count(w) from worksFor w where w.salary <= 50000 group by w.cname
     union
     select cname, 0 from company c where c.cname not in (select cname from worksFor where salary <= 50000)
),
medium_salaries as (
     select cname, count(w) from worksFor w where w.salary >= 50001 and w.salary <= 60000 group by w.cname
     union
     select cname, 0 from company c where c.cname not in (select cname from worksFor where salary >= 50001 and salary <= 60000)
),
high_salaries as (
     select cname, count(w) from worksFor w where w.salary >= 60001 group by w.cname
     union
     select cname, 0 from company c where c.cname not in (select cname from worksFor where salary >= 60001)
)

select c.cname as c, q.type as t, (select count from low_salaries where cname=c.cname) as n from company c, (select 'low' as type) q
union
select c.cname as c, q.type as t, (select count from medium_salaries where cname=c.cname) as n from company c, (select 'medium' as type) q
union
select c.cname as c, q.type as t, (select count from high_salaries where cname=c.cname) as n from company c, (select 'high' as type) q
order by c, t;

-- Connect to default database
\c postgres

-- Drop database created for this assignment
DROP DATABASE dvgassignment3;







