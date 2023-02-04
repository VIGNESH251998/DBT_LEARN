{{
        config(
            materialized='table',
            tags='ODS',
            alias='Dim_customer_vig',   
        )
        }}

        with cte1 as (select customerid , concat(firstname,' ',lastname) as name from  {{ref ('customer_stg')}}),
        cte2 as (select customerid,max(date(orderdate)) as last_order,min(date(orderdate)) as first_order,count(*) as count_of_order from {{ref ('order_stg')}} group by 1)
        ,final as (select 
        cte1.customerid,
        cte1.name,
        cte2.first_order,
        cte2.last_order,
        cte2.count_of_order
        from cte1 inner join cte2 on cte1.customerid = cte2.customerid)
        select * from final