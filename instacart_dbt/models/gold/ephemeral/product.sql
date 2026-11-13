{{
    config(
        materialized='ephemeral'
    )
}}

WITH PRODUCT AS (
   SELECT 
        PRODUCT_ID,
        PRODUCT_NAME,
        DEPARTMENT_ID,
        DEPARTMENT_NAME,
        AISLE_ID,
        AISLE
    FROM {{ ref('obt')}}
)
SELECT * FROM PRODUCT