CREATE OR REPLACE FUNCTION check_pilot_department() RETURNS TRIGGER AS $$
BEGIN
  IF NEW.pilot_crew_id NOT IN (SELECT id FROM crew WHERE department = (SELECT department_id FROM department WHERE department_name = 'Pilot Department')) THEN
    RAISE EXCEPTION 'The pilot_crew_id does not belong to the Pilots department';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_pilot_department_trigger
BEFORE INSERT ON airplane
FOR EACH ROW
EXECUTE FUNCTION check_pilot_department();


CREATE OR REPLACE FUNCTION check_technicians_department() RETURNS TRIGGER AS $$
BEGIN
  IF NEW.pilot_crew_id NOT IN (SELECT id FROM crew WHERE department = (SELECT department_id FROM department WHERE department_name = 'Technician Department')) THEN
    RAISE EXCEPTION 'The technicians_crew_id does not belong to the Pilots department';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_technicians_department_trigger
BEFORE INSERT ON airplane
FOR EACH ROW
EXECUTE FUNCTION check_technicians_department();


CREATE OR REPLACE FUNCTION check_service_department() RETURNS TRIGGER AS $$
BEGIN
  IF NEW.pilot_crew_id NOT IN (SELECT id FROM crew WHERE department = (SELECT department_id FROM department WHERE department_name = 'Service Department')) THEN
    RAISE EXCEPTION 'The service_crew_id does not belong to the Pilots department';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_service_department_trigger
BEFORE INSERT ON airplane
FOR EACH ROW
EXECUTE FUNCTION check_service_department();




CREATE OR REPLACE FUNCTION check_employee_age() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.age <= 18 THEN
        RAISE EXCEPTION 'Employee must be at least 18 years old.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER age_check
BEFORE INSERT OR UPDATE ON employee
FOR EACH ROW
EXECUTE FUNCTION check_employee_age();




CREATE OR REPLACE FUNCTION trg_check_pilot_specialization()
RETURNS TRIGGER AS $$
BEGIN
    IF NOT EXISTS (
        SELECT * FROM employee e
        WHERE e.id = NEW.id AND e.specialization = (
            SELECT id FROM specialization WHERE specialization_name = 'Pilot'
        )
    ) THEN
        RAISE EXCEPTION 'The employee is not a pilot.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER pilot_medical_examination_log_check_specialization
BEFORE INSERT ON pilot_medical_examination_log
FOR EACH ROW
EXECUTE FUNCTION trg_check_pilot_specialization();




CREATE OR REPLACE FUNCTION check_seat_capacity() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.seat_number > (SELECT people_capacity FROM airplane_type
                           WHERE airplane_type.id = (SELECT airplane_type FROM airplane
                                       WHERE airplane.id = (SELECT airplane_id FROM flight WHERE flight_id = NEW.flight_id))
                          ) THEN
        RAISE EXCEPTION 'Seat number exceeds airplane people capacity!';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_seat_capacity_trigger BEFORE INSERT ON ticket
FOR EACH ROW EXECUTE FUNCTION check_seat_capacity();


CREATE OR REPLACE FUNCTION check_department_employees() RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT * FROM employee WHERE department = OLD.department_id) THEN
        RAISE EXCEPTION 'Cannot delete department with employees.';
    END IF;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER department_employee_check
BEFORE DELETE ON department
FOR EACH ROW
EXECUTE FUNCTION check_department_employees();


-- 1 variant of check employee attribute trigger
CREATE OR REPLACE FUNCTION check_employee_has_attribute()
RETURNS TRIGGER AS $$
BEGIN
  IF NOT EXISTS (
    SELECT * FROM employee, attributes eta
             WHERE employee.id = NEW.worker_id AND
                   NEW.attribute_id = eta.id AND
                   eta.specialization = employee.specialization
  ) THEN
    RAISE EXCEPTION 'Employee has no such attribute';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE TRIGGER employee_has_attribute_2
BEFORE INSERT OR UPDATE ON employees_attributes
FOR EACH ROW
EXECUTE FUNCTION check_employee_has_attribute();





-- 2 variant of check employee attribute trigger
CREATE OR REPLACE FUNCTION check_employee_attribute() RETURNS TRIGGER AS $$
BEGIN
  IF NOT EXISTS (
    select employee.id, specialization_name, attributes.name, NEW.attribute_value
    from employee, employees_attributes, attributes, specialization
    where employee.specialization = specialization.id
    and attributes.specialization = specialization.id
    and NEW.attribute_id = attributes.id
    and NEW.worker_id = employee.id
    and employee.id = NEW.worker_id
  ) THEN
    RAISE EXCEPTION 'Employees specialization does not have the corresponding attribute.';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER employees_attributes_check
  BEFORE INSERT ON employees_attributes
  FOR EACH ROW
  EXECUTE FUNCTION check_employee_attribute();