--liquibase formatted sql

--changeset your.name:1
use test;
CREATE TABLE person2(
   id int PRIMARY KEY,
   first_name text,
   last_name text,
   city text
);

--changeset your.name:2
use test;
CREATE TABLE work_history2(
   id int PRIMARY KEY,
   person_id int,
   business_name text
);