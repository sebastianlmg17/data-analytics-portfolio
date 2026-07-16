/*============================================================

Exercise 03

Title:
Staff Directory for Human Resources

Department:
Human Resources

Difficulty:
⭐ Easy

Business Request:
The Human Resources department is updating the internal staff
directory.

Required Information:
- Staff ID
- First Name
- Last Name
- Email
- Username

The list must be ordered alphabetically by last name and,
when two employees share the same last name, by first name.

Skills Demonstrated:
- SELECT
- ORDER BY

Concepts Learned:
- Selecting business-relevant columns
- Sorting by multiple columns
- Translating business requirements into SQL queries

Database:
MySQL - Sakila

============================================================*/

SELECT
    staff_id,
    first_name,
    last_name,
    email,
    username
FROM staff
ORDER BY last_name, first_name;

/*
============================================================

Business Insight

This query generates an organized staff directory that helps
the Human Resources department quickly locate employees and
maintain internal records.

============================================================
*/
