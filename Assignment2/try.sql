with recursive Path(source, target) as (
  select source, target from graph
  UNION
  select g.source, p.target from graph g, path p where g.target=p.source
)

select distinct b1.bno, b2.bno, b3.bno from book b1, book b2, book b3 where b1.bno<>b2.bno and (b1.bno, b3.bno) in (select * from cites) and 
(b2.bno, b3.bno) in (select * from cites);

select c1.bno1, c2.bno1 from cites c1, cites c2 where c1.bno2=c2.bno2 and c1.bno1<>c2.bno1 and true=all(
  select c3.bno1=c2.bno1 from cites c3 where c3.bno1=c1.bno1
);

select b1.bno from book b1, book b2, book b3 where b1.bno<>b2.bno and 
(b1.bno, b3.bno) in (select * from cites) and 
(b2.bno, b3.bno) in (select * from cites) and true = all(
  select (b2.bno, b4.bno) in (select * from cites) from book b4 where b3.bno<>b4.bno and (b1.bno, b4.bno) in (select * from cites)
) and true=all(
  select (b1.bno, b4.bno) in (select * from cites) from book b4 where b3.bno<>b4.bno and (b2.bno, b4.bno) in (select * from cites)
);

-- Remove and to have intersect
select bno1 from (
  select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3 from book b1, book b2, book b3 where b1.bno<>b2.bno 
  INTERSECT 
  select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3 from book b1, book b2, book b3 where (b1.bno, b3.bno) in (select * from cites) 
  INTERSECT 
  select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3 from book b1, book b2, book b3 where (b2.bno, b3.bno) in (select * from cites)
  INTERSECT
  select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3 from book b1, book b2, book b3 where true = all(
    select (b2.bno, b4.bno) in (select * from cites) from book b4 where b3.bno<>b4.bno and (b1.bno, b4.bno) in (select * from cites)
  ) 
  INTERSECT
  select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3  from book b1, book b2, book b3 where true = all(
    select (b1.bno, b4.bno) in (select * from cites) from book b4 where b3.bno<>b4.bno and (b2.bno, b4.bno) in (select * from cites)
  )
) q;

select bno1 from (
  select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3 from book b1, book b2, book b3 where b1.bno<>b2.bno 
  INTERSECT 
  select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3 from book b1, book b2, book b3 where (b1.bno, b3.bno) in (select * from cites) 
  INTERSECT 
  select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3 from book b1, book b2, book b3 where (b2.bno, b3.bno) in (select * from cites)
  INTERSECT
  select * from (
    select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3 from book b1, book b2, book b3
    EXCEPT
    select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3 from book b1, book b2, book b3, book b4 where b3.bno<>b4.bno and (b1.bno, b4.bno) in (select * from cites) and (b2.bno, b4.bno) not in (select * from cites)
  ) q1
  INTERSECT
  select * from (
    select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3 from book b1, book b2, book b3
    EXCEPT 
    select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3 from book b1, book b2, book b3, book b4 where b3.bno<>b4.bno and (b2.bno, b4.bno) in (select * from cites) and (b1.bno, b4.bno) not in (select * from cites)
  ) q2
) q;

select bno1 from (
  select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3 from book b1, book b2, book b3 where b1.bno<>b2.bno 
  INTERSECT 
  select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3 from book b1, book b2, book b3 where (b1.bno, b3.bno) in (select * from cites) 
  INTERSECT 
  select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3 from book b1, book b2, book b3 where (b2.bno, b3.bno) in (select * from cites)
  INTERSECT
  select * from (
    select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3 from book b1, book b2, book b3
    EXCEPT
    select bno1, bno2, bno3 from (
          select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3, b4.bno as bno4 from book b1, book b2, book b3, book b4 where b3.bno<>b4.bno
          INTERSECT
          select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3, b4.bno as bno4 from book b1, book b2, book b3, book b4 where (b1.bno, b4.bno) in (select bno1, bno2 from cites)
          INTERSECT
          select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3, b4.bno as bno4 from book b1, book b2, book b3, book b4 where (b2.bno, b4.bno) not in (select bno1, bno2 from cites)
    ) q3
  ) q1
  INTERSECT
  select * from (
    select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3 from book b1, book b2, book b3
    EXCEPT 
    select bno1, bno2, bno3 from (
      select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3, b4.bno as bno4 from book b1, book b2, book b3, book b4 where b3.bno<>b4.bno
      INTERSECT
      select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3, b4.bno as bno4 from book b1, book b2, book b3, book b4 where (b2.bno, b4.bno) in (select bno1, bno2 from cites)
      INTERSECT
      select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3, b4.bno as bno4 from book b1, book b2, book b3, book b4 where (b1.bno, b4.bno) not in (select bno1, bno2 from cites)
    ) q4
  ) q2
) q;

select bno1 from (
  select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3 from book b1, book b2, book b3 where b1.bno<>b2.bno 
  INTERSECT 
  select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3 from book b1, book b2, book b3 where (b1.bno, b3.bno) in (select * from cites) 
  INTERSECT 
  select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3 from book b1, book b2, book b3 where (b2.bno, b3.bno) in (select * from cites)
  INTERSECT
  select * from (
    select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3 from book b1, book b2, book b3
    EXCEPT
    select bno1, bno2, bno3 from (
          select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3, b4.bno as bno4 from book b1, book b2, book b3, book b4 where b3.bno<>b4.bno
          INTERSECT
          select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3, b4.bno as bno4 from book b1, book b2, book b3, book b4 where (b1.bno, b4.bno) in (select bno1, bno2 from cites)
          INTERSECT
          select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3, b4.bno as bno4 from book b1, book b2, book b3, book b4 where (b2.bno, b4.bno) not in (select bno1, bno2 from cites)
    ) q3
  ) q1
  INTERSECT
  select * from (
    select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3 from book b1, book b2, book b3
    EXCEPT 
    select bno1, bno2, bno3 from (
      select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3, b4.bno as bno4 from book b1, book b2, book b3, book b4 where b3.bno<>b4.bno
      INTERSECT
      select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3, b4.bno as bno4 from book b1, book b2, book b3, book b4 where (b2.bno, b4.bno) in (select bno1, bno2 from cites)
      INTERSECT
      select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3, b4.bno as bno4 from book b1, book b2, book b3, book b4 where (b1.bno, b4.bno) not in (select bno1, bno2 from cites)
    ) q4
  ) q2
) q;


select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3, b4.bno as bno4 from book b1, book b2, book b3, book b4 where (b1.bno, b4.bno) in (select bno1, bno2 from cites)

select b1.bno as bno1, b2.bno as bno2, b3.bno as bno3, b4.bno as bno4 from book b1, book b2, book b3, book b4, cites c where b1.bno=c.bno1 and b4.bno=c.bno2



select c1.bno1 from cites c1, cites c2 where c1.bno2 = c2.bno2 and c1.bno1 <> c2.bno1 and true=all(
  select (c2.bno1, c3.bno2) in (select * from cites) from cites c3 where c1.bno1 = c3.bno1
) and true=all(
  select (c1.bno1, c3.bno2) in (select * from cites) from cites c3 where c2.bno1 = c3.bno1
);

select bno1 from (
  select c1.bno1 as bno1, c2.bno1 as bno2  from cites c1, cites c2 where c1.bno2 = c2.bno2
  INTERSECT
  select c1.bno1 as bno1, c2.bno1 as bno2 from cites c1, cites c2 where c1.bno1 <> c2.bno1
  INTERSECT
  select  c1.bno1 as bno1, c2.bno1 as bno2 from cites c1, cites c2 where true=all(
    select (c2.bno1, c3.bno2) in (select * from cites) from cites c3 where c1.bno1 = c3.bno1
  )
  INTERSECT
  select  c1.bno1 as bno1, c2.bno1 as bno2 from cites c1, cites c2 where true=all(
    select (c1.bno1, c3.bno2) in (select * from cites) from cites c3 where c2.bno1 = c3.bno1
  )
) q;

select bno1 from (
  select c1.bno1 as bno1, c2.bno1 as bno2  from cites c1, cites c2 where c1.bno2 = c2.bno2
  INTERSECT
  select c1.bno1 as bno1, c2.bno1 as bno2 from cites c1, cites c2 where c1.bno1 <> c2.bno1
  INTERSECT
  select * from (
    select  c1.bno1 as bno1, c2.bno1 as bno2 from cites c1, cites c2
    EXCEPT
    select  c1.bno1 as bno1, c2.bno1 as bno2 from cites c1, cites c2, cites c3 where c1.bno1 = c3.bno1 and (c2.bno1, c3.bno2) not in (select * from cites)
  ) q1
  INTERSECT
  select * from (
    select  c1.bno1 as bno1, c2.bno1 as bno2 from cites c1, cites c2
    EXCEPT
    select  c1.bno1 as bno1, c2.bno1 as bno2 from cites c1, cites c2, cites c3 where c2.bno1 = c3.bno1 and (c1.bno1, c3.bno2) not in (select * from cites)
  ) q2
) q;

select bno1 from (
  select c1.bno1 as bno1, c2.bno1 as bno2  from cites c1, cites c2 where c1.bno2 = c2.bno2
  INTERSECT
  select c1.bno1 as bno1, c2.bno1 as bno2 from cites c1, cites c2 where c1.bno1 <> c2.bno1
  INTERSECT
  select * from (
    select  c1.bno1 as bno1, c2.bno1 as bno2 from cites c1, cites c2
    EXCEPT
    select bno1, bno2 from (
      select  c1.bno1 as bno1, c2.bno1 as bno2, c3.bno1 as bno3 from cites c1, cites c2, cites c3 where c1.bno1 = c3.bno1
      INTERSECT
      select  c1.bno1 as bno1, c2.bno1 as bno2, c3.bno1 as bno3 from cites c1, cites c2, cites c3 where (c2.bno1, c3.bno2) not in (select bno1,bno2 from cites)
    ) q3
  ) q1
  INTERSECT
  select * from (
    select  c1.bno1 as bno1, c2.bno1 as bno2 from cites c1, cites c2
    EXCEPT
    select bno1, bno2 from (
      select  c1.bno1 as bno1, c2.bno1 as bno2, c3.bno1 as bno3 from cites c1, cites c2, cites c3 where c2.bno1 = c3.bno1
      INTERSECT
      select  c1.bno1 as bno1, c2.bno1 as bno2, c3.bno1 as bno3 from cites c1, cites c2, cites c3 where (c1.bno1, c3.bno2) not in (select * from cites)
    ) q4
  ) q2
) q;


select q.c1b1 from (
  select c1.bno1 as c1b1, c1.bno2 as c1b2, c2.bno1 as c2b1, c2.bno2 as c2b2  from cites c1, cites c2 where c1.bno2 = c2.bno2
  INTERSECT
  select c1.bno1 as c1b1, c1.bno2 as c1b2, c2.bno1 as c2b1, c2.bno2 as c2b2 from cites c1, cites c2 where c1.bno1 <> c2.bno1
  INTERSECT
  select q1.c1b1, q1.c1b2, q1.c2b1, q1.c2b2 from (
    select c1.bno1 as c1b1, c1.bno2 as c1b2, c2.bno1 as c2b1, c2.bno2 as c2b2 from cites c1, cites c2
    EXCEPT
    select q3.c1b1, q3.c1b2, q3.c2b1, q3.c2b2 from (
      select c1.bno1 as c1b1, c1.bno2 as c1b2, c2.bno1 as c2b1, c2.bno2 as c2b2, c3.bno1 as c3b1, c3.bno2 as c3b2 from cites c1, cites c2, cites c3 where c1.bno1 = c3.bno1
      INTERSECT
     - select q5.c1b1, q5.c1b2, q5.c2b1, q5.c2b2, q5.c3b1, q5.c3b2 from (
        select c1.bno1 as c1b1, c1.bno2 as c1b2, c2.bno1 as c2b1, c2.bno2 as c2b2, c3.bno1 as c3b1, c3.bno2 as c3b2 from cites c1, cites c2, cites c3
        EXCEPT
        select q6.c1b1, q6.c1b2, q6.c2b1, q6.c2b2, q6.c3b1, q6.c3b2 from (
          select c1.bno1 as c1b1, c1.bno2 as c1b2, c2.bno1 as c2b1, c2.bno2 as c2b2, c3.bno1 as c3b1, c3.bno2 as c3b2, c4.bno1 as c4b1, c4.bno2 as c4b2 from cites c1, cites c2, cites c3, cites c4 where c2.bno1=c4.bno1 
          INTERSECT
          select c1.bno1 as c1b1, c1.bno2 as c1b2, c2.bno1 as c2b1, c2.bno2 as c2b2, c3.bno1 as c3b1, c3.bno2 as c3b2, c4.bno1 as c4b1, c4.bno2 as c4b2 from cites c1, cites c2, cites c3, cites c4 where c3.bno2=c4.bno2
        ) q6
      ) q5
    ) q3
  ) q1
  INTERSECT
  select q2.c1b1, q2.c1b2, q2.c2b1, q2.c2b2 from (
    select c1.bno1 as c1b1, c1.bno2 as c1b2, c2.bno1 as c2b1, c2.bno2 as c2b2 from cites c1, cites c2
    EXCEPT
    select q4.c1b1, q4.c1b2, q4.c2b1, q4.c2b2 from (
      select  c1.bno1 as c1b1, c1.bno2 as c1b2, c2.bno1 as c2b1, c2.bno2 as c2b2, c3.bno1 as c3b1, c3.bno2 as c3b2 from cites c1, cites c2, cites c3 where c2.bno1 = c3.bno1
      INTERSECT
      select q8.c1b1, q8.c1b2, q8.c2b1, q8.c2b2, q8.c3b1, q8.c3b2 from (
        select c1.bno1 as c1b1, c1.bno2 as c1b2, c2.bno1 as c2b1, c2.bno2 as c2b2, c3.bno1 as c3b1, c3.bno2 as c3b2 from cites c1, cites c2, cites c3
        EXCEPT
        select q7.c1b1, q7.c1b2, q7.c2b1, q7.c2b2, q7.c3b1, q7.c3b2 from (
          select c1.bno1 as c1b1, c1.bno2 as c1b2, c2.bno1 as c2b1, c2.bno2 as c2b2, c3.bno1 as c3b1, c3.bno2 as c3b2, c4.bno1 as c4b1, c4.bno2 as c4b2 from cites c1, cites c2, cites c3, cites c4 where c1.bno1=c4.bno1 
          INTERSECT
          select c1.bno1 as c1b1, c1.bno2 as c1b2, c2.bno1 as c2b1, c2.bno2 as c2b2, c3.bno1 as c3b1, c3.bno2 as c3b2, c4.bno1 as c4b1, c4.bno2 as c4b2 from cites c1, cites c2, cites c3, cites c4 where c3.bno2=c4.bno2
        ) q7
      ) q8
    ) q4
  ) q2
) q;


select  c1.bno1 as bno1, c2.bno1 as bno2, c3.bno1 as bno3 from cites c1, cites c2, cites c3 where (c2.bno1, c3.bno2) not in (select bno1,bno2 from cites)

select * from (
  select  c1.bno1 as bno1, c2.bno1 as bno2, c3.bno1 as bno3 from cites c1, cites c2, cites c3
  EXCEPT
  select  c1.bno1 as bno1, c2.bno1 as bno2, c3.bno1 as bno3 from cites c1, cites c2, cites c3, cites c4 where c2.bno1=c4.bno1 and c3.bno2=c4.bno2
) q5


select bno1, bno2, bno3 from (
    select c1.bno1 as bno1, c2.bno1 as bno2, c3.bno1 as bno3 from cites c1, cites c2, cites c3
    EXCEPT
    select c1.bno1 as bno1, c2.bno1 as bno2, c3.bno1 as bno3 from cites c1, cites c2, cites c3, cites c4 where c2.bno1=c4.bno1 and c3.bno2=c4.bno2
) q5

select c1.bno1 as bno1, c2.bno1 as bno3, c3.bno3 as bno3 from (
    select c1.*, c2.*, c3.* as bno3 from cites c1, cites c2, cites c3 -- 3375
    EXCEPT
    select c1.*, c2.*, c3.* from cites c1, cites c2, cites c3, cites c4 where c2.bno1=c4.bno1 and c3.bno2=c4.bno2 -- 1395
) q5

select count(*) as bno3 from cites c1, cites c2, cites c3

select count(*) from cites c1, cites c2, cites c3, cites c4 where c2.bno1=c4.bno1 and c3.bno2=c4.bno2

select  count(*) from cites c1, cites c2, cites c3 where (c2.bno1, c3.bno2) not in (select bno1,bno2 from cites)


-- Some student who majors only bought books that where bought by students who major in Math

select distinct h.sid from hasMajor h where true=all(
  select (b.bno) in (select distinct b1.bno from hasMajor h1, buys b1 where h1.sid<>h.sid and b1.sid=h1.sid and h1.major='Math') from buys b where b.sid=h.sid
);

select distinct h.sid from hasMajor h where true=all(
  select b.bno in (select distinct b1.bno from hasMajor h1, buys b1 where b1.sid=h1.sid and h1.major='Math') from buys b where b.sid=h.sid
);

select distinct q.sid from (
  select h.sid, h.major from hasMajor h
  EXCEPT
  select h.sid, h.major from hasMajor h, buys b where b.sid=h.sid and b.bno not in (select distinct b1.bno from hasMajor h1, buys b1 where b1.sid=h1.sid and h1.major='Math') 
) q;

select distinct q.sid from (
  select h.sid, h.major from hasMajor h
  EXCEPT
  select q1.hsid, q1.major from (
    select h.sid as hsid, h.major, b.sid, b.bno from hasMajor h, buys b where b.sid=h.sid
    INTERSECT
    select h.sid as hsid, h.major, b.sid, b.bno from hasMajor h, buys b where b.bno not in (select distinct b1.bno from hasMajor h1, buys b1 where b1.sid=h1.sid and h1.major='Math')
  ) q1
) q;

select distinct q.sid from (
  select h.sid, h.major from hasMajor h
  EXCEPT
  select q1.hsid, q1.major from (
    select h.sid as hsid, h.major, b.sid as bsid, b.bno from hasMajor h, buys b where b.sid=h.sid
    INTERSECT
    select q2.hsid, q2.major, q2.bsid, q2.bno from (
      select h.sid as hsid, h.major, b.sid as bsid, b.bno from hasMajor h, buys b
      EXCEPT
      select h.sid as hsid, h.major, b.sid as bsid, b.bno from hasMajor h, buys b, hasMajor h1, buys b1 where b1.sid=h1.sid and h1.major='Math' and b1.bno=b.bno
    ) q2
  ) q1
) q;

select m1.major, m2.major from major m1, major m2 where m1.major<>m2.major and true=all(
  select h1.sid not in (select h2.sid from hasMajor h2 where h2.major=m2.major) from hasMajor h1 where h1.major=m1.major
);

select q.m1, q.m2 from (
  select m1.major as m1, m2.major as m2 from major m1, major m2 where m1.major<>m2.major
  INTERSECT
  select m1.major as m1, m2.major as m2 from major m1, major m2 where true=all(
    select h1.sid not in (select h2.sid from hasMajor h2 where h2.major=m2.major) from hasMajor h1 where h1.major=m1.major
  )
) q;

select q.m1, q.m2 from (
  select m1.major as m1, m2.major as m2 from major m1, major m2 where m1.major<>m2.major
  INTERSECT
  select m1.major as m1, m2.major as m2 from major m1, major m2 
  EXCEPT 
  select m1.major as m1, m2.major as m2 from major m1, major m2, hasMajor h1 where h1.major=m1.major and h1.sid in (select h2.sid from hasMajor h2 where h2.major=m2.major)
) q;



select q.m1, q.m2 from (
  select m1.major as m1, m2.major as m2 from major m1, major m2 where m1.major<>m2.major
  INTERSECT
  select q1.m1, q1.m2 from (
    select m1.major as m1, m2.major as m2 from major m1, major m2 
    EXCEPT
    select q2.m1, q2.m2 from (
      select m1.major as m1, m2.major as m2, h1.sid, h1.major from major m1, major m2, hasMajor h1 where h1.major=m1.major
      INTERSECT
      select m1.major as m1, m2.major as m2, h1.sid, h1.major from major m1, major m2, hasMajor h1, hasMajor h2 where h2.major=m2.major and h1.sid=h2.sid
    ) q2
  ) q1
) q;

-- Attribute ‘sid’ in the relation hasMajor is a foreign key referencing the primary key ‘sid’ in the relation Student

select h.sid from hasMajor h where not true=some(
  select h.sid = s.sid from student s
);

select h.sid from hasMajor h where true=all(
  select h.sid <> s.sid from student s
);

select q.sid from (
  select h.sid from hasMajor h
  EXCEPT
  select h.sid from hasMajor h, student s where h.sid = s.sid
) q


--- Problem 11

select distinct h.major, t.bno from hasMajor h join buys t on t.sid = h.sid join book b on t.bno = b.bno and true=all(
   select b.price <= b1.price from hasMajor h1 join buys t1 on t1.sid = h1.sid and h1.major = h.major join book b1 on t1.bno = b1.bno
);

select distinct h.major, t.bno from hasMajor h natural join buys t natural join book b where true=all(
   select b.price <= b1.price from hasMajor h1 natural join buys t1 natural join book b1 where h1.major = h.major 
);

select distinct h.major, t.bno from hasMajor h natural join buys t natural join book b where true=all(
   select b.price <= b1.price from hasMajor h1 natural join buys t1 natural join book b1 where h1.major = h.major 
);

select distinct h.major, t.bno from hasMajor h natural join buys t natural join book b where true=all(
   select b.price <= b1.price from (select * from hasMajor where major = h.major) h1 natural join buys t1 natural join book b1  
);

select distinct h.major, t.bno from hasMajor h natural join buys t natural join book b where true=all(
   select b.price <= b1.price from (select * from hasMajor where major = h.major) h1 natural join buys t1 natural join book b1  
);

select distinct h.major, t.bno from hasMajor h natural join buys t natural join book b where b.price <= all(
   select b1.price from (select * from hasMajor where major = h.major) h1 natural join buys t1 natural join book b1  
);

select distinct h.major, t.bno from hasMajor h natural join buys t natural join book b where not true=some(
   select b.price > b1.price from (select * from hasMajor where major = h.major) h1 natural join buys t1 natural join book b1  
);

select distinct h.major, t.bno from hasMajor h natural join buys t natural join book b where not exists(
   select 1 from (select * from hasMajor where major = h.major) h1 natural join buys t1 natural join book b1 where b.price > b1.price
);

select distinct h.major, t.bno from hasMajor h natural join buys t natural join book b
EXCEPT
select distinct h.major, t.bno from hasMajor h natural join buys t natural join book b join hasMajor h1 on h1.major = h.major natural join buys t1 natural join book b1; --where b.price > b1.price

-- on h1.major = h.major

select distinct h.major, t.bno from hasMajor h join buys t on t.sid = h.sid join book b on t.bno = b.bno and true=all(
   select b.price <= b1.price from hasMajor h1 join buys t1 on t1.sid = h1.sid and h1.major = h.major join book b1 on t1.bno = b1.bno
);

select distinct h.major, t.bno from hasMajor h join buys t on t.sid = h.sid join book b on t.bno = b.bno
EXCEPT
select distinct h.major, t.bno from hasMajor h join buys t on t.sid = h.sid join book b on t.bno = b.bno join hasMajor h1 on h.major=h1.major join buys t1 on t1.sid = h1.sid join book b1 on t1.bno = b1.bno and b.price > b1.price;


select distinct h.major, t.bno from hasMajor h natural join buys t natural join book b
INTERSECT 
select distinct h.major, t.bno from hasMajor h join buys t on t.sid = h.sid join book b on true=all(
   select b.price <= b1.price from hasMajor h1 join buys t1 on t1.sid = h1.sid and h1.major = h.major join book b1 on t1.bno = b1.bno
);

-- 5

select sid from student s where true=all(select (s.sid, b.bno) in (select * from buys) from book b);


select * from book b where b.price > 30;





