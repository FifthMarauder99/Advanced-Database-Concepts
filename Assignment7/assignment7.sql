-- Script for B561 Fall 2022 Assignment 7

create database dvgassignment7;

\c dvgassignment7


\qecho 'Problem 8'

--- Topological sort
create table V(node int);
create table E(source int, target int);


-- Implements Kahn's algorithm
create or replace function someTopologicalSort()
returns int[] as
$$
declare
  que int[];
  current int;
  toporder int[];
begin
  drop table if exists incoming_degree;
  create table incoming_degree (
    node int,
    degree int
  );
  with inc_degree as (
    select target as node, count(1) as degree from E group by target
    union
    select v.node, 0 from V v where v.node not in (select target from E)
    order by node
  )
  insert into incoming_degree select * from inc_degree;
  que := (select array(select id.node from incoming_degree id where id.degree = 0));
  while (select cardinality(que)) > 0
  loop
    current := (select que[1]);
    que := (select array_remove(que, current));
    toporder := (select array_append(toporder, current));
    update incoming_degree set degree = degree - 1 where node in (select target from E where source = current);
    que := (select array(
      select id.node from incoming_degree id where id.degree = 0
      except
      select unnest(toporder) as node
      order by node
    ));
  end loop;
  return toporder;
end;
$$ language plpgsql;

create or replace function findAllTopologicalSorts(toporder integer[], visited boolean[])
returns void as
$$
declare
  current int;
begin
  -- raise notice 'recursion';
  -- raise notice '%', (select array_to_string(toporder, ''));
  -- raise notice '%', (select array_to_string(visited, ','));
  if true=all(select unnest(visited)) then
    -- raise notice 'Inserting: %', (select array_to_string(toporder, ','));
    insert into all_topological_sorts values(toporder);
    return;
  end if;
  for current in (select node from V order by node) loop
    -- raise notice 'curr: %', current;
    if (select degree from incoming_degree where node = current) = 0 and (select visited[current]) = False then
      -- raise notice '%', current;
      -- raise notice '%', (select array_to_string(toporder, ''));
      update incoming_degree set degree = degree - 1 where node in (select target from E where source = current);
      toporder := (select array_append(toporder, current));
      visited[current] := True;
      perform findAllTopologicalSorts(toporder, visited);
      update incoming_degree set degree = degree + 1 where node in (select target from E where source = current);
      toporder := (select array_remove(toporder, toporder[array_upper(toporder, 1)]));
      -- raise notice 'After: %', (select array_to_string(toporder, ''));
      visited[current] := False;
    end if;
  end loop;
  -- raise notice 'end recursion';
end;
$$ language plpgsql;

create or replace function allTopologicalSorts()
returns table(toporder int[]) as 
$$
declare
  top_path int[];
  visited boolean[];
begin
  -- calculate indegree for nodes
  drop table if exists incoming_degree;
  create table incoming_degree (
    node int,
    degree int
  );
  with inc_degree as (
    select target as node, count(1) as degree from E group by target
    union
    select v.node, 0 from V v where v.node not in (select target from E)
    order by node
  )
  insert into incoming_degree select * from inc_degree;
  -- Table to store the topological sorts
  drop table if exists all_topological_sorts;
  create table all_topological_sorts(
    top_sort int[]
  );
  -- Populate recursively
  visited := (select array(select False from generate_series(1, (select count(1) from V))));
  perform findAllTopologicalSorts(top_path, visited);
  return query select * from all_topological_sorts;
end;
$$ language plpgsql;

delete from V;
insert into V values (1), (2), (3), (4), (5), (6);

delete from E;
insert into E values 
  (5, 1),
  (6, 1),
  (5, 2),
  (6, 3),
  (3, 4),
  (4, 2);

select * from someTopologicalSort();
select * from allTopologicalSorts();

delete from V;
insert into V values (1), (2), (3), (4), (5), (6), (7);

delete from E;
insert into E values 
  (1, 2),
  (1, 3),
  (1, 4),
  (2, 5),
  (3, 6),
  (4, 7);

select * from someTopologicalSort();
select * from allTopologicalSorts();

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

create or replace function Dijkstra(s integer)
returns table(target int, shortestDistance int) as
$$
declare
  n int;
  min_node int;
  min_node_dist int;
  max_dist int;
  edge record;
begin
  n := (select count(1) from (
      select g.source from Graph g
      union
      select g.target from Graph g
    ) q);
  max_dist := (select sum(weight) from Graph) + 1;
  drop table if exists D;
  create temp table D  (
    target int,
    shortestDistance int,
    visited boolean default False
  ) on commit drop;
  insert into D select index, max_dist from generate_series(0, n-1) as index;
  update D set shortestDistance = 0 where D.target = s;
  for i in 1..n loop
    min_node := (select q.target from D q where q.shortestDistance = (select min(D.shortestDistance) from D where visited = False) limit 1);
    min_node_dist := (select D.shortestDistance from D where D.target = min_node);
    update D set visited = True where D.target=min_node;
    for edge in (select * from Graph where source=min_node) loop
      update D as d set shortestDistance = (
        case when min_node_dist + edge.weight < d.shortestDistance then min_node_dist + edge.weight 
        else d.shortestDistance
        end
      ) where d.target=edge.target;
    end loop;
  end loop;
  return query select d.target, d.shortestDistance from D d order by 1;
end; 
$$ language plpgsql;

with V as (
  select source from Graph
  union
  select target from Graph
  order by 1
)

select * from V v, lateral Dijkstra(v.source);

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

create or replace function recursiveAggregatedWeight(partid int)
returns int as
$$
declare
  w int;
  subpart record;
begin
  w := 0;
  if exists(select 1 from partSubPart where pid=partid) then
    for subpart in (select * from partSubPart where pid=partid) loop
      w := w + recursiveAggregatedWeight(subpart.sid) * subpart.quantity;
    end loop;
  else
    w := (select weight from basicPart where pid=partid);
  end if;
  return w;
end;
$$ language plpgsql;

with P as (
  select pid from basicPart
  union
  select pid from partSubpart
  order by 1
)

select * from P, lateral recursiveAggregatedWeight(P.pid);

\qecho 'Problem 10.b'

-- Write a {\bf non-recursive} function {\tt
-- nonRecursiveAggregatedWeight(p integer)} that returns the aggregated
-- weight of a part {\tt p}.  Test your function.

create or replace function nonRecursiveAggregatedWeight(partid int)
returns int as
$$
declare
  no_of_parts int;
  weight int;
  p record;
  subpart record;
  aweight int;
begin
  drop table if exists part_weight;
  create table part_weight(pid int, weight int);

  insert into part_weight select * from basicPart;
  no_of_parts := (select count(1) from (select pid from basicPart union select pid from partSubPart) q);
  while (select count(1) from part_weight) <> no_of_parts loop
    for p in select distinct pid from partSubPart s where s.pid not in (select pid from part_weight) and true=all(select sid in (select pid from part_weight) from partSubPart where pid=s.pid) loop
      weight := 0;
      for subpart in select sid, quantity from partSubPart psp where psp.pid=p.pid loop
        weight := weight + (select pw.weight from part_weight pw where pid=subpart.sid) * subpart.quantity;
      end loop;
      insert into part_weight values(p.pid, weight);
    end loop;
  end loop;
  aweight := (select pw.weight from part_weight pw where pw.pid=partid);
  return aweight;
end;
$$ language plpgsql;

with P as (
  select pid from basicPart
  union
  select pid from partSubpart
  order by 1
)
select * from P, lateral nonRecursiveAggregatedWeight(P.pid);

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

create or replace function recursiveHamiltonian()
returns boolean as 
$$
declare
  isHCycle boolean;
  nodes int[];
begin
  nodes := (select array(select source from Graph union select target from Graph order by 1));
  isHCycle := (select exists(
          select * from generate_paths(nodes) 
          where cardinality(path) = cardinality(nodes) and 
          (path[cardinality(path)], path[1]) in (select * from Graph)
        ));
  return isHCycle;
end;
$$ language plpgsql;


-- Test your function on the following graphs.


-- delete from Graph;
-- insert into Graph values (1,2), (2,3), (3,1);

delete from Graph;
insert into Graph values
 (1,2),
 (2,3),
 (3,4),
 (4,1);

select recursiveHamiltonian();

delete from Graph;
insert into Graph values
 (1,2),
 (2,3),
 (3,1),
 (4,5),
 (5,4);

select recursiveHamiltonian();

\qecho 'Problem 12.b'

-- Write a {\bf non-recursive} function {\tt nonRecursiveHamiltonian}
-- that returns {\tt true} if the graph stored in {\tt Graph} is
-- Hamiltonian, and {\tt false} otherwise. 

create or replace function nonRecursiveHamiltonian()
returns boolean as 
$$
declare
  cnt int;
  isHCycle boolean;
begin
  drop table if exists V;
  create table V(node int);
  insert into V select source from Graph union select target from Graph order by 1;

  -- Construct paths bottom up
  drop table if exists paths;
  create table paths(path int[]);
  insert into paths select array[v.node] from V v;

  cnt := (select count(1) from V);
  for i in 2..cnt loop
    insert into paths select array_append(p.path, v.node) from paths p, lateral(select node from V) v 
    where cardinality(p.path) = i-1 and v.node not in (select unnest(p.path)) and (p.path[cardinality(p.path)], v.node) in (select * from graph);
  end loop;

  isHCycle := (select exists(
    select 1 from paths p where cardinality(p.path) = cnt and (path[cnt], path[1]) in (select * from Graph)
  ));
  return isHCycle;
end;
$$ language plpgsql;

delete from Graph;
insert into Graph values
 (1,2),
 (2,3),
 (3,4),
 (4,1);

select nonRecursiveHamiltonian();

delete from Graph;
insert into Graph values
 (1,2),
 (2,3),
 (3,1),
 (4,5),
 (5,4);

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

select nonRecursiveHamiltonian();


\qecho 'Problem 13'

create or replace function canPickColor(nnode int)
returns boolean as
$$
declare
  can_pick boolean;
  neighbour int;
begin
  for i in 1..3 loop
    can_pick := True;
    for neighbour in (select target from Graph where source=nnode union select source from Graph where target=nnode) loop
      if i = (select color from node_colors nc where nc.node = neighbour) then
        can_pick := False;
      end if;
    end loop;
    if can_pick then
      update node_colors set color = i where node = nnode;
      return True;
    end if;
  end loop;
  return False;
end;
$$ language plpgsql;

create or replace function threeColorable()
returns boolean as
$$
declare
  nodes int[];
  can_pick_color boolean;
begin
  nodes := (select array(select source as node from Graph union select target from Graph order by 1));
  drop table if exists node_colors;
  create table node_colors (
    node int,
    color int
  );
  insert into node_colors select node, -1 from (select unnest(nodes) as node) q;

  for i in 1..array_length(nodes, 1) loop
    can_pick_color := (select canPickColor(nodes[i]));
    if not can_pick_color then
      return False;
    end if;
  end loop;
  return True;
end;
$$ language plpgsql;

delete from Graph;

insert into Graph values
 (1,2),
 (2,3),
 (3,4),
 (4,5),
 (5,1);

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