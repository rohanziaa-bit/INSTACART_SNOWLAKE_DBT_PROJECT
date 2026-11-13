SELECT 
   ORDER_ID,
   PRODUCT_ID,
   ADD_TO_CART_ORDER,
   REORDERED
   
FROM {{ ref('order_product_prior')}}