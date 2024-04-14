-- Script and solutions for Assignment 2

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


\qecho 'Problem 3.c'

-- Express this query in Pure SQL by only using the ‘true = some’ or
-- ‘true = all’ subquery expressions. You can not use the set operations
-- INTERSECT, UNION, and EXCEPT.


with chemistryStudent as (select s.sid, s.birthyear
                          from   Student s, hasMajor hm
			  where  s.sid = hm.sid and hm.major = 'Chemistry')
select distinct b.bno, b.title
from   Book b, Student s, Buys t
where  t.sid = s.sid and t.bno = b.bno and
       true = all (select s1.birthyear < s.birthyear
                   from   ChemistryStudent s1, Buys t1
   	           where  t1.sid = s1.sid and t1.bno = b.bno)
order by 1;

/* ALternatively,

select b.bno, b.title
from   Book b
where  true = some( select t.sid = s.sid and t.bno = b.bno and
                           true = all (select s1.birthyear < s.birthyear
			               from   Student s1, hasMajor hm, Buys t
				       where  hm.sid = s1.sid and
				              hm.major = 'Chemistry' and
					      t.sid = s1.sid and t.bno = b.bno)
                    from   Student s, Buys t);
*/


		    
\qecho 'Problem 3.d'

-- Express this query in Pure SQL by only using the ‘exists’ or ‘not
-- exists’ subquery expressions. You can not use the set operations
-- INTERSECT, UNION, and EXCEPT.


with chemistryStudent as (select s.sid, s.birthyear
                          from   Student s, hasMajor hm
			  where  s.sid = hm.sid and hm.major = 'Chemistry')
select distinct b.bno, b.title
from   Book b, Student s, Buys t
where  t.sid = s.sid and t.bno = b.bno and
       not exists (select 1
                   from   ChemistryStudent s1, Buys t1
   	           where  t1.sid = s1.sid and t1.bno = b.bno and s1.birthyear >= s.birthyear)
order by 1;


\qecho 'Problem 3.e'

-- Express this query in Pure SQL by only using the `in' or `not in' subquery
-- expressions. You can not use the set operations INTERSECT, UNION, and
-- EXCEPT.

with chemistryStudent as (select s.sid, s.birthyear
                          from   Student s, hasMajor hm
			  where  s.sid = hm.sid and hm.major = 'Chemistry')
select distinct b.bno, b.title
from   Book b, Student s, Buys t
where  t.sid = s.sid and t.bno = b.bno and
       b.bno not in (select t1.bno
                     from   ChemistryStudent s1, Buys t1
   	             where  t1.sid = s1.sid and s1.birthyear >= s.birthyear)
order by 1;		     

\qecho 'Problem 3.f'

-- Express this query in Pure SQL without using subquery expressions. Now
-- you can use the set operations INTERSECT, UNION, and EXCEPT.

with chemistryStudent as (select s.sid, s.birthyear
                          from   Student s, hasMajor hm
			  where  s.sid = hm.sid and hm.major = 'Chemistry')
select distinct q.bno, q.title
from (select b.bno, b.title, s.sid, s.birthyear, t.sid, t.bno as tbno
      from   Book b, Student s, Buys t
      where  t.sid = s.sid and t.bno = b.bno
      except
      select b.bno, b.title, s.sid, s.birthyear, t.sid, t.bno
      from   Book b, Student s, Buys t, ChemistryStudent s1, Buys t1
      where  t1.sid = s1.sid and t1.bno = b.bno and s1.birthyear >= s.birthyear) q
order by 1;


\qecho 'Problem 4'

-- Find each student-book pair (s, b) where s is the sid of a student who
-- majors in CS and who bought each book that costs no more than
-- book b.

\qecho 'Problem 4.b'

-- Express this query in Pure SQL by only using the ‘true = some’ or
-- ‘true = all’ subquery expressions. You can not use the set operations
-- INTERSECT, UNION, and EXCEPT.

select s.sid, b.bno
from   Student s, Book b
where  true = some (select hm.sid = s.sid
                    from   hasMajor hm
		    where  hm.major = 'CS') and 
       true = all (select true = some (select s.sid = t.sid and b1.bno = t.bno
                                       from   Buys t)
                   from   Book b1
		   where  b1.price <= b.price)
order by 1,2;






\qecho 'Problem 4.c'

-- Express this query in Pure SQL by only using the ‘exists’ or ‘not
-- exists’ subquery expressions. You can not use the set operations
-- INTERSECT, UNION, and EXCEPT.

select s.sid, b.bno
from   Student s, Book b
where  exists (select 1
               from   hasMajor hm
	       where  hm.major = 'CS' and s.sid = hm.sid) and
       not exists (select 1
                   from   Book b1
		   where  b1.price <= b.price
		          and not exists (select 1
                                          from   Buys t
					  where  s.sid = t.sid and b1.bno = t.bno))
order by 1,2;



\qecho 'Problem 4.d'

-- Express this query in Pure SQL by only using the `in' or `not in' subquery
-- expressions. You can not use the set operations INTERSECT, UNION, and
-- EXCEPT.

select s.sid, b.bno
from   Student s, Book b
where  s.sid in (select hm.sid
                 from   hasMajor hm
	         where  hm.major = 'CS') and
       true not in (select b1.price <= b.price and (s.sid, b1.bno) not in (select t.sid, t.bno
                                                                           from   Buys t)
                    from   Book b1)
order by 1,2;




\qecho 'Problem 4.e'

-- Express this query in Pure SQL without using subquery expressions. Now
-- you can use the set operations INTERSECT, UNION, and EXCEPT.


with Student as (select distinct hm.sid
                 from   hasMajor hm
		 where  hm.major = 'CS')
select s.sid, b.bno
from   Student s, Book b
except
select q.sid, q.bno
from (select s.sid, b.bno, b1.bno as b1bno
      from   Student s, Book b, Book b1
      where  b1.price <= b.price
      except
      select s.sid, b.bno, b1.bno
      from   Student s, Book b, Book b1, Buys t
      where  s.sid = t.sid and b1.bno = t.bno) q
order by 1,2;





\qecho 'Problem 5'

-- Find the sid and name of each student who bought all-but-one book that
-- cost strictly more than $30.



\qecho 'Problem 5.b'

-- Express this query in Pure SQL by only using the ‘true = some’ or
-- ‘true = all’ subquery expressions. You can not use the set operations
-- INTERSECT, UNION, and EXCEPT.

with Book as (select b.bno from Book b where b.price > 30)
select s.sid, s.sname
from   Student s
where  true = some (select not true = some (select t.sid = s.sid and t.bno = b.bno
                                            from   Buys t)
                    from   Book b) and
       true = all (select b1 = b2
                   from   Book b1, Book b2
                   where  not true = some (select t.sid = s.sid and t.bno = b1.bno
                                           from   Buys t) and
                          not true = some (select t.sid = s.sid and t.bno = b2.bno
                                           from   Buys t));



\qecho 'Problem 5.c'

-- Express this query in Pure SQL by only using the ‘exists’ or ‘not
-- exists’ subquery expressions. You can not use the set operations
-- INTERSECT, UNION, and EXCEPT.


with Book as (select b.bno from Book b where b.price > 30)
select s.sid, s.sname
from   Student s, Book b
where  not exists (select 1
                   from   Buys t
	           where  t.sid = s.sid and t.bno = b.bno) and
       not exists (select 1
                   from   Book b1, Book b2
                   where  b1 != b2 and
		          not exists (select 1 
                                      from   Buys t
				      where  t.sid = s.sid and
				             (t.bno = b1.bno or t.bno = b2.bno)));



\qecho 'Problem 5.d'

-- Express this query in Pure SQL by only using the `in' or `not in' subquery
-- expressions. You can not use the set operations INTERSECT, UNION, and
-- EXCEPT.

with Book as (select b.bno from Book b where b.price > 30),
     coBuys (sid,sname,bno) as (select s.sid, s.sname, b.bno
                                from   Student s, Book b
			        where  (s.sid,b.bno) not in (select t.sid, t.bno
                                                             from   Buys t))
select t.sid, t.sname
from   coBuys t
where  true not in (select t1.bno != t2.bno
                    from   coBuys t1, coBuys t2
                    where  t.sid = t1.sid and t.sid=t2.sid);
						  
			  	                  
					 


\qecho 'Problem 5.e'

-- Express this query in Pure SQL without using subquery expressions. Now
-- you can use the set operations INTERSECT, UNION, and EXCEPT.


with Book as (select b.bno from Book b where b.price > 30),
     coBuys (sid,sname, bno) as (select s.sid, s.sname, b.bno
                                 from   Student s, Book b
			         except
			         select s.sid, s.sname, t.bno
			         from   Student s, Buys t
				 where  s.sid = t.sid)
select t.sid, t.sname
from   coBuys t
except
select t1.sid, t1.sname
from   coBuys t1, coBuys t2
where  t1.sid = t2.sid and t1.bno != t2.bno;


\qecho 'Problem 6'

-- Find the sid and sname of each student who majors in CS and who is
-- (strictly) younger than some other student who also majors in CS.


\qecho 'Problem 6.b'

-- Express this query in Pure SQL by only using the ‘true = some’ or
-- ‘true = all’ subquery expressions. You can not use the set operations
-- INTERSECT, UNION, and EXCEPT.


select s.sid, s.sname
from   Student s
where  true = some (select true = some ( select true = some  (select hm1.sid = s1.sid and hm1.major = 'CS'
                                                              from   hasMajor hm1)
                                         from   Student s1 
                                         where  s1.birthYear < s.birthYear)
                    from   hasMajor hm
                    where  hm.sid = s.sid and
                           hm.major = 'CS' )
                      
order by 1;





\qecho 'Problem 6.c'

-- Express this query in Pure SQL by only using the ‘exists’ or ‘not
-- exists’ subquery expressions. You can not use the set operations
-- INTERSECT, UNION, and EXCEPT.

select s.sid, s.sname
from   Student s
where  exists (select 1
               from   hasMajor hm
               where  hm.sid = s.sid and
                      hm.major = 'CS' and
                      exists (select 1 
                              from   Student s1
                              where  s1.birthYear < s.birthYear and
                                     exists (select 1
                                             from   hasMajor hm1
                                             where  hm1.sid = s1.sid and hm1.major = 'CS')))
order by 1;



\qecho 'Problem 6.d'

-- Express this query in Pure SQL by only using the `in' or `not in' subquery
-- expressions. You can not use the set operations INTERSECT, UNION, and
-- EXCEPT.


select s.sid, s.sname
from   Student s
where  s.sid in (select hm.sid
                 from   hasMajor hm, Student s1
                 where  hm.major = 'CS' and
                        s1.birthYear < s.birthYear and
                        s1.sid in (select hm1.sid
                                   from   hasMajor hm1
                                   where  hm1.major = 'CS'))
order by 1;



\qecho 'Problem 6.e'

-- Express this query in Pure SQL without using subquery expressions. Now
-- you can use the set operations INTERSECT, UNION, and EXCEPT.

select distinct s.sid, s.sname
from   Student s, hasMajor hm, Student s1, hasMajor hm1
where  s.sid = hm.sid and hm.major = 'CS' and
       s1.sid = hm1.sid and hm1.major = 'CS' and
       s1.birthYear < s.birthYear
order by 1;



\qecho 'Problem 7'

-- Find each (s, b) pair where s is the sid of a student who bought book
-- b and such that each other book bought by s is a book cited by b.

\qecho 'Problem 7.b'

-- Express this query in Pure SQL by only using the ‘true = some’ or
-- ‘true = all’ subquery expressions. You can not use the set operations
-- INTERSECT, UNION, and EXCEPT.


select t.sid, t.bno
from   Buys t
where  true = all (select true = some (select c.bno1 = t.bno and  c.bno2 = b.bno
                                       from   Cites  c)
                   from   Book b, Buys t1
                   where  t1.sid = t.sid and
                          t1.bno = b.bno and
                          t1.bno <> t.bno)
                          
order by 1,2;


\qecho 'Problem 7.c'


-- Express this query in Pure SQL by only using the ‘exists’ or ‘not
-- exists’ subquery expressions. You can not use the set operations
-- INTERSECT, UNION, and EXCEPT.

select t.sid, t.bno
from   Buys t
where  not exists (select 1
                   from   Book b, Buys t1
                   where  t1.sid = t.sid and
                          t1.bno = b.bno and
                          t1.bno <> t.bno and
                          not exists (select 1
                                      from   Cites  c
                                      where  c.bno1 = t.bno and 
                                             c.bno2 = b.bno))
order by 1,2;


\qecho 'Problem 7.d'

-- Express this query in Pure SQL by only using the `in' or `not in' subquery
-- expressions. You can not use the set operations INTERSECT, UNION, and
-- EXCEPT.


select t.sid, t.bno
from   Buys t
where  t.sid not in (select t1.sid
                     from   Book b, Buys t1
                     where  t1.bno = b.bno and
                            t1.bno <> t.bno and
                            (t.bno, b.bno) not in (select c.bno1, c.bno2
                                                   from   Cites  c))
order by 1,2;

\qecho 'Problem 7.e'

-- Express this query in Pure SQL without using subquery expressions. Now
-- you can use the set operations INTERSECT, UNION, and EXCEPT.

select t.sid, t.bno
from   Buys t
except
(select  q.tsid,  q.tbno
 from   (select  t.sid as  tsid, t.bno as  tbno, b.*, t1.*
         from   Buys t, Book b, Buys t1
         where  t1.sid = t.sid and
                t1.bno = b.bno and
                t1.bno <> t.bno 
         except
         select t.*, b.*, t1.*
         from   Buys t, Book b, Buys t1, Cites c
         where  c.bno1 = t.bno and 
                c.bno2 = b.bno) q)
order by 1,2;



\qecho 'Problem 8'

-- Find each major that is not a major of any person who bought a book
-- with title ‘Databases’ or ‘Philosophy’.

\qecho 'Problem 8.b'

with    BoughtDatabasesOrPhilosophy as
        (select distinct t.sid
         from   Buys t
         where  true = some (select  t.bno = b.bno
                             from    Book b
                             where   b.title = 'Databases' or b.title = 'Philosophy'))
                               

select  m.major
from    Major  m
where   true = all (select hm.major <> m.major
                    from   BoughtDatabasesOrPhilosophy s, hasMajor hm
		    where  hm.sid = s.sid)
		                        
order by 1;


\qecho 'Problem 8.c'

with    BoughtDatabasesOrPhilosophy as
        (select distinct t.sid
         from   Buys t
         where  exists (select 1
                        from   Book b
                        where  t.bno = b.bno and
                               (b.title = 'Databases' or b.title = 'Philosophy')))

select  m.major
from    Major m
where   not exists (select 1
                    from   BoughtDatabasesOrPhilosophy s, hasMajor hm
		    where  hm.sid = s.sid and hm.major = m.major)
order by 1;

\qecho 'Problem 8.d'


with    BoughtDatabasesOrPhilosophy as
        (select distinct t.sid
         from   Buys t
         where  t.bno in (select b.bno
                          from   Book b
                          where  b.title = 'Databases' or b.title = 'Philosophy'))

select  m.major
from    Major m
where   m.major not in (select hm.major
                        from   BoughtDatabasesOrPhilosophy s, hasMajor hm
		        where  hm.sid = s.sid)
order by 1;


					  

\qecho 'Problem 8.e'

with    BoughtDatabasesOrPhilosophy as
        (select distinct t.sid
         from   Buys t, Book b
         where  t.bno = b.bno and
                b.title = 'Databases' or b.title = 'Philosophy')

select  m.major
from    Major  m
except
select  hm.major
from    hasMajor hm, BoughtDatabasesOrPhilosophy s
where   hm.sid = s.sid
order by 1;




\qecho 'Problem 9'

-- Find the bno and title of each book that is bought by a student who
-- majors in CS and who is, among all students who major in CS, the
-- next-to-oldest.

\qecho 'Problem 9.b'

with CSStudent as (select s.sid, s.birthyear
                   from   Student s
		   where  true = some (select s.sid = hm.sid
		                       from   hasMajor hm
				       where  hm.major = 'CS')),
     nextToOldestCSStudent as (select s.sid
                               from   CSStudent s
		               where  true = some (select s1.birthyear < s.birthyear
		                                   from   CSStudent s1) and
	                              true = all (select s1.birthyear >= s.birthyear
					          from   CSStudent s1, CSStudent s2
						  where  s2.birthyear < s1.birthyear))
select b.bno, b.title
from   Book b
where  true = some (select t.sid = s.sid and t.bno = b.bno
                    from   nextToOldestCSStudent s, Buys t)
order by 1;


\qecho 'Problem 9.c'


with CSStudent as (select s.sid, s.birthyear
                   from   Student s
		   where  exists (select 1
		                  from   hasMajor hm
				  where  s.sid = hm.sid and hm.major = 'CS')),
     nextToOldestCSStudent as (select s.sid
                               from   CSStudent s
		               where  exists (select 1
		                              from   CSStudent s1
					      where  s1.birthyear < s.birthyear) and
	                              not exists (select 1
					          from   CSStudent s1, CSStudent s2
						  where  s2.birthyear < s1.birthyear and
			                                 s1.birthyear < s.birthyear))
select b.bno, b.title
from   Book b
where  exists (select 1 
               from   nextToOldestCSStudent s, Buys t
	       where  t.sid = s.sid and t.bno = b.bno)
order by 1;



\qecho 'Problem 9.d'

with CSStudent as (select s.sid, s.birthyear
                   from   Student s
		   where  s.sid in (select hm.sid
		                    from   hasMajor hm
				    where  hm.major = 'CS')),
     nextToOldestCSStudent as (select s.sid
                               from   CSStudent s, CSStudent s1
		               where  s1.birthyear < s.birthyear and
	                              true not in (select s2.birthyear < s1.birthyear and
			                                  s1.birthyear < s.birthyear
					           from   CSStudent s1, CSStudent s2))
						  
select b.bno, b.title
from   Book b
where  b.bno in (select t.bno
                 from   nextToOldestCSStudent s, Buys t
	         where  t.sid = s.sid)
order by 1;




\qecho 'Problem 9.e'


with CSStudent as (select distinct s.sid, s.birthyear
                   from   Student s, hasMajor hm
		   where  s.sid = hm.sid and hm.major = 'CS'),
     nextToOldestCSStudent as (select s.sid
                               from   CSStudent s, CSStudent s1
		               where  s1.birthyear < s.birthyear
			       except
			       select s.sid
			       from   CSStudent s, CSStudent s1, CSStudent s2
	                       where  s2.birthyear < s1.birthyear and
			              s1.birthyear < s.birthyear)
select distinct b.bno, b.title
from   Book b, nextToOldestCSStudent s, Buys t
where  t.sid = s.sid and t.bno = b.bno
order by 1;







\qecho 'Problem 10.b'

-- Find the bno and title of each book that was bought by exactly one
-- student.

-- Express this query in RA SQL.

select bno, title
from   Book
       natural join (select bno
                     from   Buys
                     except
                     select t1.bno
                     from   Buys t1 join Buys t2 on (t1.bno = t2.bno and t1.sid != t2.sid)) b;


\qecho 'Problem 11.b'

-- Find each pair (m, b) where m is a major and b is the bno of a book
-- bought by a student who has major m and such that the price of b is
-- the lowest among the set of books bought by students with major m

-- Express this query in RA SQL.

with E as (select major, bno, price
           from   hasMajor natural join Buys natural join Book)

select distinct major, bno
from   (select major, bno, price
        from   E e
        except
        select e.major, e.bno, e.price
        from   E e join E e1 on (e.major = e1.major and e.price > e1.price)) q
order by 1,2;	


\qecho 'Problem 12.b'

-- Find the bno and title of each book that is bought by a student who is
-- (strictly) younger than each student who majors in Chemistry and who
-- also bought that book.

-- Express this query in RA SQL.

with chemStudent as (select s.sid, birthyear 
                     from   Student s
		            natural join (select sid
		                   	  from   hasMajor hm
                                          where  major = 'Chemistry') cS),
E as (select t.bno, s.sid, s.birthyear
      from   Buys t natural join Student s)
	   
select distinct b.bno, b.title
from   Book b
       NATURAL JOIN (select bno, sid, birthyear
                     from   E 
                     except
                     select bno, e.sid, e.birthyear
                     from   E e join chemStudent s on (e.sid = s.sid and  e.birthyear >= s.birthyear)) q
order by 1;



\qecho 'Problem 13.b'

-- Find each student-book pair (s, b) where s is the sid of a student who
-- majors in CS and who bought each book that costs no more than
-- book b.


-- Express this query in RA SQL.

with CS as (select distinct sid
            from   hasMajor
  	    where  major = 'CS')
select sid, bno
from   CS cross join Book
except
select sid, bno
from (select sid, b.bno, b1.bno as b1bno
      from   CS cross join
             Book b join Book b1 on (b1.price <= b.price)
      except
      select t.sid, b.bno, t.bno
      from   Book b cross join Buys t) q
order by 1,2;


\qecho 'Problem 14.b'

-- Find the sid and name of each student who bought all-but-one book that
-- cost strictly more than $30.

with Book as (select bno from Book where price > 30),
     coBuys (sid,sname,bno) as (select sid, sname, bno
                                from   Student CROSS JOIN Book 
			        except
			        select s.sid, sname, bno
			        from   Student s NATURAL JOIN Buys)
select sid, sname
from   coBuys 
except
select t1.sid, t1.sname
from   coBuys t1 JOIN coBuys t2 on (t1.sid = t2.sid and t1.bno != t2.bno);



\qecho 'Problem 15.b'

-- Find the sid and sname of each student who majors in CS and who is
-- (strictly) younger than some other student who also majors in CS.


with CSMajor as (select sid from hasMajor where major = 'CS')
select distinct s.sid, s.sname
from   (Student s natural join CSMajor CSs)
       join
       (Student s1 natural join CSMajor CSs1) on s1.birthYear < s.birthYear
order by 1;



\qecho 'Problem 16.b'

-- Find each (s, b) pair where s is the sid of a student who bought book
-- b and such that each other book bought by s is a book cited by b.

select sid, bno
from   Buys
except
(select  q.tsid,  q.tbno
 from   (select t.sid as tsid, t.bno as tbno, b.*, t1.*
         from   Buys t
	        join Buys t1 on (t1.sid = t.sid and t1.bno <> t.bno)
		join Book b on (t1.bno = b.bno)
                
         except
         select t.*, b.*, t1.*
         from   Buys t 
	        join Cites c on (c.bno1 = t.bno)
		join Book b on (c.bno2 = b.bno)
		cross join Buys t1) q)
order by 1,2;


\qecho 'Problem 17.b'

-- Find each major that is not a major of any person who bought a book
-- with title ‘Databases’ or ‘Philosophy’.


with    BoughtDatabasesOrPhilosophy as
        (select distinct sid
         from   Buys natural join (select bno
	                           from   Book
				   where  title = 'Databases' or title = 'Philosophy') b)
select  major
from    Major
except
select  major
from    hasMajor natural join BoughtDatabasesOrPhilosophy
order by 1;


\qecho 'Problem 18.b'

-- Find the bno and title of each book that is bought by a student who
-- majors in CS and who is, among all students who major in CS, the
-- next-to-oldest.

with CSStudent as (select s.sid, s.birthyear
                   from   Student s natural join (select sid
		                                  from   hasMajor
				                  where  major = 'CS') cs),
     nextToOldestCSStudent as ( select s.sid
                                from   CSStudent s join  CSStudent s1 on (s.birthyear > s1.birthyear)
			        except
			        select s.sid
                                from   CSStudent s join  CSStudent s1 on (s.birthyear > s1.birthyear)
                                       join CSStudent s2 on (s1.birthyear > s2.birthyear) )


select distinct b.bno, b.title
from   nextToOldestCSStudent 
       natural join Buys 
       natural join Book b
order by 1;


\qecho 'Problem 27'

/*
 Define a parameterized view
 ‘PurchasedBookLessPrice(sid int, price integer)’
 that returns, for a given student identified by ‘sid’ and
a given ‘price’ value, the subrelation of ‘Book’ of books that are
bought by that student and that cost strictly less than ‘price’.

Test your view for the parameter values (1001,15), (1001,20),
(1001,50), and (1002,30).
*/

create or replace function PurchasedBookLessPrice(s int, p integer)
returns table (bno integer, title text, price integer) as
$$
select bno, title, price
from   Book
where  (s, bno) in (select sid, bno
                    from   Buys) and
       price < p;	      
$$ language sql;

select * from PurchasedBookLessPrice(1001,15) order by 3;

select * from PurchasedBookLessPrice(1001,30) order by 3;

select * from PurchasedBookLessPrice(1001,50) order by 3;

select * from PurchasedBookLessPrice(1002,30) order by 3;


\qecho 'Problem 28'

/*
Define a parameterized view ‘CitedBookbyMajor(major text)’ that
returns for a major ‘major’ the subrelation of ‘Book’ of books that
are cited by a book bought by a the student who majors in ‘major’.

Test your view for each major.
*/

create or replace function CitedBookbyMajor(m text)
returns table (bno integer, title text, price integer) as
$$
select bno, title, price
from   Book
where  bno in (select bno2
               from   Cites
	       where  bno1 in (select bno
	                       from   Buys
			       where  sid in (select sid
			                      from   hasMajor
					      where  major = m)))
order by bno;					      
$$ language sql;

/*
select m.major, b.*
from   major m,  CitedBookbyMajor(m.major) b
order by 1;
*/

select * from CitedBookbyMajor('CS');

select * from CitedBookbyMajor('Chemistry');

select * from CitedBookbyMajor('DataScience');

select * from CitedBookbyMajor('English');

select * from CitedBookbyMajor('Math');

select * from CitedBookbyMajor('Physics');




\qecho 'Problem 29'

/*
Define a parameterized view
‘JointlyBoughtBook(sid1 integer, sid2 integer)’
that returns the subrelation of ‘Book’ of books that are
bought by both the students with sids ‘sid1’ and ‘sid2’, respectively.

Test your view for the parameters (1001, 1002), (1001,1003), and
(1002,1003).
*/

create or replace function JointlyBoughtBook(s1 integer, s2 integer)
returns table (bno integer, title text, price integer) as
$$
select bno, title, price
from   Book
where  (s1,bno) in (select * from Buys) and
       (s2,bno) in (select * from Buys)
order by 1;       
$$ language sql;


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



create or replace recursive view sameGeneration (n1,n2)
as  ((select  e.parent as n1, e.parent as n2
      from    PC e
      union
      select  e.child as n1, e.child as n2
      from    PC e)
      union
      select  e1.child, e2.child
      from    PC e1, sameGeneration sg, PC e2
      where   e1.parent = sg.n1 and e2.parent = sg.n2 );


select n1, n2 from sameGeneration
order by 1,2;






-- Connect to default database
-- \c postgres

--
-- Drop database created for this assignment
-- DROP DATABASE dvgfall2022assignment2;






