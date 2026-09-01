/*============================================================

Exercise 01

Title:
Customer List for a Marketing Campaign

Department:
Marketing

Difficulty:
⭐ Easy

Business Request:
The Marketing department is preparing a promotional campaign
and needs a complete list of customers.

Required Information:
- Customer ID
- First Name
- Last Name

The list must be ordered alphabetically by last name.

Skills Demonstrated:
- SELECT
- ORDER BY

Database:
MySQL - Sakila

============================================================*/

SELECT
    customer_id,
    first_name,
    last_name
FROM customer
ORDER BY last_name;

/*
============================================================

Business Insight

This query provides the Marketing team with an alphabetically
ordered customer list, making it easier to export and use
for promotional campaigns.

============================================================
*/
