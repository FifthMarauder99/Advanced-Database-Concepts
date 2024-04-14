
create or replace function GenerateWorkForRelation(p int, c int, s int)
   returns table (pid int, cname int, salary int) as
$$
 select * from (
   select x as pid, floor(random() * c + 1)::int as cname, floor(random() * s +1)*100 as salary
   from   generate_series(1,p) x order by random()) q;
$$ language sql;

create or replace function makeWorksFor(n integer)
returns void as
$$
begin
    drop table if exists worksFor;
    create table worksFor(
      pid bigint,
      cname bigint,
      salary bigint
    );
    insert into worksFor (select * from GenerateWorkForRelation(n, n, n));
end;
$$ language plpgsql;

create or replace function experiment11_SmallRange(m int, k_1 int, k_2 int, n int, sqlstatement text)
returns table(s int, e numeric) as
$$
begin
   drop table if exists executionTimeTable;
   create table executionTimeTable (size int, executionTime float);

   for i in 1..m loop
     for k in k_1..k_2 loop
      perform makeWorksFor(floor(power(10,k))::int);
      -- Lowest salary
      insert into executionTimeTable values(floor(power(10,k))::int, (select runexperiment(n,sqlstatement)));
    end loop;
   end loop;
   return query select size::int, round(avg(executiontime)::numeric,3)
                from   executionTimeTable
                group by(size) order by 1;
end;
$$ language plpgsql;

select s as "size of relation S", e as "Average execution time for query"
from experiment11(3, 1, 2, 3, 'select pid from worksFor where  s1 <= salary and salary <= s2');



\qecho '10000000'
select makeWorksFor(10000000);
vacuum analyze worksFor;
create index on worksFor(salary);

select min(salary) from worksFor;
explain analyze select pid from worksFor where  100 <= salary and salary <= 100;

select avg(salary) from worksFor;
explain analyze select pid from worksFor where  100 <= salary and salary <= 500082613.5282;

select max(salary) from worksFor;
explain analyze select pid from worksFor where  100 <= salary and salary <= 1000000000;
