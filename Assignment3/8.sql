select q.ppid from (
     select distinct q6.ppid from (
          select p.pid as ppid, ps.skill, ps.pid from person p cross join personSkill ps
          except
          select ps.pid as ppid, s.skill as sskill, ps.pid as pspid from personSkill ps cross join skill s 
     ) q6
     intersect
     select q1.pid from (
          select distinct p.pid from person p
          except
          select q2.ppid from (
               select q3.ppid, q3.skill1, q3.skill2 from (
                    select p.pid as ppid, s1.skill as skill1, s2.skill as skill2 from person p cross join skill s1 cross join skill s2
                    except
                    select q5.ppid, q5.skill1, q5.skill2 from (
                         select ps.pid as ppid, s1.skill as skill1, s2.skill as skill2 from personSkill ps cross join skill s1 cross join skill s2 
                         intersect
                         select p.pid as ppid, ps.skill as skill1, s2.skill as skill2 from person p cross join personSkill ps cross join skill s2 
                    ) q5
               ) q3
               intersect
               select q4.ppid, q4.skill1, q4.skill2 from (
                    select p.pid as ppid, s1.skill as skill1, s2.skill as skill2 from person p cross join skill s1 cross join skill s2
                    except
                    select q6.ppid, q6.skill1, q6.skill2 from (
                         select ps.pid as ppid, s1.skill as skill1, s2.skill as skill2, ps.pid, ps.skill from personSkill ps cross join skill s1 cross join skill s2 
                         intersect
                         select p.pid as ppid, s1.skill as skill1, ps.skill as skill2, ps.pid, ps.skill from person p cross join personSkill ps cross join skill s1
                    ) q6
               ) q4
               intersect 
               select p.pid as ppid, s1.skill, s2.skill from person p, skill s1 join skill s2 on s1.skill <> s2.skill
          ) q2
     ) q1
) q;

select q.ppid from (
     select distinct q6.ppid from (
          select p.pid as ppid, ps.skill, ps.pid from person p cross join personSkill ps
          except
          select ps.pid as ppid, s.skill as sskill, ps.pid as pspid from personSkill ps cross join skill s 
     ) q6
     intersect
     select q1.pid from (
          select distinct p.pid from person p
          except
          select q2.ppid from (
               select q3.ppid, q3.skill1, q3.skill2 from (
                    select p.pid as ppid, s1.skill as skill1, s2.skill as skill2 from person p cross join skill s1 cross join skill s2
                    except
                    select q4.ppid, q4.skill1, q4.skill2 from (
                         select q5.ppid, q5.skill1, q5.skill2 from (
                              select ps.pid as ppid, s1.skill as skill1, s2.skill as skill2 from personSkill ps cross join skill s1 cross join skill s2 
                              intersect
                              select p.pid as ppid, ps.skill as skill1, s2.skill as skill2 from person p cross join personSkill ps cross join skill s2 
                         ) q5
                         union 
                         select q6.ppid, q6.skill1, q6.skill2 from (
                              select ps.pid as ppid, s1.skill as skill1, s2.skill as skill2, ps.pid, ps.skill from personSkill ps cross join skill s1 cross join skill s2 
                              intersect
                              select p.pid as ppid, s1.skill as skill1, ps.skill as skill2, ps.pid, ps.skill from person p cross join personSkill ps cross join skill s1
                         ) q6
                    ) q4
               ) q3
               intersect 
               select p.pid as ppid, s1.skill, s2.skill from person p, skill s1 join skill s2 on s1.skill <> s2.skill
          ) q2
     ) q1
) q;

select q.ppid from (
     select distinct q6.ppid from (
          select p.pid as ppid, ps.skill, ps.pid from person p cross join personSkill ps
          except
          select ps.pid as ppid, s.skill as sskill, ps.pid as pspid from personSkill ps cross join skill s 
     ) q6
     intersect
     select q1.pid from (
          select distinct p.pid from person p
          except
          select distinct q2.ppid from (
               select q4.ppid, q4.skill1, q4.skill2 from (
                    select p.pid as ppid, s1.skill as skill1, s2.skill as skill2 from person p cross join skill s1 cross join skill s2
                    except
                    select q3.ppid, q3.skill1, q3.skill2 from (
                         select ps.pid as ppid, s1.skill as skill1, s2.skill as skill2 from personSkill ps cross join skill s1 cross join skill s2 
                         intersect
                         select q5.ppid, q5.skill1, q5.skill2 from (
                              select p.pid as ppid, ps.skill as skill1, s2.skill as skill2 from person p cross join personSkill ps cross join skill s2
                              union
                              select p.pid as ppid, s1.skill as skill1, ps.skill as skill2 from person p cross join personSkill ps cross join skill s1 
                         ) q5
                    ) q3
               ) q4
               intersect 
               select p.pid as ppid, s1.skill, s2.skill from person p, skill s1 join skill s2 on s1.skill <> s2.skill
          ) q2
     ) q1
) q;

select q1.pid from (
          select distinct p.pid from person p
          except
          select distinct q2.ppid from (
               select q3.ppid, q3.skill1, q3.skill2 from (
                    select p.pid as ppid, s1.skill as skill1, s2.skill as skill2 from person p cross join skill s1 cross join skill s2
                    except
                    select q5.ppid, q5.skill1, q5.skill2 from (
                         select ps.pid as ppid, s1.skill as skill1, s2.skill as skill2 from personSkill ps cross join skill s1 cross join skill s2 
                         intersect
                         select p.pid as ppid, ps.skill as skill1, s2.skill as skill2 from person p cross join personSkill ps cross join skill s2 
                    ) q5
               ) q3
               intersect
               select q4.ppid, q4.skill1, q4.skill2 from (
                    select p.pid as ppid, s1.skill as skill1, s2.skill as skill2 from person p cross join skill s1 cross join skill s2
                    except
                    select q6.ppid, q6.skill1, q6.skill2 from (
                         select ps.pid as ppid, s1.skill as skill1, s2.skill as skill2, ps.pid, ps.skill from personSkill ps cross join skill s1 cross join skill s2 
                         intersect
                         select p.pid as ppid, s1.skill as skill1, ps.skill as skill2, ps.pid, ps.skill from person p cross join personSkill ps cross join skill s1
                    ) q6
               ) q4
               intersect 
               select p.pid as ppid, s1.skill, s2.skill from person p, skill s1 join skill s2 on s1.skill <> s2.skill
          ) q2
     ) q1


select q1.pid from (
          select distinct p.pid from person p
          except
          select distinct q2.ppid from (
               select q4.ppid, q4.skill1, q4.skill2 from (
                    select p.pid as ppid, s1.skill as skill1, s2.skill as skill2 from person p cross join skill s1 cross join skill s2
                    except
                    select q3.ppid, q3.skill1, q3.skill2 from (
                         select ps.pid as ppid, s1.skill as skill1, s2.skill as skill2 from personSkill ps cross join skill s1 cross join skill s2 
                         intersect
                         select q5.ppid, q5.skill1, q5.skill2 from (
                              select p.pid as ppid, ps.skill as skill1, s2.skill as skill2 from person p cross join personSkill ps cross join skill s2
                              union
                              select p.pid as ppid, s1.skill as skill1, ps.skill as skill2 from person p cross join personSkill ps cross join skill s1 
                         ) q5
                    ) q3
               ) q4
               intersect 
               select p.pid as ppid, s1.skill, s2.skill from person p, skill s1 join skill s2 on s1.skill <> s2.skill
          ) q2
     ) q1