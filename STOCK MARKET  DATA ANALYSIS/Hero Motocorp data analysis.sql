--1. Identifying Best-Performing Stocks Based on Closing Price Growth

SELECT "Date", "Close Price",
       ROUND((("Close Price" - FIRST_VALUE("Close Price") OVER (ORDER BY "Date")) / FIRST_VALUE("Close Price") OVER (ORDER BY "Date")) * 100, 2) AS growth_percent
FROM public."Hero Motocorp"
WHERE "Date" BETWEEN '01-01-2015' AND '31-07-2018';
--insight:
--Hero Motocorp saw 6.00 per growth.

--2. Stock Volatility Analysis Using High-Low Price Spread

SELECT "Date", "Spread High-Low",
       AVG("Spread High-Low") OVER (ORDER BY "Date" ROWS BETWEEN 9 PRECEDING AND CURRENT ROW) AS avg_volatility_10_days
FROM public."Hero Motocorp"
WHERE "Date" BETWEEN '2015-01-01' AND '2018-07-31';
--Insights :
--Hero Motocorp had an average spread of 125 Rs.

--3. Trading Volume Comparison Across Companies

SELECT "Date", SUM("No.of Shares") OVER (ORDER BY "Date" ROWS BETWEEN 29 PRECEDING AND CURRENT ROW) AS monthly_trading_volume
FROM public."Hero Motocorp"
WHERE "Date" BETWEEN '2015-01-01' AND '2018-07-31';

--Insights:

--Hero Motocorp had an average monthly trade of 2441431 shares

--4. Identifying Strongest Institutional Holding Using Deliverable Quantity

SELECT "Date", ROUND(AVG("% Deli. Qty to Traded Qty") OVER (ORDER BY "Date" ROWS BETWEEN 29 PRECEDING AND CURRENT ROW), 2) AS avg_delivery_ratio
FROM public."Hero Motocorp"
WHERE "Date" BETWEEN '2015-01-01' AND '2018-07-31';
--Insights:

-- Hero Motocorp have 30.80 average delivery ratio.

--5. Detecting Biggest Trading Days for Each Company

SELECT "Date", "No. of Trades"
FROM public."Hero Motocorp"
WHERE "Date" BETWEEN '2015-01-01' AND '2018-07-31'
ORDER BY "No. of Trades" DESC
LIMIT 10;
--Insights:

--Hero Motocorp had highest trading day at 41653 trades