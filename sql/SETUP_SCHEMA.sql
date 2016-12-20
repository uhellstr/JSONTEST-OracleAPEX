-- USER SQL
CREATE USER REST_DATA IDENTIFIED BY oracle 
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS
ALTER USER REST_DATA QUOTA UNLIMITED ON USERS;

-- ROLES
GRANT "CONNECT" TO REST_DATA ;

-- SYSTEM PRIVILEGES
GRANT CREATE TRIGGER TO REST_DATA ;
GRANT CREATE VIEW TO REST_DATA ;
GRANT CREATE SESSION TO REST_DATA ;
GRANT CREATE TABLE TO REST_DATA ;
GRANT CREATE TYPE TO REST_DATA ;
GRANT CREATE SYNONYM TO REST_DATA ;
grant create sequence to rest_data ;
GRANT CREATE PROCEDURE TO REST_DATA ;
