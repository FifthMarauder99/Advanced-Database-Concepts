
\o q_3_distinct_out.txt
vacuum full;
select s as "size of relation S", 
       t1 as "avg execution time to scan S",
       t2 as "avg execution time to de-duplicate S"
from experiment_scanning_deduplicate(3,1,8,3,'SELECT x FROM S', 'SELECT DISTINCT x FROM S');
