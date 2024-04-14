\o q_10_index.txt

-- create index skill_index on personSkill(skill);

\qecho 'Experiment with index'

vacuum personskill;
select s as "size of relation S", e as "Average execution time for query"
from  experiment10(3, 4, 7, 3, 'select pid from personSkill where skill = ''AI''');

create or replace function experiment10(m int, k_1 int, k_2 int, n int, sqlstatement text)
returns table(s int, e numeric) as
$$
begin
   drop table if exists executionTimeTable;
   create table executionTimeTable (size int, executionTime    float);

   for i in 1..m loop
     for k in k_1..k_2 loop
      perform makePersonSkill(floor(power(10,k))::int);
      analyze personSkill;
      create index skill_index on personSkill (skill);
      insert into executionTimeTable values(floor(power(10,k))::int, (select runexperiment(n,sqlstatement)));
    end loop;
   end loop;
   return query select size::int, round(avg(executiontime)::numeric,3)
                from   executionTimeTable
                group by(size) order by 1;
end;
$$ language plpgsql;

--      create index skill_index on personSkill (skill);

-- \qecho '100000'
-- select makePersonSkill(10000);
-- vacuum analyze personSkill;
-- drop table if exists executionTimeTable;
-- create table executionTimeTable (size int, executionTime float);
-- insert into executionTimeTable values(10000, (select runexperiment(3 ,'select pid from personSkill where skill = ''AI''')));
-- select round(avg(executiontime)::numeric,3) from executionTimeTable where size = 10000
