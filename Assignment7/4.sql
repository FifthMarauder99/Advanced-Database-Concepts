create table P(a integer);
create table Q(b integer);
create table R(a integer, b integer);

insert into P values(1),(5),(8),(11),(19),(50);
insert into Q values(1),(10),(15),(26),(24),(100);
insert into R values(1,10),(2,20),(3,30),(4,40),(5,50),(6,60);

explain analyze select p.a
from P p
where p.a not in (select r.a from R r where r.b not in (select q.b from Q q));

explain analyze select p.a
from P p
where p.a not in (select r.a
                    from R r
                    where r.b not in (select q.b 
                                        from Q q));


explain analyze select q2.a from
(select p.a
from P p
except 
select q1.a from 
            (select r.a,r.b
                from R r
                except
                select r.a,r.b
                from R r  natural join Q q ) q1 )q2;
