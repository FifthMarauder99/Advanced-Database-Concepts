
set max_parallel_workers = 0;

set work_mem = '64kB';


\qecho '10'
select makeS(10);
vacuum full;
explain analyze select x from S order by 1;

\qecho '100'
vacuum full;
select makeS(100);
explain analyze select x from S order by 1;

\qecho '1000'
vacuum full;
select makeS(1000);
explain analyze select x from S order by 1;

\qecho '10000'
vacuum full;
select makeS(10000);
explain analyze select x from S order by 1;

\qecho '100000'
vacuum full;
select makeS(100000);
explain analyze select x from S order by 1;

\qecho '1000000'
vacuum full;
select makeS(1000000);
explain analyze select x from S order by 1;

\qecho '10000000'
vacuum full;
select makeS(10000000);
explain analyze select x from S order by 1;

\qecho '100000000'
vacuum full;
select makeS(100000000);
explain analyze select x from S order by 1;

