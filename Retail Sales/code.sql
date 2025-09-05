SELECT 
    COUNT(DISTINCT transaction_id) As number_of_sales,
    COUNT(DISTINCT customer_id) As number_of_unique_customers,

    date as purchase_date,
    DAYNAME(date) As day_name,
    MONTHNAME(date) As month_name,
    DAYOFMONTH(date) As day_of_month,

    gender,
    product_category,

    sum(total_amount) AS total_revenue,
    sum(quantity) As total_qty,

    Case
        When age Between 0 AND 15 THEN 'kids'
        When age BETWEEN 16 And 25 THEN 'Youth'
        WHEN age BETWEEN 26 And 35 THEN 'Adult'
        else 'Senior'
        END AS age_bucket,

    CASE
        When total_amount <=100 THEN 'Low Spend'
        When total_amount >100 and total_amount<=300 THEN 'Med Spend'
        ELSE 'High Spend'
        END AS spend_group
        
From RETAILSALES.PUBLIC.SALES
GROUP BY ALL;
