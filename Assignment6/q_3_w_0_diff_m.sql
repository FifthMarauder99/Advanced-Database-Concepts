
\o q_3_diff_m_out.txt

set max_parallel_workers = 0;

set work_mem = '64kB';
vacuum full;
select s as "size of relation S", 
       t1 as "avg execution time to scan S",
       t2 as "avg execution time to sort S"
from experiment_scanning_sorting(3,1,8,3,'SELECT x FROM S', 'SELECT x FROM S ORDER BY 1');

set work_mem = '4MB';
vacuum full;
select s as "size of relation S", 
       t1 as "avg execution time to scan S",
       t2 as "avg execution time to sort S"
from experiment_scanning_sorting(3,1,8,3,'SELECT x FROM S', 'SELECT x FROM S ORDER BY 1');

set work_mem = '32MB';
vacuum full;
select s as "size of relation S", 
       t1 as "avg execution time to scan S",
       t2 as "avg execution time to sort S"
from experiment_scanning_sorting(3,1,8,3,'SELECT x FROM S', 'SELECT x FROM S ORDER BY 1');

set work_mem = '256MB';
vacuum full;
select s as "size of relation S", 
       t1 as "avg execution time to scan S",
       t2 as "avg execution time to sort S"
from experiment_scanning_sorting(3,1,8,3,'SELECT x FROM S', 'SELECT x FROM S ORDER BY 1');

set work_mem = '512MB';
vacuum full;
select s as "size of relation S", 
       t1 as "avg execution time to scan S",
       t2 as "avg execution time to sort S"
from experiment_scanning_sorting(3,1,8,3,'SELECT x FROM S', 'SELECT x FROM S ORDER BY 1');

