with cte1 as(

    select * from {{ ref('customer_stg') }}
)
select * from cte1