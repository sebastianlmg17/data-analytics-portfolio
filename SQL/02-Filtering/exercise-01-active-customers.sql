/*============================================================

Exercise 01

Title:
Active Customers for a Marketing Campaign

Department:
Marketing

Difficulty:
⭐ Easy

Business Request:
The Marketing department is preparing a promotional campaign
targeting only active customers.

Required Information:
- Customer ID
- First Name
- Last Name
- Email

Only active customers should be included.

The list must be ordered alphabetically by last name.

Skills Demonstrated:
- SELECT
- WHERE
- ORDER BY

Concepts Learned:
- Filtering rows with WHERE
- Selecting business-relevant columns
- Translating business requirements into SQL queries

Database:
MySQL - Sakila

============================================================*/

SELECT
    customer_id,
    first_name,
    last_name,
    email
FROM customer
WHERE active = 1
ORDER BY last_name;

/*
============================================================

Business Insight

This query provides the Marketing department with a clean
list of active customers, ensuring promotional campaigns
are only sent to eligible recipients.

============================================================
*/
