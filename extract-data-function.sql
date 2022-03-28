CREATE FUNCTION summary_populate()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
DELETE FROM summary_table;

INSERT INTO summary_table(
SELECT
  customer_id,
  CONCAT (first_name, ‘ ‘, last_name) AS full_name,
  Email,
  Late_rental
FROM detailed_table
WHERE late_rental IS NOT NULL
GROUP BY customer_id, return_date, first_name, last_name, email, late_rental
);

RETURN NEW;
END;
$$
