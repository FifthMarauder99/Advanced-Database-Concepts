create or replace function setRange(A int[], B int[])
returns int[][] as 
$$
declare
  n INTO;
  s record;
  i record;
begin
  drop table if exists powerSet;
  create table powerSet(p int[]);
  insert into powerSet values ('{}'::int);

  n := (select count(1) from R);
  while (select count(1) from powerSet) < power(2, n) loop
    for s in (select p from powerSet) loop;
      for i in (select x from R) loop
        insert into powerSet values (set_union(s.p, i.x));
      end loop;
    end loop;
  end loop;

  return query select ps.p from powerSet ps where subset(A, ps.p) and subset(ps.p, B);
end;
$$ language plpgsql;