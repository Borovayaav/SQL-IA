USE project;
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
WHERE contract_status = 'active';
SELECT * FROM active_contract;
