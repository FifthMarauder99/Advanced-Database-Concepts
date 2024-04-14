select p.pid as p, p.pname as n,
  (
    select array_agg(p1.pid) from person p1 
      where cardinality((select knowspersons(p1.pid))) > cardinality((select knowspersons(p.pid)))
  ) as S
from person p where (select salary from worksFor where pid = p.pid) < 60000 order by 1;
