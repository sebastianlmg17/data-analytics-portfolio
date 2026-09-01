# Customers With High Rental Activity

## Objective

Identify customers who completed more than 35 rental transactions.

## Query

```sql
SELECT 
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    COUNT(rental.rental_id)
FROM customer
INNER JOIN rental
    ON customer.customer_id = rental.customer_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name
HAVING COUNT(rental.rental_id) > 35
ORDER BY COUNT(rental.rental_id) DESC;
```

## Concepts

* HAVING clause
* COUNT()
* GROUP BY
* INNER JOIN
* ORDER BY

## Business Insight

This report identifies the most active customers by rental frequency, supporting loyalty and customer engagement analysis.

## Skills Demonstrated

* Counting customer rental activity
* Filtering groups using COUNT()
* Grouping rental transactions by customer
* Ordering customers by activity level
