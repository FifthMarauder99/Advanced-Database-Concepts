create or replace function
BinaryRelationOverIntegers(n int, l_1 int, u_1 int, l_2 int, u_2 int)
   returns table (x int, y int) as
$$
   select floor(random() * (u_1-l_1+1) + l_1)::int as x,
          floor(random() * (u_2-l_2+1) + l_2)::int as y
   from   generate_series(1,n);
$$ language sql;


create or replace function makeKnows(n integer)
returns void as
$$
begin
    drop table if exists knows;
    create table knows(
      pid1 int,
      pid2 int
    );
    insert into knows (select * from BinaryRelationOverIntegers(n, 1, n, 1, n) where x <> y group by (x,y));
end;
$$ language plpgsql;

\qecho '10000'
select makeKnows(1000000);
vacuum analyze knows;

create index on knows (pid1);
create index on knows (pid2);

explain analyze select distinct k1.pid1, k3.pid2 from knows k1, knows k2, knows k3 where k1.pid2 = k2.pid1 and k2.pid2 = k3.pid1;