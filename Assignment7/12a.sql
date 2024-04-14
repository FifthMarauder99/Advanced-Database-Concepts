create or replace function recursiveHamiltonian()
returns boolean as 
$$
begin
  return False;
end;
$$ language plpgsql;

select * from recursiveHamiltonian();

select source from Graph
union
select target from Graph
order by 1;

create or replace function generate_paths(nodes int[])
returns table(path int[]) as 
$$
  select '{}' where nodes = '{}'
  union
  select array[node] from unnest(nodes) node
  union
  select array_append(p.path, node) 
  from unnest(nodes) node, lateral (select path from generate_paths(array_remove(nodes, node))) p
  where (path[cardinality(path)], node) in (select * from Graph);
$$ language sql;

select * from generate_paths(array(select source from Graph union select target from Graph order by 1));


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

select * from recursiveHamiltonian();

with nodes as (
  select array(select source from Graph union select target from Graph order by 1)
)
select exists(
  select * from generate_paths((select * from nodes)) 
  where cardinality(path) = cardinality((select * from nodes)) and 
  (path[cardinality(path)], path[1]) in (select * from Graph)
);


delete from Graph;
insert into Graph values
 (1,2),
 (2,3),
 (3,1);
