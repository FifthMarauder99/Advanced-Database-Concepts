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


create table subGraph (source int, target int);

create or replace function inDegreeZeroVertex() returns integer as
$$
   select source 
   from   subGraph e
   where  source not in (select target
                         from   subGraph);
$$ language sql;


create or replace function someTopologicalSort() 
returns int[] as
$$
declare n integer;
        topologicalOrder int[] := '{}';
begin
   drop table if exists subGraph;
   create table subGraph (source int, target int);
   insert into subGraph select * from E;

    while exists (select 1 from subGraph)
    loop
      n := (select inDegreeZeroVertex());
      topologicalOrder := array_append(topologicalOrder, n);
      delete from subGraph where source = n;   
    end loop;

    return array_cat(topologicalOrder, 
                     (select array(select node
                                   from   V
                                   where  node not in (select unnest(topologicalOrder)))));
end;
$$ language plpgsql;

-- table V;
-- table E;

select * from someTopologicalSort();

\qecho 'Problem 8.b'
-- Find all topological sort in (V,E)

-- Recursive solution
/* create or replace function Ordering(currentV int[]) 
returns   table (ordering int[]) as
$$
select array[node]
from   unnest(currentV) node
where  not exists (select 1
                   from   E e
		   where  e.target = node)
union
select array_append(ordering,node)
from   unnest(currentV) node, lateral(select ordering
                                     from   Ordering(array_remove(currentV, node))) o
where  not (ordering && array(select target
                              from   E
			      where  source = node));
$$ language sql;

create or replace function allTopologicalSorts()
returns table (topologicalSort int[]) as
$$
 select * from Ordering(array(select node from V))
 where  cardinality(ordering) = cardinality(array(select node from V));
$$ language sql;

*/

-- iterative solution

create table Prev_Ordering(ordering int[]);
create table Ordering(ordering int[]);


create or replace function allTopologicalSorts()
returns table(topologicalSort int[]) as
$$
begin
insert into Ordering select array[node]
                     from   V
		     where  not exists (select 1
		                        from   E
					where  target = node);


for i in 1..((select count(1) from V)-1)
loop
   insert into Prev_Ordering select * from Ordering;
   delete from Ordering;

   insert into Ordering select array_append(ordering, node)
                        from   Prev_Ordering o, lateral (select node from V
			                                 except
					                 select unnest(o.ordering)) V
			where  not exists (select 1
			                   from   E
					   where  source = node and
					          target = any(ordering));

   delete from Prev_Ordering;
end loop;

return query (select * from ordering);
end;
$$ language plpgsql;


\qecho 'Total number of topological sorts'
select count(1) as ct_allTopologicalSorts from allTopologicalSorts();



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

-- The table Distance tracks the distance between a source node and each other Node in
-- the graph
CREATE TABLE  Distance (Node INTEGER, Dist INTEGER);


-- This function executes Dijkstra's algorithm 
CREATE OR REPLACE FUNCTION Dijkstra (source INTEGER) 
RETURNS TABLE (target INTEGER, distance INTEGER) AS
$$
  BEGIN
  DROP TABLE IF EXISTS Distance;
  CREATE TABLE  Distance (Node INTEGER, Dist INTEGER);
  -- Initially populate the 'Path' table with the adjacent nodes of the 'source' nodes 
  -- along with their respective 'weight' 
  
  INSERT INTO Distance SELECT source, 0;
 
   -- Keep adding nodes to the table of path and distances until all nodes that
  -- can be reached from the sources have been added
  
  WHILE (EXISTS(SELECT 1
                FROM   Graph g
                WHERE  g.source in (select d.node
                                    from   Distance d 
		                    where  g.target NOT IN (SELECT d1.node
                                                            FROM   Distance d1
                                                            WHERE  d1.dist <= d.dist + g.weight))))
  LOOP
    -- Add nodes that are immediate neighbors of the nodes that have already
    -- been added to the path's table
    INSERT INTO Distance (SELECT g.target, d.dist+g.weight
                          FROM   Distance d JOIN Graph g on (d.node = g.source)
                          WHERE  g.target not in (SELECT d1.Node
                                                  FROM   Distance d1
                                                  WHERE  d1.Dist <= (d.Dist+g.Weight)));
   END LOOP;

   RETURN QUERY (SELECT d.node, dist
                 FROM   Distance d
                 WHERE  d.node not in (SELECT d1.node
                                       FROM   Distance d1
                                       WHERE  d.dist > d1.dist));
  END;
$$ LANGUAGE PLPGSQL;

-- table Graph;

WITH Node(node) as (select source
                    from Graph
		    union
		    select target from Graph)
SELECT n.node as source, q.target as target, distance
FROM   Node n, lateral (select target, distance from Dijkstra(n.node)) q order by 1, 3, 2;

drop table Graph;


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

-- The solution is based on the following rules: 
-- ps_triples(p,s,q) :- partsubpart(p,s,q)                                                                         
-- ps_triples(p,s,q*q1) :- ps_triples(p,s1,q1), partsubpart(s1,s,q)                                                       

-- The ps_triples relation contains each triple (p,s,q) where "p" is a
-- part, "s" is a direct or indirect subpart of "p" and "q" is
-- quantity with which "s" occurs as as subpart of "p".

-- We can then compute the weight of each part "p"
-- by computing the sum of the quantities of
-- the basics part of "p" multiplied by their respective weight

/*
WITH RECURSIVE ps_triples(pid,sid,quantity) AS (
    SELECT pid, sid, quantity FROM partSubPart
    UNION
    SELECT ps1.pid, ps2.sid, ps1.quantity*ps2.quantity
    FROM   ps_triples ps1 JOIN partSubPart ps2 ON (ps1.sid = ps2.pid))
SELECT ps.pid, SUM(ps.quantity*bp.weight) as aggregatedweight
FROM   ps_triples ps JOIN basicPart bp ON (ps.sid=bp.pid)
GROUP  BY(ps.pid)
UNION 
SELECT pid, weight
FROM   basicPart order by 1;
*/

-- We can turn these ideas into a function AggregatedWeight(p)
-- which computes the aggregated weight of part "p"

CREATE OR REPLACE FUNCTION recursiveAggregatedWeight(part int)
RETURNS bigint AS
$$
WITH RECURSIVE subPart(sid,quantity) AS (
    SELECT sid, quantity FROM partSubPart WHERE pid = part
    UNION
    SELECT ps.sid, s.quantity*ps.quantity
    FROM   subPart s JOIN partSubPart ps ON (s.sid = ps.pid))
SELECT weight
FROM   (SELECT SUM(quantity*weight) as weight
        FROM   subPart JOIN basicPart ON (sid=pid)) q
WHERE  part NOT IN (SELECT pid FROM basicPart)
UNION 
SELECT weight
FROM   basicPart 
WHERE  pid = part;
$$ LANGUAGE SQL;

-- The following query computes the aggregated weight of each part

/*
with part as (select pid from partSubPart 
              union
              select pid from basicPArt)
select pid as part, recursiveAggregatedWeight(pid) as weight 
from   part order by 2;

-- Test your function.
-- Run the following query which for each part, computed is aggregatd
-- weight
*/

with part as 
  (select pid as P
   from   partSubPart
   union  
   select sid as P
   from   partSubpart)
select part.P, recursiveAggregatedWeight(part.P) 
from   part order by 1;




\qecho 'Problem 10.b'

-- Write a {\bf non-recursive} function {\tt
-- nonRecursiveAggregatedWeight(p integer)} that returns the aggregated
-- weight of a part {\tt p}.  Test your function.

-- The following is a iterative solution for the same problem

create table if not exists ps_triples(pid int, sid int, quantity int);
delete from ps_triples;

create or replace function new_ps_triples()
returns table (pid integer, sid integer, quantity integer) as
$$
  select  t.pid, ps.sid, t.quantity*ps.quantity
  from    ps_triples t, partSubpart ps
  where   t.sid = ps.pid
  except
  select  * from ps_triples;
$$ language sql;


-- the function ps_triples computes for each part each of its basic
-- subpart along with the number of times that that subpart occurs

create or replace function ps_triples()
returns table (pid integer, sid integer, quantity integer) as
$$
begin
   drop table ps_triples;
   create table ps_triples(pid integer, sid integer, quantity integer);

   insert into ps_triples select * from partSubPart;

   while exists( select * from new_ps_triples())
   loop
     insert into ps_triples select * from new_ps_triples();
   end loop;

   return query (select * from ps_triples ps
                 where  ps.sid in (select p.pid from basicPart p) order by 1,2);
end;
$$ language plpgsql;

-- the function aggregatedWeight returns for each part (including
-- basic parts), the aggregated cost of that part

create or replace function nonRecursiveAggregatedWeight(p integer) returns bigint as
$$
   select  sum(q.quantity*bp.weight)
   from    (select * from ps_triples() part where part.pid=p) q, basicPart bp
   where   q.sid = bp.pid
   group   by (q.pid)
   union
   select weight
   from   basicpart
   where  pid=p;
$$ language sql;

-- Test

with part as (select pid from partSubPart 
              union
              select pid from basicPart)
select pid as part, nonRecursiveAggregatedWeight(pid) as weight 
from   part order by 1;

\qecho 'Problem 11'

-- Write a PostgreSQL program frequentSets(t int) that returns the sets
-- of all t-frequent sets.

create table personSkills(pid int, skills text[]);

insert into personSkills values
  (1, '{"A", "B", "C", "D", "E"}'),
  (2, '{"A", "B", "C", "E", "F"}'),
  (3, '{"A", "E", "F"}'),
  (4, '{"E", "A"}');


create table if not exists Skill(skill text);
delete from Skill;

-- The relation "Skill" contains all the skills that occur in the
-- personSkill input.  The frequent itemsets will be some of the
-- subsets of the relation "Skill".

insert into Skill
 select distinct unnest(skills)
 from   personSkills order by 1;

-- The relation "Candidates" will contain

-- drop table if exists Candidates;
create table Candidates(C text[]);

-- The relation "FrequentSets" will at any time contains subsets of
-- "Skill" that are frequent according to a certain threshold "t".
-- Initially this set will be empty and at the end it will contain all
-- of the frequent sets.

-- drop table if exists FrequentSets;
create table FrequentSets(F text[]);
insert into FrequentSets values ('{}');

-- The function addSkill adds a skill "skill" to a set of skills "S".

create or replace function addSkill(S text[], skill text) returns text[] as
$$
   select array( select UNNEST(S) union select skill order by 1);
$$ language sql;

-- The function removeSkill removes a skill "skill" from a set of
-- skills "S".

create or replace function removeSkill(S text[], skill text) returns text[] as
$$
   select array( select UNNEST(S) except select skill order by 1);
$$ language sql;

-- This function determines if X is frequent by counting the the
-- number of documents whose words contain X.  If this number is at
-- least "t" than X is frequent.

create or replace function isFrequent(X text[], t integer)
returns boolean as
$$
   select (select count(1)
           from   personSkills
           where  X <@ skills) >= t;
$$ language sql;


   drop table if exists Frequentsets;
   create table Frequentsets(F text[]);

   -- add the emptyset to frequentSets since it is frequent for any
   -- threshold "t"

   insert into FrequentSets select array[]::text[];

--   drop table if exists nextLevelFrequentSets;
   create table  nextLevelFrequentSets(F text[]);

  --  add the emptyset to nextLevelFrequentSets since it is frequent
  --  for any threshold "t"

   insert into nextLevelFrequentSets select array[]::text[];

--   drop table if exists currentLevelFrequentSets;
   create table  currentLevelFrequentSets(F text[]);

   insert into currentLevelFrequentSets select * from nextLevelFrequentSets;



-- This is the apriori pruning rule Given a itemset C, we consider
-- each set of the form C - {skill} where skill is in C.  I.e., we
-- consider each strict subset of C with one less element than C.  If
-- one of these subsets in not frequent then we can deduce that C can
-- not be frequent either.  On the other end, if each of these subset
-- is frequent then we need to proceed with C and determine whether or
-- not it is frequent.

create or replace function isCandidate(C text[]) returns boolean as
$$
select not exists(select  1
                  from    UNNEST(C) skill
                  where   removeSkill(C,skill)::text[] not in (select F::text[] from currentLevelFrequentSets));
$$ language sql;

-- This function produces new Candidates by considering each
-- discovered frequent set "F" at the prior level and adding to it
-- each word in "word" that is not already in F.

create or replace function new_Candidates()
returns table (C text[]) AS
$$
  select   distinct addSkill(F::text[],skill)::text[]
  from     currentLevelFrequentSets F, Skill
  where    not(array[skill]::text[] <@ F::text[])  -- this checks if "skill" is not already in F
           and isCandidate(addSkill(F::text[], skill)::text[]);
$$ language sql;


create or replace function FrequentSets(t integer)
returns table(frequentSet text[]) as
$$
begin

--   drop table if exists Candidates; create table Candidates(C
--   text[]);

   drop table if exists Frequentsets;
   create table Frequentsets(F text[]);

-- add the emptyset to frequentSets since it is frequent for any
-- threshold "t"

   insert into FrequentSets select array[]::text[];

   drop table if exists nextLevelFrequentSets;
   create table  nextLevelFrequentSets(F text[]);

--  add the emptyset to nextLevelFrequentSets since it is frequent
--  for any threshold "t"

   insert into nextLevelFrequentSets select array[]::text[];

   drop table if exists currentLevelFrequentSets;
   create table  currentLevelFrequentSets(F text[]);

   insert into currentLevelFrequentSets select * from nextLevelFrequentSets;


   while exists(select 1 from new_Candidates())
   loop

        -- We store in "currentLevelFrequentSets the current frequent
        -- sets on the level determined by the loop
        -- "currentLevelFrequentSets" is used in new_Candidates() and
        -- is_Candidate()
        delete from currentLevelFrequentSets;
        insert into currentLevelFrequentSets select * from nextLevelFrequentSets;

        delete from nextLevelFrequentSets;
        insert into nextLevelFrequentSets select C from new_Candidates()
                                             where  isfrequent(C,t); -- and C not in (select * from frequentsets);
        insert into FrequentSets select * from nextLevelFrequentSets;
   end loop;

   return query (select * from FrequentSets);

end;
$$ language plpgsql;


-- Tests:

\qecho 'frequentSets(0)'
select * from frequentSets(0) order by 1;

\qecho 'frequentSets(1)'
select * from frequentSets(1) order by 1;

\qecho 'frequentSets(2)'
select * from frequentSets(2) order by 1;

\qecho 'frequentSets(3)'
select * from frequentSets(3) order by 1;

\qecho 'frequentSets(4)'
select * from frequentSets(4) order by 1;

\qecho 'frequentSets(5)'
select * from frequentSets(5) order by 1;


\qecho 'Problem 12' 
-- Hamiltonian

\qecho 'Problem 12.a'

-- Write a {\bf recursive} function {\tt recursiveHamiltonian()} that
-- returns {\tt true} if the graph stored in {\tt Graph} is
-- Hamiltonian, and {\tt false} otherwise.

create table Graph(source int, target int);

create or replace function recursiveGraphPath(graphNodes int[]) 
returns   table (path int[]) as
$$
select '{}'
union 
select array[node]
from   unnest(graphNodes) node
union
select array_append(p.path,node)
from   unnest(graphNodes) node, lateral(select path
                                        from   recursiveGraphPath(array_remove(graphNodes, node))) p
where  (p.path[array_upper(p.path,1)],node) in (select * from Graph);                                
$$ language sql;

create or replace function recursiveHamiltonianPath()
returns table (hamiltonPath int[]) as
$$
with graphNode as (select source from Graph
                   union
                   select target from Graph)
select path
from   recursiveGraphPath(array(select * from graphNode)) 
where  cardinality(path) = (select count(1) 
                            from   graphNode) and
       (path[array_upper(path,1)],path[1]) in (select * from   Graph);
$$ language sql;


create or replace function recursiveHamiltonian()
returns boolean as
$$
select exists(select recursiveHamiltonianPath());
$$ language sql;

-- Test your function on the following graphs.

delete from Graph;
insert into Graph values
 (1,2),
 (2,3),
 (3,4),
 (4,1);

\qecho 'Test on following data'
table graph;
select recursiveHamiltonian();

delete from Graph;
insert into Graph values
 (1,2),
 (2,3),
 (3,1),
 (4,5),
 (5,4);

\qecho 'Test on following data'
table graph;
select recursiveHamiltonian();


\qecho 'Problem 12.b'

-- Write a {\bf non-recursive} function {\tt nonRecursiveHamiltonian}
-- that returns {\tt true} if the graph stored in {\tt Graph} is
-- Hamiltonian, and {\tt false} otherwise. 



create table graphNode(node int);
create table graphPath(path int[]);

create or replace function nonRecursiveHamiltonian()
returns boolean as
$$
declare
   i int;
   ct_nodes int;
begin
  drop table graphNode;
  create table graphNode(node int);
  insert into graphNode (select source from Graph union select target from Graph);

  drop table graphPath;
  create table graphPath(path int[]);
  insert into graphPath values ('{}'::int[]);
  insert into graphPath select array[node] from graphNode;

  ct_nodes := (select count(1) from graphNode);
  
  for i in 1..ct_nodes loop
     insert into   graphPath select array_append(p.path::int[],n.node::int)
                             from   graphPath p, graphNode n
                             where  n.node not in (select * from unnest(p.path)) and
                                    cardinality(p.path) = i-1 and
                                    (p.path[cardinality(p.path)],n.node) in (select * from Graph);
     delete from graphPath p where cardinality(p.path) = i-1;                                    
  end loop;

  return (select exists (select p.path
                         from   graphPath p
                         where  cardinality(p.path) = ct_nodes and
                                (p.path[cardinality(p.path)],p.path[1]) in (select * from Graph)));
end;
$$ language plpgsql;



delete from Graph;
insert into Graph values
 (1,2),
 (2,3),
 (3,4),
 (4,1);

\qecho 'Test on following data'
table graph;

select nonRecursiveHamiltonian();

delete from Graph;
insert into Graph values
 (1,2),
 (2,3),
 (3,1),
 (4,5),
 (5,4);

\qecho 'Test on following data'
table graph;
select nonRecursiveHamiltonian();

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

\qecho 'Test on following data'
table graph;
select nonRecursiveHamiltonian();

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

\qecho 'Test on following data'
table graph;
select nonRecursiveHamiltonian();

drop table graph cascade;


\qecho 'Problem 13'

create table color(color text);
insert into color values ('red'),('green'),('blue');

create table Graph(source integer, target integer);

create or replace function isColoring(ncoloring text[])
returns boolean as
$$
select not exists (select 1
                   from   Graph 
		   where  ncoloring[source] = ncoloring[target])
$$ language sql;

create or replace function coloring(ct_Nodes int) 
returns   table (ncoloring text[]) as
$$
  select array[color] from Color
  where  ct_Nodes = 1
  union
  select array_append(ncoloring, color)
  from   coloring(ct_Nodes - 1), Color
  where  ct_Nodes >= 2 and isColoring(array_append(ncoloring,color));
$$ language sql;

create or replace function threeColorable()
returns boolean as
$$
select exists (select * from coloring( (select count(1)::int
                                        from   (select source from graph
					        union
						select target from graph) node)));
$$ language sql;

insert into Graph values
 (1,2),
 (2,3),
 (3,4),
 (4,5),
 (5,1);

\qecho 'Test on following data'
table graph;
select threeColorable();

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

\qecho 'Test on following data'
table graph;
select threeColorable();


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
 (2, 5, 8),
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


-- Create the data set table of points that are to be used to create the clusters

CREATE TABLE Centroids (cid INTEGER, X FLOAT, Y FLOAT);
-- This tracks the centroid that each data point is assigned to
CREATE TABLE Cluster_Assignments (CId INTEGER, PId INTEGER, X FLOAT, Y FLOAT);
-- This tracks the previous cluster assignment of each data points
CREATE TABLE Prev_Cluster_Assignments (CId INTEGER, PId INTEGER, X FLOAT, Y FLOAT);




-- This view tracks the number of data points in the data set
CREATE VIEW N AS (SELECT COUNT(1) FROM dataSet);

-- This function returns the number of data points that switched clusters
-- between iterations of the KMeans algorithm.
-- It takes nothing as input.

CREATE OR REPLACE FUNCTION Switched () RETURNS BIGINT AS
$$
  SELECT COUNT(1)
  FROM Cluster_Assignments ca, Prev_Cluster_Assignments pca
  WHERE ca.PId = pca.PId AND ca.CId <> pca.CId;
$$ LANGUAGE SQL;

-- This function takes a X FLOAT and Y FLOAT value as input and returns an
-- INTEGER representing the cluster the given point should be assigned to
CREATE OR REPLACE FUNCTION Assign_Cluster(xval FLOAT, yval FLOAT) RETURNS INTEGER AS
$$
  SELECT c_one.CId
  FROM Centroids c_one
  WHERE NOT EXISTS (SELECT c_two.CId
                   FROM Centroids c_two
                   WHERE |/((c_one.X - xval)^2.0 + (c_one.Y - yval)^2.0) > |/((c_two.X - xval)^2.0 + (c_two.Y - yval)^2.0));
$$ LANGUAGE SQL;

-- This is the kmeans function that learns that finds k centroids that define
-- the center of mass for the possible clusters in the data
-- It takes an INTEGER value k representing the number of centroids to learn
-- as input
CREATE OR REPLACE FUNCTION KMeans(k INTEGER) RETURNS TABLE (cid BIGINT, X FLOAT, Y FLOAT) AS
$$
  DECLARE counter INT := 1;
  BEGIN


  -- Populate the centroids table with k random points from the dataSet table
  INSERT INTO Centroids (SELECT p.p as CId, p.X, p.Y
                         FROM dataSet p ORDER BY random() limit k);
--   WHILE (NOT EXISTS(SELECT * FROM Prev_Cluster_Assignments) OR (counter < 1000))
     WHILE (counter <= 25)
--         CAST(Switched() AS FLOAT) / CAST((SELECT * FROM N) AS FLOAT) > .1) 
         LOOP
         -- Clear the table tracking the previous cluster each data point was
         -- assigned to.
         DELETE FROM Prev_Cluster_Assignments;
         -- Move data from the current to the previous cluster assignments table
         INSERT INTO Prev_Cluster_Assignments (SELECT * FROM Cluster_Assignments);
         -- Re-assign the clusters
         INSERT INTO Cluster_Assignments (SELECT Assign_Cluster(CAST(p.x AS FLOAT), CAST(p.y AS FLOAT)), p.p, p.X, p.Y
                                          FROM dataSet p);
        -- Update the centroids
        DELETE FROM Centroids;
        -- Update the centroids
        INSERT INTO Centroids (SELECT ca.CId,
                                      CAST(SUM(ca.X) AS FLOAT)/CAST(COUNT(1) AS FLOAT) AS X,
                                      CAST(SUM(ca.Y) AS FLOAT)/CAST(COUNT(1) AS FLOAT) AS Y
                               FROM Cluster_Assignments ca
                               GROUP BY(ca.CId));
        counter := counter + 1;

  END LOOP;
  RETURN QUERY (SELECT rank() over (order by C.x, C.y), C.x::float, C.y::float FROM Centroids C);
  END;
$$ LANGUAGE PLPGSQL;

\qecho 'Test kMeans(1)'
select * from kMeans(1);

--delete from N;
delete from Cluster_Assignments;
delete from Prev_Cluster_Assignments;
delete from Centroids;

\qecho 'Test kMeans(2)'
select * from kMeans(2);

--delete from N;
delete from Cluster_Assignments;
delete from Prev_Cluster_Assignments;
delete from Centroids;

\qecho 'Test kMeans(3)'
select * from kMeans(3);

--delete from N;
delete from Cluster_Assignments;
delete from Prev_Cluster_Assignments;
delete from Centroids;

\qecho 'Test kMeans(4)'
select * from kMeans(4);

-- The computations are done, so drop the tables
DROP VIEW IF EXISTS N;
DROP TABLE IF EXISTS Cluster_Assignments;
DROP TABLE IF EXISTS Prev_Cluster_Assignments;
DROP TABLE IF EXISTS Centroids;
DROP TABLE IF EXISTS dataSet;

-- Computations are done, so drop the functions
DROP FUNCTION IF EXISTS Switched ();
DROP FUNCTION IF EXISTS Assign_Cluster (FLOAT, FLOAT);
DROP FUNCTION IF EXISTS KMeans (INTEGER);


\qecho 'Problem 15'  

-- Write, in PostgreSQL, a basic MapRe- duce program, i.e., a mapper
-- function and a reducer function, as well as a 3-phases simulation that
-- implements the symmetric difference of two unary relations R(a) and
-- S(a), i.e., the relation (R − S) ∪ (S − R). You can assume that the
-- domain of the attribute ‘a’ is integer.

-- EncodingOfRandS;

create table R(a int); 
insert into R values (1),(2),(3),(4);
create table S(a int);
insert into S values (2),(4),(5);

create table EncodingOfRandS(key text, value jsonb);

insert into EncodingOfRandS
   select 'R' as key, jsonb_build_object('a', r.a) as value
   from   R r
   union
   select 'S' as key, jsonb_build_object('a', s.a) as value
   from   S s
   order by 1;

-- table EncodingOfRandS;

/*
 key |  value   
-----+----------
 R   | \{"a": 1\}
 R   | \{"a": 4\}
 R   | \{"a": 2\}
 R   | \{"a": 3\}
 S   | \{"a": 4\}
 S   | \{"a": 5\}
 S   | \{"a": 2\}
(7 rows)
*/

-- mapper function
CREATE OR REPLACE FUNCTION mapper(key text, value jsonb)
RETURNS TABLE(key jsonb, value text) AS
$$
    SELECT value, key;
$$ LANGUAGE SQL;

-- reducer function
CREATE OR REPLACE FUNCTION reducer(key jsonb, valuesArray text[])
RETURNS TABLE(key text, value jsonb) AS
$$
    SELECT 'R symmetric difference'::text, key
    WHERE  ARRAY['R'] <@ valuesArray and not (ARRAY['S'] <@ valuesArray)
    UNION
    SELECT 'R symmetric difference'::text, key
    WHERE  ARRAY['S'] <@ valuesArray and not (ARRAY['R'] <@ valuesArray);

--    EXCEPT
--     SELECT 'R symmetric difference S'::text, key
--     WHERE  not(ARRAY['R','S'] <@ valuesArray);
$$ LANGUAGE SQL;

-- 3-phases simulation of MapReduce Program followed by a decoding step
WITH
Map_Phase AS (
    SELECT m.key, m.value
    FROM   encodingOfRandS, LATERAL(SELECT key, value FROM mapper(key, value)) m
),
Group_Phase AS (
    SELECT key, array_agg(value) as value
    FROM   Map_Phase
    GROUP  BY (key)
),
Reduce_Phase AS (
    SELECT r.key, r.value
    FROM   Group_Phase, LATERAL(SELECT key, value FROM reducer(key, value)) r
)
SELECT p.value->'a' as a FROM Reduce_Phase p
order by 1;

/*
a 
---
2
4
(2 rows)
*/


\qecho 'Problem 16'

-- Write, in PostgreSQL, a basic MapReduce program, i.e., a mapper func-
-- tion and a reducer function, as well as a 3-phases simulation that
-- implements the semijoin of two relations R(A,B) and S(A,B,C),

-- Test the function on the following relations:

-- Create Tables
DROP TABLE IF EXISTS R;
CREATE TABLE R(
    A INTEGER,
    B INTEGER
);

DROP TABLE IF EXISTS S;
CREATE TABLE S(
    A INTEGER,
    B INTEGER,
    C INTEGER
);

-- Populate table
INSERT INTO R VALUES (1, 2), (2, 4), (3, 6), (4,6);
INSERT INTO S VALUES (1, 2, 7), (2, 5, 8), (1, 4, 9), (3, 6, 10), (5, 7, 11);

-- EncodingofRandS

drop table if exists EncodingOfRandS;

create table EncodingOfRandS(key text, value jsonb);

insert into EncodingOfRandS
   select 'R' as Key, json_build_object('a', a, 'b', b)::jsonb as Value
   from   R
   union
   select 'S' as Key, json_build_object('a', a, 'b', b, 'c', c)::jsonb as Value
   from   S order by 1;

table EncodingOfRandS;


-- Map function

CREATE OR REPLACE FUNCTION Map(KeyIn text, ValueIn jsonb)
RETURNS TABLE(KeyOut jsonb, ValueOut jsonb) AS
$$
  SELECT CASE WHEN KeyIn = 'R' THEN ValueIn
         ELSE ValueIn - 'c' END,
         CASE WHEN KeyIn = 'R' THEN jsonb_build_object('RelName', 'R')
         ELSE jsonb_build_object('RelName', 'S') END;
$$ LANGUAGE SQL;


-- select map('R', '{"a": 1, "b":2}'::jsonb);

-- select map('S', '{"a": 2, "b":2, "c": 3}'::jsonb);

CREATE OR REPLACE FUNCTION Reduce(KeyIn jsonb, ValuesIn jsonb[])
RETURNS TABLE(KeyOut text, ValueOut jsonb) AS
$$
    SELECT  'R anti semijoin S'::text, KeyIn
    WHERE   NOT ARRAY['{"RelName": "R"}', '{"RelName": "S"}']::jsonb[] <@ ValuesIn
            AND
            ARRAY['{"RelName": "R"}']::jsonb[] <@ ValuesIn
;
$$ LANGUAGE SQL;


-- Simulate MapReduce Program

WITH
Map_Phase AS (
    SELECT m.KeyOut, m.ValueOut 
    FROM   encodingOfRandS, LATERAL(SELECT KeyOut, ValueOut FROM Map(key, value)) m
),
Group_Phase AS (
    SELECT KeyOut, array_agg(Valueout) as ValueOut
    FROM   Map_Phase
    GROUP  BY (KeyOut)
),
Reduce_Phase AS (
    SELECT r.KeyOut, r.ValueOut
    FROM   Group_Phase gp, LATERAL(SELECT KeyOut, ValueOut FROM Reduce(gp.KeyOut, gp.ValueOut)) r
)
SELECT ValueOut->'a' as A, ValueOut->'b' as B FROM Reduce_Phase order by 1,2;


\qecho 'Problem 17'

-- Write, in PostgreSQL, a basic MapRe- duce program, i.e., a mapper

-- function and a reducer function, as well as a 3-phases simulation that
-- implements the natural join R ◃▹ S of two rela- tions R(A, B) and
-- S(B,C). You can assume that the domains of A, B, and C are
-- integer. Use the encoding and decoding methods described above.


-- Create Tables
DROP TABLE IF EXISTS R;
CREATE TABLE R(
    A INTEGER,
    B INTEGER
);

DROP TABLE IF EXISTS S;
CREATE TABLE S(
    B INTEGER,
    C INTEGER
);

-- Populate table
INSERT INTO R VALUES (1, 2), (2, 4), (3, 6), (4,6);
INSERT INTO S VALUES (2, 7), (2, 5), (6, 4), (6, 8), (5, 7);

-- table R;
-- table S;

-- EncodingofRandS

drop table if exists EncodingOfRandS;

create table EncodingOfRandS(key text, value jsonb);

insert into EncodingOfRandS
   select 'R' as Key, json_build_object('a', a, 'b', b)::jsonb as Value
   from   R
   union
   select 'S' as Key, json_build_object('b', b, 'c', c)::jsonb as Value
   from   S order by 1;

-- table EncodingOfRandS;

-- Map function

CREATE OR REPLACE FUNCTION Map(KeyIn text, ValueIn jsonb)
RETURNS TABLE(KeyOut jsonb, ValueOut jsonb) AS
$$
  SELECT CASE WHEN KeyIn = 'R' THEN ValueIn - 'a'
         ELSE ValueIn - 'c' END,
         CASE WHEN KeyIn = 'R' THEN jsonb_build_object('a', ValueIn -> 'a')
         ELSE jsonb_build_object('c', ValueIn -> 'c') END;
$$ LANGUAGE SQL;

-- Reduce function
CREATE OR REPLACE FUNCTION Reduce(KeyIn jsonb, ValuesIn jsonb[])
RETURNS TABLE(KeyOut text, ValueOut jsonb) AS
$$
   with R as (select distinct e->'a' as    a
              from   unnest(valuesIn) e
              where  not(e->'a') is null),
        S as (select distinct e->'c' as    c
              from   unnest(valuesIn) e
              where  not(e->'c') is null),
        R_cross_join_S as (select jsonb_build_object('a',r.a,'b',keyIn -> 'b', 'c', s.c) as object
                           from   R r, S s)
   select 'R_cross_join_S', object from R_cross_join_S;;
$$ LANGUAGE SQL;

-- Simulate MapReduce Program

WITH
Map_Phase AS (
    SELECT m.KeyOut, m.ValueOut 
    FROM   encodingOfRandS, LATERAL(SELECT KeyOut, ValueOut FROM Map(key, value)) m
),
Group_Phase AS (
    SELECT KeyOut, array_agg(Valueout) as ValueOut
    FROM   Map_Phase
    GROUP  BY (KeyOut)
),
Reduce_Phase AS (
    SELECT r.KeyOut, r.ValueOut
    FROM   Group_Phase gp, LATERAL(SELECT KeyOut, ValueOut FROM Reduce(gp.KeyOut, gp.ValueOut)) r
)
SELECT ValueOut->'a' as a, ValueOut->'b' as b, ValueOut-> 'c' as c FROM Reduce_Phase order by 1,2,3;


\qecho 'Problem 18'

-- Write, in PostgreSQL, a basic MapReduce program, i.e., a mapper func-
-- tion and a reducer function, as well as a 3-phases simulation that
-- imple- ments the SQL query

drop table R;
create table R(A integer, B integer);

insert into R values
   (1,1),
   (1,2),
   (1,3),
   (2,2),
   (2,3),
   (3,2);

-- table R;

/*
SELECT r.A, array_agg(r.B), sum(r.B) FROM R r
GROUP BY (r.A)
HAVING COUNT(r.B) < 3;
*/


-- Here R is a relation with schema (A, B). You can assume that the
-- domains of A and B are integers. Use the encoding and decoding methods
-- described above.


create table EncodingofR(key text, value jsonb);

insert into EncodingofR
  select 'R' as key, json_build_object('a', a, 'b', b) as value
  from   R;

-- select key, value from EncodingofR;


-- key |      value       
-- -----+------------------
-- R   | {"a": 1, "b": 1}
-- R   | {"a": 1, "b": 2}
-- R   | {"a": 1, "b": 3}
-- R   | {"a": 2, "b": 1}
-- R   | {"a": 3, "b": 1}
-- R   | {"a": 3, "b": 2}
-- (6 rows)

-- Map function
CREATE OR REPLACE FUNCTION Map(KeyIn text, ValueIn jsonb)
RETURNS TABLE(KeyOut jsonb, ValueOut jsonb) AS
$$
    SELECT ValueIn::jsonb - 'b', ValueIn::jsonb - 'a';    
$$ LANGUAGE SQL;

create or replace function json_sum(IntArray jsonb[]) 
returns bigint as
$$
   select sum((x ->> 'b')::int)
   from   (select x from unnest(IntArray) x) q;
$$ language sql;

CREATE OR REPLACE FUNCTION Reduce(KeyIn jsonb, ValuesIn jsonb[])
RETURNS TABLE(KeyOut text, ValueOut jsonb) AS
$$
select 'result'::text, json_build_object(
                           'a', KeyIn -> 'a',
                           'bS', ValuesIn,  
                           'sum', json_sum(ValuesIn::jsonb[]))
where cardinality(valuesIn) < 3;
$$ LANGUAGE SQL;


-- Simulate MapReduce Program
WITH
Map_Phase AS (
    SELECT m.KeyOut, m.ValueOut 
    FROM   encodingOfR, LATERAL(SELECT KeyOut, ValueOut FROM Map(key, value)) m
),
Group_Phase AS (
    SELECT KeyOut, array_agg(Valueout) as ValueOut
    FROM   Map_Phase
    GROUP  BY (KeyOut)
),
Reduce_Phase AS (
    SELECT r.KeyOut, r.ValueOut
    FROM   Group_Phase gp, LATERAL(SELECT KeyOut, ValueOut FROM Reduce(gp.KeyOut, gp.ValueOut)) r
)
SELECT gp.ValueOut -> 'a' as A, 
       array_agg(q.B -> 'b') as bS,
       gp.ValueOut -> 'sum' as sum_bS 
FROM  Reduce_Phase gp, lateral (select B from jsonb_array_elements(gp.ValueOut -> 'bS') as B) q
group by(gp.ValueOut -> 'a',gp.ValueOut -> 'sum');



\qecho 'Problem 19'

drop table if exists R;
drop table if exists S;

create table R(K int, V int);
create table S(K int, W int);

insert into R values
   (1,1),
   (1,2),
   (1,3),
   (2,2),
   (2,3),
   (3,2),
   (7,7);

insert into S values
   (1,1),
   (1,2),
   (1,3),
   (3,2),
   (4,1),
   (4,2),
   (5,1),
   (5,2),
   (6,4),
   (6,5);

table R;
table S;

\qecho 'Problem 19.a'

-- Define a PostgreSQL view coGroup that computes a complex-object
-- relation that represent the co-group transformation R.cogroup(S). Show
-- that this view works.

CREATE TYPE VWs AS (vs INT[], ws INT[]);

CREATE VIEW cogroup AS
    WITH Ks AS
         (SELECT k FROM R UNION SELECT k FROM S),
         Rk AS
         (SELECT k, ARRAY(SELECT r.v FROM R r WHERE r.k = ks.k) AS vs FROM Ks ks),
         Sk AS
         (SELECT k, ARRAY(SELECT s.w FROM S s WHERE s.k = ks.k) AS ws FROM Ks ks)
    SELECT k, (vs, ws)::VWs AS vws
    FROM Rk NATURAL JOIN Sk;

SELECT * FROM cogroup;

\qecho 'Problem 19.b'

-- Write a PostgreSQL query that use this {\tt coGroup} view to
-- compute the anti semi join $R\, \overline{\ltimes}\, S$, in other words compute the
-- relation $R-R \bowtie \pi_{K}(S)$.

SELECT c.k, v
FROM   cogroup c, UNNEST((c.vws).vs) v
WHERE  (SELECT count(1)
        FROM   UNNEST((c.vws).ws) q) = 0;


\qecho 'Problem 19.c'

-- Write a PostgreSQL query that uses this coGroup view to implement
-- the SQL query


/*
SELECT distinct r.K as rK, s.K as sK 
FROM   R r, S s 
WHERE  ARRAY(SELECT r1.V FROM R r1 WHERE r1.K = r.K) <@ 
       ARRAY(SELECT s1.W FROM S s1 WHERE s1.K = s.K);
*/

select distinct r.K, s.K
from   cogroup r JOIN cogroup s
       on (r.vws).vs <@ (s.vws).ws 
where  not (r.vws).vs = '{}' 
order by 1,2;


drop view cogroup;


\qecho 'Problem 20'

create table A (x int);
create table B (x int);

insert into A values (1), (2), (3), (4);
insert into B values (2), (4), (5);


drop table r cascade;
drop table s cascade;


create or replace view R(K, V) as
  select x, x from A;

create or replace view S(K, W) as
  select x, x from B;

-- CREATE TYPE VWs AS (vs INT[], ws INT[]);

-- drop view cogroup cascade;


CREATE OR REPLACE VIEW cogroup AS
    WITH Ks AS
         (SELECT k FROM R UNION SELECT k FROM S),
         Rk AS
         (SELECT k, ARRAY(SELECT r.v FROM R r WHERE r.k = ks.k) AS vs FROM Ks ks),
         Sk AS
         (SELECT k, ARRAY(SELECT s.w FROM S s WHERE s.k = ks.k) AS ws FROM Ks ks)
    SELECT k, (vs, ws)::VWs AS vws
    FROM Rk NATURAL JOIN Sk;


\qecho 'Problem 20.a'
-- Write a PostgreSQL query that uses the cogroup transformation to compute A ∩ B.

select k as x
from   cogroup c
where  (c.vws).vs = (c.vws).ws;



\qecho 'Problem 20.b'

-- Write a PostgreSQL query that uses the cogroup operator to compute the
-- symmetric difference of A and B, i.e., the expression (A − B) ∪ (B −
-- A).

select k as x
from   cogroup c
where  (c.vws).vs <@ array[]::int[] or
       (c.vws).ws <@ array[]::int[];


 




\c postgres
drop database dvgassignment7;

