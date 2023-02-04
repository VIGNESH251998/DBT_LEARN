{{
        config(
            materialized='table',
            tags='stg',
            alias='stg_order_vig',   
        )
        }}
select * from {{source ('stg_industry','salesorderheader')}}