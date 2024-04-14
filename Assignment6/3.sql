explain analyze select x from S;
explain analyze select x from S order by 1;

delete from executionTimeTable;
insert into executionTimeTable values(floor(power(10,1))::int, (select runexperiment(5,'select x from S')));
table executionTimeTable;

delete from executionTimeTable;
insert into executionTimeTable values(floor(power(10,1))::int, (select runexperiment(5,'select x from S order by 1')));
table executionTimeTable;


-- select 0.01
-- sort 0.018
-- quicksort
select makeS(10);

                                           QUERY PLAN                                           
------------------------------------------------------------------------------------------------
 Seq Scan on s  (cost=0.00..35.50 rows=2550 width=4) (actual time=0.005..0.006 rows=10 loops=1)
 Planning Time: 0.090 ms
 Execution Time: 0.014 ms
(3 rows)

                                              QUERY PLAN                                              
------------------------------------------------------------------------------------------------------
 Sort  (cost=179.78..186.16 rows=2550 width=4) (actual time=0.019..0.020 rows=10 loops=1)
   Sort Key: x
   Sort Method: quicksort  Memory: 25kB
   ->  Seq Scan on s  (cost=0.00..35.50 rows=2550 width=4) (actual time=0.010..0.012 rows=10 loops=1)
 Planning Time: 0.138 ms
 Execution Time: 0.033 ms
(6 rows)


-- select 0.024
-- sort 0.073
-- quicksort
select makeS(100);

                                           QUERY PLAN                                            
-------------------------------------------------------------------------------------------------
 Seq Scan on s  (cost=0.00..35.50 rows=2550 width=4) (actual time=0.008..0.018 rows=100 loops=1)
 Planning Time: 0.029 ms
 Execution Time: 0.033 ms
(3 rows)

                                              QUERY PLAN                                               
-------------------------------------------------------------------------------------------------------
 Sort  (cost=179.78..186.16 rows=2550 width=4) (actual time=0.045..0.054 rows=100 loops=1)
   Sort Key: x
   Sort Method: quicksort  Memory: 29kB
   ->  Seq Scan on s  (cost=0.00..35.50 rows=2550 width=4) (actual time=0.011..0.022 rows=100 loops=1)
 Planning Time: 0.117 ms
 Execution Time: 0.073 ms
(6 rows)


-- select 0.203
-- sort 0.446
-- quicksort
select makeS(1000);
explain analyze select x from S;
                                            QUERY PLAN                                            
--------------------------------------------------------------------------------------------------
 Seq Scan on s  (cost=0.00..35.50 rows=2550 width=4) (actual time=0.019..0.161 rows=1000 loops=1)
 Planning Time: 0.121 ms
 Execution Time: 0.246 ms
(3 rows)

explain analyze select x from S order by 1;
                                               QUERY PLAN                                               
--------------------------------------------------------------------------------------------------------
 Sort  (cost=179.78..186.16 rows=2550 width=4) (actual time=0.422..0.510 rows=1000 loops=1)
   Sort Key: x
   Sort Method: quicksort  Memory: 71kB
   ->  Seq Scan on s  (cost=0.00..35.50 rows=2550 width=4) (actual time=0.012..0.203 rows=1000 loops=1)
 Planning Time: 0.037 ms
 Execution Time: 0.598 ms
(6 rows)

-- select 1.616
-- sort 4.98
-- quicksort
select makeS(10000);
explain analyze select x from S;
                                             QUERY PLAN                                              
-----------------------------------------------------------------------------------------------------
 Seq Scan on s  (cost=0.00..159.75 rows=11475 width=4) (actual time=0.013..1.252 rows=10000 loops=1)
 Planning Time: 0.077 ms
 Execution Time: 1.884 ms
(3 rows)

explain analyze select x from S order by 1;
                                                QUERY PLAN                                                 
-----------------------------------------------------------------------------------------------------------
 Sort  (cost=933.52..962.21 rows=11475 width=4) (actual time=3.438..4.622 rows=10000 loops=1)
   Sort Key: x
   Sort Method: quicksort  Memory: 853kB
   ->  Seq Scan on s  (cost=0.00..159.75 rows=11475 width=4) (actual time=0.012..1.158 rows=10000 loops=1)
 Planning Time: 0.036 ms
 Execution Time: 5.359 ms
(6 rows)

-- select 1.616
-- sort 4.98
-- external merge
select makeS(100000);
explain analyze select x from S;
                                               QUERY PLAN                                                
---------------------------------------------------------------------------------------------------------
 Seq Scan on s  (cost=0.00..1572.65 rows=112965 width=4) (actual time=0.034..12.757 rows=100000 loops=1)
 Planning Time: 0.153 ms
 Execution Time: 19.304 ms
(3 rows)

explain analyze select x from S order by 1;
                                                  QUERY PLAN                                                  
--------------------------------------------------------------------------------------------------------------
 Sort  (cost=9747.82..9997.82 rows=100000 width=4) (actual time=41.243..53.256 rows=100000 loops=1)
   Sort Key: x
   Sort Method: external merge  Disk: 1376kB
   ->  Seq Scan on s  (cost=0.00..1443.00 rows=100000 width=4) (actual time=0.007..9.341 rows=100000 loops=1)
 Planning Time: 0.204 ms
 Execution Time: 60.620 ms
(6 rows)

-- select 182.234
-- sort 627.433
-- external merge
select makeS(1000000);
explain analyze select x from S;
                                                 QUERY PLAN                                                  
-------------------------------------------------------------------------------------------------------------
 Seq Scan on s  (cost=0.00..15708.75 rows=1128375 width=4) (actual time=0.021..117.536 rows=1000000 loops=1)
 Planning Time: 0.193 ms
 Execution Time: 176.170 ms
(3 rows)

explain analyze select x from S order by 1;
                                                    QUERY PLAN                                                    
------------------------------------------------------------------------------------------------------------------
 Sort  (cost=127757.34..130257.34 rows=1000000 width=4) (actual time=393.399..544.570 rows=1000000 loops=1)
   Sort Key: x
   Sort Method: external merge  Disk: 13800kB
   ->  Seq Scan on s  (cost=0.00..14425.00 rows=1000000 width=4) (actual time=0.008..83.445 rows=1000000 loops=1)
 Planning Time: 0.159 ms
 Execution Time: 605.878 ms
(6 rows)

-- select 1527.698
-- sort 7507.267
-- external merge
select makeS(10000000);
explain analyze select x from S;
                                                   QUERY PLAN                                                    
-----------------------------------------------------------------------------------------------------------------
 Seq Scan on s  (cost=0.00..157080.40 rows=11283240 width=4) (actual time=0.021..1265.876 rows=10000000 loops=1)
 Planning Time: 0.118 ms
 Execution Time: 1841.208 ms
(3 rows)

explain analyze select x from S order by 1;
                                                      QUERY PLAN                                                       
-----------------------------------------------------------------------------------------------------------------------
 Sort  (cost=1787312.97..1815521.07 rows=11283240 width=4) (actual time=5741.283..7005.703 rows=10000000 loops=1)
   Sort Key: x
   Sort Method: external merge  Disk: 137000kB
   ->  Seq Scan on s  (cost=0.00..157080.40 rows=11283240 width=4) (actual time=0.057..1067.908 rows=10000000 loops=1)
 Planning Time: 0.132 ms
 Execution Time: 7597.731 ms
(6 rows)

-- select 23000.629
-- sort 66103.283
-- external merge
-- number of workers 2
select makeS(100000000);

explain analyze select x from S;
                                                     QUERY PLAN                                                      
---------------------------------------------------------------------------------------------------------------------
 Seq Scan on s  (cost=0.00..1570796.90 rows=112831890 width=4) (actual time=0.020..22229.499 rows=100000000 loops=1)
 Planning Time: 0.183 ms
 Execution Time: 30762.937 ms
(3 rows)

explain analyze select x from S order by 1;
                                                              QUERY PLAN                                                              
--------------------------------------------------------------------------------------------------------------------------------------
 Gather Merge  (cost=8832930.06..19803463.18 rows=94026576 width=4) (actual time=32105.687..61124.285 rows=100000000 loops=1)
   Workers Planned: 2
   Workers Launched: 2
   ->  Sort  (cost=8831930.04..8949463.26 rows=47013288 width=4) (actual time=31983.912..38553.621 rows=33333333 loops=3)
         Sort Key: x
         Sort Method: external merge  Disk: 457144kB
         Worker 0:  Sort Method: external merge  Disk: 456496kB
         Worker 1:  Sort Method: external merge  Disk: 456488kB
         ->  Parallel Seq Scan on s  (cost=0.00..912610.88 rows=47013288 width=4) (actual time=0.044..4709.742 rows=33333333 loops=3)
 Planning Time: 0.275 ms
 Execution Time: 69274.752 ms
(11 rows)

-- Default
set max_parallel_workers = 8;
set work_mem = '4MB';
select s as "size of relation S", 
       t1 as "avg execution time to scan S",
       t2 as "avg execution time to sort S"
from experiment_scanning_sorting(1,1,8,3,'SELECT x FROM S', 'SELECT x FROM S ORDER BY 1');


 size of relation S | avg execution time to scan S | avg execution time to sort S 
--------------------+------------------------------+------------------------------
                 10 |                        0.021 |                        0.025
                100 |                        0.027 |                        0.064
               1000 |                        0.168 |                        0.580
              10000 |                        1.629 |                        4.787
             100000 |                       23.406 |                       86.746
            1000000 |                      220.674 |                      891.701
           10000000 |                     2407.903 |                    10923.629
          100000000 |                    22242.064 |                    76730.801
(8 rows)

set max_parallel_workers = 0;
-- 64kb
set work_mem = '64kB';
vacuum full;
 size of relation S | avg execution time to scan S | avg execution time to sort S 
--------------------+------------------------------+------------------------------
                 10 |                        0.016 |                        0.019
                100 |                        0.027 |                        0.072
               1000 |                        0.250 |                        2.989
              10000 |                        2.356 |                       15.985
             100000 |                       16.375 |                      114.565
            1000000 |                      238.041 |                     1738.397
           10000000 |                     2837.504 |                    20450.028
          100000000 |                    24907.134 |                   211225.279
(8 rows)

-- 4mb
set work_mem = '4MB';
vacuum full;
select s as "size of relation S", 
       t1 as "avg execution time to scan S",
       t2 as "avg execution time to sort S"
from experiment_scanning_sorting(1,1,8,3,'SELECT x FROM S', 'SELECT x FROM S ORDER BY 1');

 size of relation S | avg execution time to scan S | avg execution time to sort S 
--------------------+------------------------------+------------------------------
                 10 |                        0.011 |                        0.014
                100 |                        0.021 |                        0.046
               1000 |                        0.152 |                        0.391
              10000 |                        1.516 |                        4.401
             100000 |                       14.557 |                       54.155
            1000000 |                      157.673 |                      611.081
           10000000 |                     1719.339 |                     8173.922
          100000000 |                    15953.913 |                   111911.068
(8 rows)

-- 32mb
set work_mem = '32MB';
vacuum full;
select s as "size of relation S", 
       t1 as "avg execution time to scan S",
       t2 as "avg execution time to sort S"
from experiment_scanning_sorting(1,1,8,3,'SELECT x FROM S', 'SELECT x FROM S ORDER BY 1');

 size of relation S | avg execution time to scan S | avg execution time to sort S 
--------------------+------------------------------+------------------------------
                 10 |                        0.010 |                        0.021
                100 |                        0.022 |                        0.050
               1000 |                        0.171 |                        0.453
              10000 |                        1.365 |                        3.475
             100000 |                       12.785 |                       44.752
            1000000 |                      157.162 |                      689.314
           10000000 |                     1552.547 |                     6746.069
          100000000 |                    28158.766 |                   132115.831
(8 rows)

-- 265mb
set work_mem = '256MB';
vacuum full;
select s as "size of relation S", 
       t1 as "avg execution time to scan S",
       t2 as "avg execution time to sort S"
from experiment_scanning_sorting(1,1,8,3,'SELECT x FROM S', 'SELECT x FROM S ORDER BY 1');

  size of relation S | avg execution time to scan S | avg execution time to sort S 
--------------------+------------------------------+------------------------------
                 10 |                        0.011 |                        0.022
                100 |                        0.022 |                        0.048
               1000 |                        0.167 |                        0.429
              10000 |                        1.622 |                        4.854
             100000 |                       15.444 |                       51.482
            1000000 |                      151.090 |                      589.123
           10000000 |                     2078.464 |                     8992.756
          100000000 |                    21467.751 |                   105727.926
(8 rows)

-- 512mb
set work_mem = '512MB';
vacuum full;
select s as "size of relation S", 
       t1 as "avg execution time to scan S",
       t2 as "avg execution time to sort S"
from experiment_scanning_sorting(1,1,8,3,'SELECT x FROM S', 'SELECT x FROM S ORDER BY 1');

 size of relation S | avg execution time to scan S | avg execution time to sort S 
--------------------+------------------------------+------------------------------
                 10 |                        0.013 |                        0.020
                100 |                        0.027 |                        0.060
               1000 |                        0.173 |                        0.477
              10000 |                        1.794 |                        5.950
             100000 |                       16.217 |                       71.899
            1000000 |                      219.627 |                      814.047
           10000000 |                     2119.874 |                     9535.667
          100000000 |                    23338.523 |                   101519.604
(8 rows)


set work_mem = '64kB';

vacuum full;
select makeS(10);
explain analyze select x from S order by 1;

vacuum full;
select makeS(100);
explain analyze select x from S order by 1;

vacuum full;
select makeS(1000);
explain analyze select x from S order by 1;

vacuum full;
select makeS(10000);
explain analyze select x from S order by 1;

vacuum full;
select makeS(100000);
explain analyze select x from S order by 1;

vacuum full;
select makeS(1000000);
explain analyze select x from S order by 1;

vacuum full;
select makeS(10000000);
explain analyze select x from S order by 1;

vacuum full;
select makeS(100000000);
explain analyze select x from S order by 1;

