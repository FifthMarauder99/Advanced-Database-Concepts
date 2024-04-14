
\o q_3_default_sort_out.txt
vacuum full;
select s as "size of relation S", 
       t1 as "avg execution time to scan S",
       t2 as "avg execution time to sort S"
from experiment_scanning_sorting(1,1,8,3,'SELECT x FROM S', 'SELECT x FROM S ORDER BY 1');

