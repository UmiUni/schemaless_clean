# schemaless_clean
ubuntu/linux scripts for cleaning schemaless 

Warning user discretion is strongly recommended. 
Usage will clear all production database.

Usage:
```
clear_and_create_db0_certain_tables.sh
clear_and_create_db1_certain_tables.sh
```
After running clearing script (clear all databases for testing purpose),
also need to run company/school backfill script:

Companies(S&P500) backfill will take 5mins
Schools(Universities) backfill will roughtly take 33mins
https://github.com/Jogchat/school_company_csv_to_schemaless
