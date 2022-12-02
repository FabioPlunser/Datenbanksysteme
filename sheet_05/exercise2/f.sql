SELECT CONCAT(customer.first_name, ' ', customer.last_name) as customer_name,
       CONCAT(staff.first_name, ' ', staff.last_name) as staff_name,
       COUNT(payment.amount) AS total_amount
FROM payment
JOIN customer ON customer.customer_id = payment.customer_id
JOIN staff ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id,
         customer.customer_id
LIMIT 1