select * from sys.`schema_unused_indexes`;
SELECT DISTINCT TABLE_NAME,INDEX_NAME 
FROM INFORMATION_SCHEMA.STATISTICS
WHERE TABLE_SCHEMA = 'banking_transactions';
