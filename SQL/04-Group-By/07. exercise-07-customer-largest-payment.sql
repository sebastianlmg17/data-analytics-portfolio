# Customer Largest Payment Report

## Objective

Identify the largest payment made by each customer.

## Query

```sql
SELECT
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    MAX(payment.amount) AS largest_payment
FROM customer

INNER JOIN payment
    ON customer.customer_id = payment.customer_id

GROUP BY
    customer.customer_id,
    customer.first_name,
    customer.last_name

ORDER BY largest_payment DESC;
```

## Concepts

* INNER JOIN
* GROUP BY
* MAX()
* ORDER BY

## Business Insight

This report helps the Finance department analyze customer spending behavior by identifying the highest individual payment made by each customer.

## Skills Demonstrated

* Using MAX() with grouped data
* Aggregating financial transactions
* Combining JOIN operations with aggregations
* Ranking business results
