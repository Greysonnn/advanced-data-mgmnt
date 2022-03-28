CREATE TRIGGER summary_trigger
AFTER INSERT ON detailed_table
FOR EACH STATEMENT
EXECUTE PROCEDURE summary_populate();
