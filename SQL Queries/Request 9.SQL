WITH gross_sales AS (
  SELECT
    c.channel,
    SUM(g.gross_price*s.sold_quantity)/1000000 AS gross_sales_mln
  FROM
    fact_sales_monthly s
  JOIN
    dim_customer c
  ON
    s.customer_code = c.customer_code
  JOIN
    fact_gross_price g
  ON
    s.product_code = g.product_code
  AND
    s.fiscal_year = g.fiscal_year
  GROUP BY
    c.channel)
  SELECT
    channel,
    ROUND(gross_sales_mln,2) AS Gross_Sales_Mln,
    ROUND((gross_sales_mln/SUM(gross_sales_mln) OVER())*100,2) AS percentage
  FROM
    gross_sales
  ORDER BY
    Gross_Sales_Mln ASC; 
