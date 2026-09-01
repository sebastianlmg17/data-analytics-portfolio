# Staff With High Payment Volume

## Objective

Identify staff members who processed more than 8,000 payment transactions.

## Query

```sql
SELECT 
    staff.staff_id,
    COUNT(payment.payment_id)
FROM staff
INNER JOIN payment
    ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id
HAVING COUNT(payment.payment_id) > 8000
ORDER BY COUNT(payment.payment_id) DESC;
```

## Concepts

* HAVING clause
* COUNT()
* GROUP BY
* INNER JOIN
* ORDER BY

## Business Insight

This report identifies staff members responsible for a high volume of payment transactions and can support workload and operational analysis.

## Skills Demonstrated

* Filtering aggregated transaction counts
* Linking staff with payment records
* Grouping transactional data by employee
* Ordering results by transaction volume
