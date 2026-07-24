# SQL GROUP BY Practice — Sakila Database

## Overview

This section contains practical SQL exercises focused on data aggregation and summarization using the MySQL Sakila database.

The objective of these exercises is to develop the ability to transform detailed records into meaningful business insights by grouping data and applying aggregate functions.

---

## Concepts Covered

Throughout these exercises, the following SQL concepts were practiced:

* GROUP BY clause
* Aggregate functions:

  * COUNT()
  * SUM()
  * AVG()
  * MIN()
  * MAX()
* Grouping data by categories and entities
* Combining JOIN operations with aggregations
* Ordering aggregated results
* Understanding business questions behind summarized data

---

## Learning Approach

Each exercise is based on a business scenario.

Before writing the query, the analysis process followed these steps:

1. Identify what the business wants to measure.
2. Determine the entity that should be used for grouping.
3. Choose the correct aggregation function.
4. Identify whether additional tables are required.
5. Build the query and validate that the result answers the business question.

The focus was not only on learning the syntax of `GROUP BY`, but on understanding **how raw data can be transformed into analytical information**.

---

# Key Concepts Learned

## GROUP BY Clause

Used to organize records into groups based on one or more columns.

Instead of analyzing individual rows, `GROUP BY` allows creating summaries.

Example use cases:

* Number of customers per store.
* Number of films per category.
* Total revenue per employee.

Example:

```sql
SELECT
    store_id,
    COUNT(customer_id)
FROM customer
GROUP BY store_id;
```

---

## COUNT()

Used to count the number of records within each group.

Example use cases:

* Count customers by store.
* Count rentals by customer.
* Count films by category.

---

## SUM()

Used to calculate the total value of a numeric column.

Example use cases:

* Total payments by employee.
* Total revenue by customer.
* Total sales by store.

---

## AVG()

Used to calculate the average value within each group.

Example use cases:

* Average payment per customer.
* Average rental duration by category.
* Average film length by rating.

---

## MIN() and MAX()

Used to identify the lowest and highest values within each group.

Example use cases:

* Highest payment made by customer.
* Shortest film by category.
* Longest rental duration.

---

## GROUP BY with JOINs

Many business questions require combining multiple tables before creating summaries.

Example:

```text
Film
 |
Film_Category
 |
Category
```

This allows answering questions such as:

* How many films belong to each category?
* Which category has the largest catalog?

---

# Skills Developed

By completing these exercises, I improved my ability to:

* Translate business questions into analytical queries.
* Identify the correct grouping level.
* Choose the appropriate aggregation function.
* Summarize large datasets into useful metrics.
* Combine JOIN operations with aggregate functions.
* Create SQL queries focused on business analysis.

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

After completing GROUP BY fundamentals, the next focus areas will be:

* HAVING clause
* Filtering aggregated results
* Advanced JOIN and aggregation combinations
* Subqueries
* Window functions

The goal is to progress from retrieving and summarizing data to performing deeper analytical analysis using SQL.
