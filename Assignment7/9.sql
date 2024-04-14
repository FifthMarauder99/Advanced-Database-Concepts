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
  max_dist := (select sum(weight) from Graph);
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
  return query select d.target, d.shortestDistance::int from D d order by 1;
end; 
$$ language plpgsql;

select * from Dijkstra(0);