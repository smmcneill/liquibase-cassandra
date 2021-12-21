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

--changeset your.name:3
use hello;
insert into person (id, first_name, last_name, city) values (1, 'Shannon', 'McNeill', 'Hoboken');
