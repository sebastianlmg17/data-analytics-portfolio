# Stores With High Revenue

## Objective

Identify stores that generated more than 30,000 in payment revenue.

## Query

```sql
SELECT 
    store.store_id,
    SUM(payment.amount)
FROM store
INNER JOIN customer
    ON store.store_id = customer.store_id
INNER JOIN payment
    ON customer.customer_id = payment.customer_id
GROUP BY store.store_id
HAVING SUM(payment.amount) > 30000
ORDER BY SUM(payment.amount) DESC;
```

## Concepts

* HAVING clause
* SUM()
* GROUP BY
* Multiple INNER JOIN operations
* ORDER BY

## Business Insight

This report compares store-level revenue and identifies locations that generate significant payment volume.

## Skills Demonstrated

* Aggregating revenue across multiple related tables
* Filtering stores by total revenue
* Combining multiple JOIN operations with GROUP BY
* Ordering stores by revenue
