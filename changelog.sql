--liquibase formatted sql

--changeset your.name:1
use hello;
CREATE TABLE person(
   id int PRIMARY KEY,
   first_name text,
   last_name text,
   city text
);

--changeset your.name:2
use hello;
CREATE TABLE work_history(
   id int PRIMARY KEY,
   person_id int,
   business_name text
);