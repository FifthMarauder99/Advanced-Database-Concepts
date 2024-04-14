
\o q_3_index_sort_out.txt
vacuum full;
select s as "size S",
       t1 as "create time for index (in ms)",
       t2 as "time for range query (in ms)"
from experiment_scanning_indexSort(3,1,7,3);

