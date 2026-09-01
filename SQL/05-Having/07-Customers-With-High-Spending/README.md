# Customers With High Spending

## Objective

Identify customers whose total payment amount exceeds 180.

## Query

```sql
SELECT 
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    SUM(payment.amount)
FROM customer
INNER JOIN payment
    ON customer.customer_id = payment.customer_id
GROUP BY customer.customer_id, customer.first_name, customer.last_name
HAVING SUM(payment.amount) > 180
ORDER BY SUM(payment.amount) DESC;
```

## Concepts

* HAVING clause
* SUM()
* GROUP BY
* INNER JOIN
* ORDER BY

## Business Insight

This report identifies high-value customers based on their cumulative payment activity and supports customer segmentation.

## Skills Demonstrated

* Calculating total customer spending
* Filtering grouped customers by revenue
* Grouping by customer identity
* Ordering customers by total spending
