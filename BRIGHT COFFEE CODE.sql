SELECT transaction_date,
       DAYNAME(transaction_date) AS day_name,
        CASE
    WHEN day_name NOT IN ('Sat','Sun') THEN 'Weekday'
    ELSE 'Weekend'
    END AS day_classification,
    MONTHNAME(transaction_date) AS month_name,
    transaction_time,
    
CASE 
    WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN 'Morning'
    WHEN transaction_time BETWEEN '12:00:00' AND '16:59:59' THEN 'Afternoon'
    WHEN transaction_time BETWEEN '17:00:00' AND '19:59:59' THEN 'Evening'
    ELSE 'Night'
    END AS time_bucket,
    HOUR(transaction_time) AS hour_of_day,
    store_location,
    product_category,
    product_detail,
    product_type,
    unit_price,
    transaction_qty, 
    transaction_qty*unit_price AS revenue
FROM
  "SALES_RETAIL"."THEO_MASINGE"."COFFEE_SHOP";
