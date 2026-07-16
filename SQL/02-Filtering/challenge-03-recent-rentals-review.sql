/*============================================================

Challenge 03

Title:
Recent Rentals Review

Department:
Customer Service

Difficulty:
⭐⭐⭐ Intermediate

Business Request:
The Customer Service manager is reviewing recent rental
transactions related to customer complaints.

Required Information:
- Rental ID
- Rental Date
- Customer ID
- Staff ID
- Inventory ID

Requirements:
- Only rentals processed by Staff Member 2.
- Only customers with a Customer ID greater than 300.
- Display the most recent rentals first.
- If two rentals share the same date, display the highest
  Customer ID first.

Skills Demonstrated:
- SELECT
- WHERE
- AND
- ORDER BY

Concepts Learned:
- Combining multiple filtering conditions
- Filtering using comparison operators
- Multi-column sorting
- Translating business requirements into SQL queries

Database:
MySQL - Sakila

============================================================*/

SELECT
    rental_id,
    rental_date,
    customer_id,
    staff_id,
    inventory_id
FROM rental
WHERE staff_id = 2
  AND customer_id > 300
ORDER BY rental_date DESC,
         customer_id DESC;

/*
============================================================

Business Insight

This query allows the Customer Service department to review
recent rental transactions associated with a specific staff
member and customer segment, helping prioritize complaint
investigations.

============================================================
*/
