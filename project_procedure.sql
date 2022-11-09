USE project;

DELIMITER $$
 CREATE PROCEDURE set_currency (IN exchange_currency DECIMAL(5,4), IN current_currency_date DATE)
 BEGIN
	CASE 
		WHEN current_currency_date NOT IN (SELECT currency_date FROM currency) THEN
			INSERT INTO currency(currency_cost, currency_date) VALUES (exchange_currency, current_currency_date);
            SELECT 'successfully' AS result;
		ELSE
			SELECT 'For this date, the course is already indicated' AS warning;
	END CASE;
 END $$
 DELIMITER ;
 CALL set_currency (2.4639, '2019-11-09');
 SELECT * FROM currency;


DELIMITER $$
 CREATE PROCEDURE get_actual_estate_amount(IN current_currency_date DATE)
 BEGIN
	CASE 
		WHEN current_currency_date IN (SELECT currency_date FROM currency) THEN
			SELECT ROUND(payment_amount_USD * currency_cost, 2) AS byn_amount, type, country_name AS country, city_name AS city, rooms_amount, about FROM estate e
			INNER JOIN contract con ON con.estate_id = e.estate_id
			INNER JOIN city c ON c.city_id = e.city_id
            INNER JOIN currency cur ON cur.currency_date = con.dated
			INNER JOIN country co ON co.country_id = c.country_id;
		ELSE
			SELECT 'The exchange rate for the intervening date is not specified' AS warning;
	END CASE;
 END $$
 DELIMITER ;
 CALL get_actual_estate_amount ('2019-11-10');
