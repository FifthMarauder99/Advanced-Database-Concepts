\o q_4_duplicate_out.txt

\qecho '10'
select makeS(10);
vacuum full;
\qecho 'Distinct'
explain analyze select distinct x from S;
\qecho 'Group by'
explain analyze select x from S group by x;

\qecho '100'
vacuum full;
select makeS(100);
\qecho 'Distinct'
explain analyze select distinct x from S;
\qecho 'Group by'
explain analyze select x from S group by x;

\qecho '1000'
vacuum full;
select makeS(1000);
\qecho 'Distinct'
explain analyze select distinct x from S;
\qecho 'Group by'
explain analyze select x from S group by x;

\qecho '10000'
vacuum full;
select makeS(10000);
\qecho 'Distinct'
explain analyze select distinct x from S;
\qecho 'Group by'
explain analyze select x from S group by x;

\qecho '100000'
vacuum full;
select makeS(100000);
\qecho 'Distinct'
explain analyze select distinct x from S;
\qecho 'Group by'
explain analyze select x from S group by x;

\qecho '1000000'
vacuum full;
select makeS(1000000);
\qecho 'Distinct'
explain analyze select distinct x from S;
\qecho 'Group by'
explain analyze select x from S group by x;

\qecho '10000000'
vacuum full;
select makeS(10000000);
\qecho 'Distinct'
explain analyze select distinct x from S;
\qecho 'Group by'
explain analyze select x from S group by x;

\qecho '100000000'
vacuum full;
select makeS(100000000);
\qecho 'Distinct'
explain analyze select distinct x from S;
\qecho 'Group by'
explain analyze select x from S group by x;

