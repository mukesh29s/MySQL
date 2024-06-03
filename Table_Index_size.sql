`/*`  Check table size, index size, number of rows and total size ´*/`

SELECT concat(table_schema,'.',table_name) tables,
	concat(round(table_rows/1000000,2),'M') rows,
	concat(round(data_length/(1024*1024*1024),2),'G') data_size,
	concat(round(index_length/(1024*1024*1024),2),'G') index_size,
	concat(round((data_length+index_length)/(1024*1024*1024),2),'G') total_size,
	round(index_length/data_length,2) index_data_ratio
FROM information_schema.TABLES
where table_schema like '%production'
and table_name='delayed_jobs'
ORDER BY total_size DESC LIMIT 30;
