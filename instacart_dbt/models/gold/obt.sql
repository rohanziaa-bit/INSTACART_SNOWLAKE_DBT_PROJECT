
WITH order_product AS (

    SELECT
        ORDER_ID,
        PRODUCT_ID,
        ADD_TO_CART_ORDER,
        REORDERED
    FROM {{ ref('stg_order_product_prior') }}

),

order_data AS (

    SELECT
        ORDER_ID,
        USER_ID,
        EVAL_SET,
        ORDER_NUMBER,
        ORDER_DOW,
        ORDER_HOUR_OF_DAY,
        DAYS_SINCE_PRIOR_ORDER
    FROM {{ ref('stg_order') }}

),

product AS (

    SELECT
        PRODUCT_ID,
        PRODUCT_NAME,
        AISLE_ID,
        DEPARTMENT_ID
    FROM {{ ref('stg_product') }}

),

aisle AS (

    SELECT
        AISLE_ID,
        AISLE
    FROM {{ ref('stg_aisle') }}

),

department AS (

    SELECT
        DEPARTMENT_ID,
        DEPARTMENT_NAME
    FROM {{ ref('stg_department') }}

)

SELECT
    op.ORDER_ID,
    op.PRODUCT_ID,

    o.USER_ID,
    o.EVAL_SET,
    o.ORDER_NUMBER,
    o.ORDER_DOW,
    o.ORDER_HOUR_OF_DAY,
    o.DAYS_SINCE_PRIOR_ORDER,

    op.ADD_TO_CART_ORDER,
    op.REORDERED,

    p.PRODUCT_NAME,
    p.AISLE_ID,
    a.AISLE,
    p.DEPARTMENT_ID,
    d.DEPARTMENT_NAME

FROM order_product op

LEFT JOIN order_data o
    ON op.ORDER_ID = o.ORDER_ID

LEFT JOIN product p
    ON op.PRODUCT_ID = p.PRODUCT_ID

LEFT JOIN aisle a
    ON p.AISLE_ID = a.AISLE_ID

LEFT JOIN department d
    ON p.DEPARTMENT_ID = d.DEPARTMENT_ID
