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

select * from nonRecursiveHamiltonian();