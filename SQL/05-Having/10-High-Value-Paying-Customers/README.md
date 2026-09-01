# High-Value Paying Customers

## Objective

Identify customers whose last name starts with the letter `B` and who have both high payment frequency and high total spending.

## Query

```sql
SELECT 
    customer.first_name,
    customer.last_name,
    COUNT(payment.payment_id),
    SUM(payment.amount)
FROM customer
INNER JOIN payment
    ON customer.customer_id = payment.customer_id
WHERE customer.last_name LIKE 'b%'
GROUP BY customer.customer_id, customer.first_name, customer.last_name
HAVING COUNT(payment.payment_id) > 30
   AND SUM(payment.amount) > 180
ORDER BY SUM(payment.amount) DESC;
```

## Concepts

* HAVING clause
* COUNT()
* SUM()
* WHERE with LIKE
* GROUP BY
* INNER JOIN
* Multiple HAVING conditions
* ORDER BY

## Business Insight

This report identifies customers who combine frequent payment activity with high total spending, helping Marketing prioritize high-value customer segments.

## Skills Demonstrated

* Combining row-level filtering with aggregated filtering
* Applying multiple conditions in HAVING
* Measuring both transaction frequency and total spending
* Grouping and analyzing customers using joined transactional data
