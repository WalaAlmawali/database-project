INSERT INTO Airport (IATA_Code, Name, City, Country)
VALUES
('MCT', 'Muscat International Airport', 'Muscat', 'Oman'),
('DXB', 'Dubai International Airport', 'Dubai', 'United Arab Emirates'),
('LHR', 'Heathrow Airport', 'London', 'United Kingdom'),
('JFK', 'John F. Kennedy International Airport', 'New York', 'United States'),
('NRT', 'Narita International Airport', 'Tokyo', 'Japan');

INSERT INTO Aircraft
(Registration_Number, Model, Manufacturer, Seating_Capacity, Year_Manufacture)
VALUES
('A4O-OM1', 'Boeing 737-800', 'Boeing', 189, 2018),
('A4O-OM2', 'Airbus A320', 'Airbus', 180, 2020),
('A4O-OM3', 'Boeing 787 Dreamliner', 'Boeing', 242, 2021),
('A4O-OM4', 'Embraer E190', 'Embraer', 100, 2017),
('A4O-OM5', 'Airbus A350', 'Airbus', 300, 2022);

INSERT INTO Flight
(Flight_Number, Departure_DateTime, Arrival_DateTime, Status,
 Aircraft_ID, Origin_Airport_ID, Destination_Airport_ID)
VALUES
('WY101', '2026-06-01 08:00:00', '2026-06-01 10:00:00', 'Scheduled',
 1, 1, 2),

('WY102', '2026-06-02 09:30:00', '2026-06-02 14:00:00', 'Scheduled',
 2, 2, 3),

('WY201', '2026-06-03 06:00:00', '2026-06-03 11:30:00', 'Delayed',
 3, 3, 4),

('WY202', '2026-06-04 15:00:00', '2026-06-04 19:00:00', 'Delayed',
 4, 4, 5),

('WY301', '2026-06-05 07:00:00', '2026-06-05 12:00:00', 'Cancelled',
 5, 5, 1),

('WY302', '2026-06-06 18:00:00', '2026-06-06 22:30:00', 'Cancelled',
 1, 2, 4),

('WY401', '2026-06-07 05:30:00', '2026-06-07 09:00:00', 'Completed',
 2, 3, 1),

('WY402', '2026-06-08 13:00:00', '2026-06-08 18:00:00', 'Completed',
 3, 5, 2);

 INSERT INTO Passenger
(National_ID, Full_Name, Email, Phone, Nationality, Date_Of_Birth)
VALUES
('OM1001', 'Ahmed Al Balushi', 'ahmed1@email.com', '+96890000001', 'Omani', '1995-03-15'),
('AE1002', 'Fatima Al Mansoori', 'fatima2@email.com', '+97150000002', 'Emirati', '1992-07-20'),
('UK1003', 'James Wilson', 'james3@email.com', '+447700000003', 'British', '1988-11-10'),
('US1004', 'Emily Johnson', 'emily4@email.com', '+12025550004', 'American', '1997-01-25'),
('JP1005', 'Hiroshi Tanaka', 'hiroshi5@email.com', '+818012345005', 'Japanese', '1990-09-18'),
('IN1006', 'Priya Sharma', 'priya6@email.com', '+919876540006', 'Indian', '1994-05-30'),
('FR1007', 'Lucas Martin', 'lucas7@email.com', '+33612345007', 'French', '1985-12-12'),
('DE1008', 'Anna Müller', 'anna8@email.com', '+4915112345008', 'German', '1993-08-08');

INSERT INTO Booking
(Seat_Number, Class, Price_Paid, Booking_Date, Passenger_ID, Flight_ID)
VALUES
('12A', 'Economy', 120.00, GETDATE(), 1, 1),
('14B', 'Economy', 150.00, GETDATE(), 2, 1),
('22C', 'Economy', 200.00, GETDATE(), 3, 2),
('18D', 'Economy', 180.00, GETDATE(), 4, 2),

('3A', 'Business', 450.00, GETDATE(), 5, 3),
('4B', 'Business', 500.00, GETDATE(), 6, 3),
('5C', 'Business', 520.00, GETDATE(), 7, 4),

('1A', 'First', 900.00, GETDATE(), 8, 4),
('1B', 'First', 950.00, GETDATE(), 1, 5),
('10C', 'Economy', 160.00, GETDATE(), 2, 6);

INSERT INTO CrewMember
(License_Number, Full_Name, Role)
VALUES

('LIC1001', 'Captain Salim Al Hashmi', 'Pilot'),
('LIC1002', 'Captain John Miller', 'Pilot'),

('LIC2001', 'First Officer Omar Khan', 'Co-Pilot'),
('LIC2002', 'First Officer Sarah Brown', 'Co-Pilot'),

('LIC3001', 'Aisha Rahman', 'Flight Attendant'),
('LIC3002', 'David Lee', 'Flight Attendant'),

('LIC4001', 'Engineer Mohammed Ali', 'Engineer'),
('LIC4002', 'Engineer Elena Petrova', 'Engineer');

INSERT INTO FlightCrew (Flight_ID, CrewMember_ID)
VALUES

-- Flight 1
(1, 1), -- Pilot
(1, 5), -- Flight Attendant

-- Flight 2
(2, 2), -- Pilot
(2, 6), -- Flight Attendant

-- Flight 3
(3, 1), -- Pilot
(3, 5), -- Flight Attendant
(3, 7), -- Engineer

-- Flight 4
(4, 2), -- Pilot
(4, 6), -- Flight Attendant
(4, 8), -- Engineer

-- Flight 5
(5, 1), -- Pilot
(5, 5), -- Flight Attendant

-- Flight 6
(6, 2), -- Pilot
(6, 6), -- Flight Attendant

-- Flight 7
(7, 1), -- Pilot
(7, 5), -- Flight Attendant

-- Flight 8
(8, 2), -- Pilot
(8, 6); -- Flight Attendant