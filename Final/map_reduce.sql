drop table R cascade; 
drop table S cascade;

create table R(a int);
insert into R values (1),(2),(3),(4);

create table S(a int);
insert into S values (2),(4),(5);

-- Intersection
-- Union
-- Difference
-- Symmentric difference
-- Join

-- Encoding
create or replace view encodingRandS as (
  select 'R' as key, jsonb_build_object('a', a) as value from R
  union
  select 'S' as key, jsonb_build_object('a', a) as value from S
  order by 1
);

-- Intersection

-- mapper
create or replace function mapper(key text, value jsonb)
returns table(key jsonb, value text) as 
$$
  select value, key;
$$ language sql;

-- select m.* from encodingrands e, lateral mapper(e.key, e.value) m;

-- reducer
create or replace function reducer(key jsonb, valuesArray text[])
returns table(key jsonb, valuesArray text[]) as
$$
  select key, valuesArray where array['R', 'S'] <@ valuesArray;
$$ language sql;

with map_phase as (
  select m.* from encodingrands e, lateral mapper(e.key, e.value) m
),
group_phase as (
  select key, array_agg(value) as valuesArray from map_phase group by key
),
reduce_phase as (
  select r.* from group_phase g, reducer(g.key, g.valuesArray) r
)
select key->'a' as Intersection from reduce_phase;

-- Union

-- mapper
create or replace function mapper(key text, value jsonb)
returns table(key jsonb, value text) as 
$$
  select value, key;
$$ language sql;

-- select m.* from encodingrands e, lateral mapper(e.key, e.value) m;

-- reducer
create or replace function reducer(key jsonb, valuesArray text[])
returns table(key jsonb, valuesArray text[]) as
$$
  select key, valuesArray where array['R', 'S'] && valuesArray;
$$ language sql;

with map_phase as (
  select m.* from encodingrands e, lateral mapper(e.key, e.value) m
),
group_phase as (
  select key, array_agg(value) as valuesArray from map_phase group by key
),
reduce_phase as (
  select r.* from group_phase g, reducer(g.key, g.valuesArray) r
)
select key->'a' as Intersection from reduce_phase order by 1;

-- R - S

-- mapper
create or replace function mapper(key text, value jsonb)
returns table(key jsonb, value text) as 
$$
  select value, key;
$$ language sql;

-- select m.* from encodingrands e, lateral mapper(e.key, e.value) m;

-- reducer
create or replace function reducer(key jsonb, valuesArray text[])
returns table(key jsonb, valuesArray text[]) as
$$
  select key, valuesArray where 'R' = some(valuesArray) and not('S' = some(valuesArray));
$$ language sql;

with map_phase as (
  select m.* from encodingrands e, lateral mapper(e.key, e.value) m
),
group_phase as (
  select key, array_agg(value) as valuesArray from map_phase group by key
),
reduce_phase as (
  select r.* from group_phase g, reducer(g.key, g.valuesArray) r
)
select key->'a' as Intersection from reduce_phase order by 1;

-- (R - S) U (S - R)

-- mapper
create or replace function mapper(key text, value jsonb)
returns table(key jsonb, value text) as 
$$
  select value, key;
$$ language sql;

-- select m.* from encodingrands e, lateral mapper(e.key, e.value) m;

-- reducer
create or replace function reducer(key jsonb, valuesArray text[])
returns table(key jsonb, valuesArray text[]) as
$$
  select key, valuesArray where 'R' = some(valuesArray) and not('S' = some(valuesArray))
  union
  select key, valuesArray where 'S' = some(valuesArray) and not('R' = some(valuesArray))
$$ language sql;

with map_phase as (
  select m.* from encodingrands e, lateral mapper(e.key, e.value) m
),
group_phase as (
  select key, array_agg(value) as valuesArray from map_phase group by key
),
reduce_phase as (
  select r.* from group_phase g, reducer(g.key, g.valuesArray) r
)
select key->'a' as Intersection from reduce_phase order by 1;

-- Anti semi join
DROP TABLE IF EXISTS R cascade;
CREATE TABLE R(
    A INTEGER,
    B INTEGER
);

DROP TABLE IF EXISTS S;
CREATE TABLE S(
    A INTEGER,
    B INTEGER,
    C INTEGER
);

-- Populate table
INSERT INTO R VALUES (1, 2), (2, 4), (3, 6), (4,6);
INSERT INTO S VALUES (1, 2, 7), (2, 5, 8), (1, 4, 9), (3, 6, 10), (5, 7, 11);

-- encoding
create or replace view encodingrands as (
  select 'R' as key, jsonb_build_object('a', a, 'b', b) as value from R
  union
  select 'S' as key, jsonb_build_object('a', a, 'b', b, 'c', c) as value from S
  order by 1
);

--
create or replace function mapper(key text, value jsonb)
returns table(key jsonb, value text) as 
$$
  select case 
          when key='R' then value 
          else value - 'c'
          end,
          key;
$$ language sql;

create or replace function reducer(key jsonb, valuesArray text[])
returns table(key jsonb, valuesArray text[]) as
$$
  select key, valuesArray where valuesArray <@ array['R'];
$$ language sql;

with map_phase as (
  select m.* from encodingrands e, lateral mapper(e.key, e.value) m
),
group_phase as (
  select key, array_agg(value) as valuesArray from map_phase group by key
),
reduce_phase as (
  select r.* from group_phase g, reducer(g.key, g.valuesArray) r
)
select * from reduce_phase;

-- Natural Join

DROP TABLE IF EXISTS R CASCADE;
CREATE TABLE R(
    A INTEGER,
    B INTEGER
);

DROP TABLE IF EXISTS S;
CREATE TABLE S(
    B INTEGER,
    C INTEGER
);

-- Populate table
INSERT INTO R VALUES (1, 2), (2, 4), (3, 6), (4,6);
INSERT INTO S VALUES (2, 7), (2, 5), (6, 4), (6, 8), (5, 7);


-- encoding
create or replace view encodingrands as (
  select 'R' as key, jsonb_build_object('a', a, 'b', b) as value from R
  union
  select 'S' as key, jsonb_build_object('b', b, 'c', c) as value from S
  order by 1
);

--
create or replace function mapper(key text, value jsonb)
returns table(key jsonb, value text) as 
$$
  select case 
          when key='R' then value - 'a'
          else value - 'c'
          end,
          value - 'b';
$$ language sql;

create or replace function reducer(key jsonb, valuesArray text[])
returns table(key jsonb, valuesArray text[]) as
$$
  select key, valuesArray where valuesArray <@ array['R'];
$$ language sql;

with map_phase as (
  select m.* from encodingrands e, lateral mapper(e.key, e.value) m
),
group_phase as (
  select key, array_agg(value) as valuesArray from map_phase group by key
),
reduce_phase as (
  select r.* from group_phase g, reducer(g.key, g.valuesArray) r
)
select * from reduce_phase;