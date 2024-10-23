CREATE database roadsafetyanalysis;
USE  roadsafetyanalysis;

CREATE TABLE Locations (
    LocationID INT PRIMARY KEY,
    LocationName VARCHAR(100),
    Region VARCHAR(50),
    Latitude DECIMAL(9, 6),
    Longitude DECIMAL(9, 6)
);

CREATE TABLE Accidents (
    AccidentID INT PRIMARY KEY,
    AccidentDate DATE,
    LocationID INT,
    Severity VARCHAR(10), -- e.g., Minor, Major, Fatal
    WeatherConditions VARCHAR(50),
    RoadSurface VARCHAR(50),
    FOREIGN KEY (LocationID) REFERENCES Locations(LocationID)
);

CREATE TABLE Vehicles (
    VehicleID INT PRIMARY KEY,
    VehicleType VARCHAR(50), -- e.g., Car, Truck, Motorcycle
    Manufacturer VARCHAR(50),
    Model VARCHAR(50),
    Year INT
);

CREATE TABLE Drivers (
    DriverID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT,
    LicenseNumber VARCHAR(20),
    ExperienceYears INT
);

CREATE TABLE AccidentDetails (
    AccidentDetailID INT PRIMARY KEY,
    AccidentID INT,
    VehicleID INT,
    DriverID INT,
    IsResponsible BOOLEAN,
    InjurySeverity VARCHAR(20), -- e.g., None, Minor, Severe, Fatal
    FOREIGN KEY (AccidentID) REFERENCES Accidents(AccidentID),
    FOREIGN KEY (VehicleID) REFERENCES Vehicles(VehicleID),
    FOREIGN KEY (DriverID) REFERENCES Drivers(DriverID)
);


-- Insert locations
INSERT INTO Locations (LocationID, LocationName, Region, Latitude, Longitude)
VALUES
(1, 'Downtown', 'Urban', 40.712776, -74.005974),
(2, 'Highway 1', 'Rural', 34.052235, -118.243683),
(3, 'Mountain Pass', 'Rural', 36.778259, -119.417931),
(4, 'Seaside Avenue', 'Urban', 37.774929, -122.419418);

-- Insert accidents
INSERT INTO Accidents (AccidentID, AccidentDate, LocationID, Severity, WeatherConditions, RoadSurface)
VALUES
(1, '2024-01-15', 1, 'Minor', 'Clear', 'Dry'),
(2, '2024-02-20', 2, 'Major', 'Rain', 'Wet'),
(3, '2024-03-05', 3, 'Fatal', 'Fog', 'Icy'),
(4, '2024-04-10', 4, 'Minor', 'Clear', 'Dry');

-- Insert vehicles
INSERT INTO Vehicles (VehicleID, VehicleType, Manufacturer, Model, Year)
VALUES
(1, 'Car', 'Toyota', 'Corolla', 2018),
(2, 'Truck', 'Ford', 'F-150', 2020),
(3, 'Motorcycle', 'Honda', 'CBR600RR', 2021),
(4, 'Car', 'Tesla', 'Model 3', 2023);

-- Insert drivers
INSERT INTO Drivers (DriverID, Name, Age, LicenseNumber, ExperienceYears)
VALUES
(1, 'John Doe', 32, 'D1234567', 10),
(2, 'Jane Smith', 28, 'S9876543', 7),
(3, 'Alice Johnson', 45, 'J1122334', 20),
(4, 'Bob Brown', 38, 'B5566778', 15);

-- Insert accident details
INSERT INTO AccidentDetails (AccidentDetailID, AccidentID, VehicleID, DriverID, IsResponsible, InjurySeverity)
VALUES
(1, 1, 1, 1, TRUE, 'Minor'),
(2, 2, 2, 2, TRUE, 'Severe'),
(3, 3, 3, 3, TRUE, 'Fatal'),
(4, 4, 4, 4, FALSE, 'None');
