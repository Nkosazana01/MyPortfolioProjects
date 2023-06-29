SELECT * 
FROM pizza_sales

SELECT SUM(total_price) AS  total_revenue 
FROM pizza_sales



SELECT SUM(total_price)/COUNT(Distinct order_id) AS AVG_ORDER_VALUE 
FROM pizza_sales



SELECT SUM(quantity) AS TOTAL_PIZZA_SOLD 
FROM pizza_sales




SELECT COUNT(DISTINCT order_id) AS TOTAL_ORDERS 
FROM pizza_sales




SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/CAST(COUNT(Distinct order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS AVG_PIZZA_PER_ORDER
FROM pizza_sales


--DAILY TREND
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS TOTAL_ORDERS
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)



--HOURLY TREND
SELECT DATEPART(HOUR, order_time) AS order_day, COUNT(DISTINCT order_id) AS TOTAL_ORDERS
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)



SELECT pizza_category, SUM(total_price) AS TOTAL_SALES, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1 ) AS PERCENTAGE_OF_SALES
FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category





SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,0)) AS TOTAL_SALES, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE DATEPART(QUARTER, order_date) = 1 ) AS DECIMAL(10,2))  AS PERCENTAGE_OF_SALES
FROM pizza_sales
WHERE DATEPART(QUARTER, order_date) = 1
GROUP BY pizza_size
ORDER BY PERCENTAGE_OF_SALES DESC



SELECT pizza_category, SUM(quantity)  AS TOTAL_PIZZA_SOLD
FROM pizza_sales
GROUP BY pizza_category



SELECT TOP 5 pizza_name, SUM(quantity)  AS TOTAL_SOLD_PIZZA
FROM pizza_sales
WHERE MONTH(order_date) =3
GROUP BY pizza_name
ORDER BY SUM(QUANTITY) DESC


--TABLES FOR VIEWS

CREATE VIEW TOTAL_REVENUES AS
SELECT SUM(total_price) AS  total_revenue 
FROM pizza_sales


CREATE VIEW  AVERAGE_ORDER_VALUES AS
SELECT SUM(total_price)/COUNT(Distinct order_id) AS AVG_ORDER_VALUE 
FROM pizza_sales


CREATE VIEW TOTAL_PIZZAS_SOLD AS
SELECT SUM(quantity) AS TOTAL_PIZZA_SOLD 
FROM pizza_sales



CREATE VIEW TOTAL_ORDER AS
SELECT COUNT(DISTINCT order_id) AS TOTAL_ORDERS 
FROM pizza_sales



CREATE VIEW AVERAGE_PIZZA_PER_ORDER as
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/CAST(COUNT(Distinct order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS AVG_PIZZA_PER_ORDER
FROM pizza_sales


--DAILY TREND
CREATE VIEW TOTAL_DAYS AS
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS TOTAL_ORDERS
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)



--HOURLY TREND
CREATE VIEW TOTAL_TIME AS
SELECT DATEPART(HOUR, order_time) AS order_day, COUNT(DISTINCT order_id) AS TOTAL_ORDERS
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)


CREATE VIEW TOTALSALES AS
SELECT pizza_category, SUM(total_price) AS TOTAL_SALES, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE MONTH(order_date) = 1 ) AS PERCENTAGE_OF_SALES
FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category




CREATE VIEW TOTAL_AMOUNT_OF_SALES AS
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,0)) AS TOTAL_SALES, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales WHERE DATEPART(QUARTER, order_date) = 1 ) AS DECIMAL(10,2))  AS PERCENTAGE_OF_SALES
FROM pizza_sales
WHERE DATEPART(QUARTER, order_date) = 1
GROUP BY pizza_size


CREATE VIEW TOTAL_SOLD_PIZZA AS
SELECT pizza_category, SUM(quantity)  AS TOTAL_PIZZA_SOLD
FROM pizza_sales
GROUP BY pizza_category


CREATE VIEW TOTAL_TOTAL_PIZZAS_SOLD AS
SELECT TOP 5 pizza_name, SUM(quantity)  AS TOTAL_SOLD_PIZZA
FROM pizza_sales
WHERE MONTH(order_date) =3
GROUP BY pizza_name
--ORDER BY SUM(QUANTITY) DESC