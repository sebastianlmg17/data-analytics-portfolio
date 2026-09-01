# Customers Without Rentals Report

## Objective

Identify customers who are registered in the system but have never completed a rental transaction.

## Query

```sql
SELECT 
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    customer.email
FROM customer

LEFT JOIN rental
    ON customer.customer_id = rental.customer_id

WHERE rental.rental_id IS NULL

ORDER BY customer.last_name;
```

## Concepts

* LEFT JOIN
* NULL Filtering
* Primary Key and Foreign Key relationships
* Customer analysis

## Business Insight

This report helps the Marketing team identify inactive customers who have not used the service yet, creating opportunities for targeted activation campaigns.

## Skills Demonstrated

* Identifying records without matching relationships
* Using LEFT JOIN for customer analysis
* Applying NULL conditions to filter missing activity
