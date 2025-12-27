WITH product_2020 AS (
  SELECT
    p.segment,
    COUNT(DISTINCT s.product_code) AS product_count_2020
  FROM
    fact_sales_monthly s
  JOIN
    dim_product p
  ON
    s.product_code = p.product_code
  WHERE
    EXTRACT(YEAR FROM s.date) = 2020
  GROUP BY
    p.segment),
product_2021 AS (
  SELECT
    p.segment,
    COUNT(DISTINCT s.product_code) AS product_count_2021
  FROM
    fact_sales_monthly s
  JOIN
    dim_product p
  ON
    s.product_code = p.product_code
  WHERE
    EXTRACT(YEAR FROM s.date) = 2021
  GROUP BY
    p.segment)
  SELECT
    p21.segment,
    p20.product_count_2020,
    p21.product_count_2021,
    (p21.product_count_2021-p20.product_count_2020) AS difference
  FROM
    product_2020 p20
  JOIN
    product_2021 p21
  ON
    p20.segment = p21.segment
  ORDER BY
    difference;
