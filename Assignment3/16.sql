-- select p1.pid, p2.pid from person p1, person p2 where p1.pid<>p2.pid and true=all(
--      select (p2.pid, ps1.skill) not in (select * from personSkill) from personSkill ps1 where ps1.pid=p1.pid
-- );

-- select p1.pid, p2.pid from person p1, person p2 where p1.pid<>p2.pid and true=all(
--      select (p2.pid, ps1.skill) not in (select * from personSkill) from personSkill ps1 where ps1.pid=p1.pid
-- );

-- select q.p1pid, q.p1pid from (
--      select p1.pid as p1pid, p2.pid as p2pid from person p1, person p2 where p1.pid<>p2.pid
--      intersect
--      select p1.pid as p1pid, p2.pid as p2pid from person p1, person p2 where true=all(
--           select (p2.pid, ps1.skill) not in (select * from personSkill) from personSkill ps1 where ps1.pid=p1.pid
--      )
-- ) q;

-- select q.p1pid, q.p1pid from (
--      select p1.pid as p1pid, p2.pid as p2pid from person p1, person p2 where p1.pid<>p2.pid
--      intersect
--      select q1.p1pid, q1.p2pid from (
--           select p1.pid as p1pid, p2.pid as p2pid from person p1, person p2
--           except
--           select p1.pid as p1pid, p2.pid as p2pid from person p1, person p2, personSkill ps1 where  ps1.pid=p1.pid and (p2.pid, ps1.skill) in (select * from personSkill)
--      ) q1
-- ) q;

-- select q.p1pid, q.p1pid from (
--      select p1.pid as p1pid, p2.pid as p2pid from person p1, person p2 where p1.pid<>p2.pid
--      intersect
--      select q1.p1pid, q1.p2pid from (
--           select p1.pid as p1pid, p2.pid as p2pid from person p1, person p2
--           except
--           select q2.p1pid, q2.p2pid from (
--                select p1.pid as p1pid, p2.pid as p2pid, ps1.pid, ps1.skill from person p1, person p2, personSkill ps1 where ps1.pid=p1.pid
--                intersect
--                select p1.pid as p1pid, p2.pid as p2pid, ps1.pid, ps1.skill from person p1, person p2, personSkill ps1 where (p2.pid, ps1.skill) in (select * from personSkill)
--           ) q2
--      ) q1
-- ) q;

select q.p1pid, q.p1pid from (
     select p1.pid as p1pid, p2.pid as p2pid from person p1, person p2 where p1.pid<>p2.pid
     intersect
     select q1.p1pid, q1.p2pid from (
          select p1.pid as p1pid, p2.pid as p2pid from person p1, person p2
          except
          select q2.p1pid, q2.p2pid from (
               select p1.pid as p1pid, p2.pid as p2pid, ps1.pid, ps1.skill from person p1, person p2, personSkill ps1 where ps1.pid=p1.pid
               intersect
               select distinct p1.pid as p1pid, p2.pid as p2pid, ps1.pid, ps1.skill from person p1, person p2, personSkill ps1, personSkill ps2 where p2.pid=ps2.pid and ps1.skill=ps2.skill
          ) q2
     ) q1
) q;