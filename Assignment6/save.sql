-- Functions
-- Returns n integers between (l, u)
create or replace function SetOfIntegers(n int, l int, u int)
    returns table (x int) as
$$
    select floor(random() * (u-l+1) + l)::int from generate_series(1,n);
$$ language sql;
-- select x from SetofIntegers(3,5,10);

-- Returns n integers (a, b) a is between (l_1, u_1) b is between (l_2, u_2)
create or replace function
BinaryRelationOverIntegers(n int, l_1 int, u_1 int, l_2 int, u_2 int)
   returns table (x int, y int) as
$$
   select floor(random() * (u_1-l_1+1) + l_1)::int as x,
          floor(random() * (u_2-l_2+1) + l_2)::int as y
   from   generate_series(1,n);
$$ language sql;
-- select x, y from BinaryRelationOverIntegers(20,3,8,2,11);

-- Returns functions
create or replace function
FunctionOverIntegers(n int, l_1 int, u_1 int, l_2 int, u_2 int)
   returns table (x int, y int) as
$$
   select x, floor(random() * (u_2-l_2+1) + l_2)::int as y
   from   generate_series(l_1,u_1) x order by random() limit(n);
$$ language sql;
-- select x, y from FunctionOverIntegers(15,1,20,3,8);


-- create or replace function
-- BinaryRelationOverIntegers(n int, l_1 int, u_1 int, l_2 int, u_2 int)
--    returns table (x int, y int) as
-- $$
--    select floor(random() * (u_1-l_1+1) + l_1)::int as x,
--           floor(random() * (u_2-l_2+1) + l_2)::int as y
--    from   generate_series(1,n);
-- $$ language sql;

-- create or replace function GeneratepersonSkillRelationUniform(n int, l int, u int)
-- returns table (pid int, skill text) as
-- $$
-- with skillNumber(skill, index) as (select skill, row_number() over (order by skill)
-- from Skill),
--      pS as (select x, y
--             from   BinaryRelationOverIntegers(n, l, u, 1, (select count(1) from Skill)::int))
-- select x as pid, skill
-- from   pS join skillNumber on y = index
-- group by (x, skill) order by 1,2;
-- $$ language sql;