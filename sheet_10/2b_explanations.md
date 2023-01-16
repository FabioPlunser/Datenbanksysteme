For speeding up this query we sould create a index in ascending order on the column `last_name` of the table `customer`:
    
```sql
CREATE INDEX last_name ON customer (last_names ASC);
```

Original
```sql
 Sort  (cost=42.62..44.12 rows=599 width=17)
   Sort Key: last_name
   ->  Seq Scan on customer  (cost=0.00..14.99 rows=599 width=17)
(3 rows)

Time: 1.717 ms
```

With Index
```sql
 Sort  (cost=42.62..44.12 rows=599 width=17)
   Sort Key: last_name
   ->  Seq Scan on customer  (cost=0.00..14.99 rows=599 width=17)
(3 rows)

Time: 1.355 ms
```

The Index is not used, because the dataset is to small. If the dataset would be bigger, the index would be used.