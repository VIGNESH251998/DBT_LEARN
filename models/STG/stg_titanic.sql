{{
config
(
    materialized='table',
    tags='stg',
    alias='stg_titanic_vig'  
)
}}

with cte1 as
(
    select * from {{ ref ('titanic')}}
)

select * from cte1