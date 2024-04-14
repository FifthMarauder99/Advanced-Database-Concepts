-- 20 + (50 + 6)
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

select recursiveAggregatedWeight(1);