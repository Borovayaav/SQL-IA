
CREATE VIEW country_houses AS
SELECT city_id, rooms_amount, about, status FROM estate 
WHERE type = 'country house'
ORDER BY  rooms_amount;
select * from country_houses;


CREATE ALGORITHM = MERGE VIEW  available_for_rent AS
SELECT city_id, type, rooms_amount, about, status FROM estate 
WHERE status = 'available for rent/sale'
ORDER BY  type;
INSERT INTO available_for_rent(city_id, type, rooms_amount, about, status) VALUES
(10, 'house', 5, NULL, 'available for rent/sale');
SELECT * FROM available_for_rent;


CREATE VIEW clients_with_contract AS
SELECT contract_id, clients_name, type, contract_type, payment_amount_USD, dated 
FROM clients
INNER JOIN contract ON  clients.clients_id = contract.clients_id
INNER JOIN estate ON  estate.estate_id = contract.estate_id
ORDER BY dated;
SELECT * FROM clients_with_contract;


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


DELIMITER $$
CREATE TRIGGER delete_contract
AFTER DELETE
ON contract
FOR EACH ROW
INSERT INTO deleted_contract(contract_id, clients_id, estate_id, employee_id, contract_type) 
VALUES  (OLD.contract_id, OLD.clients_id, OLD.estate_id, OLD.employee_id, OLD.contract_type)
$$
DELIMITER ;
SELECT contract_id, clients_id, estate_id, employee_id, contract_type FROM contract;
DELETE FROM contract WHERE contract_id = 10;
SELECT contract_id, clients_id, estate_id, employee_id, contract_type FROM deleted_contract;

 
 DELIMITER $$
 CREATE PROCEDURE get_amount (IN exchange_currency DECIMAL(11,8), IN contract INT, OUT nat_currency_payment DECIMAL(10,2))
 BEGIN
 SET nat_currency_payment = (SELECT IFNULL(payment_amount_USD,0)*exchange_currency
 FROM contract WHERE contract=contract_id);
 END $$
 DELIMITER ;
 CALL get_amount(2.4703, 1, @nat_currency_payment_1);
 SELECT ROUND(@nat_currency_payment_1,2);
 
