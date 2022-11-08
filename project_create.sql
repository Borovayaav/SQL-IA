CREATE DATABASE project;
USE project;

CREATE TABLE country(
    country_id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    country_name VARCHAR(45) DEFAULT NULL
);

CREATE TABLE city(
    city_id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    city_name VARCHAR(45) DEFAULT NULL,
    country_id INT UNSIGNED DEFAULT NULL, 
	FOREIGN KEY (country_id) REFERENCES country (country_id)
);

CREATE TABLE employee(
    employee_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(45) DEFAULT NULL
);

CREATE TABLE estate(
	estate_id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    employee_id INT UNSIGNED DEFAULT NULL,
    city_id INT UNSIGNED NOT NULL,
    type ENUM('apartment','house','country house'),
    square dec(10,2) NULL,
    balcon ENUM('yes','no'),
    rooms_amount INT UNSIGNED DEFAULT 1,
    pets_allowed ENUM('yes','no'),
    about VARCHAR(450) ,
    status ENUM('estate leased','estate bought','estate sold', 'estate rented', 'available for rent/sale'),
	FOREIGN KEY (city_id) REFERENCES city (city_id),
    FOREIGN KEY (employee_id) REFERENCES employee (employee_id)
);

CREATE TABLE worked_with_estate(
	estate_id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    previous_employee_id INT UNSIGNED DEFAULT NULL,
    new_employee_id INT UNSIGNED DEFAULT NULL,
    city_id INT UNSIGNED NOT NULL,
    type ENUM('apartment','house','country house'),
    changed_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE clients(
    clients_id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    clients_name VARCHAR(45) NOT NULL,
    clients_address VARCHAR(90) NOT NULL,
    phone VARCHAR(20) DEFAULT NULL,
    mail VARCHAR(50) DEFAULT NULL,
    about VARCHAR(450) DEFAULT NULL
);

CREATE TABLE transactions(
    transactions_id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    seller_id INT UNSIGNED NOT NULL,
    buyer_id INT UNSIGNED NOT NULL,
    transactions_date DATE NOT NULL,
    about VARCHAR(250) DEFAULT NULL,
    FOREIGN KEY (seller_id) REFERENCES clients (clients_id),
    FOREIGN KEY (buyer_id) REFERENCES clients (clients_id),
    CHECK (seller_id != buyer_id)
);

CREATE TABLE contract_type(
	contract_type_id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
	contract_type_operation VARCHAR(50) DEFAULT NULL)
    ;

CREATE TABLE contract(
    contract_id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
    contract_type_id INT UNSIGNED NOT NULL,
    clients_id INT UNSIGNED NOT NULL,
    estate_id INT UNSIGNED NOT NULL,
    employee_id INT UNSIGNED NULL,
    transactions_id INT UNSIGNED NOT NULL,
    payment_amount_USD DECIMAL(10,2) DEFAULT NULL,
    dated DATE NOT NULL,
    finished BOOL NULL,
    FOREIGN KEY (clients_id) REFERENCES clients (clients_id),
    FOREIGN KEY (estate_id) REFERENCES estate (estate_id),
    FOREIGN KEY (employee_id) REFERENCES employee (employee_id),
    FOREIGN KEY (transactions_id) REFERENCES transactions (transactions_id)
);
