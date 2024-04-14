select p.pid from person p where not overlap(
  (select personhasskills(p.pid)),
  (select array_agg(s.skill) from skill s where overlap(
      (select skillofpersons(s.skill)),
      (select array_agg(pid) from worksFor where cname = 'Yahoo' or cname = 'Netflix')
    )
  )
);