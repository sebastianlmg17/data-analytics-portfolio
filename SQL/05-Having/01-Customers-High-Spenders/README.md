# Customers With High Spending

## Objective

Identify customers whose total spending exceeds 150 in the Sakila database.

## Query

```sql
SELECT 
    customer.first_name,
    customer.last_name,
    SUM(payment.amount)
FROM customer
INNER JOIN payment
    ON customer.customer_id = payment.customer_id
GROUP BY customer.first_name, customer.last_name
HAVING SUM(payment.amount) > 150
ORDER BY SUM(payment.amount) DESC;
```

## Concepts

* HAVING clause
* SUM()
* GROUP BY
* INNER JOIN
* ORDER BY

## Business Insight

This report helps identify high-spending customers who generate significant revenue for the rental business.

## Skills Demonstrated

* Filtering aggregated results with HAVING
* Calculating customer-level revenue
* Combining JOINs with aggregation
* Ordering customers by total spending
