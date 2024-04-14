create or replace function GeneratepersonSkillRelation(n int, l int, u int)
returns table (pid int, skill text) as
$$
with skillNumber(skill, index) as (select skill, row_number() over (order by skill)
from Skill),
     pS as (select x, y
            from   BinaryRelationOverIntegers(n,l,u,1, (select count(1) from Skill)::int))
select x as pid, skill
from   pS join skillNumber on y = index
group by (x, skill) order by 1,2;
$$ language sql;

create or replace function makePersonSkill(n integer)
returns void as
$$
begin
    drop table if exists personSkill;
    create table personSkill(
      pid int,
      skill text
    );

    insert into personSkill (select * from GeneratepersonSkillRelation(n, 1, n));
end;
$$ language plpgsql;

-- create function which return n -> (pid, skill)
select makePersonSkill(1000);

-- Creating data
-- 10^4, 10^6, 10^8
-- select pid from personSkill where skill = s;

-- select pid from personSkill where skill = 'AI';
-- explain analyze select pid from personSkill where skill = 'AI';


create or replace function extractExecutionTime(sqlStatement text)
returns       float as
$$
   select substring(q.queryPlan,'([0-9.]+)')::float
   from   (select queryPlan from queryPlan(sqlStatement)) q
   where  q.queryPlan like '%Exec%';
$$ language sql;


create or replace function runExperiment(n int, queryStatement text)
returns float as
$$
    select avg((select * from extractExecutionTime(queryStatement)))
    from   generate_series(1,n);
$$ language sql;


create or replace function experiment10(m int, k_1 int, k_2 int, n int, sqlstatement text)
returns table(s int, e numeric) as
$$
begin
   drop table if exists executionTimeTable;
   create table executionTimeTable (size int, executionTime    float);

   for i in 1..m loop
     for k in k_1..k_2 loop
      perform makePersonSkill(floor(power(10,k))::int);
      insert into executionTimeTable values(floor(power(10,k))::int, (select runexperiment(n,sqlstatement)));
    end loop;
   end loop;
   return query select size::int, round(avg(executiontime)::numeric,3)
                from   executionTimeTable
                group by(size) order by 1;
end;
$$ language plpgsql;

select s as "size of relation S", e as "Average execution time for query"
from experiment10(3, 1, 2, 3, 'select pid from personSkill where skill = ''AI''');

-- To run the experiment before creating index
-- After creating index
