use ola;
select * from bengaluru_booking_data;
-- 1.	Retrieve all successful bookings:
create view successful_bookings as
SELECT *
FROM bengaluru_booking_data
WHERE `Booking Status` = 'Incomplete';

select * from successful_bookings;


-- 2.	Find the average ride distance for each vehicle type:
create view ride_distance_for_each_vehicle as
SELECT `Vehicle Type`, AVG(`Ride Distance`) AS Average_distance
FROM bengaluru_booking_data
GROUP BY `Vehicle Type`;

select * from ride_distance_for_each_vehicle;



-- 3.	Get the total number of cancelled rides by customers:

select count(*) from bengaluru_booking_data
where`Booking Status` ="Incomplete";


-- 4.-- 	List the top 5 customers who booked the highest number of rides:
create view top_5_customers_who_booked_the_highest_number_of_rides as
SELECT `Customer ID`, COUNT(`Booking ID`) AS total_rides
FROM bengaluru_booking_data
GROUP BY `Customer ID`
order by total_rides desc limit 5;

select * from top_5_customers_who_booked_the_highest_number_of_rides;

-- 5.	Get the number of rides cancelled by drivers due to personal and car-related issues:
select count(*) 
from bengaluru_booking_data 
where `Reason for cancelling by Customer` = 'wrong address';


-- 6.	Find the maximum and minimum driver ratings for Prime Sedan bookings:
select max(`Customer Rating`) as max_rating, 
       min(`Customer Rating`) as min_rating 
from bengaluru_booking_data where `Vehicle Type` ='Prime Plus';

-- 7.	Retrieve all rides where payment was made using UPI:
select * from bengaluru_booking_data
where `payment method ` = 'upi';


-- 8.	Find the average customer rating per vehicle type: 
create view average_customer_rating as
select `Vehicle Type`, avg(`Customer Rating`) as avg_customer_rating
from bengaluru_booking_data
group by `Vehicle Type`;

select * from average_customer_rating;

-- 9.	Calculate the total booking value of rides completed successfully:

select sum(`Booking Value`) as total_successfully_ride_booking_value
from bengaluru_booking_data where `Booking Status` ='Completed';


-- 10.	List all incomplete rides along with the reason:
select `Customer ID` , `Incomplete Rides Reason` 
from bengaluru_booking_data
where `Incomplete Rides` = 0;