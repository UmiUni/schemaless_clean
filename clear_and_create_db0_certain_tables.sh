#!/bin/bash

echo "clearling jogchat0..."

mysql -u root -pUmiuni_jogchat_schemales_2018@ -h 138.197.103.33 <<MY_QUERY

DROP DATABASE if exists jogchat0;

CREATE DATABASE jogchat0;

USE jogchat0;

CREATE TABLE cell
(
    added_at         BIGINT PRIMARY KEY AUTO_INCREMENT,
    row_key          BINARY(16) NOT NULL,
    column_name      VARCHAR(64) NOT NULL,
    ref_key          BIGINT NOT NULL,
    body             BLOB,
    created_at       DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT cell_idx UNIQUE(row_key, column_name,ref_key)
) ENGINE=InnoDB;

CREATE TABLE index_users_id(
    id VARCHAR(36) NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (id, row_key)
) ENGINE=InnoDB; 

CREATE TABLE index_users_username(
    username VARCHAR(20) NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (username, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_users_email(
    email VARCHAR(254) NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (email, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_users_phone(
    phone INT(10),
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (phone, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_users_activate(
    activate BOOLEAN NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (activate, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_users_token(
    token BINARY(60) NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (token, row_key)
) ENGINE=InnoDB;


CREATE TABLE index_companies_id(
    id VARCHAR(36) NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (id, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_companies_category(
    category VARCHAR(255) NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (category, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_companies_domain(
    domain VARCHAR(63) NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (domain, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_companies_name(
    name VARCHAR(255) NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (name, row_key)
) ENGINE=InnoDB;


CREATE TABLE index_schools_id(
    id VARCHAR(36) NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (id, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_schools_category(
    category VARCHAR(255) NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (category, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_schools_domain(
    domain VARCHAR(63) NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (domain, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_schools_name(
    name VARCHAR(255) NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (name, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_news_id(
    id VARCHAR(36) NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE, 
    PRIMARY KEY (id, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_news_domain(
    domain VARCHAR(63) NOT NULL, 
    row_key BINARY(16) NOT NULL UNIQUE, 
    PRIMARY KEY (domain, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_news_timestamp(
    timestamp BIGINT NOT NULL, 
    row_key BINARY(16) NOT NULL UNIQUE, 
    PRIMARY KEY (timestamp, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_news_author(
    author VARCHAR(255) NOT NULL, 
    row_key BINARY(16) NOT NULL UNIQUE, 
    PRIMARY KEY (author, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_news_title(
    title VARCHAR(1024) NOT NULL, 
    row_key BINARY(16) NOT NULL UNIQUE, 
    PRIMARY KEY (title, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_comment_id(
    id VARCHAR(36) NOT NULL, 
    row_key BINARY(16) NOT NULL UNIQUE, 
    PRIMARY KEY (id, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_comment_newsId(
    newsId VARCHAR(36) NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE, 
    PRIMARY KEY (newsId, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_comment_userId(
    userId VARCHAR(36) NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE, 
    PRIMARY KEY (userId, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_comment_parentId(
    parentId VARCHAR(36) NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE, 
    PRIMARY KEY (parentId, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_comment_content(
    content VARCHAR(300) NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE, 
    PRIMARY KEY (content, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_comment_timestamp(
    timestamp BIGINT NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE, 
    PRIMARY KEY (timestamp, row_key)
) ENGINE=InnoDB;

MY_QUERY

echo "create jogchat1 serveral index tables done"
