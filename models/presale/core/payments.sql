with customer_payments as (
  select
    o.user_id,
    sum(p.amount) as customer_lifetime_value
  from HAVOSAMPLEDB.public.pgsql_raw_payments p
  join HAVOSAMPLEDB.public.pgsql_raw_orders o
    on p.order_id = o.id
  group by o.user_id
)
select
  user_id,
  customer_lifetime_value
from customer_payments