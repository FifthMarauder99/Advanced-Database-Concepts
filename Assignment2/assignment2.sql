-- Script for Assignment 2

-- Creating database with full name

CREATE DATABASE dvgfall2022assignment2;


-- Connecting to database 
\c dvgfall2022assignment2

-- Relation schemas and instances for assignment 2


CREATE TABLE Student(sid integer,
                     sname text,
                     birthYear integer,
                     primary key (sid));

CREATE TABLE Book(bno integer,
                  title text,
                  price integer,
                  primary key (bno));

CREATE TABLE Major(major text,
                   primary key (major));


CREATE TABLE Buys(sid integer,
                  bno integer,
                  primary key (sid,bno),
                  foreign key (sid) references Student(sid),
                  foreign key (bno) references Book(bno));


CREATE TABLE hasMajor(sid integer,
                      major text,
                      primary key (sid, major),
                      foreign key (sid) references Student (sid),
                      foreign key (major) references Major (major));


CREATE TABLE Cites(bno1 integer,
                   bno2 integer,
                   primary key (bno1,bno2),
                   foreign key (bno1) references Book(bno),
                   foreign key (bno2) references Book(bno));



INSERT INTO Student VALUES
 (1001,'Jean',1999),
 (1002,'Vidya',1999),
 (1003,'Anna',2001),
 (1004,'Qin',2001),
 (1005,'Megan',1999),
 (1006,'Ryan',1995),
 (1007,'Danielle',1997),
 (1008,'Emma',2000),
 (1009,'Hasan',2000),
 (1010,'Linda',1995),
 (1011,'Nick',1999),
 (1012,'Eric',1999),
 (1013,'Lisa',1998),
 (1014,'Deepa',2000),
 (1015,'Chris',1998),
 (1016,'YinYue',1995),
 (1017,'Latha',1997),
 (1018,'Arif',2000),
 (1019,'John',2003),
 (1020,'Margaret',1997);


INSERT INTO Book VALUES
 (2001,'Databases',20),
 (2002,'AI',20),
 (2003,'DataScience',25),
 (2004,'Databases',25),
 (2005,'Programming',30),
 (2006,'Complexity',30),
 (2007,'AI',20),
 (2008,'Algorithms',40),
 (2009,'Networks',40),
 (2010,'AI',30),
 (2011,'Logic',25),
 (2012,'Physics',45),
 (2013,'Physics',30);



INSERT INTO Buys VALUES
 (1003,2001),
 (1010,2007),
 (1011,2010),
 (1014,2007),
 (1010,2005),
 (1011,2003),
 (1008,2006),
 (1009,2003),
 (1006,2003),
 (1007,2008),
 (1017,2004),
 (1017,2003),
 (1004,2001),
 (1007,2006),
 (1005,2007),
 (1005,2011),
 (1013,2004),
 (1002,2009),
 (1009,2011),
 (1018,2011),
 (1015,2004),
 (1001,2011),
 (1013,2006),
 (1015,2002),
 (1005,2002),
 (1008,2009),
 (1014,2009),
 (1002,2002),
 (1001,2002),
 (1009,2001),
 (1006,2006),
 (1015,2007),
 (1019,2008),
 (1006,2002),
 (1018,2008),
 (1003,2004),
 (1006,2011),
 (1013,2005),
 (1003,2010),
 (1008,2008),
 (1007,2009),
 (1016,2008),
 (1011,2002),
 (1004,2005),
 (1004,2009),
 (1006,2010),
 (1001,2010),
 (1001,2006),
 (1009,2010),
 (1019,2002),
 (1004,2010),
 (1018,2010),
 (1009,2006),
 (1008,2003),
 (1018,2005),
 (1004,2002),
 (1011,2004),
 (1007,2002),
 (1015,2005),
 (1012,2001),
 (1017,2010),
 (1002,2001),
 (1016,2010),
 (1010,2003),
 (1003,2008),
 (1017,2005),
 (1016,2006),
 (1011,2007),
 (1006,2009),
 (1001,2005),
 (1007,2005),
 (1005,2004),
 (1013,2008),
 (1005,2008),
 (1004,2011),
 (1009,2009),
 (1013,2001),
 (1015,2006),
 (1003,2002),
 (1016,2001),
 (1006,2007),
 (1016,2011),
 (1006,2008),
 (1007,2003),
 (1015,2003),
 (1011,2011),
 (1010,2006),
 (1012,2009),
 (1001,2001),
 (1011,2001),
 (1013,2002),
 (1012,2007),
 (1002,2010),
 (1012,2010),
 (1001,2007),
 (1005,2003),
 (1011,2005),
 (1014,2011),
 (1011,2006),
 (1009,2002),
 (1008,2001),
 (1002,2003),
 (1002,2005),
 (1009,2008),
 (1008,2002),
 (1006,2001),
 (1008,2007),
 (1012,2002),
 (1017,2008),
 (1019,2009),
 (1010,2010),
 (1003,2011),
 (1017,2006),
 (1013,2011),
 (1006,2004),
 (1016,2004),
 (1019,2001),
 (1002,2006),
 (1018,2006),
 (1010,2009),
 (1010,2008),
 (1003,2007),
 (1009,2007),
 (1002,2007),
 (1018,2009),
 (1004,2004),
 (1018,2001),
 (1007,2001),
 (1004,2003),
 (1010,2001),
 (1008,2010),
 (1008,2005),
 (1015,2001),
 (1012,2003),
 (1005,2006),
 (1007,2010),
 (1010,2004),
 (1015,2010),
 (1017,2002),
 (1013,2003),
 (1001,2008),
 (1016,2002),
 (1005,2005),
 (1016,2009),
 (1012,2004),
 (1009,2004),
 (1020,2012),
 (1020,2013);



INSERT INTO Major VALUES
   ('CS'),
   ('DataScience'),
   ('Math'),
   ('Physics'),
   ('Chemistry'),
   ('English');

INSERT INTO hasMajor VALUES
 (1001,'CS'),
 (1001,'DataScience'),
 (1002,'CS'),
 (1002,'DataScience'),
 (1004,'DataScience'),
 (1004,'CS'),
 (1005,'DataScience'),
 (1005,'CS'),
 (1005,'Math'),
 (1006,'CS'),
 (1006,'Physics'),
 (1007,'Physics'),
 (1007,'CS'),
 (1009,'Physics'),
 (1009,'Math'),
 (1010,'Math'),
 (1011,'Math'),
 (1011,'Physics'),
 (1011,'DataScience'),
 (1011,'CS'),
 (1012,'DataScience'),
 (1012,'Physics'),
 (1012,'CS'),
 (1013,'CS'),
 (1013,'Physics'),
 (1013,'Math'),
 (1014,'Physics'),
 (1014,'DataScience'),
 (1014,'Math'),
 (1015,'CS'),
 (1015,'DataScience'),
 (1016,'Physics'),
 (1016,'DataScience'),
 (1017,'Math'),
 (1017,'CS'),
 (1018,'DataScience'),
 (1019,'Math'),
 (1020,'Chemistry');


INSERT INTO Cites VALUES
 (2004,2003),
 (2006,2003),
 (2009,2003),
 (2009,2004),
 (2009,2006),
 (2008,2007),
 (2010,2008),
 (2010,2007),
 (2010,2003),
 (2002,2001),
 (2009,2001),
 (2011,2003),
 (2011,2005),
 (2001,2004),
 (2012,2013);

create table PC(parent integer,
                child integer);

insert into PC values
 (1,2),
 (1,3),
 (1,4),
 (2,5),
 (2,6),
 (3,7),
 (5,8),
 (8,9),
 (8,10),
 (8,11),
 (7,12),
 (7,13),
 (12,14),
 (14,15);

\qecho 'Problem 3'

-- Find the bno and title of each book that is bought by a student who
-- is (strictly) younger than each student who majors in Chemistry and
-- who also bought that book.

-- select bno, title from book b, (
--    select s1.sid from student s1 where true=all(
--       select s1.birthYear > s2.birthYear from student s2, hasMajor h where h.major='Chemistry' and (s2.sid, b.no) in (select * from buys)
--    )
-- ) s1 where (s.sid, b.bno) in (select * from buys)


\qecho 'Problem 3.c'

-- Express this query in Pure SQL by only using the ‘true = some’ or
-- ‘true = all’ subquery expressions. You can not use the set operations
-- INTERSECT, UNION, and EXCEPT.


		    
\qecho 'Problem 3.d'

-- Express this query in Pure SQL by only using the ‘exists’ or ‘not
-- exists’ subquery expressions. You can not use the set operations
-- INTERSECT, UNION, and EXCEPT.



\qecho 'Problem 3.e'

-- Express this query in Pure SQL by only using the `in' or `not in' subquery
-- expressions. You can not use the set operations INTERSECT, UNION, and
-- EXCEPT.


\qecho 'Problem 3.f'

-- Express this query in Pure SQL without using subquery expressions. Now
-- you can use the set operations INTERSECT, UNION, and EXCEPT.


\qecho 'Problem 4'

-- Find each student-book pair (s, b) where s is the sid of a student who
-- majors in CS and who bought each book that costs no more than
-- book b.

-- select s.sid, b.bno, b.price from student s, book b where (s.sid, 'CS') in (select * from hasMajor) and true = all(
--    select b1.price < b.price from book b1 where (s.sid, b1.bno) in (select * from buys)
-- );

-- select s.sid, b.bno from student s, book b where (s.sid, 'CS') in (select * from hasMajor) and true = all(
--    select (s.sid, b1.bno) in (select * from buys) from book b1 where b1.price <= b.price
-- );

-- select s.sid, b.bno from student s, book b, hasMajor h where s.sid=h.sid and h.major='CS' and true = all(
--    select b1.price <= b.price from book b1, buys bu where bu.sid=s.sid and bu.bno=b1.bno
-- );
-- select b1.price <= b.price from book b1, buys bu where bu.sid=s.sid and bu.bno=b1.bno


\qecho 'Problem 4.b'

-- Express this query in Pure SQL by only using the ‘true = some’ or
-- ‘true = all’ subquery expressions. You can not use the set operations
-- INTERSECT, UNION, and EXCEPT.



\qecho 'Problem 4.c'

-- Express this query in Pure SQL by only using the ‘exists’ or ‘not
-- exists’ subquery expressions. You can not use the set operations
-- INTERSECT, UNION, and EXCEPT.



\qecho 'Problem 4.d'

-- Express this query in Pure SQL by only using the `in' or `not in' subquery
-- expressions. You can not use the set operations INTERSECT, UNION, and
-- EXCEPT.



\qecho 'Problem 4.e'

-- Express this query in Pure SQL without using subquery expressions. Now
-- you can use the set operations INTERSECT, UNION, and EXCEPT.



\qecho 'Problem 5'

-- Find the sid and name of each student who bought all-but-one book that
-- cost strictly more than $30.

select s.sid, s.sname from student s
EXCEPT
select s.sid, s.sname from student s where true=all(select t.sid=s.sid and t.bno=b.bno from book b, buys t where b.price > 30)
EXCEPT
select s.sid, s.sname from student s where s.sid in (select t1.sid from buys t1 join buys t2 on (t1.sid = t2.sid and t1.bno <> t2.bno))

-- No book
select s.sid, s.sname from student s where true=all(select t.sid=s.sid and t.bno<>b.bno from book b, buys t where b.price > 30)

-- student who bought atleast two book
SELECT distinct t.sid from buys t, book b where t.bno=b.bno and b.price > 30
EXCEPT
select distinct t1.sid from buys t1, buys t2, book b where t1.bno<>t2.bno and t1.sid=t2.sid and b.price > 30 and (b.bno=t1.bno or b.bno=t2.bno);

select sid from  buys
except
select t1.sid from  buys t1 join buys t2 on
                         (t1.sid = t2.sid and t1.bookno <> t2.bookno);

SELECT s.sid, s.sname FROM student s WHERE TRUE = SOME(
   SELECT TRUE = ALL (
      SELECT  b1.bno != t1.bno FROM buys t1 WHERE  t1.sid = s.sid
   ) AND TRUE = ALL(
      SELECT  TRUE = SOME (
         SELECT b2.bno = t2.bno FROM buys t2 WHERE t2.sid = s.sid
      ) FROM book b2 WHERE b2.bno != b1.bno AND b2.price > 30
   ) FROM book b1 WHERE b1.price >30 
);



\qecho 'Problem 5.b'

-- Express this query in Pure SQL by only using the ‘true = some’ or
-- ‘true = all’ subquery expressions. You can not use the set operations
-- INTERSECT, UNION, and EXCEPT.



\qecho 'Problem 5.c'

-- Express this query in Pure SQL by only using the ‘exists’ or ‘not
-- exists’ subquery expressions. You can not use the set operations
-- INTERSECT, UNION, and EXCEPT.




\qecho 'Problem 5.d'

-- Express this query in Pure SQL by only using the `in' or `not in' subquery
-- expressions. You can not use the set operations INTERSECT, UNION, and
-- EXCEPT.

					 


\qecho 'Problem 5.e'

-- Express this query in Pure SQL without using subquery expressions. Now
-- you can use the set operations INTERSECT, UNION, and EXCEPT.




\qecho 'Problem 10.b'

-- Find the bno and title of each book that was bought by exactly one
-- student.

-- Express this query in RA SQL.

-- Find books bought by atleast two students
-- select distinct bno, title from book b natural join (
--    select  t1.bno as bno from buys t1 join buys t2 on (t1.bno = t2.bno and t1.sid <> t2.sid)
-- ) q;

-- Find the bno and title of each book that was bought by exactly one
-- student.
select bno, title from book
EXCEPT
select distinct bno, title from book b natural join (
   select  t1.bno as bno from buys t1 join buys t2 on (t1.bno = t2.bno and t1.sid <> t2.sid)
) q;


\qecho 'Problem 11.b'

-- Find each pair (m, b) where m is a major and b is the bno of a book
-- bought by a student who has major m and such that the price of b is
-- the lowest among the set of books bought by students with major m

-- Express this query in RA SQL.

-- select distinct h.major, t.bno from hasMajor h join buys t on t.sid = h.sid join book b on t.bno = b.bno and true=all(
--    select b.price <= b1.price from hasMajor h1 join buys t1 on t1.sid = h1.sid and h1.major = h.major join book b1 on t1.bno = b1.bno
-- );

select * from (
   select distinct h.major, t.bno from hasMajor h join buys t on t.sid = h.sid join book b on t.bno = b.bno
   EXCEPT
   select distinct h.major, t.bno from hasMajor h join buys t on t.sid = h.sid join book b on t.bno = b.bno join hasMajor h1 on h.major=h1.major join buys t1 on t1.sid = h1.sid join book b1 on t1.bno = b1.bno and b.price > b1.price
) q order by major;



\qecho 'Problem 12.b'

-- Find the bno and title of each book that is bought by a student who is
-- (strictly) younger than each student who majors in Chemistry and who
-- also bought that book.

-- Express this query in RA SQL.


\qecho 'Problem 13.b'

-- Find each student-book pair (s, b) where s is the sid of a student who
-- majors in CS and who bought each book that costs no more than
-- book b.


-- Express this query in RA SQL.


\qecho 'Problem 14.b'

-- Find the sid and name of each student who bought all-but-one book that
-- cost strictly more than $30.

-- Problem 19

select b1.bno from book b1, book b2, book b3 where b1.bno<>b2.bno and 
(b1.bno, b3.bno) in (select * from cites) and 
(b2.bno, b3.bno) in (select * from cites) and true = all(
  select (b2.bno, b4.bno) in (select * from cites) from book b4 where b3.bno<>b4.bno and (b1.bno, b4.bno) in (select * from cites)
) and true=all(
  select (b1.bno, b4.bno) in (select * from cites) from book b4 where b3.bno<>b4.bno and (b2.bno, b4.bno) in (select * from cites)
);


\qecho 'Problem 27'

/*
 Define a parameterized view
 ‘PurchasedBookLessPrice(sid int, price integer)’
 that returns, for a given student identi- fied by ‘sid’ and
a given ‘price’ value, the subrelation of ‘Book’ of books that are
bought by that student and that cost strictly less than ‘price’.

Test your view for the parameter values (1001,15), (1001,20),
(1001,50), and (1002,30).
*/

-- DROP FUNCTION PurchasedBookLessPrice;

CREATE FUNCTION PurchasedBookLessPrice(bookid Integer, bookprice Integer)
RETURNS TABLE(bno Integer, title TEXT, price Integer) AS
   $$
   select bno, title, price from book b
   WHERE (bookid, b.bno) in (select * from buys t) and b.price < bookprice
   $$  LANGUAGE  SQL;

select distinct C.bno, C.title, C.price from PurchasedBookLessPrice(1001,15) C;
select distinct C.bno, C.title, C.price from PurchasedBookLessPrice(1001,30) C;
select distinct C.bno, C.title, C.price from PurchasedBookLessPrice(1001,50) C;
select distinct C.bno, C.title, C.price from PurchasedBookLessPrice(1002,30) C;


\qecho 'Problem 28'

/*
Define a parameterized view ‘CitedBookbyMajor(major text)’ that
returns for a major ‘major’ the subrelation of ‘Book’ of books that
are cited by a book bought by a the student who majors in ‘major’.

Test your view for each major.
*/

CREATE OR REPLACE FUNCTION CitedBookbyMajor(pmajor Text)
RETURNS TABLE(bno Integer, title TEXT, price Integer) AS
   $$
   select bno, title, price from book where bno in (
      select c.bno2 from cites c where c.bno1 in (
         select distinct b.bno from student s, book b where (s.sid, pmajor) in (select * from hasMajor) and (s.sid, b.bno) in (select * from buys)
      )
   );
   $$  LANGUAGE  SQL;

select * from CitedBookbyMajor('CS') order by bno;
select * from CitedBookbyMajor('Chemistry') order by bno;
select * from CitedBookbyMajor('DataScience') order by bno;
select * from CitedBookbyMajor('English') order by bno;
select * from CitedBookbyMajor('Math') order by bno;
select * from CitedBookbyMajor('Physics') order by bno;

\qecho 'Problem 29'

/*
Define a parameterized view
‘JointlyBoughtBook(sid1 integer, sid2 integer)’
that returns the subrelation of ‘Book’ of books that are
bought by both the students with sids ‘sid1’ and ‘sid2’, respectively.

Test your view for the parameters (1001, 1002), (1001,1003), and
(1002,1003).
*/

CREATE OR REPLACE FUNCTION JointlyBoughtBook(sid1 Integer, sid2 Integer)
RETURNS TABLE(bno Integer, title TEXT, price Integer) AS
   $$
   SELECT b.bno, b.title, b.price
   FROM book b
   Where (sid1, b.bno) in (select * from buys) and (sid2, b.bno) in (select * from buys)
   $$   LANGUAGE  SQL;

select * from JointlyBoughtBook(1001, 1002);
select * from JointlyBoughtBook(1001, 1003);
select * from JointlyBoughtBook(1002, 1003);


\qecho 'Problem 30'

/*
Let PC(parent : integer,child : integer) be a rooted parent- child
tree. So a pair (n, m) in ‘PC’ indicates that node n is a parent of
node m. The ‘sameGeneration(n1, n2)’ binary relation is inductively
defined using the following two rules:

(1) If n is a node in PC, then the pair (n, n) is in the
sameGeneration relation. (Base rule)

(2) If n1 is the parent of m1 in PC and n2 is the parent of m2 in PC
and (n1,n2) is a pair in the sameGeneration relation then (m1, m2) is
a pair in the sameGeneration relation. (Inductive Rule)

Write a recursive view for the sameGeneration relation. Test your
view.
*/

with recursive sameGeneration(parent, child) as (
  select parent, parent from PC UNION select child, child from PC
  UNION
  select a.child, b.child from PC a, PC b, sameGeneration g where a.parent = g.parent and b.parent = g.child
)

select * from sameGeneration order by parent,child;

-- Connect to default database
-- \c postgres

--
-- Drop database created for this assignment
-- DROP DATABASE dvgfall2022assignment2;




