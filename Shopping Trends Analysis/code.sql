--Loading the table 
SELECT*
FROM SHOPPING.PUBLIC.SHOPPING_TRENDZ;

--Making use of AND & OR statements

--Choosing the people that made use of promo codes and had a discounbt apply 

FROM SHOPPING.PUBLIC.SHOPPING_TRENDZ
WHERE PROMO_CODE_USED='TRUE' AND DISCOUNT_APPLIED='TRUE';

--Choosing the people that got free shipping or used  Venmo to pay 
SELECT *
FROM SHOPPING.PUBLIC.SHOPPING_TRENDZ
WHERE SHIPPING_TYPE='Free Shipping' AND PAYMENT_METHOD='Venmo';


--Selecting certain columns from the data

--Taking the first 5 customer's gender
SELECT CUSTOMER_ID,GENDER
FROM SHOPPING.PUBLIC.SHOPPING_TRENDZ
limit 5;

--The gender and age of the first 10 people that bought clothing
SELECT AGE,GENDER
FROM SHOPPING_TRENDZ
WHERE CATEGORY= 'Clothing'
limit 10;

--finding the category and item_purchased of the last 5 females
SELECT ITEM_PURCHASED,CATEGORY
FROM SHOPPING_TRENDZ
WHERE GENDER='Female'
ORDER BY GENDER DESC
limit 5;

--Making use of Case statement
SELECT CUSTOMER_ID,LOCATION,COLOR, SHIPPING_TYPE
CASE WHEN PREVIOUS_PURCHASES > 30 THEN 'Enough'
ELSE 'Not Enough'
End as Scaling_Purchases
FROM SHOPPING_TRENDZ
limit 20;

--Using case statement to see who used the cheapest shipping method 
SELECT AGE,GENDER, ITEM_PURCHASED, PURCHASE_AMOUNT(USD)
    
    CASE
    WHEN SHIPPING_TYPE = 'Free Shipping' THEN 'Cheapest'
    WHEN SHIPPING_TYPE = 'Free Shipping' THEN 'Average price'
    else 'Not Cheapest'
END as Scaling_Shipping_Method
FROM shopping_trendz
limit 8;

--Making Use of DATE FUNCTIONS 

--Finding the current date 
SELECT current_date();

--Day before Yesterday's date 
SELECT CURRENT_DATE()-2 as DayBeforeYesterday;

--AGGREGATE FUNCTIONS 

--Counting the amount of people in the table
SELECT count(CUSTOMER_ID) as NoOfCustomers
FROM SHOPPING_TRENDZ;

--Counting the Customers categorised by season
SELECT count(CUSTOMER_ID) as NoOfCustomersPerSeason
FROM SHOPPING_TRENDZ
GROUP BY SEASON;

-- The Total Purchase Amount(USD)  grouped by the frequency of their purchase 
SELECT sum("Purchase Amount (USD)")
FROM SHOPPING_TRENDZ
GROUP BY FREQUENCY_OF_PURCHASES;

--Maximum amount of Previous Purchases
SELECT MAX(PREVIOUS_PURCHASES) AS MaxPreviousPurchase
FROM SHOPPING_TRENDZ;

--Minimum amount of Previous Purchases
SELECT MIN(PREVIOUS_PURCHASES) AS MinPreviousPurchase
FROM SHOPPING_TRENDZ;

--Not operator, Like,ILike and Wildcard 
---Select customers who have their payment method not starting with C followed by multiple Characters
SELECT *
FROM SHOPPING_TRENDZ
WHERE PAYMENT_METHOD NOT like 'C%';

---Select customers who have their payment method not starting with C followed by 3 Characters
SELECT *
FROM SHOPPING_TRENDZ
WHERE PAYMENT_METHOD NOT like 'C___';

---Select customers who do not have their previous purchases between  10 and 30
SELECT *
FROM SHOPPING_TRENDZ
WHERE PREVIOUS_PURCHASES NOT BETWEEN 10 AND 30;

--- Not Located in Hawaii, Wisconsin, Rhode Isaland, Indiana, Kentucky
SELECT CUSTOMER_ID,AGE,GENDER, "Purchase Amount (USD)", Size
FROM SHOPPING_TRENDZ
WHERE LOCATION NOT IN('Hawaii', 'Wisconsin', 'Rhode Isaland', 'Indiana', 'Kentucky');

---Selecting payment method where there is nothing on the field
SELECT *
FROM SHOPPING_TRENDZ
WHERE PAYMENT_METHOD IS NULL;







