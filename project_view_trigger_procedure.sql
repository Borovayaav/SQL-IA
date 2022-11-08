CREATE VIEW the_most_expensive AS
SELECT payment_amount_USD, type, country_name AS country, city_name AS city, rooms_amount, about FROM estate e
INNER JOIN contract con ON con.estate_id = e.estate_id
INNER JOIN city c ON c.city_id = e.city_id
INNER JOIN country co ON co.country_id = c.country_id
ORDER BY  payment_amount_USD DESC
LIMIT 5;
select * from the_most_expensive;

CREATE VIEW the_most_effective AS
SELECT sum(payment_amount_USD) AS total, employee_name AS employee FROM employee e
INNER JOIN contract con ON con.employee_id = e.employee_id
GROUP BY con.employee_id
ORDER BY total DESC
LIMIT 5;
select * from the_most_effective;


CREATE VIEW country_houses AS
SELECT type, country_name AS country, city_name AS city, rooms_amount, about FROM estate e
INNER JOIN city c ON c.city_id = e.city_id
INNER JOIN country co ON co.country_id = c.country_id
WHERE type = 'country house'
ORDER BY  rooms_amount;
select * from country_houses;


CREATE VIEW  available_for_rent AS
SELECT country_name AS country, city_name AS city, type, rooms_amount, about, status FROM estate e
INNER JOIN city c ON c.city_id = e.city_id
INNER JOIN country co ON co.country_id = c.country_id
WHERE status = 'available for rent/sale'
ORDER BY  type;
SELECT * FROM available_for_rent;


CREATE VIEW clients_with_contract AS
SELECT clients_name, contract_type_operation, payment_amount_USD, dated 
FROM clients cl
INNER JOIN contract con ON  cl.clients_id = con.clients_id
INNER JOIN contract_type ct ON  ct.contract_type_id = con.contract_type_id
INNER JOIN estate e ON  e.estate_id = con.estate_id
ORDER BY dated;
SELECT * FROM clients_with_contract LIMIT 5;

CREATE VIEW active_contract AS
SELECT clients_name, contract_type_operation, payment_amount_USD, dated FROM clients cl
INNER JOIN contract con ON  cl.clients_id = con.clients_id
INNER JOIN contract_type ct ON  ct.contract_type_id = con.contract_type_id
INNER JOIN estate e ON  e.estate_id = con.estate_id
WHERE finished = 0;
SELECT * FROM active_contract;

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
 CREATE PROCEDURE get_amount (IN exchange_currency DECIMAL(11,8), IN contract INT, OUT nat_currency_payment DECIMAL(10,2))
 BEGIN
 SET nat_currency_payment = (SELECT IFNULL(payment_amount_USD,0)*exchange_currency
 FROM contract WHERE contract=contract_id);
 END $$
 DELIMITER ;
 CALL get_amount(2.4703, 1, @nat_currency_payment_1);
 SELECT ROUND(@nat_currency_payment_1,2);
