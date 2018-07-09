#!/bin/bash

echo "clearing jogchat0..."

mysql -u root -pUmiuni_jogchat_schemales_2018@ -h 165.227.25.43 <<MY_QUERY

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
    id VARCHAR(36) NOT NULL UNIQUE,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (id, row_key)
) ENGINE=InnoDB; 

CREATE TABLE index_users_username(
    username VARCHAR(20) NOT NULL UNIQUE,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (username, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_users_email(
    email VARCHAR(254) NOT NULL UNIQUE,
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

CREATE TABLE index_users_applicant(
    applicant BOOLEAN NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (applicant, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_users_referrer(
    referrer BOOLEAN NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (referrer, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_users_resume(
    resume VARCHAR(63) NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (resume, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_companies_id(
    id VARCHAR(36) NOT NULL UNIQUE,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (id, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_companies_domain(
    domain VARCHAR(63) NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (domain, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_companies_name(
    name VARCHAR(64) NOT NULL UNIQUE,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (name, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_schools_id(
    id VARCHAR(36) NOT NULL UNIQUE,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (id, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_schools_domain(
    domain VARCHAR(63) NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (domain, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_schools_name(
    name VARCHAR(64) NOT NULL UNIQUE,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (name, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_position_id(
    id VARCHAR(36) NOT NULL UNIQUE,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (id, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_position_postedBy(
    postedBy VARCHAR(36) NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (postedBy, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_position_position(
    position VARCHAR(64) NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (position, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_position_company(
    company VARCHAR(255) NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (company, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_comment_id(
    id VARCHAR(36) NOT NULL UNIQUE,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (id, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_comment_positionId(
    positionId VARCHAR(36) NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (positionId, row_key)
) ENGINE=InnoDB;

CREATE TABLE index_comment_parentId(
    parentId VARCHAR(36) NOT NULL,
    row_key BINARY(16) NOT NULL UNIQUE,
    PRIMARY KEY (parentId, row_key)
) ENGINE=InnoDB;

MY_QUERY

echo "create jogchat0 serveral index tables done"
