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


\qecho '10000000'
select makePersonSkill(10000000);
vacuum analyze personSkill;
create index on personskill (pid, skill);
explain analyze select pid, skill from personSkill where pid=100 and skill = 'AI';
select queryPlan('select pid from personSkill where skill = ''AI''');