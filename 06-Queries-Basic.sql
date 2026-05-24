
SELECT 
    Flight_Number,
    Departure_DateTime,
    Arrival_DateTime,
    Status
FROM Flight
ORDER BY Departure_DateTime ASC;

SELECT 
    Passenger_ID,
    National_ID,
    Full_Name,
    Email,
    Phone,
    Nationality,
    Date_Of_Birth
FROM Passenger
ORDER BY Full_Name ASC;

SELECT 
    Aircraft_ID,
    Registration_Number,
    Model,
    Manufacturer,
    Seating_Capacity,
    Year_Manufacture
FROM Aircraft
ORDER BY Seating_Capacity DESC;

select * from Booking

SELECT DISTINCT Class
FROM Booking;

SELECT * FROM Flight
WHERE Status IN ('Delayed', 'Cancelled');

SELECT * FROM Passenger
WHERE Nationality = 'Omani';

SELECT * FROM Airport
ORDER BY Country ASC;

