#!/bin/bash

# MySQL credentials
USER="your_mysql_username"
PASSWORD="your_mysql_password"
HOST="your_mysql_host"
# Directory to save the dumps
DUMP_DIR="/mysql_bck"

# Ensure the dump directory exists
mkdir -p $DUMP_DIR

# Get the list of databases excluding the default ones
DBS=$(mysql -u $USER -p$PASSWORD -h $HOST -e "SHOW DATABASES;" | grep -Ev "(Database|information_schema|performance_schema|mysql|sys|tmp|x_dba|x_test1|s_test_s1)")

# Loop through each database and dump it
for DB in $DBS; do
    echo "Dumping database: $DB"
    mysqldump -u $USER -p$PASSWORD -h $HOST $DB > $DUMP_DIR/$DB.sql
    if [ $? -eq 0 ]; then
        echo "Database $DB dumped successfully."
    else
        echo "Error dumping database $DB."
    fi
done

echo "All database dumps are completed."
