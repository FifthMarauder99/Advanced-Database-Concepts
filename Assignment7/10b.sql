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