WITH product_2020 AS (
  SELECT
    COUNT(DISTINCT product_code) AS unique_product_2020
  FROM
    fact_sales_monthly
  WHERE 
    EXTRACT(YEAR FROM date) = 2020),
product_2021 AS (
  SELECT
    COUNT(DISTINCT product_code) AS unique_product_2021
  FROM
    fact_sales_monthly
  WHERE 
    EXTRACT(YEAR FROM date ) = 2021)
  SELECT
    p20.unique_product_2020,
    p21.unique_product_2021,
    ROUND((unique_product_2021-unique_product_2020)*100/unique_product_2020,2) AS percentage_change
  FROM
    product_2020 p20
  CROSS JOIN product_2021 p21;
