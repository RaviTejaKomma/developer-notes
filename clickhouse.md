## Clickhouse

### Useful queries

1. The easiest way to figure out what settings are available, what do they mean and what the defaults are is to query the system.settings table

```sql
SELECT name, value, changed, description
FROM system.settings
WHERE name LIKE '%max_insert_b%'
FORMAT TSV
```

2. To get the mutations that are completed

```sql
select * from system.mutations where is_done=1
```

3. To get the partition id's of a table in database:

```sql
SELECT DISTINCT partition_id FROM `system`.`parts` WHERE database='default' AND table='test'
```

```sql
SELECT 
    partition, 
    count() as number_of_parts, 
    formatReadableSize(sum(bytes)) as sum_size 
FROM system.parts 
WHERE 
    active 
    AND database = 'default' 
    AND table = 'test' 
GROUP BY partition 
ORDER BY partition;
```


4. To save the query result into an output file.

```sql
select * from test into outfile '/home/ravi/Documents/result.csv' format CSV
```

5. To fire the queries over the HTTP interface 

```shell
echo "select count(*) from test" | curl 'http://localhost:8123/' --data-binary @-
```

6. **ArrayJoin** function takes an array as an argument, and propagates the source row to multiple rows for the number of elements in the array. All the values in columns are simply copied, except the values in the column where this function is applied; it is replaced with the corresponding array value.

```
SELECT arrayJoin([1, 2, 3] AS src) AS dst, 'Hello', src
┌─dst─┬─\'Hello\'─┬─src─────┐
│   1 │ Hello     │ [1,2,3] │
│   2 │ Hello     │ [1,2,3] │
│   3 │ Hello     │ [1,2,3] │
└─────┴───────────┴─────────┘
```

7. SELECT toDateTime('2016-06-15 23:00:00') AS time,

8. To drop the partitions from all the nodes at once

```sql
ALTER TABLE test ON CLUSTER test_cluster DROP PARTITION '2020-04-17'
```

9. Queries to get the size of databases/tables

```sql
select 
	concat(database, '.', table) as table,
	sum(bytes) as size
from system.parts
where active
group by database, table
order by size desc;
```

```sql
select 
	database, 
    sum(bytes) as size
from system.parts
where active
group by database
order by size desc;
```

```sql
SELECT table,
    formatReadableSize(sum(bytes)) as size,
    min(min_date) as min_date,
    max(max_date) as max_date
    FROM system.parts
    WHERE active
GROUP BY table
```

### References
1. https://tech.marksblogg.com/faster-clickhouse-imports-csv-parquet-mysql.html
2. https://gist.github.com/sanchezzzhak/511fd140e8809857f8f1d84ddb937015