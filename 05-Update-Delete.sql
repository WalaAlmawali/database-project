--update 

UPDATE Flight
SET Status = 'Completed'
WHERE Flight_ID = 1
  AND Status = 'Scheduled';

UPDATE Flight
SET Status = 'Cancelled'
WHERE Flight_ID = 3
  AND Status = 'Delayed';

UPDATE Booking
SET Price_Paid = Price_Paid * 1.10
WHERE Class = 'Economy';

UPDATE Passenger
SET Phone = '+96898879888'
WHERE National_ID = 'OM1001';

UPDATE CrewMember
SET Role = 'Co-Pilot'
WHERE License_Number = 'LIC3001';

--delete 

DELETE FROM Flight
WHERE Flight_Number = 'WY301'
  AND Status = 'Cancelled';


  DELETE FROM Booking
  WHERE Flight_ID IN (
      SELECT Flight_ID
      FROM Flight
      WHERE Status = 'Cancelled'
  );

DELETE FROM Passenger
WHERE National_ID = 'OM1001';

--The passenger is deleted successfully.
-- All related bookings are automatically deleted due to ON DELETE CASCADE

