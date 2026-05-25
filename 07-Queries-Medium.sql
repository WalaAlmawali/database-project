SELECT 
    F.Flight_Number,
    A1.Name AS Origin_Airport,
    A2.Name AS Destination_Airport
FROM Flight F
JOIN Airport A1 ON F.Origin_Airport_ID = A1.Airport_ID
JOIN Airport A2 ON F.Destination_Airport_ID = A2.Airport_ID;

SELECT 
    B.Booking_ID,
    P.Full_Name,
    F.Flight_Number
FROM Booking B
JOIN Passenger P ON B.Passenger_ID = P.Passenger_ID
JOIN Flight F ON B.Flight_ID = F.Flight_ID;

SELECT 
    C.Full_Name,
    C.Role
FROM FlightCrew FC
JOIN CrewMember C ON FC.CrewMember_ID = C.CrewMember_ID
JOIN Flight F ON FC.Flight_ID = F.Flight_ID
WHERE F.Flight_Number = 'SK101';

SELECT 
    F.Flight_Number,
    A.Model
FROM Flight F
JOIN Aircraft A ON F.Aircraft_ID = A.Aircraft_ID
WHERE F.Status = 'Completed';

SELECT 
    P.Full_Name,
    COUNT(B.Booking_ID) AS Total_Bookings
FROM Passenger P
LEFT JOIN Booking B ON P.Passenger_ID = B.Passenger_ID
GROUP BY P.Full_Name
ORDER BY Total_Bookings DESC;

SELECT 
    Class,
    SUM(Price_Paid) AS Total_Revenue
FROM Booking
GROUP BY Class;

SELECT 
    A.Registration_Number,
    COUNT(F.Flight_ID) AS Total_Flights
FROM Aircraft A
LEFT JOIN Flight F ON A.Aircraft_ID = F.Aircraft_ID
GROUP BY A.Registration_Number;

SELECT 
    Flight_ID,
    COUNT(*) AS Total_Bookings
FROM Booking
GROUP BY Flight_ID
HAVING COUNT(*) > 1;

SELECT 
    P.Full_Name,
    F.Flight_Number,
    A1.Name AS Origin,
    A2.Name AS Destination,
    B.Class,
    B.Price_Paid
FROM Booking B
JOIN Passenger P ON B.Passenger_ID = P.Passenger_ID
JOIN Flight F ON B.Flight_ID = F.Flight_ID
JOIN Airport A1 ON F.Origin_Airport_ID = A1.Airport_ID
JOIN Airport A2 ON F.Destination_Airport_ID = A2.Airport_ID;





