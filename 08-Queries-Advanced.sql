SELECT 
    F.Flight_Number,
    A1.Name AS Origin,
    A2.Name AS Destination,
    AC.Model,
    COUNT(B.Booking_ID) AS Total_Passengers
FROM Flight F
LEFT JOIN Booking B ON F.Flight_ID = B.Flight_ID
JOIN Airport A1 ON F.Origin_Airport_ID = A1.Airport_ID
JOIN Airport A2 ON F.Destination_Airport_ID = A2.Airport_ID
JOIN Aircraft AC ON F.Aircraft_ID = AC.Aircraft_ID
GROUP BY 
    F.Flight_Number, A1.Name, A2.Name, AC.Model;

    SELECT P.*
FROM Passenger P
LEFT JOIN Booking B ON P.Passenger_ID = B.Passenger_ID
WHERE B.Booking_ID IS NULL;

SELECT 
    F.Flight_Number,
    SUM(B.Price_Paid) AS Total_Revenue
FROM Flight F
JOIN Booking B ON F.Flight_ID = B.Flight_ID
GROUP BY F.Flight_Number
HAVING SUM(B.Price_Paid) > 500
ORDER BY Total_Revenue DESC;

SELECT 
    C.Full_Name,
    COUNT(FC.Flight_ID) AS Total_Flights
FROM CrewMember C
JOIN FlightCrew FC ON C.CrewMember_ID = FC.CrewMember_ID
GROUP BY C.Full_Name
HAVING COUNT(FC.Flight_ID) > 1;

SELECT 
    F.Flight_Number,
    AVG(B.Price_Paid) AS Avg_Price
FROM Flight F
JOIN Booking B ON F.Flight_ID = B.Flight_ID
GROUP BY F.Flight_Number
HAVING AVG(B.Price_Paid) > (SELECT AVG(Price_Paid) FROM Booking);

SELECT TOP 1
    F.Flight_Number,
    COUNT(B.Booking_ID) AS Total_Bookings
FROM Flight F
JOIN Booking B ON F.Flight_ID = B.Flight_ID
GROUP BY F.Flight_Number
ORDER BY Total_Bookings DESC;

SELECT 
    Class,
    COUNT(*) AS Total_Bookings,
    SUM(Price_Paid) AS Total_Revenue,
    AVG(Price_Paid) AS Avg_Price,
    MAX(Price_Paid) AS Max_Price,
    MIN(Price_Paid) AS Min_Price
FROM Booking
GROUP BY Class;

SELECT 
    P.Full_Name,
    F.Flight_Number,
    B.Booking_Date
FROM Booking B
JOIN Passenger P ON B.Passenger_ID = P.Passenger_ID
JOIN Flight F ON B.Flight_ID = F.Flight_ID
WHERE F.Status = 'Cancelled';

SELECT 
    F.Flight_Number,
    COUNT(FC.CrewMember_ID) AS Total_Crew,
    F.Departure_DateTime
FROM Flight F
JOIN FlightCrew FC ON F.Flight_ID = FC.Flight_ID
JOIN CrewMember C ON FC.CrewMember_ID = C.CrewMember_ID
GROUP BY F.Flight_Number, F.Departure_DateTime
HAVING 
    SUM(CASE WHEN C.Role = 'Pilot' THEN 1 ELSE 0 END) > 0
    AND
    SUM(CASE WHEN C.Role = 'Flight Attendant' THEN 1 ELSE 0 END) > 0;

    SELECT 
    F.Flight_Number,
    A1.City AS Origin_City,
    A2.City AS Destination_City,
    AC.Model,
    AC.Manufacturer,
    COUNT(DISTINCT B.Passenger_ID) AS Total_Passengers,
    COUNT(DISTINCT FC.CrewMember_ID) AS Total_Crew,
    SUM(B.Price_Paid) AS Total_Revenue
FROM Flight F
LEFT JOIN Booking B ON F.Flight_ID = B.Flight_ID
LEFT JOIN FlightCrew FC ON F.Flight_ID = FC.Flight_ID
JOIN Airport A1 ON F.Origin_Airport_ID = A1.Airport_ID
JOIN Airport A2 ON F.Destination_Airport_ID = A2.Airport_ID
JOIN Aircraft AC ON F.Aircraft_ID = AC.Aircraft_ID
GROUP BY 
    F.Flight_Number,
    A1.City,
    A2.City,
    AC.Model,
    AC.Manufacturer
ORDER BY Total_Revenue DESC;











