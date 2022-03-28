CREATE TABLE detailed_table  AS (
SELECT 
  c.customer_id,
  c.first_name,
  c.last_name,
  c.email,
  rental.return_date,
  CASE
    WHEN rental.return_date >= ‘2005-08-07’ AND rental.return_date <= ‘2005-08-14’ THEN ‘Past-due’
  END late_rental
FROM rental
JOIN customer c ON c.customer_id = rental.customer_id
GROUP BY 
  c.customer_id,
  return_date,
  first_name 
);


SELECT * FROM customer_rentals
