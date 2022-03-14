set lines 1024
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
	categorical_col_1 varchar2(30) NULL,
	categorical_col_2 varchar2(30) NULL,
	PRIMARY KEY(id)
);



INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (1,632, 'Gray', 43, 'Toyota');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (2,474, 'White', 115, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (3,593, 'Black', 3, 'Nissan');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (4,687, 'Brown', 57, 'Lexus');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (5,543, 'Brown', 0, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (6,527, 'Red', 114, 'Toyota');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (7,330, 'Blue', 14, 'Lexus');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (8,589, 'Purple', 169, 'Lexus');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (9,665, 'Burgundy', 42, 'Toyota');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (10,372, 'Burgundy', 64, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (11,368, 'Purple', 92, 'Lexus');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (12,307, 'Red', 49, 'Lexus');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (13,316, 'Brown', 156, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (14,495, 'Gray', 54, 'Nissan');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (15,377, 'White', 48, 'Lexus');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (16,425, 'Brown', 145, 'Toyota');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (17,646, 'Black', 185, 'Nissan');
INSERT INTO RAW_DATA(id, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (18, 'Gray', 90, 'Lexus');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (19,528, 'Black', 124,  'Lexus');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (20,688, 'Gray', 9, 'Lexus');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (21,665, 'Brown', 165, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (22,519, 'Red', 149, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (23,481, 'Silver', 139, 'Toyota');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (24,470, 'Maroon', 21, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (25,445, 'Blue', 100, 'Nissan');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (26,526, 'Black', 153, 'Nissan');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (27,680, 'Purple', 106, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (28,670, 'Gray', 134, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (29,318, 'Brown', 22, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (30,344, 'White', 1, 'Toyota');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (31,365, 'Burgundy', 79, 'Lexus');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (32,502, 'Blue', 190, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (33,368, 'Burgundy', 149, 'Nissan');
INSERT INTO RAW_DATA(id, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (34, 'Silver', 33, 'Toyota');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (35,365, 'Gray', 197, 'Lexus');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (36,432, 'Red', 172, 'Lexus');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (37,460, 'White', 174);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1,numerical_col_2, categorical_col_2) VALUES (38,403, 'Silver', 118, 'Toyota');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (39,481, 'Silver', 42, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (40,322, 'Purple', 185, 'Toyota');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (41,408, 'Burgundy', 23, 'Toyota');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (42,642, 'Brown', 36, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (43,700, 'Maroon', 189, 'Toyota');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1,numerical_col_2, categorical_col_2) VALUES (44,480, 'White',153, 'Nissan');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (45,395, 'Gray', 34, 'Nissan');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (46,376, 'Maroon', 73, 'Nissan');
INSERT INTO RAW_DATA(id, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (47, 'White', 70, 'Nissan');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (48,548, 'Black', 100, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (49,557, 'Blue', 163, 'Toyota');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (50,529, 'Red', 142, 'Toyota');

--inserting outlier values
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (51,950, 'Silver', 199, 'Nissan');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (52,1000, 'Purple', 0, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (53,25, 'Black', 97, 'Honda');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2, categorical_col_2) VALUES (54,40, 'Gray', 200, 'Toyota');


SELECT * FROM raw_data WHERE numerical_col_1 IS NULL;  -- PRINT NULL VALUES.

SELECT * FROM raw_data;


/*
	l_str := 'ALTER TABLE RAW_DATA ADD new_col number default 0'; 
	execute immediate l_str;
	
	DBMS_OUTPUT.PUT_LINE(CONCAT('Tech on', TO_CHAR(123)));
*/

DECLARE
	create_column_command varchar2(100);
	first_part varchar2(100);
	counter int := 1;
	update_col_command varchar2(200);
BEGIN

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

select * from raw_data;

--UPDATE RAW_DATA SET CONCAT('col_', 'White')  = 1 WHERE id = 0;
--				execute immediate update_col_command;


/*
	FOR r IN (SELECT categorical_col_1 FROM (SELECT DISTINCT categorical_col_1 FROM RAW_DATA)) 
		LOOP										
			FOR x IN (SELECT * from raw_data where categorical_col_1 = r.categorical_col_1) 
			LOOP										
				update_col_command := 'UPDATE raw_data SET col_';
				update_col_command := CONCAT(update_col_command, r.categorical_col_1);
				update_col_command := CONCAT(update_col_command, ' = 1 WHERE id = ');
				update_col_command := CONCAT(update_col_command, TO_CHAR(x.id));
				DBMS_OUTPUT.PUT_LINE(update_col_command);
			END LOOP;			
	END LOOP;
	

*/







