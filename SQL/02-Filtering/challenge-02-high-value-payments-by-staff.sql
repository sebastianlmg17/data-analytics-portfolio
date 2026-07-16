/*============================================================

Challenge 02

Title:
High-Value Payments Processed by Staff Member 1

Department:
Operations

Difficulty:
⭐⭐⭐ Intermediate

Business Request:
The Operations department is reviewing payments processed by
Staff Member 1 to verify compliance with internal policies.

Required Information:
- Payment ID
- Customer ID
- Staff ID
- Amount
- Payment Date

Requirements:
- Only payments processed by Staff Member 1.
- Only payments with an amount greater than or equal to $8.
- Display the highest payments first.
- If two payments have the same amount, display the most recent payment first.

Skills Demonstrated:
- SELECT
- WHERE
- AND
- ORDER BY

Concepts Learned:
- Combining multiple filtering conditions
- Filtering using comparison operators
- Multi-column sorting
- Understanding the business meaning of database fields

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
WHERE staff_id = 1
  AND amount >= 8
ORDER BY amount DESC,
         payment_date DESC;

/*
============================================================

Business Insight

This query helps the Operations department review high-value
transactions processed by a specific staff member, making it
easier to verify compliance with internal review procedures.

============================================================
*/
