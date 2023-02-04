{{
        config(
            materialized='table',
            tags='stg',
            alias='stg_customer_vig',   
        )
        }}
select * from {{source ('stg_industry','customer')}}