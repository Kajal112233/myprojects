select * from ola_dataset;
--(1) Retrive all successfull bookings
SELECT * 
FROM ola_dataset
WHERE booking_status ILIKE 'completed'; 
--(2) Find average ride distance for each vehicle type
create view average_ride_distance as
select vehicle_type ,avg(ride_distance) from ola_dataset group by vehicle_type;
--(3) Get the total number of cancelled ride by customer
select count(*) from ola_dataset where canceled_ride_by_customer  = 'true';
--(4) List the top 5 customer who booked the highest number of ride
select  customer_id,count(booking_id) as total_rides from ola_dataset group by customer_id order by total_rides desc limit 5;
--(5) Get the number of rides canceled_by_driver due to personal and car related issue

select count(canceled_ride_by_driver) from ola_dataset where incomplete_ride_reason='Driver Unavailable'
--(6) Find the maximum and minimum driver rating for sedan bookings
select max(driver_rating),min(driver_rating)from ola_dataset where vehicle_type ='Sedan'
--(7) Retrive all drive where payment is done by UPI
select * from ola_dataset where payment_method='UPI'
--(8) Find the average customer_rating per vehicle type
select vehicle_type,AVG(customer_rating) as avg_customer_rating from ola_dataset group by vehicle_type;
--(9) Calculate total booking value of rides completed successfully
select sum(booking_value)as total_bookings from ola_dataset where booking_status='Completed'
--(10) List all incomplete rides along with the reason
select booking_id,incomplete_ride_reason from ola_dataset where incomplete_ride='True'

