-- Function
CREATE OR REPLACE FUNCTION check_Knows_foreign_key_constraint_action()
RETURNS trigger AS
$$
-- Logic
BEGIN
  IF NEW.pid1 NOT IN (SELECT pid FROM Person) or NEW.pid2 NOT IN (select pid FROM Person) THEN
  RAISE EXCEPTION 'Either pid1 or pid2 is not present in Person';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Definition
CREATE TRIGGER check_Knows_foreign_key_constraint_definition
BEFORE INSERT ON Knows
FOR EACH ROW EXECUTE PROCEDURE check_Knows_foreign_key_constraint_action();

-- NEW <- record that is inserted
-- OLD <- record that is deleted
