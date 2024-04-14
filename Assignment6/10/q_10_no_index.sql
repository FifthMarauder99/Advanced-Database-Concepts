\o q_10_no_index.txt

\qecho 'Experiment'
vacuum full;
select s as "size of relation S", e as "Average execution time for query"
from  experiment(3, 1, 8, 3, 'select pid from personSkill where skill = ''AI''');
