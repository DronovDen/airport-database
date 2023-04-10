create table specialization
(
 id integer primary key,
 specialization_name varchar(255) not null unique
);

create table if not exists airline
(
 id integer primary key,
 airline_name varchar(255) not null unique
);

create table if not exists airplane_type
(
 id integer primary key,
 type_name varchar(255) not null,
 people_capacity integer not null check (people_capacity >= 0),
 cruising_speed integer not null check (cruising_speed > 0)
);

create table if not exists department
(
 department_id integer primary key,
 department_name varchar(255) not null unique
-- director integer references employee(id)
);

create table if not exists crew
(
 id integer primary key,
 department integer not null references department(department_id)
);

create table if not exists employee
(
 id integer primary key,
 age integer not null check (age > 18),
 sex varchar(255) not null,
 birthdate date not null,
 surname varchar(255) not null,
 first_name varchar(255) not null,
 patronymic varchar(255) not null,
 work_experience integer,
 employment_date date not null,
 salary integer not null check (salary > 0),
 children_number integer check (children_number >= 0),
 department integer not null references department(department_id),
 crew integer not null references crew(id),
 specialization integer not null references specialization(id)
);

create table if not exists directors
(
 department_id integer primary key references department(department_id),
 director integer not null references employee(id)
);


create table if not exists location
(
 id integer primary key,
 country varchar(255) not null,
 city varchar(255) not null,
 airport_name varchar(255) not null unique,
 temperature float not null,
 weather_conditions varchar(255)
);

create table if not exists airplane
(
 id integer primary key,
 airline integer references airline(id),
-- model varchar(255) not null,
 airplane_type integer not null references airplane_type(id),
 manufacture_year integer not null check (manufacture_year > 1900),
 pilot_crew_id integer not null references crew(id),
 technical_crew_id integer not null references crew(id),
 service_crew_id integer not null references crew(id),
 base_airport integer not null references location(id)
);

create table if not exists airplane_tech_maintenance_type
(
 id integer primary key,
 maintenance_type varchar(255) not null unique
);

create table if not exists airplane_tech_maintenance_log
(
 id integer primary key,
 airplane integer not null references Airplane(id),
 tech_crew integer references crew(id) not null,
 maintenance_type integer references airplane_tech_maintenance_type(id) not null,
 maintenance_date date not null,
 refueled_fuel integer not null check (refueled_fuel >= 0)
);

create table if not exists airplane_service_log
(
 id integer primary key,
 airplane integer not null references Airplane(id),
 crew integer not null references crew(id),
 salon_cleaning boolean not null,
 food_replenishment boolean not null,
 service_date date not null
);

create table if not exists flight_category
(
 id integer primary key,
 category_name varchar(255) not null unique
);

create table if not exists departure_status
(
 id integer primary key,
 description varchar(255) not null,
 reason varchar(255)
);

create table if not exists flight
(
 flight_id integer primary key,
 airplane_id integer not null references Airplane(id),
 departure_time timestamp,
 arrival_time timestamp,
 flight_duration integer check (flight_duration > 0),
 departure_location integer not null references location(id),
 arrival_location integer not null references location(id),
 status integer not null references departure_status(id),
 flight_category integer references flight_category(id)
);


create table if not exists ticket_status
(
 status_id integer primary key,
 description varchar(255) not null unique
);

create table if not exists seat_class
(
 id integer primary key,
 description varchar(255) not null unique
);

create table if not exists passenger
(
 passport_id integer primary key,
 international_passport_id integer,
 age integer not null check (age >= 0),
 sex varchar(255) not null,
 surname varchar(255) not null,
 name varchar(255) not null,
 patronymic varchar(255) not null,
 cargo boolean not null
-- customs_control boolean not null
);

create table if not exists ticket
(
 ticket_id integer primary key,
 flight_id integer not null references flight(flight_id),
 passenger integer not null references passenger(passport_id),
 seat_number integer not null,
 seat_class integer not null references seat_class(id),
-- ticket_status integer not null references ticket_status(status_id),
 price integer not null,
 luggage_max integer not null
);

create table if not exists ticket_status_log
(
 ticket integer primary key references ticket(ticket_id),
 status integer not null references ticket_status(status_id)
);

create table if not exists attributes
(
 id integer primary key,
 name varchar(255) not null unique,
 specialization integer not null references specialization(id)
);

create table if not exists employees_attributes
(
 worker_id integer references employee(id),
 attribute_id integer references attributes(id),
 attribute_value varchar(255)
);

create table if not exists pilot_medical_examination_log
(
-- trigger here while adding employee (check if he is really pilot)
 id integer references employee(id),
 medical_examination_date date not null,
 allowed_to_fly boolean not null
);