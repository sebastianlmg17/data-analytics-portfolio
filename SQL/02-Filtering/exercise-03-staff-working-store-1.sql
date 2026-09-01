/*============================================================

Exercise 03

Title:
Staff Working at Store 1

Department:
Human Resources

Difficulty:
⭐ Easy

Business Request:
The Human Resources department needs a list of employees
working at Store 1.

Required Information:
- Staff ID
- First Name
- Last Name
- Email
- Store ID

Only employees assigned to Store 1 should be included.

The list must be ordered alphabetically by last name.

Skills Demonstrated:
- SELECT
- WHERE
- ORDER BY

Concepts Learned:
- Filtering records using equality conditions
- Selecting relevant business information
- Organizing query results

Database:
MySQL - Sakila

============================================================*/

SELECT
    staff_id,
    first_name,
    last_name,
    email,
    store_id
FROM staff
WHERE store_id = 1
ORDER BY last_name;

/*
============================================================

Business Insight

This query helps the Human Resources department quickly
identify employees assigned to Store 1, making staff
management and reporting more efficient.

============================================================
*/
