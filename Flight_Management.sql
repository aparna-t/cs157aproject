CREATE DATABASE IF NOT EXISTS Flight_Management;
USE Flight_Management;

CREATE TABLE Passenger(
passenger_id int PRIMARY KEY,
first_name varchar(50) NOT NULL,
last_name varchar(50) NOT NULL,
email varchar(50) UNIQUE NOT NULL,
phone_number varchar(50) NOT NULL,
user_password varchar(50) UNIQUE NOT NULL,
address varchar(100) NOT NULL,
meal_preferences varchar(100) NOT NULL,
medical_concerns varchar(100) NOT NULL
);

CREATE TABLE Flight_Crew(
flightcrew_id int PRIMARY KEY,
first_name varchar(50) NOT NULL,
last_name varchar(50) NOT NULL,
email varchar(50) UNIQUE NOT NULL,
phone_number varchar(50) NOT NULL,
crew_password varchar(50) UNIQUE NOT NULL,
address varchar(100) NOT NULL,
meal_preferences varchar(100) NOT NULL,
medical_concerns varchar(100) NOT NULL
);

CREATE TABLE Air_Personnel(
airpersonnel_id int PRIMARY KEY,
first_name varchar(50) NOT NULL,
last_name varchar(50) NOT NULL,
email varchar(50) UNIQUE NOT NULL,
phone_number varchar(50) NOT NULL,
personnel_password varchar(50) UNIQUE NOT NULL,
address varchar(100) NOT NULL
);

CREATE TABLE Flight_Info(
flight_number int PRIMARY KEY,
gate_number int NOT NULL,
departure_date date NOT NULL,
departure_time time NOT NULL,
departure_location varchar(50) NOT NULL,
arrival_date date NOT NULL,
arrival_time time NOT NULL,
arrival_location varchar(50) NOT NULL,
route varchar(100) UNIQUE NOT NULL,
flight_duration varchar(25) NOT NULL,
airline varchar(50) NOT NULL
);


CREATE TABLE Ticket(
ticket_code int PRIMARY KEY,
passenger_id int,
FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id),
flight_number int,
FOREIGN KEY (flight_number) REFERENCES Flight_Info(flight_number),
ticket_status varchar(25) NOT NULL,
seat_class varchar(25) NOT NULL,
seat_number varchar(5) UNIQUE NOT NULL,
carry_on_luggage int NOT NULL,
checked_in_luggage int NOT NULL
);

CREATE TABLE Payment(
payment_id int PRIMARY KEY,
ticket_code int,
FOREIGN KEY (ticket_code) REFERENCES Ticket(ticket_code),
amount int NOT NULL,
payment_confirmation varchar(25) NOT NULL,
payment_date date NOT NULL,
payment_time time NOT NULL
);

CREATE TABLE Aircraft(
aircraft_id int PRIMARY KEY,
manufacturer varchar(50) NOT NULL,
model varchar(50) NOT NULL
);



-- Passenger Data
INSERT INTO Passenger VALUES(28614, 'Taylor', 'Swift', 'fearless13@gmail.com', '012-345-6789', 'ev3rm0rE', '22 Centennial Park, Nashville, TN', 'N/A', 'N/A');
INSERT INTO Passenger VALUES(17925, 'Joe', 'Burrow', 'joeybrrr@gmail.com', '123-456-7890', '5h!3stY', '9th Street, Cleveland, OH', 'N/A', 'Concussed Patient');
INSERT INTO Passenger VALUES(35281, 'Henry', 'Burton', 'seattlegrace@gmail.com', '234-567-8901', 't3ddyaltm4n', '007 Mercy West Drive, Seattle, WA', 'N/A', 'Von Hippel Lindau Disease Patient');
INSERT INTO Passenger VALUES(67683, 'Jules', 'Ambrose', 'iheartskiing@gmail.com', '345-678-9012', '3ntr4!l5', '2272, Geneva St, New York, NY', 'Vegetarian', 'N/A');
INSERT INTO Passenger VALUES(88217, 'Joshua', 'Templeman', 'bexleypublishing@gmail.com', '456-789-0123', 'str4wb3rry5h0rtc4ke', '4558 Sundown Lane, Austin, TX', 'Vegan', 'N/A');

-- Flight_Info Data
INSERT INTO Flight_Info VALUES(5252478, 08, '2022-05-12', '08:12:56', 'Seattle',  '2022-05-12', '12:01:59', 'San Francisco', 'Seattle-Portland-SanFrancisco', '03:49:03', 'United');
INSERT INTO Flight_Info VALUES(5243292, 06, '2022-05-24', '01:12:34', 'San Jose',  '2022-05-24', '12:42:13', 'New York City', 'San Jose-New York', '11:49:17', 'Southwest');
INSERT INTO Flight_Info VALUES(5492040, 12, '2022-05-30', '04:18:43', 'New York City',  '2022-05-30', '07:03:49', 'San Francisco', 'New York City-SanFrancisco', '8:27:03', 'United');
INSERT INTO Flight_Info VALUES(5595920, 04, '2022-05-26', '08:24:27', 'Tampa',  '2022-05-26', '11:08:42', 'San Francisco', 'Tampa-Portland-SanFrancisco', '3:01:03', 'American');
INSERT INTO Flight_Info VALUES(5960302, 10, '2022-06-02', '10:01:29', 'Austin',  '2022-06-02', '13:07:45', 'San Francisco', 'Austin-LAX-SanFrancisco', '3:13:03', 'United');

-- Ticket Data
INSERT INTO Ticket VALUES(533, 28614, 5252478, 'VALID', 'first class', '5A', 2, 1);
INSERT INTO Ticket VALUES(535, 17925, 5243292, 'VALID', 'economy class', '47B', 2, 0);
INSERT INTO Ticket VALUES(538, 35281, 5492040, 'NOT VALID', 'economy class', '32C', 2, 0);
INSERT INTO Ticket VALUES(539, 67683, 5595920, 'VALID', 'first class', '2A', 1, 1);
INSERT INTO Ticket VALUES(542, 88217, 5960302, 'NOT VALID', 'economy class', '3D', 2, 0);

-- Payment Data
INSERT INTO Payment VALUES(12301, 533, 1198, 'CONFIRMED', '2022-04-30', '06:34:18');
INSERT INTO Payment VALUES(12302, 535, 1201, 'CONFIRMED', '2022-05-03', '12:22:36');
INSERT INTO Payment VALUES(12303, 538, 1567, 'NOT CONFIRMED', '2022-05-07', '15:01:58');
INSERT INTO Payment VALUES(12304, 539, 1789, 'CONFIRMED', '2022-04-27', '01:31:10');
INSERT INTO Payment VALUES(12305, 542, 1998, 'NOT CONFIRMED', '2022-04-21', '07:23:18');

-- Aircraft Data
INSERT INTO Aircraft VALUES(001, 'Boeing', 'Boeing 737');
INSERT INTO Aircraft VALUES(002, 'Airbus', 'A330');
INSERT INTO Aircraft VALUES(003, 'Emraer', 'E-Jet');
INSERT INTO Aircraft VALUES(004, 'Airbus', 'A380');
INSERT INTO Aircraft VALUES(005, 'UAC', 'Sukhoi Superjet 130');

SELECT * FROM Passenger;
SELECT * FROM Flight_Info;
SELECT * FROM Aircraft;
