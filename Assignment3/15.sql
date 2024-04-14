create or replace function max_salary(c_name Text)
returns integer as
$$
select max(salary) from worksFor w where w.cname=c_name
$$ language sql;

select * from (
     select p.pid from person p
     except
     select q1.ppid from (
          select p.pid as ppid, w.pid, w.cname from person p, worksFor w where w.cname='Amazon'
          intersect
          select p.pid as ppid, w.pid, w.cname from person p, worksFor w where w.salary=max_salary('Amazon')
          intersect
          select distinct q2.ppid,q2.pid, q2.cname from (
               select p.pid as ppid, w.cname, w.pid from person p, worksFor w
               except
               select p.pid as ppid, w.cname, w.pid from person p, worksFor w, knows k where p.pid=k.pid1 and w.pid=k.pid2
          ) q2
     ) q1
) q;