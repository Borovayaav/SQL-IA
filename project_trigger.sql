USE project;

DELIMITER $$
CREATE TRIGGER distribution_of_duties
AFTER INSERT
ON employee
FOR EACH ROW
UPDATE estate SET employee_id = NEW.employee_id
WHERE employee_id IS NULL
$$
DELIMITER ;
INSERT INTO employee(employee_name) VALUES ('Amy Farafauler');
SELECT * FROM estate;


DELIMITER $$
CREATE TRIGGER worked_with_archive
AFTER UPDATE
ON estate
FOR EACH ROW
IF NEW.employee_id != OLD.employee_id THEN
INSERT INTO worked_with_estate(estate_id, previous_employee_id, new_employee_id, city_id, type) 
VALUES (NEW.estate_id, OLD.employee_id, NEW.employee_id, NEW.city_id, NEW.type);
END IF $$
DELIMITER ;
SELECT estate_id, employee_id FROM estate limit 5;
UPDATE estate SET employee_id = 2 WHERE employee_id = 1;
SELECT * FROM worked_with_estate;
