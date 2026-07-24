# SQL JOINs Practice — Sakila Database

## Overview

This section contains practical SQL exercises focused on understanding and applying **JOIN operations** using the MySQL Sakila database.

The objective of these exercises is to develop the ability to combine information from multiple related tables, understand database relationships, and write queries based on real business requirements.

---

## Concepts Covered

Throughout these exercises, the following SQL concepts were practiced:

* INNER JOIN
* LEFT JOIN
* Multi-table relationships
* Primary Key and Foreign Key relationships
* Bridge tables (Many-to-Many relationships)
* Choosing the correct starting table
* Filtering joined data
* Ordering results from joined datasets

---

## Learning Approach

Each exercise is based on a business scenario.

Before writing the query, the analysis process followed these steps:

1. Identify the business requirement.
2. Determine the main entity being analyzed.
3. Identify the required tables.
4. Understand the relationship between tables.
5. Choose the appropriate JOIN type.
6. Build and validate the SQL query.

The focus was not only on syntax, but on understanding **why a JOIN is necessary and what information each table contributes**.

---

# Key Concepts Learned

## INNER JOIN

Used when only matching records between tables are required.

Example use cases:

* Retrieve films with their languages.
* Connect actors with films.
* Combine customer information with related records.

---

## LEFT JOIN

Used when all records from the main table must be kept, even if there is no matching record in the related table.

Example use cases:

* Finding customers without rentals.
* Identifying films without inventory.
* Analyzing missing relationships.

---

## Many-to-Many Relationships

Some entities cannot be connected directly.

Example:

```
Film
 |
 |
Film_Actor
 |
 |
Actor
```

The bridge table allows the relationship between multiple films and multiple actors.

---

# Skills Developed

By completing these exercises, I improved my ability to:

* Analyze relational database structures.
* Follow relationships between tables.
* Select the correct JOIN strategy.
* Build queries based on business questions.
* Avoid unnecessary JOINs.
* Understand how data analysts retrieve information from relational databases.

---

## Database Used

**MySQL — Sakila Sample Database**

Sakila is a relational database designed to simulate a DVD rental business environment.

It contains realistic entities such as:

* Customers
* Films
* Actors
* Categories
* Stores
* Rentals
* Payments

---

## Next Steps

After completing JOIN fundamentals, the next focus area will be:

* GROUP BY
* Aggregate functions:

  * COUNT()
  * SUM()
  * AVG()
  * MIN()
  * MAX()
* HAVING
* Combining JOINs with aggregations

The goal is to progress from retrieving data to performing business analysis using SQL.
