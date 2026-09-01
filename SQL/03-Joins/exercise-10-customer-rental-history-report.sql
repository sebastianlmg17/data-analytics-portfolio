# Customer Rental History Report

## Objective

Generate a customer report that includes rental information when available while keeping all registered customers in the analysis.

## Query

```sql
SELECT
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    customer.email,
    rental.rental_date
FROM customer

LEFT JOIN rental
    ON customer.customer_id = rental.customer_id

ORDER BY rental.rental_date DESC;
