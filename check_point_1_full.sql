set lines 300
set trimout on
set tab off

SET SERVEROUTPUT ON;
SET VERIFY OFF;

--first run client create tables file
--then run this data file in server
--then run process_fragments file in client.


drop table RAW_DATA;

CREATE TABLE RAW_DATA (
	id INt NOT NULL , 
	numerical_col_1 float NULL, 	
	numerical_col_2 int NULL, 
	numerical_col_3 float NULL,
	categorical_col_1 varchar2(30) NULL,
	categorical_col_2 varchar2(30) NULL,
	PRIMARY KEY(id)
);



INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (1,632, 'Gray', 43,474, 'Toyota');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (2,474, 'White', 115,372, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (3,593, 'Black', 3,593, 'Nissan');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (4,687, 'Brown', 57,687, 'Lexus');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (5,543, 'Brown', 0,589, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (6,527, 114,632, 'Toyota');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (7,330, 'Blue', 14,665, 'Lexus');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (8,589, 'Purple', 169,372, 'Lexus');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (9,665, 'Burgundy', 42,307, 'Toyota');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (10,372, 'Burgundy', 64,377, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (11,368, 'Purple', 92,646, 'Lexus');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (12,307, 'Red', 49,495, 'Lexus');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (13,316, 'Brown', 156,368, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (14,495, 'Gray', 54,670, 'Nissan');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (15,377, 'White', 48,589, 'Lexus');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (16,425, 'Brown', 145,688, 'Toyota');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (17,646, 'Black', 185,445, 'Nissan');
INSERT INTO RAW_DATA(id, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (18, 'Gray', 90,632, 'Lexus');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (19,528, 'Black', 124,670,  'Lexus');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (20,688, 'Gray', 9,526, 'Lexus');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (21,665, 'Brown', 165,365, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (22,519, 'Red', 149,368, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (23,481, 134, 481, 'Toyota');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (24,470, 'Maroon', 21,481, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (25,445, 'Blue', 100,318, 'Nissan');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (26,526, 'Black', 153,528, 'Nissan');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (27,680, 'Purple', 106,307, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (28,670, 'Gray', 134,425, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (29,318, 'Brown', 22,688, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (30,344, 'White', 1,665, 'Toyota');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (31,365, 'Burgundy', 79,377, 'Lexus');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (32,502, 'Blue', 190,445, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (33,368, 'Burgundy', 149,680, 'Nissan');
INSERT INTO RAW_DATA(id, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (34, 'Silver', 33,632, 'Toyota');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (35,365, 'Gray', 197,368, 'Lexus');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (36,432, 'Red', 172,470, 'Lexus');
INSERT INTO RAW_DATA(id, numerical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (37,460, 174,632, 'Toyota');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1,numerical_col_2, numerical_col_3, categorical_col_2) VALUES (38,403, 'Silver', 118,307, 'Toyota');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (39,481, 'Silver', 42,403, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (40,322, 'Purple', 185,322, 'Toyota');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (41,408, 'Burgundy', 23,376, 'Toyota');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (42,642, 'Brown', 36,642, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (43,700, 'Maroon', 189,700, 'Toyota');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1,numerical_col_2, numerical_col_3, categorical_col_2) VALUES (44,480, 'White',153,529, 'Nissan');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (45,395, 'Gray', 34,548, 'Nissan');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (46,376, 'Maroon', 73,365, 'Nissan');
INSERT INTO RAW_DATA(id, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (47, 'White', 70,632, 'Nissan');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (48,548, 'Black', 100,445, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (49,557, 163,376, 'Toyota');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (50,529, 'Red', 142,665, 'Toyota');

--inserting outlier values
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (51,950, 'Silver', 199,632, 'Nissan');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (52,1000, 'Purple', 0,632, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (53,25, 'Black', 97,632, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, numerical_col_3, categorical_col_2) VALUES (54,40, 'Gray', 200,632, 'Toyota');


SELECT * FROM raw_data WHERE numerical_col_1 IS NULL;  -- PRINT NULL VALUES.

SELECT * FROM raw_data;

/*    SENDING DATA TO CLIENTS     */


DECLARE
	
BEGIN
	
	FOR r IN (SELECT * FROM RAW_DATA) 
		LOOP					
			INSERT INTO fragment_1@site1(id, numerical_col_1, numerical_col_2, numerical_col_3) VALUES (r.id,r.numerical_col_1,r.numerical_col_2,r.numerical_col_3);
			INSERT INTO fragment_2@site2(id, categorical_col_1, categorical_col_2) VALUES (r.id,r.categorical_col_1,r.categorical_col_2);
	END LOOP;
	
END;
/


commit;

SELECT id, numerical_col_1 FROM raw_data;


DECLARE
	mean_val float := 0;
	mean_counter INT := 0;
	
BEGIN

	DBMS_OUTPUT.PUT_LINE('Finding Missing Values for Numerical Feature');
	
	FOR r IN (SELECT numerical_col_1 FROM RAW_DATA) 
		LOOP
		IF  r.numerical_col_1 IS NOT NULL then 
			mean_val := mean_val + r.numerical_col_1;
			mean_counter := mean_counter + 1;
		END IF;
	END LOOP;
	
	mean_val := (mean_val / mean_counter);
	
	DBMS_OUTPUT.PUT_LINE('Mean Value to fill the missing values : ' ||  mean_val);
	
	FOR r IN (SELECT id,numerical_col_1 FROM RAW_DATA) 
		LOOP
		IF  r.numerical_col_1 IS NULL then 
			DBMS_OUTPUT.PUT_LINE('Missing Numerical Value with id : ' ||  r.id);
			UPDATE RAW_DATA SET numerical_col_1 = mean_val WHERE id = r.id;
		END IF;
	END LOOP;

END;
/

commit;

SELECT id, numerical_col_1 FROM raw_data;

SELECT id, categorical_col_1 FROM raw_data;


DECLARE
	
	most_frequent_val varchar2(30);
	num_of_occurences INT;	
	
BEGIN
	
	DBMS_OUTPUT.PUT_LINE('Finding Missing Values For Categorical Features');
	
	select * into most_frequent_val,num_of_occurences from (select categorical_col_1, count(*) from raw_data 
	group by categorical_col_1 order by count(*) desc) where rownum = 1;
	
	DBMS_OUTPUT.PUT_LINE('Most Frequent value: ' || most_frequent_val);
	DBMS_OUTPUT.PUT_LINE(' Number of times appeared: ' || num_of_occurences);
	
	FOR r IN (SELECT id,categorical_col_1 FROM RAW_DATA) 
		LOOP
		IF  r.categorical_col_1 IS NULL then 
			DBMS_OUTPUT.PUT_LINE('Missing Categorical Value with id : ' ||  r.id);
			UPDATE RAW_DATA SET categorical_col_1 = most_frequent_val WHERE id = r.id;
		END IF;
	END LOOP;
	
END;
/

commit;


SELECT id, categorical_col_1 FROM raw_data;



/*    OUTLIER DETECTION     */

drop view Outlier_Detector;

CREATE OR REPLACE VIEW Outlier_Detector(id, numerical_col_1) AS
SELECT R.id, R.numerical_col_1
FROM raw_data R ORDER BY R.numerical_col_1;


SELECT id, numerical_col_1 FROM raw_data;

DECLARE 
	lower_quartile_index INT := 0;
	upper_quartile_index INT := 0;
	lower_quartile_value FLOAT := 0;
	upper_quartile_value FLOAT := 0;
	size_of_data INT := 0;
	quartile_counter INT := 0;
	upper_outlier_boundary FLOAT := 0;
	lower_outlier_boundary FLOAT := 0;
	interquartile_range FLOAT := 0;
BEGIN 

	DBMS_OUTPUT.PUT_LINE('Finding Outliers');
	
	SELECT COUNT(*) INTO size_of_data FROM raw_data;
	
	lower_quartile_index := (size_of_data) * (1/4);
	upper_quartile_index := (size_of_data) * (3/4);
		

	FOR r IN (SELECT id,numerical_col_1 FROM Outlier_Detector) 
		LOOP
		quartile_counter := quartile_counter + 1;
		IF  quartile_counter = lower_quartile_index THEN
			lower_quartile_value := r.numerical_col_1;
		ELSIF quartile_counter = upper_quartile_index THEN
			upper_quartile_value := r.numerical_col_1;
		END IF;		
	END LOOP;
	
	DBMS_OUTPUT.PUT_LINE('Lower Quartile index : ' || lower_quartile_index || '  Upper Quartile Index : ' || upper_quartile_index);	
	DBMS_OUTPUT.PUT_LINE('Lower Quartile Value : ' || lower_quartile_value || '  Upper Quartile Value : ' || upper_quartile_value);
	
	interquartile_range := upper_quartile_value - lower_quartile_value ;
	DBMS_OUTPUT.PUT_LINE('Interquartile Range : ' || interquartile_range);
	
	lower_outlier_boundary := lower_quartile_value - interquartile_range * 1.5;
	DBMS_OUTPUT.PUT_LINE('Lower Outlier Boundary : ' || lower_outlier_boundary);
	
	upper_outlier_boundary := upper_quartile_value + interquartile_range * 1.5;
	DBMS_OUTPUT.PUT_LINE('Upper Outlier Boundary : ' || upper_outlier_boundary);
	
	FOR r IN (SELECT id,numerical_col_1 FROM RAW_DATA) 
	LOOP
		IF r.numerical_col_1 > upper_outlier_boundary or r.numerical_col_1 < lower_outlier_boundary then 
			DBMS_OUTPUT.PUT_LINE('Detected Outlier : ' || r.numerical_col_1);		
		END IF;
	END LOOP;
	
END;
/

/*

-----      REMOVING  OUTLIERS, ADD ABOVE IF REQUIRED

FOR r IN (SELECT id,numerical_col_1 FROM RAW_DATA) 
	LOOP
	IF r.numerical_col_1 > upper_outlier_boundary or r.numerical_col_1 < lower_outlier_boundary then 
		DBMS_OUTPUT.PUT_LINE('Detected Outlier : ' || r.numerical_col_1);
		DELETE FROM raw_data WHERE id = r.id;
	END IF;
END LOOP;
	

*/



commit;





DECLARE
	min_val INT := 0;
	max_val INT := 0;
	val float := 0;
BEGIN

	DBMS_OUTPUT.PUT_LINE('Min Max Scaler / Normalization');
	
	
	select MIN(numerical_col_1) into min_val from raw_data;
	select MAX(numerical_col_1) into max_val from raw_data;
	DBMS_OUTPUT.PUT_LINE( min_val || ' ' || max_val);
	
	
	FOR r IN (SELECT id,numerical_col_1 FROM RAW_DATA) 
		LOOP					
			val := ((r.numerical_col_1 - min_val) / (max_val - min_val));			
			UPDATE raw_data SET numerical_col_1 = ROUND(val,5)  WHERE id = r.id;				
	END LOOP;
	
	
END;
/

commit;

SELECT id, numerical_col_1 FROM raw_data;


SELECT id, numerical_col_2 FROM raw_data;

DECLARE
	min_val INT;
	max_val INT;	
	increment_val int;
	no_of_divisions INT := 8;
	temp int ;
	l_str varchar2(100);
BEGIN

	
	DBMS_OUTPUT.PUT_LINE('Binning');	
	
	SELECT MIN(numerical_col_2) INTO min_val FROM raw_data;
	SELECT MAX(numerical_col_2) INTO max_val FROM raw_data;
	DBMS_OUTPUT.PUT_LINE('Min and Max value for numerical_col_2');
	DBMS_OUTPUT.PUT_LINE(min_val || ' ' || max_val);
	increment_val := (max_val - min_val) / no_of_divisions;
	DBMS_OUTPUT.PUT_LINE('Increment Value : ' || increment_val);
	FOR r IN (SELECT id,numerical_col_2 FROM RAW_DATA) 
		LOOP					
			temp := FLOOR(r.numerical_col_2 / increment_val) + 1;
			IF temp > no_of_divisions THEN
				temp := no_of_divisions;
			END IF;			
			UPDATE raw_data SET numerical_col_2 = temp  WHERE id = r.id;			
	END LOOP;

	
END;
/

commit;

SELECT id, numerical_col_2 FROM raw_data;


SELECT id, categorical_col_2 FROM raw_data;

DECLARE
	create_column_command varchar2(100);
	first_part varchar2(100);
	counter int := 1;
	update_col_command varchar2(200);
BEGIN
	

	DBMS_OUTPUT.PUT_LINE('Discretization of categorical Data');	
	
	FOR r IN (SELECT categorical_col_2 FROM (SELECT DISTINCT categorical_col_2 FROM RAW_DATA)) 
		LOOP										
			create_column_command := 'ALTER TABLE RAW_DATA ADD col_';
			create_column_command := CONCAT(create_column_command, r.categorical_col_2);
			create_column_command := CONCAT(create_column_command, ' number default 0');
			counter := counter + 1;
			--DBMS_OUTPUT.PUT_LINE(create_column_command);
			execute immediate create_column_command;
			
	END LOOP;
	
	
	
	FOR r IN (SELECT categorical_col_2 FROM (SELECT DISTINCT categorical_col_2 FROM RAW_DATA)) 
		LOOP										
			
			FOR x IN (SELECT id,categorical_col_2 FROM RAW_DATA where categorical_col_2 = r.categorical_col_2)
			LOOP					
				update_col_command := 'UPDATE raw_data SET col_';
				update_col_command := CONCAT(update_col_command, r.categorical_col_2);
				update_col_command := CONCAT(update_col_command, ' = 1 WHERE id = ');
				update_col_command := CONCAT(update_col_command, TO_CHAR(x.id));
				--DBMS_OUTPUT.PUT_LINE(update_col_command);
				execute immediate update_col_command;
			END LOOP;
			
	END LOOP;
	
			
	
END;
/

commit;

SELECT * FROM raw_data;



DECLARE
	mean_val float := 0;
	diff float := 0;
	sum_of_square_of_diff float := 0;
	variancee float := 0;
	mean_counter INT := 0;
	standard_deviation_r float := 0;
	standardized_val float := 0;
BEGIN

	DBMS_OUTPUT.PUT_LINE('Standard Scaler / Standardizing Numerical Column 3');
	DBMS_OUTPUT.PUT_LINE((-2)*(-3));
	
	FOR r IN (SELECT numerical_col_3 FROM RAW_DATA)
		LOOP
			mean_val := mean_val + r.numerical_col_3;
			mean_counter := mean_counter + 1;
	END LOOP;
	
	mean_val := (mean_val / mean_counter);			
	
	FOR r IN (SELECT numerical_col_3 FROM RAW_DATA) 
		LOOP					
			diff := (r.numerical_col_3 - mean_val);
			diff := diff * diff;
			sum_of_square_of_diff := sum_of_square_of_diff + diff;
	END LOOP;
	
	variancee := sum_of_square_of_diff / mean_counter;
	standard_deviation_r := SQRT(variancee);
	
	FOR r IN (SELECT id,numerical_col_3 FROM RAW_DATA) 
		LOOP
			standardized_val := (r.numerical_col_3 - mean_val) / standard_deviation_r;
			UPDATE raw_data SET numerical_col_3 = ROUND(standardized_val,5)  WHERE id = r.id;				
	END LOOP;
	
	
END;
/


select id, numerical_col_3 from raw_data;




DECLARE
no_of_unique_val int;
counter int;
BEGIN
	SELECT DISTINCT count(*) into no_of_unique_val FROM RAW_DATA;
	counter := 0;
	
	FOR r IN (SELECT distinct categorical_col_1 FROM RAW_DATA) 
		LOOP								
		
		DBMS_OUTPUT.PUT_LINE(r.categorical_col_1 || ' : ' || counter);		
		FOR x IN (SELECT id,categorical_col_1 FROM RAW_DATA where categorical_col_1 = r.categorical_col_1) 
		LOOP								
			UPDATE raw_data SET categorical_col_1 = TO_CHAR(counter) WHERE id = x.id;				
		END LOOP;
		counter := counter + 1;
		
	END LOOP;
	
END;
/

select id, categorical_col_1 from raw_data;



/*
FOR r IN (SELECT id,numerical_col_1 FROM RAW_DATA) 
		LOOP					
			val := ((r.numerical_col_1 - min_val) / (max_val - min_val));			
			UPDATE raw_data SET numerical_col_1 = ROUND(val,5)  WHERE id = r.id;				
	END LOOP;

*/


-- TODO
-- encoding
-- another binning





/*


INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (1,632);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (2,474);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (3,593);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (4,687);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (5,543);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (6,527);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (7,330);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (8,589);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (9,665);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (10,372);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (11,368);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (12,307);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (13,316);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (14,495);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (15,377);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (16,425);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (17,646);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (18,630);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (19,528);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (20,688);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (21,665);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (22,519);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (23,481);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (24,470);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (25,445);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (26,526);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (27,680);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (28,670);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (29,318);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (30,344);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (31,365);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (32,502);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (33,368);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (34,502);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (35,365);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (36,432);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (37,460);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (38,403);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (39,481);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (40,322);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (41,408);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (42,642);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (43,700);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (44,480);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (45,395);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (46,376);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (47,508);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (48,548);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (49,557);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (50,529);

*/





/*
DROP TABLE STUDENT CASCADE CONSTRAINTS;
DROP TABLE BORROWS CASCADE CONSTRAINTS;
DROP TABLE BOOK CASCADE CONSTRAINTS;
DROP TABLE AUTHOR CASCADE CONSTRAINTS;

CREATE TABLE STUDENT (
	sid INt, 
	sname varchar2(30), 
	phone varchar2(15), 
	age INt,
        PRIMARY KEY(sid)); 

CREATE TABLE AUTHOR (
	aid INt, 
	aname varchar2(30), 
	age INt,
        PRIMARY KEY(aid)); 

CREATE TABLE BOOK (
	bid INt, 
	aid INt, 
	title varchar2(100), 
	genre varchar2(),
        PRIMARY KEY(bid),
	FOREIGN KEY(aid) REFERENCES AUTHOR(aid)); 

CREATE TABLE BORROWS(
	sid INt, 
	bid INt, 
	dateBorrowed date,
	FOREIGN KEY(sid) REFERENCES STUDENT(sid),
	FOREIGN KEY(bid) REFERENCES BOOK(bid));
	
	
INSERT INTO student(sid, sname, phone, age) VALUES (1,'Abid Abdullah','01710123456',);
INSERT INTO student(sid, sname, phone, age) VALUES (2,'Abdullah Karim','01710123457',21);
INSERT INTO student(sid, sname, phone, age) VALUES (3,'Sajid Rahmatullah','01710123156',22);
INSERT INTO student(sid, sname, phone, age) VALUES (4,'Abdullah Hafiz','01710123458',);
INSERT INTO student(sid, sname, phone, age) VALUES (5,'Rahmatullah Hafiz','01710124456',19);
INSERT INTO student(sid, sname, phone, age) VALUES (6,'Abid Barkatullah','01710173456',18);
INSERT INTO student(sid, sname, phone, age) VALUES (7,'Nazmul Hasan','01710113456',23);
INSERT INTO student(sid, sname, phone, age) VALUES (8,'Hasnat Ahmed','01710153456',24);
INSERT INTO student(sid, sname, phone, age) VALUES (9,'Sadman Sakib','01710193456',21);
INSERT INTO student(sid, sname, phone, age) VALUES (10,'Sazid Rahman','01710143456',19);


INSERT INTO author(aid, aname, age) VALUES (1,'William Shakespeare',50);
INSERT INTO author(aid, aname, age) VALUES (2,'Leo Tolstoy',45);
INSERT INTO author(aid, aname, age) VALUES (3,'Arthur Conan Doyle',51);
INSERT INTO author(aid, aname, age) VALUES (4,'Emily DickINson',42);
INSERT INTO author(aid, aname, age) VALUES (5,'Edgar Allan Poe',30);
INSERT INTO author(aid, aname, age) VALUES (6,'RabINdranath Tagore',48);
INSERT INTO author(aid, aname, age) VALUES (7,'Rudyard KiplINg',32);
INSERT INTO author(aid, aname, age) VALUES (8,'Oscar Wilde',55);
INSERT INTO author(aid, aname, age) VALUES (9,'Ernest HemINgway',60);
INSERT INTO author(aid, aname, age) VALUES (10,'John Keats',46);


INSERT INTO book(bid, aid, title, genre) VALUES (1,2, 'War and Peace', 'Novel');
INSERT INTO book(bid, aid, title, genre) VALUES (2,2, 'Anna KarenINa', 'Novel');
INSERT INTO book(bid, aid, title, genre) VALUES (3,10, 'SELECTed Poems', 'Poetry');
INSERT INTO book(bid, aid, title, genre) VALUES (4,9, 'The Old Man and the Sea', 'Literary Fiction');
INSERT INTO book(bid, aid, title, genre) VALUES (5,6, 'Gitanjali', 'Poetry');
INSERT INTO book(bid, aid, title, genre) VALUES (6,6, 'Shesher Kabita', 'Novel');
INSERT INTO book(bid, aid, title, genre) VALUES (7,1, 'Macbeth', 'Novel');
INSERT INTO book(bid, aid, title, genre) VALUES (8,3, 'A Study IN Scarlet', 'Novel');
INSERT INTO book(bid, aid, title, genre) VALUES (9,3, 'The Hound of the Baskervilles', 'Novel');
INSERT INTO book(bid, aid, title, genre) VALUES (10,4, 'Poems', 'Poetry');
INSERT INTO book(bid, aid, title, genre) VALUES (11,6, 'Kabuliwala', 'Short Story');
INSERT INTO book(bid, aid, title, genre) VALUES (12,6, 'Chokher Bali', 'Novel');	
	
	
INSERT INTO borrows(sid, bid, dateBorrowed) VALUES (1,4,'13-feb-19');	
INSERT INTO borrows(sid, bid, dateBorrowed) VALUES (2,4,'14-jan-18');	
INSERT INTO borrows(sid, bid, dateBorrowed) VALUES (2,4,'03-mar-17');	
INSERT INTO borrows(sid, bid, dateBorrowed) VALUES (1,4,'15-apr-19');	
INSERT INTO borrows(sid, bid, dateBorrowed) VALUES (3,2,'16-jul-18');	
INSERT INTO borrows(sid, bid, dateBorrowed) VALUES (3,2,'17-feb-17');	
INSERT INTO borrows(sid, bid, dateBorrowed) VALUES (5,1,'18-aug-19');	
INSERT INTO borrows(sid, bid, dateBorrowed) VALUES (4,1,'19-feb-18');	
INSERT INTO borrows(sid, bid, dateBorrowed) VALUES (5,3,'01-aug-17');	
INSERT INTO borrows(sid, bid, dateBorrowed) VALUES (4,9,'31-jan-18');	
INSERT INTO borrows(sid, bid, dateBorrowed) VALUES (6,8,'13-feb-17');	
INSERT INTO borrows(sid, bid, dateBorrowed) VALUES (7,7,'14-jan-19');	
INSERT INTO borrows(sid, bid, dateBorrowed) VALUES (7,5,'15-mar-19');	
INSERT INTO borrows(sid, bid, dateBorrowed) VALUES (8,5,'16-feb-18');	
INSERT INTO borrows(sid, bid, dateBorrowed) VALUES (6,5,'17-aug-17');	
INSERT INTO borrows(sid, bid, dateBorrowed) VALUES (9,5,'19-jul-19');	
INSERT INTO borrows(sid, bid, dateBorrowed) VALUES (7,6,'01-feb-18');	
INSERT INTO borrows(sid, bid, dateBorrowed) VALUES (8,6,'03-mar-18');	
INSERT INTO borrows(sid, bid, dateBorrowed) VALUES (8,4,'30-jul-19');	
INSERT INTO borrows(sid, bid, dateBorrowed) VALUES (8,4,'06-jan-18');	


*/