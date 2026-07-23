/*============================================================

Exercise 01

Title:
Customer Rental Activity Report

Department:
Customer Analytics

Difficulty:
⭐⭐⭐ Medium

Business Request:

The Customer Analytics team needs to analyze customer activity
and understand rental behavior.

This report provides a detailed view of customer rental
transactions, helping identify customer engagement patterns.

Required Information:

- Customer ID
- Customer First Name
- Customer Last Name
- Rental ID
- Rental Date

Results must be ordered by:
- Customer Last Name
- Rental Date (most recent first)

Skills Demonstrated:

- INNER JOIN
- Primary Key and Foreign Key relationships
- Working with transactional data
- ORDER BY with multiple columns

Concepts Learned:

- Connecting customer information with rental activity
- Understanding relationships between entity and transactional
  tables
- Selecting appropriate tables based on business requirements

Database:

MySQL - Sakila

============================================================*/


SELECT
    customer.customer_id,
    customer.first_name,
    customer.last_name,
    rental.rental_id,
    rental.rental_date
FROM customer
INNER JOIN rental
    ON customer.customer_id = rental.customer_id
ORDER BY
    customer.last_name,
    rental.rental_date DESC;


/*
============================================================

Business Insight

This query provides the Customer Analytics team with a detailed
view of customer rental activity.

By connecting customer information with rental transactions,
the company can analyze customer engagement and identify
patterns in service usage.

This report can be used as a foundation for further customer
behavior analysis, segmentation, and retention strategies.

============================================================*/
