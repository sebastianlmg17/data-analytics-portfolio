/*============================================================

Exercise 02

Title:
High-Value Payments for Financial Audit

Department:
Finance

Difficulty:
⭐ Easy

Business Request:
The Finance department is reviewing high-value payments as
part of an internal audit.

Required Information:
- Payment ID
- Customer ID
- Staff ID
- Amount
- Payment Date

Only payments greater than $10 should be included.

The list must be ordered from the highest amount to the lowest.

Skills Demonstrated:
- SELECT
- WHERE
- ORDER BY

Concepts Learned:
- Filtering rows using comparison operators
- Sorting results in descending order
- Translating business requirements into SQL queries

Database:
MySQL - Sakila

============================================================*/

SELECT
    payment_id,
    customer_id,
    staff_id,
    amount,
    payment_date
FROM payment
WHERE amount > 10
ORDER BY amount DESC;

/*
============================================================

Business Insight

This query helps the Finance department quickly identify
high-value transactions that may require additional review
during an internal audit.

============================================================
*/
