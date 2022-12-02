SELECT
    first_name,
    last_name,
    (
        SELECT 
            AVG(payment.amount) as avg_payment
            FROM payment 
            where payment.staff_id = staff.staff_id
            GROUP BY payment.customer_id
            ORDER BY avg_payment DESC
            LIMIT 1
    ) as highest_avg_payment_from_customer
FROM staff;