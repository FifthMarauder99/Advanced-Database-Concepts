--                  List of relations
--  Schema |      Name       | Type  |      Owner
-- --------+-----------------+-------+------------------
--  public | company         | table | srinivasa.vemula
--  public | companylocation | table | srinivasa.vemula
--  public | knows           | table | srinivasa.vemula
--  public | person          | table | srinivasa.vemula
--  public | personskill     | table | srinivasa.vemula
--  public | skill           | table | srinivasa.vemula
--  public | worksfor        | table | srinivasa.vemula
-- (7 rows)

-- Base tables
--------------
-- person
-- company
-- skill
-- worksFor
-- personSkill
-- knows

-- Functions
------------
-- personHasSkills -- personhasskills
-- skillOfPersons -- skillofpersons
-- knowsPersons -- knowspersons
-- isKnownByPersons -- isknownbypersons

select personHasSkills(1001);
select skillOfPersons('AI');
select knowsPersons(1001);
select isKnownByPersons(1001);