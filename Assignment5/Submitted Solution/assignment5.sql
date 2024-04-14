-- Script for Assignment 5  Fall 2022

-- Creating database with full name

CREATE DATABASE dvgfall2022assignment5;


-- Connecting to database 
\c dvgfall2022assignment5

-- Relation schemas and instances for assignment 5


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

create or replace view studentBuysBooks as
   select sid, array(select t.bno
                     from   Buys t
      	      	     where  t.sid = s.sid order by 1) as books
   from   Student s order by 1;

create or replace view bookBoughtByStudents as
   select bno, array(select t.sid
                     from   Buys t
      	      	     where  t.bno = b.bno order by 1) as students
   from   Book b order by 1;


create or replace view studentHasMajors as
   select sid, array(select hm.major
                     from   hasMajor hm
      	      	     where  hm.sid = s.sid order by 1) as majors
   from   Student s order by 1;


create or replace view majorOfStudents as
   select major, array(select hm.sid
                       from   hasMajor hm
      	      	       where  hm.major = m.major order by 1) as students
   from   Major m order by 1;


create or replace view bookCitesBooks as
   select bno, array(select c.bno2
                     from   Cites c
      	      	     where  c.bno1 = b.bno order by 1) as citedBooks
   from   Book b order by 1;


create or replace view bookCitedByBooks as
   select bno, array(select c.bno1
                     from   Cites c
      	      	     where  c.bno2 = b.bno order by 1) as citingBooks
   from   Book b order by 1;

-- We define the following functions and predicates

/*
Functions:
set_union(A,B)               A union B
set_intersection(A,B)        A intersection B
set_difference(A,B)          A - B
add_element(x,A)             {x} union A
remove_element(x,A)          A - {x}
make_singleton(x)            {x}
bag_to_set(A)                coerce a bag A to the corresponding set

Predicates:
is_in(x,A)                   x in A
is_not_in(x,A)               not(x in A)
is_empty(A)                  A is the emptyset
is_not_emptyset(A)           A is not the emptyset
subset(A,B)                  A is a subset of B
superset(A,B)                A is a super set of B
equal(A,B)                   A and B have the same elements
overlap(A,B)                 A intersection B is not empty
disjoint(A,B)                A and B are disjoint 
*/

-- Set Operations: union, intersection, difference

-- Set union $A \cup B$:
create or replace function set_union(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) union select unnest(B) order by 1);
$$ language sql;

-- Set intersection $A\cap B$:
create or replace function set_intersection(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) intersect select unnest(B) order by 1);
$$ language sql;

-- Set difference $A-B$:
create or replace function set_difference(A anyarray, B anyarray) 
returns anyarray as
$$
   select array(select unnest(A) except select unnest(B) order by 1);
$$ language sql;


-- Add element to set
create or replace function add_element(x anyelement, A anyarray) 
returns anyarray as
$$
   select bag_to_set(x || A);
$$ language sql;


-- Remove element from set
create or replace function remove_element(x anyelement, A anyarray) 
returns anyarray as
$$
   select array_remove(A, x);
$$ language sql;


-- Make singleton  x --->  {x}

create or replace function make_singleton(x anyelement) 
returns anyarray as
$$
   select add_element(x,'{}');
$$ language sql;


-- Bag operations

-- Bag union 
create or replace function bag_union(A anyarray, B anyarray) 
returns anyarray as
$$
   select A || B;
$$ language sql;

-- bag To set
create or replace function bag_to_set(A anyarray)
returns anyarray as
$$
   select array(select distinct unnest(A) order   by 1);
$$ language sql;


-- Set Predicates: set membership, set non membership, emptyset, subset, superset, overlap, disjoint

-- Set membership $x \in A$:
create or replace function is_in(x anyelement, A anyarray) 
returns boolean as
$$
   select x = SOME(A);
$$ language sql;

-- Set non membership $x \not\in A$:
create or replace function is_not_in(x anyelement, A anyarray) 
returns boolean as
$$
   select not(x = SOME(A));
$$ language sql;

-- emptyset test $A = \emptyset$:
create or replace function is_empty(A anyarray) 
returns boolean as
$$
   select A <@ '{}';
$$ language sql;


-- non emptyset test $A \neq \emptyset$:
create or replace function is_not_empty(A anyarray) 
returns boolean as
$$
   select not(A <@ '{}');
$$ language sql;

-- Subset test $A\subseteq B$:
create or replace function subset(A anyarray, B anyarray) 
returns boolean as
$$
   select A <@ B;
$$ language sql;

-- Superset test $A \supseteq B$:
create or replace function superset(A anyarray, B anyarray) 
returns boolean as
$$
   select A @> B;
$$ language sql;

-- Equality test $A = B$
create or replace function equal(A anyarray, B anyarray) 
returns boolean as
$$
   select A <@ B and A @> B;
$$ language sql;

-- Overlap test $A\cap B \neq \emptyset$:
create or replace function overlap(A anyarray, B anyarray) 
returns boolean as
$$
   select A && B;
$$ language sql;

-- Disjointness test $A\cap B = \emptyset$:
create or replace function disjoint(A anyarray, B anyarray) 
returns boolean as
$$
   select not A && B;
$$ language sql;

\qecho 'Problem 1'

-- Find the sid and name of each student who bought the most books.

select sid, sname from student 
where is_in(sid, (select array_agg(sid) from studentbuysbooks where cardinality(books)=(select max(cardinality(books)) from studentbuysbooks)));

\qecho 'Problem 2'

-- Find the sid and name of each student who bought the most books
-- that cost strictly more than $25.

with studentbuysbooksgreater25 as (
   select sb.sid, set_intersection(sb.books, array(select b.bno from book b where b.price > 25 order by 1)) as books from studentbuysbooks sb
)

select s.sid, s.sname from student s 
where s.sid in (
   select sb.sid from studentbuysbooksgreater25 sb
   where cardinality(sb.books) = (select max(cardinality(sb.books)) as cnt from studentbuysbooksgreater25 sb)
);

\qecho 'Problem 3'

-- Find the bno and title of each book that is bought by a student who is
-- (strictly) younger than each student who majors in Chemistry and who
-- also bought that book.

select b.bno, b.title from book b 
where overlap(
      (select students from bookboughtbystudents where bno=b.bno), 
      (select array_agg(s.sid) from student s where s.birthYear > all(
         select birthyear from student where is_in(s.sid, (select set_intersection((select students from majorofstudents where major='Chemistry'), (select students from bookboughtbystudents where bno=b.bno))))) 
      )
   );



\qecho 'Problem 4'

-- Find each student-book pair (s, b) where s is the sid of a student who
-- majors in CS and who bought each book that costs no more than book b.

select s.sid, b.bno from student s, book b
where is_in(s.sid, (select array_agg(sid) from studenthasmajors where is_in('CS', majors))) and
   (select books from studentbuysbooks where sid=s.sid) @> (select array_agg(bno) from book b1 where b1.price <= b.price)
order by 1,2;

\qecho 'Problem 5'

-- Find the bno and title of each book that cites a book and that was
-- bought by a student who majors in CS but not in Math.

with student_majors_cs_not_math as (
   select array_agg(sid) from studenthasmajors where is_in('CS', majors) and is_not_in('Math', majors)
), book_bought_by_student_majors_cs_not_math as (
   select array_agg(bno) from bookboughtbystudents where overlap(students, (select * from student_majors_cs_not_math))
), book_that_cites_a_book as (
   select array_agg(bno) from bookcitesbooks where cardinality(citedbooks)>=1
), book_that_cites_a_book_and_bought_by_student_majors_cs_not_math as (
   select set_intersection((select * from book_that_cites_a_book), (select * from book_bought_by_student_majors_cs_not_math))
)

select bno, title from book 
where bno in (select unnest((select * from book_that_cites_a_book_and_bought_by_student_majors_cs_not_math)));

\qecho 'Problem 6'

-- Find each (s, b) pair where s is the sid of a student who bought book
-- b and such that each other book bought by s is a book cited by b.

select s.sid, b.bno from student s, book b 
where (select is_in(b.bno, (select sb.books from studentbuysbooks sb where sb.sid=s.sid))) and
      (select equal(
         remove_element(b.bno, (select books from studentbuysbooks where sid=s.sid)), 
         (select citedbooks from bookcitesbooks where bno=b.bno)
         )
      );


\qecho 'Problem 7'

-- Find each major that is not a major of any person who bought a book
-- with title ‘Databases’ or ‘Complexity’.

with book_with_title as (
   select array_agg(bno) from book where title='Databases' or title='Complexity'
), students_who_book_with_title as (
   select array_agg(sid) from studentbuysbooks where overlap(books, (select * from book_with_title))
)

select major from majorofstudents where not overlap(students, (select * from students_who_book_with_title));

\qecho 'Problem 8'

-- Find each major that is the major of at least three students who bought
-- a common book.

with students_who_bought_common_book as (
   select array(select distinct unnest(students) from bookboughtbystudents where cardinality(students) >= 2)
), major_of_students_who_bought_common_book as (
   select major from majorofstudents 
   where cardinality((select set_intersection(students, (select * from students_who_bought_common_book)))) >=3
)

select * from major_of_students_who_bought_common_book;


\qecho 'Problem 9'

-- Find each student who has no major in common with those of students
--  who bought a book with title ’Databases’ or ’AI’.
with book_with_title as (
   select array_agg(bno) from book where title = 'Databases' or title='AI'
), students_who_bought_book_with_title as (
   select array_agg(sid) from studentbuysbooks where overlap(books, (select * from book_with_title))
), majors_of_students_who_bought_book_with_title as (
   select array_agg(major) from majorofstudents where overlap(students, (select * from students_who_bought_book_with_title))
)

select sid from studenthasmajors where not overlap(majors, (select * from majors_of_students_who_bought_book_with_title));

\qecho 'Problem 10'

-- Find the set of bnos of books that each cite strictly more than 4
-- books and that each are cited by fewer than 2 books. (So this query
-- returns only one object, i.e., the set of bnos specified in the
-- query.)

-- select array(
--    select b.bno from book b where
--       (select cardinality(
--          set_intersection(
--             bcb.citedbooks, 
--             (select array(select b.bno from book b where cardinality((select citingbooks from bookcitedbybooks where bno=b.bno)) <= 2))
--          )
--       ) from bookcitesbooks bcb where bcb.bno=b.bno) > 4
-- );

select array(
   select b.bno from bookcitesbooks b
   where cardinality(set_intersection(b.citedbooks, (select array(select bno from bookcitedbybooks where cardinality(citingBooks) <= 2)))) >= 4
);

\qecho 'If we consider the condition CITE AT LEAST 4'
\qecho 'then we get the answer'

select array(
   select b.bno from bookcitesbooks b
   where cardinality(b.citedbooks) >= 4
);

\qecho 'Problem 11'

-- Find the sid and name of each student who has all the majors of the
-- combined set of all majors of the oldest students who bought the book
-- with bno 2000.

-- select students from bookBoughtByStudents b where b.bno=2001;
-- select array(select sid from student where birthyear=(select min(birthyear) from student));


with older_student_bought_book as (
   select set_intersection(
      (select students from bookBoughtByStudents b where b.bno=2000), 
      (select array(select sid from student where birthyear=(select min(birthyear) from student)))
   )
), all_majors_of_older_students_bought_book as (
   select array_agg(major) from majorofstudents where overlap(students, (select * from older_student_bought_book))
), students_who_took_all_majors_of_older_students_bought_book as (
   select sid from studenthasmajors where (select * from all_majors_of_older_students_bought_book) <@ majors
)

select sid, sname from student where sid in (select * from students_who_took_all_majors_of_older_students_bought_book);

\qecho 'If we take bno 2001 instead of 2000, we get the following answer'

with older_student_bought_book as (
   select set_intersection(
      (select students from bookBoughtByStudents b where b.bno=2001), 
      (select array(select sid from student where birthyear=(select min(birthyear) from student)))
   )
), all_majors_of_older_students_bought_book as (
   select array_agg(major) from majorofstudents where overlap(students, (select * from older_student_bought_book))
), students_who_took_all_majors_of_older_students_bought_book as (
   select sid from studenthasmajors where (select * from all_majors_of_older_students_bought_book) <@ majors
)

select sid, sname from student where sid in (select * from students_who_took_all_majors_of_older_students_bought_book);


\qecho 'Problem 12'

-- Find the following set of sets
--  {M |M ⊆Major∧|M|≤3}.

create or replace function make_pair(a anyelement, b anyelement)
returns anyarray as
$$
   select set_union(make_singleton(a), make_singleton(b))
$$ language sql;

create or replace function make_triple(a anyelement, b anyelement, c anyelement)
returns anyarray as
$$
   select set_union(make_singleton(a), set_union(make_singleton(b), make_singleton(c)))
$$ language sql;

with M as (
   select '{}' as majors
   union
   select make_singleton(major) from major
   union
   select make_pair(m1.major, m2.major) from major m1, major m2
   union
   select make_triple(m1.major, m2.major, m3.major) from major m1, major m2, major m3
   order by 1
)

select * from M;

\qecho 'Problem 13'

-- Reconsider Problem 12.
-- Let M denote the set {M | M ⊆ Major ∧ |M| ≤ 3}. Find the following set of sets
-- {X |X ⊆ M∧|X|≥2}.

create type majorType as (major text);
create type majorsType as (majors majorType[]);

with M as (
   select '{}' as majors
   union
   select make_singleton(row(major)::majorType) from major
   union
   select make_pair(row(m1.major)::majorType, row(m2.major)::majorType) from major m1, major m2
   union
   select make_triple(row(m1.major)::majorType, row(m2.major)::majorType,row(m3.major)::majorType) from major m1, major m2, major m3
   order by 1
),
X as (
   select '{}' as majors
   union
   select make_singleton(row(M.majors)::majorsType) from M
   union
   select make_pair(row(M1.majors)::majorsType, row(M2.majors)::majorsType) from M M1, M M2
)

select count(*) from X;

\qecho 'Problem 14'


-- Let t be a number called a threshold. We say that an (unordered)
-- triple of different sids {s1, s2, s3} co-occur with frequency at least
-- t if there are at least t books who are each bought by the students
-- s1, s2, and s3.  Write a function coOccur(t integer) that returns the
-- (unordered) triples {s1, s2, s3} of bno that co-occur with frequency
-- at least t.  Test your coOccur function for t in the range [0, 3].


-- create table temp(
--    n integer[]
-- );

-- insert into temp values
--    (array[1,2,3]),
--    (array[1,3,2]),
--    (array[2,1,3]),
--    (array[2,3,1]),
--    (array[3,1,2]),
--    (array[3,2,1])

-- select distinct (array(select unnest(q.n) order by 1)) from temp q;

create or replace function coOccur(t integer)
returns table(sids int[]) as 
$$
   select distinct array(select unnest(array[s1.sid, s2.sid, s3.sid]) order by 1) from student s1, student s2, student s3
   where s1.sid<>s2.sid and s1.sid<>s3.sid and s2.sid<>s3.sid and cardinality(
         (select set_intersection(
            (select books from studentbuysbooks where sid=s1.sid), 
            set_intersection(
               (select books from studentbuysbooks where sid=s2.sid), 
               (select books from studentbuysbooks where sid=s3.sid)
            )
         ))
      ) >= t;
$$ language sql;

\qecho 'coOccur 0'
\qecho 'The number of triples is'
select count(*) from coOccur(0);

\qecho 'coOccur 1'
\qecho 'The number of triples is'
select count(*) from coOccur(1);

\qecho 'coOccur 2'
\qecho 'The number of triples is'
select count(*) from coOccur(2);

\qecho 'coOccur 3'
\qecho 'The number of triples is'
select count(*) from coOccur(3);

-- Data for problem 15 through 18

DROP TABLE IF EXISTS Student CASCADE;

CREATE TABLE student (sid TEXT, sname TEXT, major TEXT, byear INT);
INSERT INTO student VALUES
('s100', 'Eric'  , 'CS'     , 1988),
('s101', 'Nick'  , 'Math'   , 1991),
('s102', 'Chris' , 'Biology', 1977),
('s103', 'Dinska', 'CS'     , 1978),
('s104', 'Zanna' , 'Math'   , 2001),
('s105', 'Vince' , 'CS'     , 2001);

CREATE TABLE course (cno TEXT, cname TEXT, dept TEXT);
INSERT INTO course VALUES
('c200', 'PL'      , 'CS'),
('c201', 'Calculus', 'Math'),
('c202', 'Dbs'     , 'CS'),
('c301', 'AI'      , 'CS'),
('c302', 'Logic'   , 'Philosophy');

CREATE TABLE enroll (sid TEXT, cno TEXT, grade TEXT);
insert into enroll values 
     ('s100','c200', 'A'),
     ('s100','c201', 'B'),
     ('s100','c202', 'A'),
     ('s101','c200', 'B'),
     ('s101','c201', 'A'),
     ('s102','c200', 'B'),
     ('s103','c201', 'A'),
     ('s101','c202', 'A'),
     ('s101','c301', 'C'),
     ('s101','c302', 'A'),
     ('s102','c202', 'A'),
     ('s102','c301', 'B'),
     ('s102','c302', 'A'),
     ('s104','c201', 'D');

\qecho 'Problem 15'

-- (cno, gradeInfo{(grade, students{(sid)})})

create type studentType as (sid text);
create type courseType as (sid text);
create type gradeStudentsType as (grade text, students studentType[]);

create or replace view courseGrades as (
   with a as (select cno, grade, array_agg(row(sid)::studentType) as students from enroll group by (cno, grade) order by 1,2),
   b as (select cno, array_agg(row(grade, students)::gradeStudentsType)as gradeInfo from a group by (cno) order by 1)
   select * from b
);

select * from courseGrades order by 1;

\qecho 'Problem 16'
\qecho 'Problem 16.a'
-- Find each pair (c, S) where c is the cno of a course and S is the set of sids of students 
-- who received an ‘A’ but not a ‘B’ in course c.
-- The type of your answer relation should be (cno : text, Students : {(sid : text)})

select cg.cno, g.students from courseGrades cg, unnest(cg.gradeInfo) g where g.grade = 'A' and g.grade<>'B' order by 1;

\qecho 'Problem 16.b'
-- Find each (s, C) pair where s is the sid of a students and C is the set of cnos of courses 
-- in which the student received an ‘A’ or a ‘B’ but not a ‘C’. 
-- The type of your answer relation should be (sid : text, Courses : {(cno : text)}).

select s.sid, array_agg(cg.cno) from courseGrades cg, unnest(cg.gradeInfo) g, unnest(g.students) s 
where (g.grade='A' or g.grade='B') and g.grade<>'C' group by s.sid order by 1;

\qecho 'Problem 17'

create or replace view jcourseGrades as (
   with a as (select e.cno, e.grade, json_agg(json_build_object('sid', e.sid)) as students from enroll e group by (e.cno, e.grade) order by 1,2),
   b as (select jsonb_build_object('cno', cno, 'gradeInfo', json_agg(json_build_object('grade', grade, 'students', students))) as courseInfo from a group by (cno))
   select * from b
);

select * from jcourseGrades;

\qecho 'Problem 18'
\qecho 'Problem 18.a'
-- Find each pair (c, s) where c is the cno of a course and s is the sid of a student who received an ‘A’ in course c. 
-- The type of your answer relation should be (cno:text, sid:text).
select jcg.courseInfo->>'cno' as cno, s->>'sid' as sid from jcourseGrades jcg, jsonb_array_elements(jcg.courseInfo->'gradeInfo') g, jsonb_array_elements(g->'students') s 
where g->'grade'='"A"';

\qecho 'Problem 18.b'
-- Find each pair ({c1, c2}, S) where c1 and c2 are the course numbers of two different courses 
-- and S is the set of sids of students who received a ’A’ in both courses c1 and c2. 
-- The type of your answer relation should be (coursePair : {(cno : text)}, Students : {(sid : text))}.

with 
   E as (
   select row(jcg.courseInfo->>'cno')::courseType as cno from jcourseGrades jcg ),
   F as (
   select row(jcg.courseInfo->>'cno')::courseType as cno, array_agg(row(s->>'sid')::studentType) as students from jcourseGrades jcg, jsonb_array_elements(jcg.courseInfo->'gradeInfo') g, jsonb_array_elements(g->'students') s
   where g->>'grade'='A' group by jcg.courseInfo->>'cno'),
   G as (
      select cno, students from F
      union
      select cno, array[]::studentType[] from E where cno in (
         select cno from E
         except
         select cno from F
      )
   )

select distinct array(select unnest(array[g1.cno, g2.cno]) order by 1) as coursePair, (select set_intersection(g1.students, g2.students)) as students
from G g1, G g2 where g1.cno<>g2.cno;

-- Connect to default database
\c postgres

-- Drop database created for this assignment

DROP DATABASE dvgfall2022assignment5;




