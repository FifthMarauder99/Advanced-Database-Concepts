create or replace function findAllTopologicalSorts(toporder integer[], visited boolean[])
returns void as
$$
declare
  current int;
begin
  -- raise notice 'recursion';
  -- raise notice '%', (select array_to_string(toporder, ','));
  -- raise notice '%', (select array_to_string(visited, ','));
  if true=all(select unnest(visited)) then
    -- raise notice 'Inserting: %', (select array_to_string(toporder, ','));
    -- begin transaction;
    insert into all_topological_sorts values(toporder);
    -- end transaction;
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

select * from allTopologicalSorts();