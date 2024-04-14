-- Script for B561 Fall 2022 Assignment 7

create database dvgassignment7;

\c dvgassignment7


\qecho 'Problem 8'

--- Topological sort
create table V(node int);
create table E(source int, target int);


insert into V values
   (1), (2), (3), (4), (5), (6), (7), (8), (9), (10), (11), (12);

insert into E values
   (1,2),
   (1,3),
   (1,4),
   (2,5),
   (2,6),
   (3,7),
   (4,8),
   (5,9),
   (7,10),
   (7,11),
   (9,12);


\qecho 'Problem 9'
-- Dijkstra Algorithm

create table Graph(source int,
                   target int,
                   weight int);

insert into Graph values
  (0,1,2),
  (1,0,2),
  (0,4,10),
  (4,0,10),
  (1,3,3),
  (3,1,3),
  (1,4,7),
  (4,1,7),
  (2,3,4),
  (3,2,4),
  (3,4,5),
  (4,3,5),
  (4,2,6),
  (2,4,6);

\qecho 'Problem 10'

create table partSubpart(pid int, sid int, quantity int);
create table basicPart(pid int, weight int);

insert into partSubpart values 
   (1,2,1),
   (1,3,3),
   (1,4,2),
   (2,5,1),
   (2,6,4),
   (3,7,2),
   (4,8,1),
   (5,9,2),
   (7,10,2),
   (7,11,3),
   (9,12,5);

insert into basicPart values
  (6,  1),
  (8,  4),
  (10, 1),
  (11, 5),
  (12, 3);

\qecho 'Problem 10.a'

-- Write a {\bf recursive} function {\tt recursiveAggregatedWeight(p
-- integer)} that returns the aggregated weight of a part {\tt p}.

\qecho 'Problem 10.b'

-- Write a {\bf non-recursive} function {\tt
-- nonRecursiveAggregatedWeight(p integer)} that returns the aggregated
-- weight of a part {\tt p}.  Test your function.


\qecho 'Problem 11'

-- Write a PostgreSQL program frequentSets(t int) that returns the sets
-- of all t-frequent sets.

create table personSkills(doc int, words text[]);

insert into personSkills values
  (1, '{"A", "B", "C", "D", "E"}'),
  (2, '{"A", "B", "C", "E", "F"}'),
  (3, '{"A", "E", "F"}'),
  (4, '{"E", "A"}');



\qecho 'Problem 12' 
-- Hamiltonian

\qecho 'Problem 12.a'

-- Write a {\bf recursive} function {\tt recursiveHamiltonian()} that
-- returns {\tt true} if the graph stored in {\tt Graph} is
-- Hamiltonian, and {\tt false} otherwise.

drop table Graph;
create table Graph(source int, target int);


-- Test your function on the following graphs.


-- delete from Graph;
-- insert into Graph values (1,2), (2,3), (3,1);

delete from Graph;
insert into Graph values
 (1,2),
 (2,3),
 (3,4),
 (4,1);

-- select recursiveHamiltonian();

delete from Graph;
insert into Graph values
 (1,2),
 (2,3),
 (3,1),
 (4,5),
 (5,4);

-- select recursiveHamiltonian();

\qecho 'Problem 12.b'

-- Write a {\bf non-recursive} function {\tt nonRecursiveHamiltonian}
-- that returns {\tt true} if the graph stored in {\tt Graph} is
-- Hamiltonian, and {\tt false} otherwise. 

delete from Graph;
insert into Graph values
 (1,2),
 (2,3),
 (3,4),
 (4,1);

-- select nonRecursiveHamiltonian();

delete from Graph;
insert into Graph values
 (1,2),
 (2,3),
 (3,1),
 (4,5),
 (5,4);

-- select nonRecursiveHamiltonian();

delete from Graph;
insert into Graph values
 (1,2),
 (2,3),
 (3,4),
 (4,5),
 (5,6),
 (6,7),
 (7,8),
 (8,9),
 (9,10),
 (10,1);


-- select nonRecursiveHamiltonian();

delete from Graph;
insert into Graph values
 (1,2),
 (2,3),
 (3,4),
 (4,5),
 (5,6),
 (6,7),
 (7,8),
 (8,9),
 (9,10);

-- select nonRecursiveHamiltonian();


\qecho 'Problem 13'

delete from Graph;

insert into Graph values
 (1,2),
 (2,3),
 (3,4),
 (4,5),
 (5,1);


-- select threeColorable();


delete from Graph;
insert into Graph values
 (1,2),
 (2,1),
 (1,3),
 (3,1),
 (1,4),
 (4,1),
 (2,3),
 (3,2),
 (2,4),
 (4,2),
 (3,4),
 (4,3);


-- select threeColorable();


\qecho 'Problem 14'

create table dataSet(p integer, x float, y float);

insert into dataSet values
 (1, 1, 1),
 (2, 1, 2),
 (3, 1, 3),
 (4, 1, 4),
 (5, 1, 5),
 (6, 1, 6),
 (7, 1, 7),
 (8, 1, 8),
 (9, 1, 9),
 (10, 1, 10),
 (11, 2, 1),
 (12, 2, 2),
 (13, 2, 3),
 (14, 2, 4),
 (15, 2, 5),
 (16, 2, 6),
 (17, 2, 7),
 (18, 2, 8),
 (19, 2, 9),
 (20, 2, 10),
 (21, 3, 1),
 (22, 3, 3),
 (23, 3, 4),
 (24, 3, 5),
 (25, 3, 6),
 (26, 3, 7),
 (27, 3, 8),
 (28, 3, 9),
 (29, 4, 1),
 (30, 4, 2),
 (31, 4, 4),
 (32, 4, 5),
 (33, 4, 6),
 (34, 4, 7),
 (35, 4, 8),
 (36, 4, 9),
 (37, 4, 10),
 (38, 5, 2),
 (39, 5, 4),
 (40, 5, 5),
 (41, 5, 6),
 (42, 5, 8),
 (43, 5, 9),
 (44, 5, 10),
 (45, 6, 2),
 (46, 6, 3),
 (47, 6, 4),
 (48, 6, 5),
 (49, 6, 6),
 (50, 6, 7),
 (51, 6, 8),
 (52, 6, 9),
 (53, 6, 10),
 (54, 7, 2),
 (55, 7, 3),
 (56, 7, 5),
 (57, 7, 6),
 (58, 7, 7),
 (59, 7, 8),
 (60, 7, 9),
 (61, 7, 10),
 (62, 8, 2),
 (63, 8, 3),
 (64, 8, 4),
 (65, 8, 5),
 (66, 8, 6),
 (67, 8, 7),
 (68, 8, 8),
 (69, 8, 9),
 (70, 9, 2),
 (71, 9, 3),
 (72, 9, 4),
 (73, 9, 5),
 (74, 9, 7),
 (75, 9, 8),
 (76, 9, 9),
 (77, 9, 10),
 (78, 10, 2),
 (79, 10, 3),
 (80, 10, 4),
 (81, 10, 5),
 (82, 10, 6),
 (83, 10, 7),
 (84, 10, 8);



-- select * from kMeans(1);

-- select * from kMeans(2);

-- select * from kMeans(3);

-- select * from kMeans(4);


 



 




\c postgres
drop database dvgassignment7;

