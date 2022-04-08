# SQL LESSONS

- We will be using Postgrel SQL

## Syntax

```

SELECT col_name_1, col_name_2, *
FROM table_name
WHERE col_name = row_value
ORDER_BY col_name_1 DESC, col_name_2
LIMIT 10
```

### SELECT & FROM

- Used to Select columns
- From a table

### SELECT DISTINCT

- Distinct answers the question how many unique values do we have in a column
- It displays values in the column without repeating value.

```
 SELECT DISTINCT(col_name)
 FROM table_name

### ORDER_BY

- Used to sort results by a chosen column
- ORDER_BY DESC sort in descending order

### WHERE

- Used to filter result
- Use all comparison operator
  =, >=, <=, in [list],'nonnumeric_data',etc

### LIMIT

- Limits the number of output

## Functionalities

### Derived Columns

col_name_1 + col_name_2 AS new_col_name

### Logical Operators

- LIKE => This allows you to perform operations similar to using WHERE and =, but for cases when you might not know exactly what you are looking for.
- IN => This allows you to perform operations similar to using WHERE and =, but for more than one condition.
- NOT => This is used with IN and LIKE to select all of the rows NOT LIKE or NOT IN a certain condition.
- AND & BETWEEN => These allow you to combine operations where all combined conditions must be true.
- OR => This allows you to combine operations where at least one of the combined conditions must be true.

### RegEx

% => any character or any number of character
e.g WHERE

### Join

- Used to join two or more tables

```

SELECT t1.col, t2.col
FROM table_1 t1
JOIN table_2 t2
ON t1.col =t2.col

```

```
