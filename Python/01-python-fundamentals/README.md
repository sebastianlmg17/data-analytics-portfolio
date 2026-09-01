# Python Fundamentals

This section documents the Python fundamentals developed as part of my training, with a focus on skills that support data analytics, data manipulation and future machine learning work.

## Topics Covered

### Variables and Basic Operations
- Variables and assignment
- Arithmetic operators
- Comparison operators
- Logical operators (`and`, `or`, `not`)
- Division and remainder (`/`, `%`)
- Exponentiation (`**`)

### Data Structures
- Lists
- Tuples
- Sets
- Dictionaries
- Indexing and slicing
- Nested data structures
- List modification with `append()`, `insert()`, `remove()`, `pop()`
- Checking membership with `in`
- Counting elements with `count()`
- Sorting with `sort()` and `sorted()`
- Reversing lists with `reverse()`
- Copying lists
- Understanding mutable objects and references

### Control Flow
- `if`, `elif`, `else`
- Conditional expressions
- Combining conditions with `and`, `or` and `not`
- `for` loops
- `while` loops
- `range()`
- Accumulator patterns
- Combining loops and conditions

## Practical Patterns

### Iterating through a collection
```python
for number in numbers:
    print(number)
```

### Filtering values
```python
for number in numbers:
    if number % 2 == 0:
        print(number)
```

### Accumulating a result
```python
total = 0

for number in numbers:
    total += number
```

### Conditional access logic
```python
if age >= 18 and has_id:
    print("Access granted")
else:
    print("Access denied")
```

## Data Analytics Relevance

These fundamentals provide the base for working with structured data in Python. Lists and dictionaries are particularly relevant when handling collections of records and nested data, while loops, conditions and accumulators support data transformation and validation logic.

The next stages of this learning path will apply these programming fundamentals to data cleaning, analysis, visualization and machine learning.

## Current Status

**In progress — fundamentals review**

This section will be expanded as new concepts from the Python course are reviewed and demonstrated in practice.
