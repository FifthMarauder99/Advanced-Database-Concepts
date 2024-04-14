-- Implements Kahn's algorithm
create or replace function someTopologicalSort()
returns int[] as
$$
declare
  que int[];
  current int;
  toporder int[];
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

select * from someTopologicalSort();
