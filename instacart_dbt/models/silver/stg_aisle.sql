SELECT 
  AISLE_ID,
  NULLIF(TRIM(AISLE), '') AS AISLE

FROM {{ ref('br_aisle')}}