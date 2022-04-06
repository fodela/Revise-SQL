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
