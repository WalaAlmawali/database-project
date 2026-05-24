CREATE DATABASE AirportManagement
use AirportManagement

CREATE TABLE Airport (
    Airport_ID INT IDENTITY(1,1) PRIMARY KEY,

    IATA_Code CHAR(3) NOT NULL UNIQUE,
    Name VARCHAR(50) NOT NULL,
    City VARCHAR(50) NOT NULL,
    Country VARCHAR(50) NOT NULL
);

CREATE TABLE Aircraft (
    Aircraft_ID INT IDENTITY(1,1) PRIMARY KEY,

    Registration_Number VARCHAR(20) NOT NULL UNIQUE,
    Model VARCHAR(50) NOT NULL,
    Manufacturer VARCHAR(50) NOT NULL,

    Seating_Capacity INT NOT NULL
        CHECK (Seating_Capacity > 0),

    Year_Manufacture INT
);

CREATE TABLE Flight (

    Flight_ID INT IDENTITY(1,1) PRIMARY KEY,

    Flight_Number VARCHAR(10) NOT NULL UNIQUE,

    Departure_DateTime DATETIME NOT NULL,
    Arrival_DateTime DATETIME NOT NULL,

    Status VARCHAR(20) NOT NULL
        DEFAULT 'Scheduled'
        CHECK (Status IN ('Scheduled', 'Delayed', 'Cancelled', 'Completed')),

    Aircraft_ID INT,
    Origin_Airport_ID INT,
    Destination_Airport_ID INT,

    CONSTRAINT chk_flight_time
        CHECK (Arrival_DateTime > Departure_DateTime),

    CONSTRAINT fk_flight_aircraft
        FOREIGN KEY (Aircraft_ID)
        REFERENCES Aircraft(Aircraft_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_origin_airport
        FOREIGN KEY (Origin_Airport_ID)
        REFERENCES Airport(Airport_ID)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION,

    CONSTRAINT fk_destination_airport
        FOREIGN KEY (Destination_Airport_ID)
        REFERENCES Airport(Airport_ID)
        ON DELETE NO ACTION
        ON UPDATE NO ACTION
);

CREATE TABLE Passenger (
    Passenger_ID INT IDENTITY(1,1) PRIMARY KEY,

    National_ID VARCHAR(20) NOT NULL UNIQUE,
    Full_Name VARCHAR(100) NOT NULL,

    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(20),

    Nationality VARCHAR(50) NOT NULL,
    Date_Of_Birth DATE NOT NULL
);

CREATE TABLE Booking (
    Booking_ID INT IDENTITY(1,1) PRIMARY KEY,

    Seat_Number VARCHAR(10) NOT NULL,

    Class VARCHAR(20) NOT NULL
        CHECK (Class IN ('Economy', 'Business', 'First')),

    Price_Paid DECIMAL(10,2) NOT NULL
        CHECK (Price_Paid > 0),

    Booking_Date DATE NOT NULL
        DEFAULT GETDATE(),

    Passenger_ID INT,
    Flight_ID INT,

    CONSTRAINT fk_booking_passenger
        FOREIGN KEY (Passenger_ID)
        REFERENCES Passenger(Passenger_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE,

    CONSTRAINT fk_booking_flight
        FOREIGN KEY (Flight_ID)
        REFERENCES Flight(Flight_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE CrewMember (
    CrewMember_ID INT IDENTITY(1,1) PRIMARY KEY,

    License_Number VARCHAR(20) NOT NULL UNIQUE,

    Full_Name VARCHAR(100) NOT NULL,

    Role VARCHAR(30) NOT NULL
        CHECK (Role IN ('Pilot', 'Co-Pilot', 'Flight Attendant', 'Engineer'))
);