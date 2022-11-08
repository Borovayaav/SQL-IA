USE project;
INSERT INTO country(country_name) VALUES(
'Belarus'),( 'Russia'), ('Poland'), ('Germany'), ('France'), ('Italy'), ('Hungary'), ('Brazil'), ('Austria'), ('Belgium'),
('Georgia'), ('Denmark'), ('Egypt'), ('India'), ('Ireland'), ('Spain'), ('Canada'), ('Cyprus'), ('China'), ('Netherlands');

INSERT INTO city(city_name,country_id) VALUES
('Minsk', 1),( 'Moskow', 2), ('Warsaw', 3), ('Berlin', 4), ('Paris',5),
('Rome', 6), ('Budapest', 7), ('Brasilia', 8), ('Wienn', 9), ('Brussel', 10),
('Tbilicy', 11), ('Copengagen', 12), ('Cairo', 13), ('New Delhi', 14), ('Dublin', 15),
 ('Madrid', 16), ('Ottawa', 17), ('Nikosia', 18), ('Beijing', 19), ('Amsterdam', 20);

INSERT INTO employee(employee_name) VALUES
('Georg Ramirez'), ('Deni Water'), ('Eggy Stone'), ('Indira Tatum'), ('Iren Buttler'),
('Spaik Downing'), ('Candy Trawis'), ('Cyris McColumn'), ('Sara Konor'), ('Nelly James');

INSERT INTO estate(employee_id, city_id, type, square, balcon, rooms_amount, pets_allowed, about, status) VALUES
(1, 20, 'apartment', 64.70, 'yes', 2, 'yes', 'Great view!', 'available for rent/sale'),
(2, 17, 'country house', 224.30, 'no', 12, 'yes', 'For big companies and great weekends!', 'estate rented'),
(3, 14, 'house', 118.53, 'no', 5, 'no', NULL, 'available for rent/sale'),
(4, 11, 'house', 94.10, 'yes', 3, 'yes', 'Your vakancy with fresh air', 'estate leased'),
(5, 8, 'apartment', 71.20, 'yes', 2, 'no', 'No limit to sunbathes', 'estate sold'),
(6, 5, 'apartment', 107.30, 'yes', 3, 'no', 'Romantic', 'estate bought'),
(7, 2, 'apartment', 94.15, 'no', 4, 'yes', 'Urgent sale. Bargain', 'available for rent/sale'),
(8, 19, 'house', 64.70, 'no', 2, 'yes', 'Little place of peace', 'estate sold'),
(9, 16, 'country house', 264.70, 'yes', 5, 'yes', 'Fiesta', 'estate leased'),
(10, 12, 'apartment', 109.01, 'no', 3, 'no', 'The city center', 'estate bought'),
(NULL,9, 'apartment', 31.50, 'yes', 1, 'no', NULL, 'available for rent/sale')
;

INSERT INTO clients VALUES
(1,'Jamy McLarens', '1278 McHoland Drive, Chicago, USA', '+24285551236', 'mcjamy@icloud.com','Interested in scandinavik houses'),
(2,'Alla Petrova', 'Russian Federation, Liubertsy, Lesnaya street, 12', '+97154829167', NULL,'Looking for an appartment near Moscow'),
(3,'Sergey Ivanow', 'Belarus, Minsk, Orlovskaya street, 28, app.19', '+375291234567', NULL,'Fresh men'),
(4,'Sarah Polson', '12714 Midletown Rimini, Toskana, Italy ', '+251451662761', NULL,'allredy made a deal'),
(5,'John Week', '17-34 Livigstone boul Seattle, Washington USA', '+24187169912', NULL,NULL),
(6,'Kelly Clarkson', '29 Poless street Uzda Poland', '+67184592151', 'ClarkClark@yahoo.com','Want to buy an estate near the sea'),
(7,'Clark Kent', '17-39 Stonevillage Nashville, Washington USA', '+357291614893', 'shy_superhero@gmail.com','The safety place we coud even find'),
(8,'Amy Larens', '12 McHoland Drive, Chicago, USA', '+24231651236', 'laramy@icloud.com', NULL),
(9,'Anna Delfi', 'Russian Federation, Moscow, Metallurgichesskaya street, 22', '+49157831456', NULL,'Looking for an appartment near Moscow'),
(10,'Sergey Bystrov', 'Belarus, Minsk, Plekhanova street, 28, app.19', '+375299876541', NULL,'Chep appartments in Poland'),
(11,'Sam Polson', '12714 Midletown Rimini, Toskana, Italy ', '+251728662761', NULL, NULL),
(12,'John Wendelz', '1734 Courage ave Seattle, Washington USA', '+24124159912', 'johnwen@yahoo.com',NULL),
(13,'Jill Summers', '1-314 1st street Drive, Mexico, USA', '+27345551236', 'summerjill@icloud.com','Pretty home with flowers'),
(14,'Andrew Simons', 'Poland, Poznan, Miestachkovae sialo, 12', '+91356571821', NULL,'Want to live in Holand')
;

INSERT INTO transactions VALUES
(1, 12, 1, '2022-05-18', 'change with payment'),(2, 7, 5, '2021-09-19', 'clear change with fee'),
(3, 1, 4, '2018-10-31', 'payment'),(4, 3, 7, '2020-09-01', 'payment'),
(5, 5, 3, '2021-04-28', 'payment'),(6, 14, 8, '2022-03-12', 'clear change with fee'),
(7, 8, 12, '2020-08-18', 'change with payment'),(8, 6, 2, '2021-05-07', 'payment'),
(9, 2, 1, '2022-05-18', 'payment'),(10, 9, 11, '2022-05-18', 'change with payment'),
(11, 11, 10, '2019-02-27', 'change with payment'),(12, 10, 9, '2019-11-03', 'clear change with fee'),
(13, 6, 11, '2022-04-01', 'clear change with fee'),(14, 12, 4, '2021-12-25', 'payment')
;

INSERT INTO contract(clients_id, estate_id, employee_id, transactions_id, contract_type, payment_amount_USD, dated) VALUES
(12, 1, 4, 1, 'selling (to a customer)', 25411.37, '2022-05-18'),
(5, 2, 1, 2, 'buying (from a customer)', 5237.41, '2021-09-19'),
(1, 3, 2, 3, 'leasing (from a customer)', 1500.00, '2018-10-31'),
(7, 4, 10, 4, 'mediation (buying)', 455000.00, '2020-09-01'),
(5, 5, 6, 5, 'mediation (leasing)', 4500.00, '2021-04-28'),
(14, 6, 3, 6, 'selling (to a customer)', 7000.00, '2022-03-12'),
(8, 7, 3, 7, 'selling (to a customer)', 23518.00, '2020-08-18'),
(6, 8, 5, 8, 'mediation (leasing)', 518.00, '2021-05-07'),
(2, 9, 9, 9, 'selling (to a customer)', 135516.40, '2022-05-18'),
(9, 10, 4, 10, 'buying (from a customer)', 18819.53, '2022-05-18'),
(11, 11, 7, 11, 'selling (to a customer)', 35592.40, '2019-02-27'),
(10, 1, 8, 12, 'mediation (selling)', 124689.23, '2019-11-03'),
(6, 3, 4, 13, 'buying (from a customer)', 4123.18, '2022-04-01'),
(4, 4, 2, 14, 'mediation (renting)', 214.30, '2021-12-25')
;