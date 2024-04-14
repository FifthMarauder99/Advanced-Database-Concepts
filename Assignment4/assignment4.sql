-- Assigment 4

CREATE DATABASE dvgassignment4;
\c dvgassignment4

CREATE TABLE Person (
  pid INTEGER,
  name TEXT
);

CREATE TABLE Company (
  cname TEXT,
  city TEXT
);

CREATE TABLE worksFor (
  pid Integer,
  cname TEXT
);

CREATE TABLE Knows (
  pid1 Integer,
  pid2 Integer
);

DELETE FROM Person;
DELETE FROM Company;
DELETE FROM worksFor;
DELETE FROM Knows;

\echo 'Problem 1'
-- In Person pid is a primary key
CREATE OR REPLACE FUNCTION check_Person_key_constraint_action()
RETURNS trigger AS
$$
BEGIN
  IF NEW.pid IN (SELECT pid FROM Person) THEN
  RAISE EXCEPTION 'pid already exists in Person';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_Person_key_constraint_definition
BEFORE INSERT ON Person
FOR EACH ROW EXECUTE PROCEDURE check_Person_key_constraint_action();

-- Example
SELECT * FROM Person;
INSERT INTO Person VALUES (1001,'Jean');
SELECT * FROM Person;
-- Prevents inserting duplicate pid
INSERT INTO Person VALUES (1001,'Vidya');
SELECT * FROM Person;
-- But can insert with new pid
INSERT INTO Person VALUES (1002,'Vidya');
INSERT INTO Person VALUES (1003,'Anna');
SELECT * FROM Person;

-- In Knows pid1, pid2 is a composite primary key
CREATE OR REPLACE FUNCTION check_Knows_key_constraint_action()
RETURNS trigger AS
$$
BEGIN
  IF (NEW.pid1, NEW.pid2) IN (SELECT pid1, pid2 FROM Knows) THEN
  RAISE EXCEPTION '(pid1, pid2) already exists in Knows';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_Knows_key_constraint_definition
BEFORE INSERT ON Knows
FOR EACH ROW EXECUTE PROCEDURE check_Knows_key_constraint_action();

-- Example
SELECT * FROM Knows;
INSERT INTO Knows VALUES(1001, 1002);
-- Insert fails
INSERT INTO Knows VALUES(1001, 1002);
SELECT * FROM Knows;
-- Insert happens
INSERT INTO Knows VALUES(1001, 1003);
SELECT * FROM Knows;

-- pid1, pid2 in Knows are foreign keys to pid in Person
CREATE OR REPLACE FUNCTION check_Knows_foreign_key_constraint_action()
RETURNS trigger AS
$$
BEGIN
  IF NEW.pid1 NOT IN (SELECT pid FROM Person) or NEW.pid2 NOT IN (select pid FROM Person) THEN
  RAISE EXCEPTION 'Either pid1 or pid2 is not present in Person';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_Knows_foreign_key_constraint_definition
BEFORE INSERT ON Knows
FOR EACH ROW EXECUTE PROCEDURE check_Knows_foreign_key_constraint_action();

-- Example
SELECT * FROM Person;
INSERT INTO Knows VALUES(1001, 1004);
SELECT * FROM Knows;
INSERT INTO Knows VALUES(1004, 1001);
SELECT * FROM Knows;
INSERT INTO Knows VALUES(1004, 1005);
SELECT * FROM Knows;

INSERT INTO Person VALUES(1004, 'Qin');
SELECT * FROM Person;
INSERT INTO Knows VALUES(1001, 1004);
INSERT INTO Knows VALUES(1004, 1002);
SELECT * FROM Knows;

-- When a Person is deleted, delete corresponding record from Knows - Cascade delete
CREATE OR REPLACE FUNCTION cascade_delete_Knows_action()
RETURNS trigger AS
$$
BEGIN
  DELETE FROM Knows where pid1 = OLD.pid OR pid2 = OLD.pid;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER cascade_delete_Knows_action_definition
AFTER DELETE ON Person
FOR EACH ROW EXECUTE PROCEDURE cascade_delete_Knows_action();

-- Example
INSERT INTO Person VALUES (1005,'Megan');
INSERT INTO Knows VALUES(1001, 1005);
INSERT INTO Knows VALUES(1005, 1002);
SELECT * FROM Knows;

DELETE FROM Person WHERE pid=1005;
SELECT * FROM Knows;

\echo 'Problem 2'
-- cname in worksFor is foreign key to cname in company
CREATE OR REPLACE FUNCTION check_worksFor_foreign_key_constraint_action()
RETURNS trigger AS
$$
BEGIN
  IF NEW.cname NOT IN (SELECT cname FROM Company) THEN
  RAISE EXCEPTION 'cname does not exist in Company';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_worksFor_foreign_key_constraint_definition
BEFORE INSERT ON worksFor
FOR EACH ROW EXECUTE PROCEDURE check_worksFor_foreign_key_constraint_action();

SELECT * FROM Company;
INSERT INTO worksFor VALUES(1001, 'Amazon');
INSERT INTO Company VALUES('Amazon', 'Seattle');
SELECT * FROM Company;
INSERT INTO worksFor VALUES(1001, 'Amazon');

-- Cascade delete worksFor records when company is deleted
CREATE OR REPLACE FUNCTION cascade_delete_worksFor_action()
RETURNS trigger AS
$$
BEGIN
  DELETE FROM worksFor where cname = OLD.cname;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER cascade_delete_worksFor_action_definition
AFTER DELETE ON Company
FOR EACH ROW EXECUTE PROCEDURE cascade_delete_worksFor_action();

-- Example
INSERT INTO Company VALUES ('Apple','Seattle');
SELECT * FROM Company;
INSERT INTO worksFor VALUES(1002, 'Apple');
SELECT * FROM Company;
SELECT * FROM worksFor;
DELETE FROM Company WHERE cname='Apple';
SELECT * FROM Company;
SELECT * FROM worksFor;

\echo 'Problem 3'
--When I know a new person, I insert a record into KNows table
--When a record gets inserted into knows, the c value in PersonKnowsNumberofPersons gets incremented
CREATE TABLE PersonKnowsNumberofPersons(
	p Integer,
	n Text,
	c Integer
);

CREATE OR REPLACE FUNCTION insert_into_knows_action()
RETURNS trigger AS
$$
BEGIN
  IF (SELECT EXISTS(SELECT 1 FROM PersonKnowsNumberofPersons where p=NEW.pid1)) THEN
    UPDATE PersonKnowsNumberofPersons set c = (select c from PersonKnowsNumberofPersons where p=NEW.pid1) + 1 where p=NEW.pid1;
  ELSE
    INSERT INTO PersonKnowsNumberofPersons(p, n, c) SELECT pid, name, 1 FROM Person WHERE pid=NEW.pid1;
  END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER insert_into_knows_defintion
BEFORE INSERT ON Knows
FOR EACH ROW EXECUTE PROCEDURE insert_into_knows_action();

DELETE FROM Knows;
INSERT INTO Person VALUES (1005,'Nikhil');
INSERT INTO Person VALUES (1006,'Shreeja');
INSERT INTO Person VALUES (1007,'Ami');
INSERT INTO Person VALUES (1008,'Atharva');

SELECT * FROM PersonKnowsNumberofPersons;
INSERT INTO Knows VALUES(1005, 1006);
SELECT * FROM PersonKnowsNumberofPersons;
INSERT INTO Knows VALUES(1005, 1007);
SELECT * FROM PersonKnowsNumberofPersons;
INSERT INTO Knows VALUES(1005, 1008);
SELECT * FROM PersonKnowsNumberofPersons;
INSERT INTO Knows VALUES(1006, 1007);
SELECT * FROM PersonKnowsNumberofPersons;

-- Handle when we delete from knows table
CREATE OR REPLACE FUNCTION delete_knows_action()
RETURNS trigger AS
$$
BEGIN
  UPDATE PersonKnowsNumberofPersons SET c = (SELECT c FROM PersonKnowsNumberofPersons where p=OLD.pid1) - 1 WHERE p=OLD.pid1;
  RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER delete_knows_defintion
AFTER DELETE ON Knows
FOR EACH ROW EXECUTE PROCEDURE delete_knows_action();

SELECT * FROM PersonKnowsNumberofPersons;
DELETE FROM Knows WHERE pid1=1005 and pid2=1006;
SELECT * FROM PersonKnowsNumberofPersons;
DELETE FROM Knows WHERE pid1=1005 and pid2=1007;
SELECT * FROM PersonKnowsNumberofPersons;

\echo 'Problem 4'
CREATE TABLE Student(
  sid INTEGER PRIMARY KEY,
  sname TEXT,
  major TEXT
);

CREATE TABLE Course(
  cno INTEGER PRIMARY KEY,
  cname TEXT,
  total INTEGER,
  max INTEGER
);

CREATE TABLE Prerequisite(
  cno INTEGER,
  prereq INTEGER
);

CREATE TABLE hasTaken(
  sid INTEGER,
  cno INTEGER
);

CREATE TABLE Enroll(
  sid INTEGER,
  cno INTEGER
);

CREATE TABLE Waitlist(
  sid INTEGER,
  cno INTEGER,
  POSITION INTEGER
);

INSERT INTO Student VALUES
     (1001,'Jean','CS'),
     (1002,'Vidya', 'CS'),
     (1003,'Anna', 'DataScience'),
     (1004,'Qin', 'DataScience'),
     (1005,'Megan', 'Math'),
     (1006,'Ryan', 'CS'),
     (1007,'Danielle','Physics'),
     (1008,'Emma', 'DataScience'),
     (1009,'Hasan', 'DataScience'),
     (1010,'Linda', 'CS'),
     (1011,'Nick', 'Math'),
     (1012,'Eric', 'CS'),
     (1013,'Lisa', 'English'), 
     (1014,'Deepa', 'DataScience'), 
     (1015,'Chris', 'Chemistry'),
     (1016,'YinYue', 'CS'),
     (1017,'Latha', 'Physics'),
     (1018,'Arif', 'DataScience'),
     (1019,'John', 'Chemistry');

INSERT INTO Course VALUES
    (551, 'EAI', 0, 5),
    (657, 'ComputerVision', 0, 5),
    (651, 'NLP', 0, 5),
    (561, 'ADC', 0, 5);

INSERT INTO Prerequisite VALUES
  (657, 551),
  (651, 551);

CREATE OR REPLACE FUNCTION no_of_students(ccno INTEGER)
RETURNS INTEGER AS
$$
  select total from Course where cno=ccno;
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION max_students(ccno INTEGER)
RETURNS INTEGER AS
$$
  select max from Course where cno=ccno;
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION has_taken_prereq(ssid INTEGER, ccno INTEGER)
RETURNS BOOLEAN AS
$$
  SELECT true=all(
    SELECT (ssid, p.prereq) IN (select sid, cno from hasTaken) FROM Prerequisite p where p.cno=ccno
  );
$$ LANGUAGE SQL;

CREATE OR REPLACE FUNCTION current_waitlist(ccno INTEGER)
RETURNS INTEGER AS
$$
  select COUNT(c) from waitList c where cno=ccno;
$$ LANGUAGE SQL;

-- Insert on enroll
-- I should take all prerequisites
-- Course not full, insert into enroll and increase the total by 1
-- Course full, insert into waitList
CREATE OR REPLACE FUNCTION on_enroll_insert_action()
RETURNS trigger AS
$$
BEGIN
  IF has_taken_prereq(NEW.sid, NEW.cno) THEN
    IF no_of_students(NEW.cno) < max_students(NEW.cno) THEN
      UPDATE Course SET total = no_of_students(NEW.cno) + 1 WHERE cno=NEW.cno;
      RETURN NEW;
    ELSE
      INSERT INTO waitList VALUES(NEW.sid, NEW.cno, current_waitlist(NEW.cno) + 1);
      RETURN NULL;
    END IF;
  ELSE
    RAISE EXCEPTION 'Prerequisites must be met';
    RETURN NULL;
  END IF;
END;
$$LANGUAGE plpgsql;

CREATE TRIGGER on_enroll_insert_trigger_definition
BEFORE INSERT ON Enroll
FOR EACH ROW EXECUTE PROCEDURE on_enroll_insert_action();

DELETE FROM Enroll;
DELETE FROM hasTaken;

-- Course with prerequisite
INSERT INTO Enroll VALUES(1001, 651);
INSERT INTO hasTaken VALUES(1001, 551);
INSERT INTO Enroll VALUES(1001, 651);
SELECT * from Course;
SELECT * from Enroll;

-- Verify total
INSERT INTO Enroll VALUES (1001, 561);
select * from Course;

-- Verify waitlisting
INSERT INTO Enroll VALUES 
  (1002, 561),
  (1003, 561),
  (1004, 561),
  (1005, 561);
SELECT * FROM Course;
INSERT INTO Enroll VALUES
  (1006, 561),
  (1007, 561),
  (1008, 561);

SELECT * FROM Course;
SELECT * FROM Enroll;
SELECT * FROM waitList;

-- Delete from enroll
-- Someone in waitList, delete from enroll, delete from waitList and insert that into enroll. Total does not change
-- No one is waitList, delete from enroll, decrement total by 1
-- Total cannot be less than zero

CREATE OR REPLACE FUNCTION on_enroll_delete_action()
RETURNS trigger AS
$$
BEGIN
  IF no_of_students(OLD.cno) > 0 THEN
    UPDATE Course SET total = no_of_students(OLD.cno) - 1 WHERE cno=OLD.cno;
  END IF;

  IF current_waitlist(OLD.cno) > 0 THEN
    INSERT INTO Enroll (sid, cno) SELECT sid, cno FROM waitList WHERE cno=OLD.cno ORDER BY position LIMIT 1;
    DELETE FROM waitList WHERE (sid, cno) IN (SELECT sid, cno FROM waitList WHERE cno=OLD.cno ORDER BY position LIMIT 1);
  END IF;
  RETURN NULL;
END;
$$LANGUAGE plpgsql;

CREATE TRIGGER on_enroll_delete_trigger_definition
AFTER DELETE ON Enroll
FOR EACH ROW EXECUTE PROCEDURE on_enroll_delete_action();

-- Verify waiting list
SELECT * FROM Enroll;
SELECT * FROM waitList;
DELETE FROM Enroll where sid=1003 and cno=561;
SELECT * FROM Enroll;
SELECT * FROM waitList;

-- Everyone is enrolled
DELETE FROM Enroll where sid=1001 and cno=561;
DELETE FROM Enroll where sid=1005 and cno=561;
SELECT * from Enroll;
SELECT * FROM waitList;

SELECT * FROM Course;
DELETE FROM Enroll where sid=1004 and cno=561;
SELECT * FROM Course;

\c postgres
DROP DATABASE dvgassignment4;