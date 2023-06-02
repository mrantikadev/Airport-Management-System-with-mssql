CREATE TABLE Airlines (
	airline_id INT PRIMARY KEY,
	name NVARCHAR(20),
	country NVARCHAR(20)
);

CREATE TABLE Airports (
	airport_id INT PRIMARY KEY,
	name NVARCHAR(20),
	city NVARCHAR(20),
	country NVARCHAR(20),
	is_international BIT
);

CREATE TABLE Passengers (
	passenger_id INT PRIMARY KEY,
	first_name NVARCHAR(20),
	last_name NVARCHAR(20),
	email NVARCHAR(50),
	phone NVARCHAR(11)
);

CREATE TABLE Baggage (
	baggage_id INT PRIMARY KEY,
	passenger_id INT,
	weight DECIMAL(5,2),
	FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id)
);

CREATE TABLE Flights (
	flight_id INT PRIMARY KEY,
	airline_id INT,
	departure_airport_id INT,
	arrival_airport_id INT,
	departure_time DATETIME,
	arrival_time DATETIME,
	FOREIGN KEY (airline_id) REFERENCES Airlines(airline_id),
	FOREIGN KEY (departure_airport_id) REFERENCES Airports(airport_id),
	FOREIGN KEY (arrival_airport_id) REFERENCES Airports(airport_id)
);

CREATE TABLE Staff (
	staff_id INT PRIMARY KEY,
	airport_id INT,
	first_name NVARCHAR(20),
	last_name NVARCHAR(20),
	job_title NVARCHAR(20),
	department NVARCHAR(50),
	FOREIGN KEY (airport_id) REFERENCES Airports(airport_id)
);

CREATE TABLE Tickets (
	ticket_id INT PRIMARY KEY,
	passenger_id INT,
	flight_id INT,
	seat_number VARCHAR(10),
	FOREIGN KEY (passenger_id) REFERENCES Passengers(passenger_id),
	FOREIGN KEY (flight_id) REFERENCES Flights(flight_id)
);

INSERT INTO Passengers (first_name, last_name, email, phone)
VALUES ('Rasit', 'Antika', 'rasit@example.com', '12345678901'),
       ('Berat', 'Albas', 'berat@example.com', '98765432198'),
	   ('Mustafa', 'Ayaz', 'mustafa@example.com', '12378945682'),
	   ('John', 'Doe', 'johndoe@example.com', '74125896331'),
	   ('Emma', 'Johnson', 'emmajohnson@example.com', '47574557423'),
	   ('Marshall', 'Mathers', 'eminem@example.com', '74564121487'),
	   ('Enis', 'Kirazoglu', 'eniskiraz@example.com', '48678542356'),
	   ('Lionel', 'Messi', 'legoat@example.com', '10547864308'),
	   ('Ali', 'Yılmaz', 'aliyilmaz@example.com', '75438684242');

INSERT INTO Airports(name, city, country, is_international)
VALUES ('Istanbul Havalimanı', 'Istanbul', 'Turkey', 1),
       ('Heathrow Airport', 'London', 'UK', 1),
	   ('Paris City Airport', 'Paris', 'France', 1),
	   ('Ataturk Havalimanı', 'Istanbul', 'Turkey', 1),
	   ('Rosario Aeropuerte', 'Rosario', 'Argentina', 1),
	   ('JFK Airport', 'New York', 'USA', 1);

INSERT INTO Airlines(name, country)
VALUES ('Turkish Airlines', 'Turkey'),
       ('British Airways', 'UK'),
	   ('Air France', 'France'),
	   ('Emirates', 'UAE'),
	   ('Argentine Airways', 'Argentina');

INSERT INTO Baggage(passenger_id, weight)
VALUES (1, 23.800),
       (2, 15.400),
	   (3, 18.200),
	   (4, 16.450),
	   (5, 20.120),
	   (6, 19.540),
	   (7, 21.440),
	   (8, 17.320);

INSERT INTO Flights(airline_id, departure_airport_id, arrival_airport_id, departure_time, arrival_time)
VALUES (1, 1, 2, '2023-05-21 10:00:00.000', '2023-05-21 12:00:00.000'),
       (2, 2, 3, '2023-05-21 13:00:00.000', '2023-05-21 16:00:00.000'),
       (3, 3, 1, '2023-05-21 18:00:00.000', '2023-05-21 20:00:00.000'),
       (1, 4, 2, '2023-05-21 21:00:00.000', '2023-05-21 23:00:00.000'),
       (2, 2, 4, '2023-05-22 01:00:00.000', '2023-05-22 04:00:00.000'),
       (1, 1, 3, '2023-05-22 01:00:00.000', '2023-05-22 05:00:00.000'),
       (5, 3, 5, '2023-05-22 03:00:00.000', '2023-05-22 07:00:00.000'),
       (4, 2, 3, '2023-05-21 13:00:00.000', '2023-05-21 16:00:00.000'),
	   (3, 1, 2, '2023-05-22 05:00:00.000', '2023-05-22 10:00:00.000');
	   

INSERT INTO Staff (airport_id, first_name, last_name, job_title, department)
VALUES (1, 'Enes', 'Karakoyun', 'Pilot', 'Flight Crew'),
       (1, 'Batuhan', 'Bayram', 'Flight Attendant', 'Cabin Crew'),
	   (2, 'Muhammed', 'Duyar', 'Flight Attendant', 'Cabin Crew'),
	   (3, 'Sarah', 'Smith', 'Pilot', 'Flight Crew'),
	   (3, 'David', 'Johnson', 'Flight Attendant', 'Cabin Crew'),
	   (4, 'Daryl', 'Dixon', 'Flight Attendant', 'Cabin Crew'),
	   (5, 'Rodrigo', 'De Paul', 'Security', 'Security Crew'),
	   (5, 'Leonardo', 'Parades', 'Security', 'Security Crew'),
	   (2, 'Brie', 'Larson', 'Pilot', 'Flight Crew'),
	   (4, 'Merle', 'Dixon', 'Pilot', 'Flight Crew'),
	   (5, 'Alexis', 'Mac Allister', 'Pilot', 'Flight Crew'),
	   (4, 'Gleen', 'Rhe', 'Pilot', 'Flight Crew');


INSERT INTO Tickets(passenger_id, flight_id, seat_number)
VALUES (1, 1, 'A12'),
       (2, 2, 'B7'),
	   (3, 4, 'C14'),
	   (4, 2, 'B12'),
	   (5, 4, 'A9'),
	   (6, 1, 'A11'),
	   (7, 1, 'A13'),
	   (8, 7, 'B7'),
	   (9, 9, 'A3'),
	   (3, 3, 'B9');

-- Havalimanı isimleri ve şehirleri
SELECT name, city
FROM Airports;

-- Girilen havayolu şirketlerindeki pilotların listesi
SELECT s.first_name AS pilot_name, a.name AS airline_name
FROM Staff s
JOIN Airlines a ON s.airport_id = a.airline_id
WHERE s.job_title = 'Pilot' AND a.airline_id = 1 OR a.airline_id = 2;

-- Bir havaalanında çalışan pilotların listesi ve bu pilotların çalıştığı havayolu şirketleri
SELECT s.first_name AS pilot_name, al.name AS airline_name
FROM Staff s
JOIN Airlines al ON s.airport_id = al.airline_id
JOIN Airports a ON s.airport_id = a.airport_id
WHERE s.job_title = 'Pilot' AND a.airport_id = 4;

-- Bir havaalanında aktif olarak çalışan personelin isimleri ve görevleri
SELECT s.first_name, s.job_title
FROM Staff s
JOIN Airports a ON s.airport_id = a.airport_id
WHERE a.airport_id = 4;

-- Bir yolcunun uçtuğu tüm havayolu şirketlerinin listesi
SELECT DISTINCT a.name AS airline_name
FROM Airlines a
JOIN Flights f ON a.airline_id = f.airline_id
JOIN Tickets t ON f.flight_id = t.flight_id
WHERE t.passenger_id = 3;

-- Bir uçuşun bilgilerini ve o uçuşa ait yolcu sayısını getirme
SELECT f.flight_id, f.departure_time, f.arrival_time, COUNT(t.ticket_id) AS passenger_count
FROM Flights f
LEFT JOIN Tickets t ON f.flight_id = t.flight_id
WHERE f.flight_id = 1
GROUP BY f.flight_id, f.departure_time, f.arrival_time;

-- Bir havaalanındaki tüm çalışanların listesi ve görevleri
SELECT s.first_name, s.job_title, a.name AS airport_name
FROM Staff s
JOIN Airports a ON s.airport_id = a.airport_id
WHERE s.airport_id = 5;

-- Bir yolcunun aldığı biletlerin toplam sayısı
SELECT COUNT(*) AS ticket_count
FROM Tickets t
WHERE t.passenger_id = 3;

-- Bir havayolu şirketindeki tüm uçuşlar ve bu uçuşlara ait bilet sayıları
SELECT f.flight_id, f.departure_time, f.arrival_time, a.name AS airline_name, COUNT(t.ticket_id) AS ticket_count
FROM Flights f
JOIN Airlines a ON f.airline_id = a.airline_id
LEFT JOIN Tickets t ON f.flight_id = t.flight_id
WHERE a.airline_id = 1
GROUP BY f.flight_id, f.departure_time, f.arrival_time, a.name;

-- Girilen yolcuların adları, nereden nereye uçtukları ve uçuş tarihleri
SELECT p.first_name AS passenger_name, a1.name AS departure_airport, a2.name AS arrival_airport, f.departure_time, f.arrival_time
FROM Passengers p
JOIN Tickets t ON p.passenger_id = t.passenger_id
JOIN Flights f ON t.flight_id = f.flight_id
JOIN Airports a1 ON f.departure_airport_id = a1.airport_id
JOIN Airports a2 ON f.arrival_airport_id = a2.airport_id
WHERE p.passenger_id = 1 OR p.passenger_id = 2 OR p.passenger_id = 5 OR p.passenger_id = 6 OR p.passenger_id = 8;

-- Bir havayoluna ait uçuşlar
SELECT f.flight_id, f.departure_time, f.arrival_time, a.name AS airline_name
FROM Flights f
JOIN Airlines a ON f.airline_id = a.airline_id
WHERE a.name = 'Turkish Airlines';

-- Yolcuların bilet bilgileri, bavul ağırlıkları ve uçuşları
SELECT p.first_name, p.last_name, t.ticket_id, t.seat_number, b.weight, f.flight_id, f.departure_time, f.arrival_time
FROM Passengers p
JOIN Tickets t ON p.passenger_id = t.passenger_id
JOIN Baggage b ON p.passenger_id = b.passenger_id
JOIN Flights f ON t.flight_id = f.flight_id;

-- Belirli bir tarihteki uçuşlar
SELECT flight_id, departure_time, arrival_time
FROM Flights
WHERE CAST(departure_time AS DATE) = '2023-05-21';

-- Yolcu sayısı en fazla olan havalimanı
SELECT TOP 1 a.name, COUNT(*) AS passenger_count
FROM Airports a
JOIN Flights f ON a.airport_id = f.departure_airport_id
JOIN Tickets t ON f.flight_id = t.flight_id
GROUP BY a.name
ORDER BY passenger_count DESC;

-- Havalimanında çalışan personel sayısı
SELECT a.name, COUNT(*) AS staff_count
FROM Airports a
JOIN STAFF s ON a.airport_id = s.airport_id
GROUP BY a.name;

-- Belirli bir yolcunun uçuşları
SELECT f.flight_id, f.departure_time, f.arrival_time
FROM Flights f
JOIN Tickets t ON f.flight_id = t.flight_id
JOIN Passengers p ON t.passenger_id = p.passenger_id
WHERE p.first_name = 'Lionel' AND p.last_name = 'Messi';

-- Belirli tarihler arasındaki tüm uçuşlar
SELECT * 
FROM Flights
WHERE departure_time >= '2023-05-21' AND departure_time <= '2023-05-22';

-- Aynı ülkedeki havalimanlarından bilet alan kişiler
SELECT p.first_name, p.last_name
FROM Passengers p
WHERE p.passenger_id IN (
    SELECT t.passenger_id
    FROM Tickets t
    WHERE t.flight_id IN (
        SELECT f.flight_id
        FROM Flights f
        WHERE f.departure_airport_id IN (
            SELECT a.airport_id
            FROM Airports a
            WHERE a.country = 'Turkey'
        )
    )
);

-- Bavul ağırlıkları 20 kilonun üzerinde olan yolcuların bilet bilgileri ve uçuşları
SELECT p.first_name, p.last_name, t.ticket_id, t.seat_number, b.weight, f.flight_id, f.departure_time, f.arrival_time
FROM Passengers p
JOIN Tickets t ON p.passenger_id = t.passenger_id
JOIN Baggage b ON p.passenger_id = b.passenger_id
JOIN Flights f ON t.flight_id = f.flight_id
WHERE b.weight > 20