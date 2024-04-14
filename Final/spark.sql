drop table R cascade;
create table R (
  K text,
  V int
);

insert into R values
  ('a', 1),
  ('a', 2),
  ('b', 1),
  ('c', 3);

drop table S cascade;
create table S (
  K text,
  W int
);

insert into S values
  ('a', 1),
  ('a', 3),
  ('c', 2),
  ('d', 1),
  ('d', 4);

create type cogroup_item as (
  a text[],
  b text[]
);


create view cogroup as (
  with k_values as (select k from R union select k from S),
  r_values as (
    select k, array_agg(v) as r_k from R group by k
    union
    select k, '{}' from k_values where k not in (select k from R)
  ),
  s_values as (
    select k, array_agg(w) as s_w from S group by k
    union
    select k, '{}' from k_values where k not in (select k from S)
  )

  select k, (r_k, s_w)::cogroup_item as cg from r_values natural join s_values
);