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

create table E1 (x integer);
create table E2 (x integer);
create table F (y integer);

create view ifThenElse as(
(select e1.*
 from   E1 e1
 except
 select e1.*
 from   E1 e1 cross join (select row()
                          from   F) f)
 union
 select e2.*
 from   E2 e2 cross join (select row()
                          from   F) f);




\qecho 'Problem 1.b'

insert into E1 values (1), (2);
insert into E2 values (3), (4);

select * from ifThenElse;


\qecho 'Problem 1.c'

insert into F values (10), (20), (30);


select * from ifThenElse;


\qecho 'Problem 2'

-- Consider the following boolean SQL query:

drop table F cascade;
create table F(x integer, y integer);

select true = all (select p1 = p2
                   from   F p1, F p2
                   where  p1.x = p2.x)  "isaFunction";



\qecho 'Problem 2.a'

-- Using the insights you gained from Problem 1, write an RA SQL query
-- that expresses the above boolean SQL query.


(select true as "isaFunction"
 except
 select true
 from   (select 1
         from   F p1 join F p2 on (p1.x = p2.x and p1 != p2)) q)
union
select false as "isaFunction"
from   (select 1
        from   F p1 join F p2 on (p1.x = p2.x and p1 != p2)) q;




\qecho 'Problem 2.b'


(select true as "isaFunction"
 except
 select true
 from   (select 1
         from   F p1 join F p2 on (p1.x = p2.x and p1 != p2)) q)
union
select false as "isaFunction"
from   (select 1
        from   F p1 join F p2 on (p1.x = p2.x and p1 != p2)) q;

\qecho 'Problem 2.c'

insert into F values (1,10), (2,20);

(select true as "isaFunction"
 except
 select true
 from   (select 1
         from   F p1 join F p2 on (p1.x = p2.x and p1 != p2)) q)
union
select false as "isaFunction"
from   (select 1
        from   F p1 join F p2 on (p1.x = p2.x and p1 != p2)) q;

\qecho 'Problem 2.d'

insert into F values (1,20);

(select true as "isaFunction"
 except
 select true
 from   (select 1
         from   F p1 join F p2 on (p1.x = p2.x and p1 != p2)) q)
union
select false as "isaFunction"
from   (select 1
        from   F p1 join F p2 on (p1.x = p2.x and p1 != p2)) q;


\qecho 'Problem 6a.'

/*
Consider the query “Find the pid and pname of each persons who knows
no-one who works for the Apple company.” 

A possible way to write this
query in Pure SQL is*/

select p.pid, p.pname
from   Person p
where  false = all (select exists (select 1
                                   from   worksFor w
                                   where  p1.pid = w.pid and w.cname = 'Apple') and
                           (p.pid,p1.pid) = some (select k.pid1, k.pid2
                                                  from   Knows k)                                            
                    from   Person p1);
		    
-- Using the Pure SQL to RA SQL translation algorithm, translate this
-- Pure SQL query to an equivalent RA SQL query.  Show the translation
-- steps you used to obtain your solution.


-- Eliminate 'false = all'

select p.pid, p.pname
from   Person p
except
select p.pid, p.pname
from   Person p, Person p1
where  exists (select 1
               from   worksFor w
               where  p1.pid = w.pid and w.cname = 'Apple') and
       (p.pid,p1.pid) = some (select k.pid1, k.pid2
                              from   Knows k);
			      


-- Eliminate 'exists' and '=some'

select p.pid, p.pname
from   Person p
except
select p.pid, p.pname
from   Person p, Person p1, worksFor w, Knows k
where  p1.pid = w.pid and w.cname = 'Apple' and
       p.pid = k.pid1 and p1.pid = k.pid2;

-- Put constant condition with worksFor w

select p.pid, p.pname
from   Person p
except
select p.pid, p.pname
from   Person p, Knows k, Person p1,
       (select w.* from worksFor w where w.cname = 'Apple') w 
where  p1.pid = w.pid and p.pid = k.pid1 and p1.pid = k.pid2;


-- Introduce joins
-- Deal with `p.pid = k.pid1' condition

select p.pid, p.pname
from   Person p
except
select p.pid, p.pname
from   (Person p join Knows k on (p.pid = k.pid1)), Person p1,
       (select w.* from worksFor w where w.cname = 'Apple') w 
where  p1.pid = w.pid and p1.pid = k.pid2;

-- Deal with `p1.pid = k.pid2' condition

select p.pid, p.pname
from   Person p
except
select p.pid, p.pname
from   ((Person p join Knows k on (p.pid = k.pid1)) join Person p1 on (p1.pid = k.pid2)),
       (select w.* from worksFor w where w.cname = 'Apple') w 
where  p1.pid = w.pid;

-- Deal with `p1.pid = w.pid' condition, and we arrive at the RA SQL query

select p.pid, p.pname
from   Person p
except
select p.pid, p.pname
from   (((Person p join Knows k on (p.pid = k.pid1)) join Person p1 on (p1.pid = k.pid2))
       join 
       (select w.* from worksFor w where w.cname = 'Apple') w on (p1.pid = w.pid));




\qecho 'Problem 6b.'

--  Optimization

-- Step 1
--  We do not need cname, salary fields from worksFor
--  Pushing projection over join
	       
select pid, pname
from   Person p
except
select p.pid, p.pname
from   ((Person p join Knows k on (p.pid = k.pid1)) join Person p1 on (p1.pid = k.pid2))
        join (select pid
	      from   worksFor
	      where  cname = 'Apple') w on (p1.pid = w.pid);

--  Step 2
--  We can eliminate Person p1 entirely through pushing projections down

select pid, pname
from   Person p
except
select p.pid, p.pname
from   (Person p join Knows k on (p.pid = k.pid1))
        join (select pid
	      from   worksFor
	      where  cname = 'Apple') w on (k.pid2 = w.pid);

-- Step 3
-- We observe a semi join

select pid, pname
from   Person p
except
select p.pid, pname
from   Person p natural join
       (select pid1 as "pid"
        from   Knows
               join (select pid
                     from   worksFor
                     where  cname = 'Apple') w on (pid2 = pid)) q;



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


-- eliminate 'in'

select distinct c.cname, p.pid
from   Company c, Person p, worksFor w
where  w.cname = c.cname and p.pid = w.pid and
       true = all (select w1.salary <= 60000
                   from   worksFor w1
                   where  p.pid != w1.pid and 
                          w1.cname = c.cname and
                          w.salary <= w1.salary);



-- rewrite `true = all' to `not exists'

select distinct c.cname, p.pid
from   Company c, Person p, worksFor w
where  w.cname = c.cname and p.pid = w.pid and
       not exists (select 1
                   from   worksFor w1
                   where  p.pid != w1.pid and 
                          w1.cname = c.cname and
                          w.salary <= w1.salary and
			  w1.salary > 60000);

-- eliminate `not exists'

select distinct cname, pid
from (select c.*, p.*, w.pid as wpid, w.cname as wcname, w.salary
      from   Company c, Person p, worksFor w
      where  w.cname = c.cname and p.pid = w.pid
      except
      select c.*, p.*, w.*
      from   Company c, Person p, worksFor w, worksfor w1
      where  w.cname = c.cname and p.pid = w.pid and
             p.pid != w1.pid and 
             w1.cname = c.cname and
             w.salary <= w1.salary and
             w1.salary > 60000) q;

-- move `w1.salary > 60000' with worksfor w1

select distinct cname, pid
from (select c.*, p.*, w.pid as wpid, w.cname as wcname, w.salary
      from   Company c, Person p, worksFor w
      where  w.cname = c.cname and p.pid = w.pid
      except
      select c.*, p.*, w.*
      from   Company c, Person p, worksFor w,
             (select w1.* from worksfor w1 where  w1.salary > 60000) w1
      where  w.cname = c.cname and p.pid = w.pid and
             p.pid != w1.pid and 
             w1.cname = c.cname and
             w.salary <= w1.salary) q;

-- introduce joins

select distinct cname, pid
from (select c.*, p.*, w.pid as wpid, w.cname as wcname, w.salary
      from   Person p natural join worksFor w natural join Company c
      except
      select c.*, p.*, w.*
      from   (Person p natural join worksFor w natural join Company c)
             join 
             (select w1.* from worksfor w1 where  w1.salary > 60000) w1
	     on (p.pid != w1.pid and w1.cname = c.cname and w.salary <= w1.salary)) q;

\qecho 'Problem 7b.'

-- We can now begin with the optimization

-- Step 1
-- Due to foreign key constraints, we can eliminate the Person variable
-- and the Company variable; we can also inline the condition `w1.salary';

select cname, pid
from (select w.*
      from   worksFor w
      except
      select w.*
      from   worksFor w
             join worksFor w1
	     on (w.pid != w1.pid and w.cname = w1.cname and w.salary <= w1.salary and w1.salary > 60000)) q;

-- Step 2
-- We can also eliminate the w.salary component in the select clauses
-- Pushing down projection over joins

select cname, pid
from (select w.pid, w.cname
      from   worksFor w
      except
      select w.pid, w.cname
      from   worksFor w
             join worksFor w1
	     on (w.pid != w1.pid and w.cname = w1.cname and w.salary <= w1.salary and w1.salary > 60000)) q;


-- Step 3.  Because of the primary key constraint pid in worksFor 
--  we can push the outermost projection 'select cname, pid' over the `except'
--  We get the optimized RA SQL query


select w.cname, w.pid
from   worksFor w
except
select w.cname, w.pid
from   worksFor w
       join worksFor w1
       on (w.pid != w1.pid and w.cname = w1.cname and w.salary <= w1.salary and w1.salary > 60000);
       


\qecho 'Problem 8a.'

/*Find the pid of each person who has all-but-one job skill

A possible way to write this
query in Pure SQL is*/

select p.pid
from   person p
where  exists (select 1
               from   skill s
               where  not (p.pid, s.skill) in (select ps.pid, ps.skill
                                               from   personSkill ps)) and
       true = all (select s1.skill = s2.skill
                   from   skill s1, skill s2
                   where  (p.pid, s1.skill) not in (select ps.pid, ps.skill 
                                                    from   personSkill ps) and
                          (p.pid, s2.skill) not in (select ps.pid, ps.skill 
                                                    from   personSkill ps));
		    
-- Using the Pure SQL to RA SQL translation algorithm, translate this
-- Pure SQL query to an equivalent RA SQL query.  Show the translation
-- steps you used to obtain your solution.

-- Replace 'true = all' with `not exists'

-- A possible way to write this query in Pure SQL is


select p.pid
from   person p
where  exists (select 1
               from   skill s
               where  (p.pid, s.skill) not in (select ps.pid, ps.skill 
                                               from   personSkill ps)) and
        not exists (select 1
                    from   skill s1, skill s2
                    where  s1.skill <> s2.skill and
                           (p.pid, s1.skill) not in (select ps.pid, ps.skill 
                                                     from   personSkill ps) and
                           (p.pid, s2.skill) not in (select ps.pid, ps.skill 
                                                     from   personSkill ps));
-- Using the Pure SQL to RA SQL translation algorithm, translate this
-- Pure SQL query to an equivalent RA SQL query.  Show the translation
-- steps you used to obtain your solution.


-- Step 1: Replace 'and' by intersection


select q.pid
from
 (select p.*
  from   person p
  where  exists (select 1
                 from   skill s
                 where  (p.pid, s.skill) not in (select ps.pid, ps.skill 
                                                 from   personSkill ps))
  intersect
  select p.*
  from   person p
  where  not exists (select 1
                     from   skill s1, skill s2
                     where  s1.skill <> s2.skill and
                            (p.pid, s1.skill) not in (select ps.pid, ps.skill 
                                                      from   personSkill ps) and
                            (p.pid, s2.skill) not in (select ps.pid, ps.skill 
                                                      from   personSkill ps))) q;

-- Step 2: Translate the 'exists' and 'not exists' set predicates

select q.pid
from (
 (select p.*
  from   person p, skill s
  where  (p.pid, s.skill) not in (select ps.pid, ps.skill 
                                  from   personSkill ps))
  intersect
  (select p.*
   from   person p
   except
   select p.*
   from   person p, skill s1, skill s2
   where  s1.skill <> s2.skill and
          (p.pid, s1.skill) not in (select ps.pid, ps.skill 
                                    from   personSkill ps) and
          (p.pid, s2.skill) not in (select ps.pid, ps.skill 
                                    from   personSkill ps))) q;


-- Step 3: Translate outermost 'not in' predicate

select q.pid
from (
 (select q1.pid, q1.pname, q1.city
  from   (select p.*, s.*
          from   person   p, skill s
          except 
          select p.*, s.*
          from   person p, skill s, personSkill ps
          where  p.pid = ps.pid and s.skill = ps.skill) q1)
  intersect
  (select p.*
   from   person p
   except
   select p.*
   from   person p, skill s1, skill s2
   where  s1.skill <> s2.skill and
          (p.pid, s1.skill) not in (select ps.pid, ps.skill 
                                    from   personSkill ps) and
          (p.pid, s2.skill) not in (select ps.pid, ps.skill 
                                    from   personSkill ps))) q;


-- Step 4: Translate 'and not' and 'and not' into 'except' and 'except'

select q.pid
from (
 (select q1.pid, q1.pname, q1.city
  from   (select p.*, s.*
          from   person   p, skill s
          except 
          select p.*, s.*
          from   person p, skill s, personSkill ps
          where  p.pid = ps.pid and s.skill = ps.skill) q1)
  intersect
  (select p.*
   from   person p
   except
   (select q2.pid, q2.pname, q2.city
    from 
       (select p.*, s1.*, s2.*
        from   person p, skill s1, skill s2
        where  s1.skill <> s2.skill
        except 
        select p.*, s1.*, s2.*
        from   person p, skill s1, skill s2, personSkill ps
        where  p.pid = ps.pid and s1.skill = ps.skill
        except
        select p.*, s1.*, s2.*
        from   person p, skill s1, skill s2, personSkill ps
        where  p.pid = ps.pid and s2.skill = ps.skill) q2))) q;


-- we can now introduce joins


select q.pid
from (
 (select q1.pid, q1.pname, q1.city
  from   (select p.*, s.*
          from   person   p cross join skill s
          except 
          select p.*, s.*
          from   person p
                 join personSkill ps on (p.pid = ps.pid)
                 join skill s on ( s.skill = ps.skill)) q1)
  intersect
  (select p.*
   from   person p
   except
   (select q2.pid, q2.pname, q2.city
    from 
       (select p.*, s1.*, s2.*
        from   person p cross join
               skill s1 join skill s2 on (s1.skill <> s2.skill)
        except 
        select p.*, s1.*, s2.*
        from   skill s2 cross join
               person p
               join   personSkill ps on(p.pid = ps.pid)
               join   skill s1 on (ps.skill = s1.skill)
        where  p.pid = ps.pid and s1.skill = ps.skill
        except
        select p.*, s1.*, s2.*
        from   skill s1 cross join
               person p
               join   personSkill ps on(p.pid = ps.pid)
               join   skill s2 on (ps.skill = s2.skill)) q2))) q;


\qecho 'Problem 8b.'

-- We can now start the optimization
-- Step 1: primary key constraint
-- because pid -> pname and citt and we never use these attributes, 
-- we can eliminate them from the query


with person as (select pid from   person)
select q.pid
from (
 (select q1.pid
  from   (select p.*, s.*
          from   person   p cross join skill s
          except 
          select p.*, s.*
          from   person p
                 join personSkill ps on (p.pid = ps.pid)
                 join skill s on ( s.skill = ps.skill)) q1)
  intersect
  (select p.pid
   from   person p
   except
   (select q2.pid
    from 
       (select p.*, s1.*, s2.*
        from   person p cross join
               skill s1 join skill s2 on (s1.skill <> s2.skill)
        except 
        select p.*, s1.*, s2.*
        from   skill s2 cross join
               person p
               join   personSkill ps on(p.pid = ps.pid)
               join   skill s1 on (ps.skill = s1.skill)
        where  p.pid = ps.pid and s1.skill = ps.skill
        except
        select p.*, s1.*, s2.*
        from   skill s1 cross join
               person p
               join   personSkill ps on(p.pid = ps.pid)
               join   skill s2 on (ps.skill = s2.skill)) q2))) q;


-- Step 2:  successive projections on 'pid'
-- We can also eliminae the outmost project

with person as (select pid from   person)
 select pid
 from   (select pid, skill
         from   person cross join skill
         except 
         select p.pid, s.skill
         from   person p
                natural join personSkill ps 
                natural join skill s) q1
  intersect
  (select pid
   from   person
   except
   (select q2.pid
    from 
       (select pid, s1.skill, s2.skill
        from   person p cross join
               skill s1 join skill s2 on (s1.skill <> s2.skill)
        except 
        select p.pid, s1.skill, s2.skill
        from   skill s2 cross join
               person p
               join  personSkill ps on (p.pid = ps.pid)
               join  skill s1 on (ps.skill = s1.skill)
        except
        select p.pid, s1.skill, s2.skill
        from   skill s1 cross join
               person p
               join   personSkill ps on(p.pid = ps.pid)
               join   skill s2 on (ps.skill = s2.skill)) q2));


-- Step 3:
-- we can now exploit foreign key constraints


with person as (select pid from   person)
 select pid
 from   (select pid, skill
         from   person cross join skill
         except 
         select pid, skill
         from   personSkill) q1
  intersect
  (select pid
   from   person
   except
   (select q2.pid
    from 
       (select pid, s1.skill, s2.skill
        from   person p cross join
               skill s1 join skill s2 on (s1.skill <> s2.skill)
        except 
        select ps.pid, ps.skill, s2.skill
        from   skill s2 cross join
               personSkill ps
        except
        select ps.pid, s1.skill, ps.skill
        from   skill s1 cross join
               personSkill ps) q2));



-- Step 4: Notice that (select pid (...) is subset of (select pid from person))
--  A \cap B = A if A subset of B
-- We can further symplify by exploiting this set equality


with person as (select pid from   person)
 select pid
 from   (select pid, skill
         from   person cross join skill
         except 
         select pid, skill
         from   personSkill) q1
   except
   (select q2.pid
    from 
       (select pid, s1.skill, s2.skill
        from   person p cross join
               skill s1 join skill s2 on (s1.skill <> s2.skill)
        except 
        select ps.pid, ps.skill, s2.skill
        from   skill s2 cross join
               personSkill ps
        except
        select ps.pid, s1.skill, ps.skill
        from   skill s1 cross join
               personSkill ps) q2);

-- Further simplification



with person as (select pid from   person),
     skillPair as (select ps.pid, ps.skill as psSkill, s.skill
                   from   skill s cross join personSkill ps)
 select pid
 from   (select pid, skill
         from   person cross join skill
         except 
         select pid, skill
         from   personSkill) q1
   except
   (select q2.pid
    from 
       (select pid, s1.skill, s2.skill
        from   person p cross join
               skill s1 join skill s2 on (s1.skill <> s2.skill)
        except 
        select pid, psSkill, skill
        from   skillPair
        except
        select pid, skill, psSkill
        from   skillPair) q2);


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


-- We rewrite the `true = all' and `in' subquery expressions

select c.cname
from   Company c
where  c.cname in (select w.cname
                   from   worksfor w
                   where  not exists (select 1
                                      from   companyLocation cl 
                                      where  w.cname = cl.cname and 
                                             cl.city = 'Chicago')) AND
       not exists (select 1
                   from   Person p
                   where  p.pid in (select w.pid
                                     from   worksFor w
                                     where  w.cname = c.cname and
                                            w.salary < 60000 and
                                            p.pid in (select ps.pid
                                                       from   personSkill ps
                                                       where  ps.skill = 'Programming' or
                                                              ps.skill = 'AI')));


-- We eliminate the `AND' into an `intersection'


select c.cname
from   Company c
where  c.cname in (select w.cname
                   from   worksFor w
                   where  not exists (select 1
                                      from   companyLocation cl 
                                      where  w.cname = cl.cname and 
                                             cl.city = 'Chicago'))
intersect
select c.cname
from   Company c
where  not exists (select 1
                   from   Person p
                   where  p.pid in (select w.pid
                                     from   worksFor w
                                     where  w.cname = c.cname and
                                            w.salary < 60000 and
                                            p.pid in (select ps.pid
                                                       from   personSkill ps
                                                       where  ps.skill = 'Programming' or
                                                              ps.skill = 'AI')));



-- We eliminate all the `in' subquery expressions

select c.cname
from   Company c, worksfor w
where  c.cname = w.cname and
       not exists (select 1
                   from   companyLocation cl 
                   where  w.cname = cl.cname and 
                          cl.city = 'Chicago')
intersect
select c.cname
from   Company c
where  not exists (select 1
                   from   Person p, worksFor w, personSkill ps
                   where  p.pid = w.pid and
                          w.cname = c.cname and
                          w.salary < 60000 and
                          p.pid = ps.pid and
                          (ps.skill = 'Programming' or ps.skill = 'AI'));
			  
    

-- We eliminate the `not exists' subquery expressions

select q.cname
from (select c.*, pid, w.cname as wcname, salary
      from   Company c, worksfor w
      where  c.cname = w.cname
      except
      select c.*, w.*
      from   Company c, worksfor w, companyLocation cl
      where  c.cname = w.cname and
             w.cname = cl.cname and 
             cl.city = 'Chicago') q
intersect
(
select cname
from   (select c.*
        from   Company c
        except
        select c.*
        from   Company c, Person p, worksFor w, personSkill ps
        where  p.pid = w.pid and
               w.cname = c.cname and
               w.salary < 60000 and
               p.pid = ps.pid and
               (ps.skill = 'Programming' or ps.skill = 'AI')) q);
	       
       
-- introduce some temporary views

with
companyLocation as (select cl.*
                    from   companyLocation cl
    	            where  cl.city = 'Chicago'),
personSkill as (select ps.*
                from   personSkill ps
		where  (ps.skill = 'Programming' or ps.skill = 'AI'))
select q.cname
from   (select c.*, pid, w.cname as wcname, salary
        from   Company c, worksfor w
        where  c.cname = w.cname
        except
        select c.*, w.*
        from   Company c, worksfor w, companyLocation cl
        where  c.cname = w.cname and
               w.cname = cl.cname) q
intersect
select cname
from   (select c.*
        from   Company c
        except
        select c.*
        from   Company c, Person p, worksFor w, personSkill ps
        where  p.pid = w.pid and
               w.cname = c.cname and
               w.salary < 60000 and
               p.pid = ps.pid) q;


-- Put constant condition `w.salary < 60000) with worksfor
-- and introduce joins

with
companyLocation as (select cl.*
                    from   companyLocation cl
    	            where  cl.city = 'Chicago'),
personSkill as (select ps.*
                from   personSkill ps
		where  (ps.skill = 'Programming' or ps.skill = 'AI'))
select q.cname
from   (select c.*, pid, w.cname as wcname, salary
        from   Company c natural join worksfor w
        except
        select c.*, w.*
        from   (Company c natural join worksfor w)
	       join companyLocation cl on (w.cname = cl.cname)) q
intersect
select cname
from   (select c.*
        from   Company c
        except
        select c.*
        from   Company c natural join
	       ((select w.*
	        from    worksFor w
		where   w.salary < 60000) w natural join (Person p natural join personSkill ps))) q;


\qecho 'Problem 9b.'


-- We can begin the optimization
-- Step 1 We can use the primary key condition for Company since we don't need the headquarter

with
companyLocation as (select cl.*
                    from   companyLocation cl
    	            where  cl.city = 'Chicago'),
personSkill as (select ps.*
                from   personSkill ps
		where  (ps.skill = 'Programming' or ps.skill = 'AI'))
select q.cname
from   (select c.*, pid, w.cname as wcname, salary
        from   Company c natural join worksfor w
        except
        select c.*, w.*
        from   (Company c natural join worksfor w)
	       join companyLocation cl on (w.cname = cl.cname)) q
intersect
(
select cname
from   Company c
except
select c.cname
from   Company c natural join
       ((select w.*
	 from   worksFor w
	 where  w.salary < 60000) w natural join (Person p natural join personSkill ps)));

-- Step 2 We can optimize the temporary views through the projection rule, salary can also be eliminated


with
companyLocation as (select cname
                    from   companyLocation cl
    	            where  cl.city = 'Chicago'),
personSkill as (select pid
                from   personSkill ps
		where  (ps.skill = 'Programming' or ps.skill = 'AI'))
select q.cname
from   (select c.*, pid, w.cname as wcname
        from   Company c natural join worksfor w
        except
        select c.*, pid, w.cname
        from   (Company c natural join worksfor w)
	       join companyLocation cl on (w.cname = cl.cname)) q
intersect
(
select cname
from   Company c
except
select c.cname
from   Company c natural join
       ((select w.pid, w.cname
	 from   worksFor w
	 where  w.salary < 60000) w natural join (Person p natural join personSkill ps)));


-- Step 3 Using foreign key constraints
-- We can eliminate some Company variables and Person variables
-- and obtain the optimized query

with
companyLocation as (select cname
                    from   companyLocation cl
    	            where  cl.city = 'Chicago'),
personSkill as (select pid
                from   personSkill ps
		where  (ps.skill = 'Programming' or ps.skill = 'AI'))
select q.cname
from   (select pid, cname
        from   worksfor w
        except
        select pid, cname
        from   worksfor w
	       natural join companyLocation cl) q
intersect
(select cname
 from   Company c
 except
 select w.cname
 from   (select w.pid, w.cname
         from   worksFor w
         where  w.salary < 60000) w natural join personSkill ps);
	 

\qecho 'Problem 10a'

-- Consider the following Pure SQL query.

select p.pid, exists (select 1
                      from   hasManager hm1, hasManager hm2
                      where  hm1.mid = p.pid and hm2.mid = p.pid and
                             hm1.eid <> hm2.eid)
from   Person p;

-- This query returns a pair (p,t) if p is the pid of a person who
-- manages at least two persons and returns the pair (p,f) other- wise.11

-- Using the insights gained from Problem~\ref{existsInSelect}, translate
-- this Pure SQL query to an equivalent RA SQL query.

-- Step 1: Rewrite the query as follows (observe that there are 2 cases)

select p.pid, true
from   Person p
where  exists (select 1
               from   hasManager hm1, hasManager hm2
               where  hm1.mid = p.pid and hm2.mid = p.pid and
                      hm1.eid <> hm2.eid)
union
select p.pid, false
from   Person p
where  not exists (select 1
                   from   hasManager hm1, hasManager hm2
                   where  hm1.mid = p.pid and hm2.mid = p.pid and
                          hm1.eid <> hm2.eid);


-- Step 2: Move constants 'true' and 'false' to queries in the respective
-- from clauses

select p.pid, c.booleanValue
from   Person p, (select true as booleanValue) c, hasManager hm1, hasManager hm2
where  hm1.mid = p.pid and hm2.mid = p.pid and hm1.eid <> hm2.eid
union
(select p.pid, c.booleanValue
 from   Person p, (select false as booleanValue) c
 except
 select p.pid, c.booleanValue
 from   Person p, (select false as booleanValue) c, hasManager hm1, hasManager hm2
 where  hm1.mid = p.pid and hm2.mid = p.pid and     hm1.eid <> hm2.eid)
 order by 1,2;

-- Step 3: Introduce joins


select p.pid, c.booleanValue
from   (select true as booleanValue) c
        cross join Person p
        join hasManager hm1 on (hm1.mid = p.pid)
        join hasManager hm2 on (hm1.mid = hm2.mid and hm1.eid <> hm2.eid)
union
(select p.pid, c.booleanValue
 from   Person p, (select false as booleanValue) c
 except
 select p.pid, c.booleanValue
 from   (select false as booleanValue) c
         cross join Person p
         join hasManager hm1 on (hm1.mid = p.pid)
         join hasManager hm2 on (hm1.mid = hm2.mid and hm1.eid <> hm2.eid))
 order by 1,2;

\qecho 'Problem 10.b'

-- Step 4:  Optimize by pushing projections over joins and taking into
-- account foreign key constrains.


with person as (select pid   from  person)
select  q.mid, c.booleanValue
from   (select true as booleanValue) c
          cross join
          (select hm1.mid from hasManager hm1 join hasManager hm2 on (hm1.mid = hm2.mid and hm1.eid <> hm2.eid)) q
union
(select p.pid, c.booleanValue
 from   Person p, (select false as booleanValue) c
 except
 select q.mid, c.booleanValue
 from   (select false as booleanValue) c
        cross join
         (select hm1.mid from hasManager hm1 join hasManager hm2 on (hm1.mid = hm2.mid and hm1.eid <> hm2.eid)) q)
order by 1,2;



\qecho 'Problem 11'

/*
Find each pair (c, a, l, u) where ‘c’ is the cname of a company that
pays each of its employees a salary between 50000 and 60000, ‘a′ is
the average salary of the employees who work for company ‘c’, ‘l’ is
the number of employees who earn a salary strictly below this average,
and ‘u’ is the number of employees who earn at least this average.
*/


create or replace function averageSalary(c text)
returns numeric as
$$
select avg(w.salary)
from   worksFor w
where  w.cname = c;
$$ language sql;

select distinct w.cname as "c",
       averageSalary(w.cname) as "a",
       (select count(1)
        from   worksfor w1
	where  w1.cname = w.cname and
	       w1.salary < averageSalary(w.cname)) as "l",
       (select count(1)
        from   worksfor w1
	where  w1.cname = w.cname and
	       w1.salary >= averageSalary(w.cname)) as "u"
from   worksFor w
where  true = all (select w1.salary between 50000 and 60000
                   from   worksFor w1
		   where  w1.cname = w.cname);



		   
\qecho 'Problem 12'

/*
Find each skill that is the skill of at least 3 persons who each know
at least 2 persons who work for Apple and whose salary is at most 50000.
*/

select s.skill
from   Skill s
where  (select count(1)
        from   (select p.pid
                from   Person p
                where  (select count(1)
                        from   (select pid
	                        from   worksFor w
  		                where  w.cname = 'Apple' and w.salary <= 50000) ap
	                where  (p.pid, ap.pid) in (select * from Knows)) >= 2) p
	where  (p.pid, s.skill) in (select * from personSkill)) >= 3;
	

\qecho 'Problem 13'


/*
Find the pid and name of each person p who has at least 3 job skills
in combined set of job skills of the persons who are managed by p.
*/

select p.pid, p.pname
from   Person p
where  (select count(1)
        from   (select ps.skill
                from   personSkill ps
	        where  ps.pid = p.pid
	        intersect
                select ps1.skill 
                from   personSkill ps1
                where  ps1.pid in (select hm.eid
                                   from   hasManager hm
                                   where  p.pid = hm.mid)) s) >= 3;


\qecho 'Problem 14'

/*
Find the cname of each company that employs at least 4 persons and
that pays the highest average salary among such companies.
*/


create or replace function numberOfEmployees(c text)
returns numeric as
  $$ 
     select count(1)
     from   worksFor w
     where  w.cname = c;
  $$ language sql;

select c.cname
from   company c
where  numberOfEmployees(c.cname) >= 4 and
       averageSalary(c.cname) = (select max(averageSalary(c.cname))
                                 from   company c
                                 where  numberOfEmployees(c.cname) >= 4);
				 


\qecho 'Problem 15'

/*
Without using subquery expressions, find each pid of a person who
knows each person who earns the highest salary at company Amazon.
*/

create or replace function highestEarner(c text)
returns table (pid integer) as
$$
   select w.pid
   from   worksFor w
   where  w.cname = c
          and w.salary = (select max(w1.salary)
	                  from   worksFor w1
			  where  w1.cname = c);
$$ language sql;

select p.pid
from   Person p
where  (select count(1)
        from   (select p1.pid
	        from   highestEarner('Amazon') p1
                except
                select k.pid2
                from   Knows k
	        where  k.pid1 = p.pid) q) = 0;


\qecho 'Problem 16'

/*
Without using subquery expressions, find each pairs (p1,p2) of pids of
different persons such that if s is a job skill of p1 then s is not a
job skill of person p2.
*/


select distinct p1.pid, p2.pid
from   Person p1, Person p2
where  p1.pid != p2.pid and
       (select count(1)
        from   (select ps1.skill
                from   personSkill ps1
	        where  ps1.pid = p1.pid
	        intersect
	        select ps2.skill
                from   personSkill ps2
	        where  ps2.pid = p2.pid) q) = 0;


			   






		   

\qecho 'Problem 17'

/* Find each pairs (p1,p2) of different pids of persons p1 and p2
and such that (1) the number of skills of person s1 is strictly less
than the number of skills of person s2 and (2) such that the gap
between these numbers is the largest among all such possible gaps.
 */


create or replace function gap (p1 integer, p2 integer)
returns numeric as
$$
select (select count(1)
        from   skillOfPerson(p1)) -
       (select count(1)
        from   skillOfPerson(p2))
$$ language sql;

select p1.pid as "p1", p2.pid as "p2"
from   Person p1, Person p2
where  gap(p2.pid,p1.pid) = (select max(gap(p2.pid,p1.pid))
                             from   Person p1, Person p2);



\qecho 'Problem 18'

/*
Consider three types of salaries:
  'low' is a salary below 50000
  'medium' is a salary between 50001 and 60000
  'high' is a salary above 60001

Write a SQL query that returns each triple (c, t, n) where c is the
name of a company, t is a salary type (i.e., one of ‘low’, ‘medium’,
or ‘high’, and n is the number of employees who work for company c 
and who have a salary of type t.  (You can think of this problem as
that of creating a histogram.)

*/




with
 salaryType (type) as
  (values ('low'),('medium'),('high')),


 mapSalaryType as
 (select w.cname, w.pid, w.salary,
        (case  when w.salary between 0 and 50000 then 'low'
               when w.salary between 50001 and 60000 then 'medium'
               else 'high'
         end) as type
  from   worksfor w)


select c.cname, t.type, (select count(1)
                         from   mapSalaryType m
			 where  m.cname = c.cname and
			        m.type = t.type) as "ctEmployees"
from   Company c, salaryType t
order by 1,2;

/*
Alternatively,

with
 salaryType (salarytype) as
  (select 'low' 
   union
   select 'medium'
   union
   select 'high'),

Histogram as
(select w.cname, case  when w.salary between 0 and 50000 then 'low'
                       when w.salary between 50001 and 60000 then 'medium'
                       else 'high'
		 end as salaryType,
       count(1) as ctEmployees
 from   worksFor w
 group by (w.cname, case  when w.salary between 0 and 50000 then 'low'
                          when w.salary between 50001 and 60000 then 'medium'
 	                  else 'high'
	  end) )
select h.cname, h.salaryType, h.ctEmployees
from   Histogram h
union
select c.cname, t.salaryType, 0
from   Company c, salaryType t
where  (c.cname, t.salaryType) not in (select cname, salaryType
                                       from   Histogram) order by 1,2;
*/





-- Alternatively

/*
with
 salaryType (salarytype) as
  (select 'low' 
   union
   select 'medium'
   union
   select 'high'),

 Histogram as
 (select cname, salarytype, count(pid) as ctEmployees
  from   (select w.cname, w.pid, (case  when w.salary between 0 and 50000 then 'low'
                                        when w.salary between 50001 and 60000 then 'medium'
                                        else 'high'
  		                  end) as salarytype
         from   worksfor w) t
  group by (cname, salarytype))
select h.*
from   histogram h
union
select c.cname, t.salaryType, 0
from   Company c, salaryType t
where  (c.cname, t.salaryType) not in (select cname, salaryType
                                       from   histogram) order by 1,2;
*/







-- Connect to default database
-- \c postgres

-- Drop database created for this assignment
-- DROP DATABASE dvgassignment3;





