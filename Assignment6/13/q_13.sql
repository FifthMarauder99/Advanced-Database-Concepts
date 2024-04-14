create or replace function
BinaryRelationOverIntegers(n int, l_1 int, u_1 int, l_2 int, u_2 int)
   returns table (x int, y int) as
$$
   select floor(random() * (u_1-l_1+1) + l_1)::int as x,
          floor(random() * (u_2-l_2+1) + l_2)::int as y
   from   generate_series(1,n);
$$ language sql;

create or replace function makePerson(n integer)
returns void as
$$
begin
    drop table if exists person;
    create table person(
      pid int,
      pname int
    );

    insert into person (select * from BinaryRelationOverIntegers(n, 1, n, 1, n));
end;
$$ language plpgsql;

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


\qecho '10000'
select makePerson(100);
select makePersonSkill(1000);
vacuum analyze person;
vacuum analyze personSkill;

create index on person (pid);
create index on personSkill (skill, pid);

-- select pid, pname from Person where  pid in (select pid from personSkill where skill = 'AI');
explain analyze select pid, pname from Person where  pid not in (select pid from personSkill where skill = 'AI');