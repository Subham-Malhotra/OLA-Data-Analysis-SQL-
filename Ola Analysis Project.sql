CREATE DATABASE ola;

USE ola;

-- import data by table wizard, cleaning was already done in excel

-- Questions

-- 1. Retrieve all successful bookings?

CREATE VIEW Successful_Bookings AS
SELECT COUNT(*) FROM bookings
WHERE Booking_Status = 'Success';

SELECT * FROM Successful_Bookings;


-- 2. Find the average ride distance for each vehicle type?

CREATE VIEW ride_distance_for_each_vehicle AS 
SELECT Vehicle_Type, Avg(Ride_Distance)
AS avg_distance FROM Bookings
GROUP BY Vehicle_Type;

SELECT * FROM ride_distance_for_each_vehicle;


-- 3. Get the total number of cancelled rides by customers?

CREATE VIEW Canceled_by_Customer AS
SELECT COUNT(*) FROM bookings
WHERE Booking_Status = 'Canceled by Customer';

SELECT * FROM Canceled_by_Customer;


-- 4. List the top 5 customers who booked the highest number of rides?

CREATE VIEW top_5_customers AS
SELECT Customer_ID, COUNT(Booking_ID) AS total_rides
FROM bookings
GROUP BY Customer_ID
ORDER BY total_rides DESC limit 5;

SELECT * FROM top_5_customers;


-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues?

CREATE VIEW Canceled_Rides_by_Driver AS
SELECT count(*) FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

SELECT * FROM Canceled_Rides_by_Driver;


-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings?

CREATE VIEW maximum_and_minimum_driver_ratings AS
SELECT max(Driver_Ratings) AS max_rating,
min(Driver_Ratings) AS min_rating
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';

SELECT * FROM maximum_and_minimum_driver_ratings;


-- 7. Retrieve all rides where payment was made using UPI?

CREATE VIEW UPI_Payments AS
SELECT * FROM bookings
WHERE Payment_Method = 'UPI';

SELECT * FROM UPI_Payments;


-- 8. Find the average customer rating per vehicle type?

CREATE VIEW customer_rating_per_vehicle_type AS
SELECT vehicle_type, avg(Customer_Rating) AS avg_customer_rating
FROM bookings 
GROUP BY vehicle_type;

SELECT * FROM customer_rating_per_vehicle_type;


-- 9. Calculate the total booking value of rides completed successfully?

CREATE VIEW total_successful_value AS
SELECT sum(Booking_Value) AS total_successful_value
FROM bookings
WHERE Booking_Status = 'Success';

SELECT * FROM total_successful_value;


-- 10. List all incomplete rides along with the reason?

CREATE VIEW incomplete_rides_with_reason AS
SELECT Booking_ID, Incomplete_Rides_Reason 
FROM bookings
WHERE Incomplete_Rides = 'Yes';

SELECT * FROM incomplete_rides_with_reason;

