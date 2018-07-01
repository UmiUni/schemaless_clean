#!/bin/bash

echo "clearling jogchat0..."

mysql -u root -pUmiuni_jogchat_schemales_2018@ -h 165.227.25.43 <<MY_QUERY
USE jogchat0
DELETE from cell;

DELETE from index_users_id;
DELETE from index_users_username;
DELETE from index_users_email;
DELETE from index_users_phone;
DELETE from index_users_activate;
DELETE from index_users_token;

DELETE from index_companies_id;
DELETE from index_companies_category;
DELETE from index_companies_domain;
DELETE from index_companies_name;

DELETE from index_schools_id;
DELETE from index_schools_category;
DELETE from index_schools_domain;
DELETE from index_schools_name;
MY_QUERY

echo "clearling jogchat0 done"
