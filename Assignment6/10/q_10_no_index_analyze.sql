\o q_10_no_index_analyze.txt

\qecho '100000'
vacuum full;
select makePersonSkill(100000);
select queryPlan('select pid from personSkill where skill = ''AI''');

\qecho '1000000'
vacuum full;
select makePersonSkill(1000000);
select queryPlan('select pid from personSkill where skill = ''AI''');

\qecho '10000000'
vacuum full;
select makePersonSkill(10000000);
select queryPlan('select pid from personSkill where skill = ''AI''');

\qecho '100000000'
vacuum full;
select makePersonSkill(100000000);
select queryPlan('select pid from personSkill where skill = ''AI''');
