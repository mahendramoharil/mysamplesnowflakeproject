This project creates a materialized view customer_summary in Snowflake, aggregating data from three tables: pgsql_raw_customers, pgsql_raw_orders, and pgsql_raw_payments

Prerequisites:-

1. Github Access
2. Sign up for a free trail of Snowflake
3. Sign up for a free account in Hevo
4. Install/Configure PostgreSQL DB Instance
5. Network Configuration


Detail summary of this Assessment - 

1. Created PGSQL DB instance on GCP Cloud sql .
2. ![image](https://github.com/mahendramoharil/mysamplesnowflakeproject/assets/84889579/94dcbd39-44bf-4f4e-80c4-d265a9d7fa79)
3. Create Storage backup and copied the given 3 tables CSV files.
4. Create table and user (for Hevo Pipeline )
5. raw_orders / raw_payments / raw_customers
   PFB below sytanx for PGSQL.

    CREATE TABLE public.raw_payments(
    id integer NOT NULL,
    order_id integer,
    payment_method character varying COLLATE pg_catalog."default",
    amount integer) TABLESPACE pg_default;

ALTER TABLE public.raw_payments OWNER to postgres;
GRANT ALL ON TABLE public.raw_payments TO postgres;


