SELECT
  p.segment,
  COUNT(DISTINCT p.product_code) AS unique_product
FROM
  fact_sales_monthly s
JOIN
  dim_product p
ON
  s.product_code = p.product_code
GROUP BY
  p.segment
ORDER BY
  unique_product DESC;
