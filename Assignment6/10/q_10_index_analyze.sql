\o q_10_index_analyze.txt

-- create index skill_index on personSkill(skill);

\qecho '10000'
select makePersonSkill(10000);
vacuum analyze personSkill;
explain analyze select pid from personSkill where skill = 'AI';
select queryPlan('select pid from personSkill where skill = ''AI''');

\qecho '100000'
select makePersonSkill(100000);
vacuum analyze personSkill;
explain analyze select pid from personSkill where skill = 'AI';
select queryPlan('select pid from personSkill where skill = ''AI''');

\qecho '1000000'
select makePersonSkill(1000000);
vacuum analyze personSkill;
explain analyze select pid from personSkill where skill = 'AI';

create index skill_index on personSkill (skill);
explain analyze select pid from personSkill where skill = 'AI';

drop index skill_index;
create index skill_index on personSkill using hash (skill);
explain analyze select pid from personSkill where skill = 'AI';

\qecho '10000000'
select makePersonSkill(10000000);
vacuum analyze personSkill;
select queryPlan('select pid from personSkill where skill = ''AI''');

