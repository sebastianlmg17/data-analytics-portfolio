# Customer Smallest Payment Report

## Objective

Identify the smallest payment made by each customer.

## Query

```sql
SELECT
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    MIN(payment.amount) AS smallest_payment
FROM customer

INNER JOIN payment
    ON customer.customer_id = payment.customer_id

GROUP BY
    customer.customer_id,
    customer.first_name,
    customer.last_name

ORDER BY smallest_payment ASC;
```

## Concepts

* INNER JOIN
* GROUP BY
* MIN()
* ORDER BY

## Business Insight

This report helps the Finance department identify the lowest payment made by each customer, providing insight into customer payment patterns.

## Skills Demonstrated

* Using MIN() with grouped data
* Aggregating customer transactions
* Working with financial datasets
* Ordering summarized information
