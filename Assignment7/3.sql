create table R(a int, b int);

insert into R values
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5);

select distinct r1.a from R r1 JOIN R r2 on (r1.b=r2.a) JOIN R r3 on (r2.b = r3.a) JOIN R r4 on (r3.b = r4.a);

select distinct r1.a from R r1 JOIN (select r2.a from R r2 join (select r3.a from R r3 join R r4 on r3.b=r4.a) q3 on (r2.b = q3.a)) q2 on (r1.b=q2.a) ;


create or replace function BinaryRelationOverIntegers(n int, l_1 int, u_1 int, l_2 int, u_2 int)
returns table (x int, y int) as
$$
select distinct
floor(random() * (u_1-l_1+1) + l_1)::int as x,
floor(random() * (u_2-l_2+1) + l_2)::int as y
from generate_series(1,n);
$$ LANGUAGE sql;

delete from R;
insert into R select * from BinaryRelationOverIntegers(1000, 1, 100, 1, 100);
insert into R select * from BinaryRelationOverIntegers(10000, 1, 1000, 1, 1000);
insert into R select * from BinaryRelationOverIntegers(100000, 1, 10000, 1, 10000);
insert into R select * from BinaryRelationOverIntegers(1000000, 1, 10000, 1, 10000);

select count(1) from (select distinct r1.a from R r1 JOIN R r2 on (r1.b=r2.a) JOIN R r3 on (r2.b = r3.a) JOIN R r4 on (r3.b = r4.a)) q;
select count(1) from (select distinct r1.a from R r1 JOIN (select r2.a from R r2 join (select r3.a from R r3 join R r4 on r3.b=r4.a) q3 on (r2.b = q3.a)) q2 on (r1.b=q2.a)) q;


explain analyze select distinct r1.a from R r1 JOIN R r2 on (r1.b=r2.a) JOIN R r3 on (r2.b = r3.a) JOIN R r4 on (r3.b = r4.a);

explain analyze select a from R where b in (
  select a from R where b in (
    select a from R where b in (
      select a from R
    )
  )
);