This project creates a materialized view customer_summary in Snowflake, aggregating data from three tables: pgsql_raw_customers, pgsql_raw_orders, and pgsql_raw_payments

Prerequisites:-
====================
1. Github Access
2. Sign up for a free trail of Snowflake
3. Sign up for a free account in Hevo
4. Install/Configure PostgreSQL DB Instance
5. Network Configuration
6. dbt cloud installed
7. Access to a Snowflake database
8. Configured profiles.yml file for Snowflake

Project Structure
===========================
my_snowflake_project/
├── models/
│ ├── presale/
│ │ ├── core/
│ │ │ ├── customer_summary.sql
│ │ │ ├── customers.sql
│ │ │ ├── orders.sql
│ │ │ ├── payments.sql
│ │ │ ├── schema.yml
├── macros
├── dbt_project.yml
└── README.md

Setup Instructions:-
=========================
1. Clone the repository:

git clone https://github.com/mahendramoharil/mysamplesnowflakeproject
cd mysamplesnowflakeproject

2.Install dbt cloud :
3.Configure your profiles.yml:

my_snowflake_profile:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: <acname>
      user: <yourusername>
      password: <yourpwd>
      role: 
      database: HAVOSAMPLEDB
      warehouse: COMPUTE_WH
      schema: public
      threads: 1
      client_session_keep_alive: False 

Build and Run Instructions
==================
1.Installed required libraries 
2.dbt deps
3.dbt clean
4.dbt run
5.dbt test

Detail summary of this GCP Assessment - 
=========================

1. Created PGSQL DB instance on GCP Cloud sql .
2. ![image](https://github.com/mahendramoharil/mysamplesnowflakeproject/assets/84889579/94dcbd39-44bf-4f4e-80c4-d265a9d7fa79)
3. Create Storage backup and copied the given 3 tables CSV files.
   ![image](https://github.com/mahendramoharil/mysamplesnowflakeproject/assets/84889579/6c502a47-5024-41e4-bc75-451ea6611caa)
4. Create table and user (for Hevo Pipeline )
5. raw_orders / raw_payments / raw_customers
   PFB below sytanx for PGSQL.

1.  CREATE TABLE public.raw_payments(
    id integer NOT NULL,
    order_id integer,
    payment_method character varying COLLATE pg_catalog."default",
    amount integer) TABLESPACE pg_default;
ALTER TABLE public.raw_payments OWNER to postgres;
GRANT ALL ON TABLE public.raw_payments TO postgres;

2. CREATE TABLE public.raw_orders(
    id integer NOT NULL,
    user_id integer,
    order_date date,
    status character varying COLLATE pg_catalog."default") TABLESPACE pg_default;

ALTER TABLE public.raw_orders OWNER to postgres;
GRANT SELECT ON TABLE public.raw_orders TO hevouser;
GRANT ALL ON TABLE public.raw_orders TO postgres;

3.CREATE TABLE public.raw_customers
(
    id integer NOT NULL,
    first_name character varying ,
    last_name character varying )TABLESPACE pg_default;
    
ALTER TABLE public.raw_customer OWNER to postgres;
GRANT ALL ON TABLE public.raw_customers TO postgres;

6. Restored / Import the csv backup to PGSQL in Cloud SQL DB.
   By using PGADMIN Tool go to table and right click on Import option and add file name / format / encoding / Header (Yes) / Delimiter (,)
   once done check the raw count on tables.
7. Setup Network configuration between Source and Target
   whitelist Hevo ip, your sysment ip if you want to remote connection

8. Sign up Hevo and Snowflake account.
9. Create Hevo pipeline and add source connection details.
10. Test the connection. Once done please proceed
11. Configure Destination connection deails (Snowflake)
12. Once test connection done start Hevo Pipe Line by adding table details.
    ![image](https://github.com/mahendramoharil/mysamplesnowflakeproject/assets/84889579/ca0ae312-a60c-4b7a-9de8-7ef29dd471e7)
    
