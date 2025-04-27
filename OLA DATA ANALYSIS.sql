create database OLA;
use OLA;

-- 1. Retrieve all successful bookings

Create View Successful_Bookings As
Select * from bookings
WHERE Booking_Status = 'Success';

Select * from Successful_Bookings;

-- 2. Find the average ride distance for each vehicle type:

Create View ride_distance_for_each_vehicle As
Select Vehicle_Type, AVG(Ride_Distance)
as avg_distance From bookings
Group By Vehicle_Type;

Select * from ride_distance_for_each_vehicle;

-- 3. Get the total number of cancelled rides by customers:
Create View canceled_rides_by_customers as
Select COUNT(*) FROM bookings WHERE Booking_Status = 'Canceled by Customer';

Select * FROM canceled_rides_by_customers;

-- 4. List the top 5 customers who booked the highest number of rides:
Create View Top_5_Customers AS
Select Customer_ID, COUNT(Booking_ID) as total_rides
FROM bookings
group by Customer_ID
ORDER BY total_rides DESC LIMIT 5;

Select * From Top_5_Customers;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:

Create View Canceled_ride_by_drivers AS
Select COUNT(*) FROM bookings
WHERE Canceled_Rides_by_Driver = 'Personal & Car related issue';

Select * FROM Canceled_ride_by_drivers;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:
Create VIEW MIN_MAX_Driver_Ratings AS
Select MAX(Driver_Ratings) as max_rating,
MIN(Driver_Ratings) as min_rating
FROM bookings WHERE Vehicle_Type = 'Prime Sedan';

Select * from MIN_MAX_Driver_Ratings;

-- 7. Retrieve all rides where payment was made using UPI:

Create View UPI_Payment As
select * from bookings where Payment_Method = 'UPI';

Select * from UPI_Payment;

-- 8. Find the average customer rating per vehicle type:

Create View Rating_Per_Vehicle_Type as
Select Vehicle_Type, AVG(Customer_Rating) as avg_customer_rating
From bookings
group by Vehicle_Type;

Select * from Rating_Per_Vehicle_Type;

-- 9. Calculate the total booking value of rides completed successfully:

Create View Total_booking_value AS
Select SUM(Booking_Value) as total_successful_value
From bookings
Where Booking_Status = 'Success';

Select * from Total_booking_value;

-- 10. List all incomplete rides along with the reason:

Create View Incomplete_Rides AS
Select Booking_ID, Incomplete_Rides_Reason
From bookings
Where Incomplete_Rides = 'Yes';

Select * From Incomplete_Rides;