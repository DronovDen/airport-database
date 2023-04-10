INSERT INTO airline (id, airline_name) VALUES
(1, 'Aeroflot'),
(2, 'S7 Airlines'),
(3, 'Pobeda'),
(4, 'Ural Airlines');

INSERT INTO airplane_type (id, type_name, people_capacity, cruising_speed) VALUES
(1, 'Boeing 747', 416, 920),
(2, 'Airbus A380', 853, 945),
(3, 'Boeing 737', 215, 853),
(4, 'Airbus A320', 180, 828),
(5, 'Sukhoi SuperJet', 280, 850);


INSERT INTO specialization (id, specialization_name) VALUES
(1, 'Pilot'),
(2, 'Flight Dispatcher'),
(3, 'Aircraft Technician'),
(4, 'Cashier'),
(5, 'Security Personnel'),
(6, 'Help Desk'),
(7, 'Service Personnel');

-- Insert data into the department table
INSERT INTO department (department_id, department_name) VALUES
(1, 'Pilot Department'),
(2, 'Dispatcher Department'),
(3, 'Technician Department'),
(4, 'Cashier Department'),
(5, 'Security Department'),
(6, 'Help Desk Department'),
(7, 'Service Department');

-- Insert data into the crew table
INSERT INTO crew (id, department) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 1),
(9, 3),
(10, 1);


INSERT INTO employee (id, age, sex, birthdate, surname, first_name, patronymic, work_experience, employment_date,
                      salary, children_number, department, crew, specialization)
VALUES (1, 35, 'M', '1988-01-01', 'Smith', 'John', 'William', 10, '2015-01-01', 50000, 2, 1, 1, 1),
       (2, 28, 'F', '1995-05-01', 'Johnson', 'Jessica', 'Marie', 5, '2020-03-01', 40000, 0, 3, 3, 3),
       (3, 45, 'M', '1978-12-15', 'Lee', 'David', 'Kang', 20, '2005-06-01', 70000, 2, 1, 1, 1),
       (4, 32, 'F', '1991-08-20', 'Kim', 'Emily', 'Jung', 7, '2016-05-01', 45000, 1, 2, 2, 2),
       (5, 41, 'M', '1982-03-03', 'Garcia', 'Juan', 'Lopez', 18, '2008-01-01', 65000, 3, 3, 3, 3),
       (6, 26, 'F', '1997-11-12', 'Hernandez', 'Sofia', 'Maria', 2, '2021-02-01', 35000, 0, 4, 4, 4),
       (7, 33, 'M', '1990-07-10', 'Nguyen', 'Kevin', 'Duc', 8, '2015-09-01', 50000, 2, 1, 8, 1),
       (8, 29, 'F', '1994-04-09', 'Brown', 'Olivia', 'Grace', 4, '2019-01-01', 40000, 0, 3, 3, 3),
       (9, 44, 'M', '1979-09-25', 'Davis', 'Michael', 'Lee', 19, '2004-03-01', 68000, 2, 1, 8, 1),
       (10, 31, 'F', '1992-06-18', 'Jones', 'Emma', 'Claire', 6, '2017-04-01', 45000, 1, 2, 2, 2),
       (11, 39, 'M', '1984-01-23', 'Martinez', 'Jose', 'Luis', 15, '2008-09-01', 60000, 3, 3, 9, 3),
       (12, 25, 'F', '1996-10-07', 'Gonzalez', 'Isabella', 'Sophia', 1, '2022-01-01', 34000, 0, 4, 4, 4),
       (13, 34, 'M', '1989-02-12', 'Rodriguez', 'Alex', 'Miguel', 9, '2014-01-01', 48000, 2, 7, 7, 7),
       (14, 30, 'F', '1993-03-27', 'Taylor', 'Ava', 'Madison', 3, '2018-02-01', 39000, 0, 3, 9, 3),
       (15, 40, 'M', '1981-07-14', 'Lopez', 'Carlos', 'Miguel', 17, '2006-05-01', 67000, 2, 1, 10, 1),
       (16, 36, 'M', '1987-06-30', 'Smith', 'William', 'Robert', 12, '2011-03-01', 55000, 1, 2, 2, 2),
       (17, 27, 'F', '1994-09-01', 'Johnson', 'Emily', 'Grace', 4, '2020-01-01', 41000, 0, 3, 9, 3),
       (18, 47, 'M', '1976-11-19', 'Lee', 'Joon', 'Hyung', 22, '2002-01-01', 75000, 2, 1, 10, 1),
       (19, 29, 'F', '1992-12-24', 'Kim', 'Sophie', 'Min', 5, '2018-08-01', 42000, 0, 5, 5, 5),
       (20, 38, 'M', '1985-05-17', 'Garcia', 'Luis', 'Antonio', 14, '2009-06-01', 59000, 3, 6, 6, 6);


INSERT INTO directors (department_id, director)
VALUES
  (1, 1),
  (2, 4),
  (3, 2),
  (4, 6),
  (5, 19),
  (6, 20),
  (7, 13);

INSERT INTO location (id, country, city, airport_name, temperature, weather_conditions)
VALUES
  (1, 'Russia', 'Novosibirsk', 'Tolmachevo', 5, 'Clear'),
  (2, 'France', 'Paris', 'Charles de Gaulle Airport', 12.5, 'Cloudy'),
  (3, 'Japan', 'Tokyo', 'Narita International Airport', 23.7, 'Rain'),
  (4, 'Australia', 'Sydney', 'Sydney Airport', 26.4, 'Sunny'),
  (5, 'United Arab Emirates', 'Dubai', 'Dubai International Airport', 32.1, 'Sunny'),
  (6, 'Russia', 'Moscow', 'Pulkovo', 9, 'Clear');

INSERT INTO airplane (id, airline, airplane_type, manufacture_year, pilot_crew_id, technical_crew_id, service_crew_id, base_airport)
VALUES
  (1, 1, 1, 2015, 1, 3, 7, 1),
  (2, 2, 2, 2010, 1, 3, 7, 1),
  (3, 3, 3, 2005, 8, 9, 7, 2),
  (4, 4, 4, 2018, 8, 3, 7, 3),
  (5, 1, 5, 2013, 10, 9, 7, 6);

INSERT INTO airplane_tech_maintenance_type (id, maintenance_type)
VALUES
  (1, 'Regular Maintenance'),
  (2, 'Major Overhaul'),
  (3, 'Repairs');

INSERT INTO airplane_tech_maintenance_log (id, airplane, tech_crew, maintenance_type, maintenance_date, refueled_fuel)
VALUES
  (1, 1, 3, 1, '2023-01-05', 10000),
  (2, 3, 3, 3, '2023-02-12', 5000),
  (3, 4, 9, 2, '2022-03-20', 7500),
  (4, 2, 3, 1, '2022-04-28', 9000),
  (5, 5, 9, 3, '2022-05-10', 3000),
  (6, 5, 9, 3, '2023-03-10', 5000);

INSERT INTO airplane_service_log (id, airplane, crew, salon_cleaning, food_replenishment, service_date)
VALUES
  (1, 1, 7, true, true, '2022-01-05'),
  (2, 3, 7, false, true, '2022-02-12'),
  (3, 4, 7, true, false, '2022-03-20'),
  (4, 2, 7, true, true, '2022-04-28'),
  (5, 5, 7, false, false, '2022-05-10');


INSERT INTO flight_category (id, category_name)
VALUES
(1, 'Domestic'),
(2, 'International');

INSERT INTO departure_status (id, description, reason)
VALUES
(1, 'Departed', NULL),
(2, 'Cancelled', 'Bad weather conditions'),
(3, 'Cancelled', 'Few tickets sold'),
(4, 'Delayed', 'Technical issues'),
(5, 'Delayed', 'Bad weather conditions'),
(6, 'Registration', NULL),
(7, 'Boarding', NULL),
(8, 'Landed', NULL);

INSERT INTO flight (flight_id, airplane_id, departure_time, arrival_time, flight_duration, departure_location,
                    arrival_location, status, flight_category)
VALUES
(1, 1, '2021-04-05 10:00:00', '2021-04-05 11:30:00', 90, 1, 2, 1, 2),
(2, 2, '2021-04-06 15:00:00', '2021-04-06 19:00:00', 240, 3, 4, 3, 2),
(3, 3, '2021-04-07 08:30:00', '2021-04-07 11:30:00', 120, 1, 5, 2, 2),
(4, 4, '2021-03-08 08:00:00', '2021-03-08 11:30:00', 120, 1, 6, 4, 1),
(5, 4, '2021-03-08 18:00:00', '2021-03-08 21:30:00', 120, 6, 1, 5, 1);

INSERT INTO ticket_status (status_id, description)
VALUES
(1, 'In sale'),
(2, 'Booked'),
(3, 'Redeemed'),
(4, 'Returned');

INSERT INTO seat_class (id, description)
VALUES
(1, 'Economy'),
(2, 'Business'),
(3, 'First class');

INSERT INTO passenger (passport_id, international_passport_id, age, sex, surname, name, patronymic, cargo)
VALUES
(111, 222, 25, 'M', 'Smith', 'John', 'Adam', false),
(222, 333, 38, 'F', 'Johnson', 'Mary', 'Anne', false),
(333, 444, 45, 'M', 'Williams', 'David', 'Robert', true),
(444, 555, 35, 'M', 'Jobs', 'Steve', 'Sed', true),
(666, 777, 27, 'M', 'Trump', 'John', 'Thompson', false),
(888, 999, 40, 'F', 'McGregor', 'Conor', 'Johns', false);

INSERT INTO ticket (ticket_id, flight_id, passenger, seat_number, seat_class, price, luggage_max)
VALUES
(1, 1, 111, 25, 1, 5000, 15),
(2, 2, 222, 10, 2, 10000, 30),
(3, 3, 333, 5, 3, 7000, 50),
(4, 3, 444, 6, 1, 8000, 100),
(5, 4, 666, 10, 3, 7777, 50),
(6, 5, 888, 20, 2, 15000, 75);

INSERT INTO ticket_status_log (ticket, status)
VALUES
(1, 1),
(2, 2),
(3, 1),
(4, 4),
(5, 2),
(6, 4);



INSERT INTO attributes (id, name, specialization) VALUES
(1, 'Is aircraft commander', 1),
(2, 'Foreign language', 2),
(3, 'Technical specialization', 3),
(4, '1C experience', 4),
(5, 'Area', 5),
(6, 'Issue', 6),
(7, 'Cleaning company', 7);


INSERT INTO employees_attributes (worker_id, attribute_id, attribute_value) VALUES
(1, 1, 'Yes'),
(2, 3, 'Engine'),
(3, 1, 'No'),
(4, 2, 'Arabian'),
(6, 4, '5 years'),
(19, 5, 'Hangars territory'),
(20, 6, 'Lost luggage'),
(13, 7, 'Chistyulya');


INSERT INTO pilot_medical_examination_log (id, medical_examination_date, allowed_to_fly) VALUES
(1, '2022-01-01', true),
(3, '2021-11-30', true),
(7, '2022-03-15', true),
(9, '2022-02-28', false),
(15, '2021-12-31', true),
(18, '2021-12-31', true);
