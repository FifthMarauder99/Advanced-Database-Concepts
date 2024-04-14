-- Creating database with full name
CREATE DATABASE durga_sai_sailesh_chodabattula;
-- Connecting to database
\c durga_sai_sailesh_chodabattula;
-- Creating required tables
create table Person(pid Integer , pname text, city text , primary key(pid) );
create table Company(cname text,headquarter text, primary key(cname) );
create table Skill(skill text,primary key(skill));
CREATE TABLE worksFor (pid Integer,cname text,salary Integer,
PRIMARY KEY(pid),
CONSTRAINT pid_mapping
FOREIGN KEY(pid)
REFERENCES Person(pid),
CONSTRAINT cname_mapping
FOREIGN KEY(cname)
REFERENCES Company(cname));
CREATE TABLE companyLocation (cname text,city text,
PRIMARY KEY(cname,city),
CONSTRAINT cname_mapping
FOREIGN KEY(cname)
REFERENCES Company(cname));
CREATE TABLE personSkill (pid Integer,skill text,
PRIMARY KEY(pid,skill),
CONSTRAINT pid_mapping
FOREIGN KEY(pid)
REFERENCES Person(pid),
CONSTRAINT skill_mapping
FOREIGN KEY(skill)
REFERENCES Skill(skill));
CREATE TABLE hasManager (eid Integer,mid Integer,
PRIMARY KEY(eid,mid),
CONSTRAINT eid_mapping
FOREIGN KEY(eid)
REFERENCES Person(pid),
CONSTRAINT mid_mapping
FOREIGN KEY(mid)
REFERENCES Person(pid));
\qecho 'Problem 1'
-- Provide 4 conceptually different examples that illustrate how the
-- presence or absence of primary and foreign keys affect insert and
-- deletes in these relations. To solve this problem, you will need to
-- experiment with the relation schemas and instances for this
-- assignment. For example, you should consider altering primary keys
-- and foreign key constraints and then consider various sequences of
-- insert and delete operations. You may need to change some of the
-- relation instances to observe the desired effects. Certain inserts
-- and deletes should succeed but other should generate error
-- conditions. (Consider the lecture notes about keys, foreign keys,
-- and inserts and deletes as a guide to solve this problem.)
create table Person1(pid Integer , pname text, city text , primary key(pid) );
CREATE TABLE worksFor1 (pid Integer,cname text,salary Integer,
PRIMARY KEY(pid),
CONSTRAINT pid_mapping
FOREIGN KEY(pid)
REFERENCES person1(pid));
\qecho 'Problem 1 conceptual example 1'
--Primary key Missing error
insert into person1 values (null,'X','Y');
\qecho 'Problem 1 conceptual example 2'
insert into person1 values (1,'X','Y');
insert into worksFor1 values (1,'X',1);
--Foriegn key dependency table error
delete from person1 where pid='1';
\qecho 'Problem 1 conceptual example 3'
-- Foriegn Key Missing Error
insert into worksFor1 values (null,'x', 1);
\qecho 'Problem 1 conceptual example 4'
-- Deletes the row as there no primary key
delete from worksFor1 where pid='1';
\qecho 'dropping table that were created for illustrating the concepts'
drop table worksFor1;
drop table person1;
-- Before starting with the rest of the assignment, make sure to
-- use the originally given data set in data.sql
-- Data for B561 Fall 2021 Assignment 1
-- Loading The data
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
('ACM', 'NewYork');
INSERT INTO worksFor VALUES
(1001,'Apple', 65000),
(1002,'Apple', 45000),
(1003,'Amazon', 55000),
(1004,'Amazon', 55000),
(1005,'Google', 60000),
(1006,'Amazon', 55000),
(1007,'Netflix', 50000),
(1008,'Amazon', 50000),
(1009,'Apple',60000),
(1010,'Amazon', 55000),
(1011,'Google', 70000),
(1012,'Apple', 50000),
(1013,'Netflix', 55000),
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
('IBM', 'NewYork');
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
(1013,'AI'),
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
(1014, 1012);

\qecho 'Problem 2'
-- Find the pid, pname of each person who (a) lives in Bloomington, (b)
-- works for a company where he or she earn a salary that is higher than
-- 30000, and (c) has at least one manager.
SELECT p.pid, p.pname FROM Person p, worksFor wf, hasManager hm
WHERE p.pid=wf.pid and wf.salary>30000 and hm.eid=p.pid and
p.city='Bloomington';

\qecho 'Problem 3'
-- Find the pairs $(c_1, c_2)$ of different company names who
-- headquarters are located in the same city.
select c.cname as c_1,c1.cname as c_2 from Company c , Company c1
where c.headquarter=c1.headquarter and c.cname!=c1.cname order by c_1;

\qecho 'Problem 4'
-- Find the pid and pname of each person who lives in a city that is
-- different than each city in which his or her managers live.
-- (Persons who have no manager should not be included in the answer.)
select p.pid,p.pname from Person p,hasManager hm1 where p.pid=hm1.eid and p.city
not in
(select p1.city from Person p1,hasManager hm2 where hm2.eid=p.pid and
hm2.mid=p1.pid);

\qecho 'Problem 5'
-- Find each skill that is the skill of at most 2 persons.
select s1.skill from Skill s1
where not exists (select * from personSkill ps1 where s1.skill= ps1.skill);

\qecho 'Problem 6'
-- Find the pid, pname, and salary of each employee who has at least two
-- managers such that these managers have a common job skill but provided
-- that it is not the `Networks' skill.
select distinct p.pid,p.pname,wf.salary
from Person p,
personSkill ps1,
personSkill ps2,
hasManager hm1,
hasManager hm2,
worksFor wf
where ps1.pid = hm1.mid
and ps2.pid = hm2.mid
and hm1.eid = hm2.eid
and hm1.mid != hm2.mid
and ps1.skill = ps2.skill
and p.pid = hm1.eid
and p.pid = wf.pid
and ps1.skill != 'Networks'
and ps2.skill != 'Networks';

\qecho 'Problem 7'
-- Find the cname of each company that not only employs persons
-- who live in MountainView.
select distinct wf.cname from worksFor wf, Person p
where wf.pid=p.pid and p.city != 'MountainView' order by wf.cname ASC;

\qecho 'Problem 8'
-- For each company, list its name along with the highest salary made by
-- employees who work for it.
select wf.cname,wf.salary from worksFor wf where not exists (
select * from worksFor wf1
where wf1.cname =wf.cname
and wf1.pid != wf.pid
and wf1.salary > wf.salary) order by wf.cname;

\qecho 'Problem 9'
-- Find the pid and pname of each employee who has a salary that is
-- higher than the salary of each of his or her managers. (Employees who
-- have no manager should not be included.)
select distinct p.pid,p.pname from person p, worksfor wf, hasmanager hm
where hm.eid=wf.pid and
p.pid =hm.eid
and not exists ( select * from worksfor wf1, hasmanager hm1
where wf1.pid!=wf.pid
and hm.eid=wf.pid
and wf1.pid= hm.mid
and wf.salary <= wf1.salary)
order by p.pid;

\qecho 'Problem 10'
select p.pid, p.pname, wf.cname, wf.salary from Person p ,worksFor wf
where p.pid = wf.pid and p.city = 'Bloomington' and 40000 <= wf.salary
and wf.cname != 'Apple' order by p.pid, p.pname, wf.cname, wf.salary;

\qecho 'Problem 11'
select p.pid,p.pname from Person p
where
exists
(select * from Company c , worksFor wf where c.cname=wf.cname and
p.pid=wf.pid
and c.headquarter= 'LosGatos') and
exists (select * from hasManager hm where hm.eid = p.pid
and exists (select * from Person p1 where hm.mid = p1.pid
and p1.city !='LosGatos'));

\qecho 'Problem 12'
select s.skill from Skill s where not exists
(select * from Person p , personSkill ps where p.pid=ps.pid
and ps.skill=s.skill and p.city='Bloomington');

\qecho 'Problem 13'
select p.pid,p.pname from Person p where
not exists( select * from hasManager hm where hm.mid = p.pid
and not exists
(select * from Person p1 where hm.eid = p1.pid and
p1.city=p.city));


\qecho 'Problem 18'
-- Each person works for a company and has at least two job skills.
select not exists (
select * from worksFor wf
where exists (select * from personskill ps1 , personskill ps2
where ps1.pid = wf.pid and ps2.pid= wf.pid and ps1.skill !=
ps2.skill)) as constraintSatisfied;

\qecho 'Problem 19'
-- Some person has a salary that is strictly higher than the salary of
-- each of his or her managers.
select exists ( select * from worksFor wf where exists (select * from worksFor
wf1 ,hasManager hm where hm.mid=wf.pid and hm.eid = wf1.pid
and wf.pid != wf1.pid
and wf1.salary <= wf.salary)) as constraintSatisfied;

\qecho 'Problem 20'
-- Each employee and his or her managers work for the same company.
SELECT NOT EXISTS (SELECT * FROM Person P WHERE EXISTS
(SELECT * FROM hasManager hm,worksFor wf1,worksFor wf2
WHERE hm.eid = p.pid and hm.eid = wf1.pid and hm.eid = wf2.pid and wf1.cname
!= wf2.cname)) as constraintSatisfied;
-- Connect to default database
\c postgres;
-- Drop database created for this assignment
DROP DATABASE durga_sai_sailesh_chodabattula;