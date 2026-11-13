{{ 
    config(
        materialized= 'ephemeral'
    )
}}

WITH ORDERS AS (
    SELECT
        ORDER_ID,
        USER_ID,
        ORDER_NUMBER,
        ORDER_DOW,
        ORDER_HOUR_OF_DAY,
        DAYS_SINCE_PRIOR_ORDER
    FROM {{ ref('obt')}}
)
SELECT * FROM ORDERS