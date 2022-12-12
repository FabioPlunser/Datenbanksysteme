-- create trigger that team must have less than 20 members

CREATE OR REPLACE FUNCTION team_members_trigger() RETURNS TRIGGER AS $$
DECLARE
    team_members INT;
BEGIN
    SELECT COUNT(*) INTO team_members FROM is_part_of WHERE team_id = NEW.team_id;
    IF team_members >= 20 THEN
        RAISE EXCEPTION 'Team % has too many members', NEW.team_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER team_members 
    BEFORE INSERT OR UPDATE ON team 
    FOR EACH ROW
    EXECUTE PROCEDURE team_members_trigger();


   


