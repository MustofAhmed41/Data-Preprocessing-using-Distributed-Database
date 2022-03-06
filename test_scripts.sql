set lines 256
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
	PRIMARY KEY(id)
);



INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (1,632, 'Gray', 43);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (2,474, 'White', 115);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (3,593, 'Black', 3);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (4,687, 'Brown', 57);
INSERT INTO RAW_DATA(id, numerical_col_1, numerical_col_2) VALUES (5,543, 0);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (6,527, 'Red', 114);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (7,330, 'Blue', 14);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (8,589, 'Purple', 169);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (9,665, 'Burgundy', 42);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (10,372, 'Burgundy', 64);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (11,368, 'Purple', 92);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (12,307, 'Red', 49);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (13,316, 'Brown', 156);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (14,495, 'Gray', 54);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (15,377, 'White', 48);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (16,425, 'Brown', 145);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (17,646, 'Black', 185);
INSERT INTO RAW_DATA(id, categorical_col_1, numerical_col_2) VALUES (18, 'Gray', 90);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (19,528, 'Black', 124);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (20,688, 'Gray', 9);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (21,665, 'Brown', 165);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (22,519, 'Red', 149);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (23,481, 'Silver', 139);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (24,470, 'Maroon', 21);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (25,445, 'Blue', 100);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (26,526, 'Black', 153);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (27,680, 'Purple', 106);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (28,670, 'Gray', 134);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (29,318, 'Brown', 22);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (30,344, 'White', 1);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (31,365, 'Burgundy', 79);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (32,502, 'Blue', 190);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (33,368, 'Burgundy', 149);
INSERT INTO RAW_DATA(id, categorical_col_1, numerical_col_2) VALUES (34, 'Silver', 33);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (35,365, 'Gray', 197);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (36,432, 'Red', 172);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (37,460, 'White', 174);
INSERT INTO RAW_DATA(id, numerical_col_1, numerical_col_2) VALUES (38,403, 118);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (39,481, 'Silver', 42);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (40,322, 'Purple', 185);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (41,408, 'Burgundy', 23);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (42,642, 'Brown', 36);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (43,700, 'Maroon', 189);
INSERT INTO RAW_DATA(id, numerical_col_1, numerical_col_2) VALUES (44,480, 153);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (45,395, 'Gray', 34);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (46,376, 'Maroon', 73);
INSERT INTO RAW_DATA(id, categorical_col_1, numerical_col_2) VALUES (47, 'White', 70);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (48,548, 'Black', 100);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (49,557, 'Blue', 163);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (50,529, 'Red', 142);

--inserting outlier values
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (51,950, 'Silver', 199);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (52,1000, 'Purple', 0);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (53,25, 'Black', 97);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (54,40, 'Gray', 200);


SELECT * FROM raw_data WHERE numerical_col_1 IS NULL;  -- PRINT NULL VALUES.

SELECT * FROM raw_data;


DECLARE
	min_val INT;
	max_val INT;	
	increment_val int;
	no_of_divisions INT := 8;
	temp int ;
	l_str varchar2(100);
BEGIN
	SELECT MIN(numerical_col_2) INTO min_val FROM raw_data;
	SELECT MAX(numerical_col_2) INTO max_val FROM raw_data;
	DBMS_OUTPUT.PUT_LINE('Min and Max value for numerical_col_2');
	DBMS_OUTPUT.PUT_LINE(min_val || ' ' || max_val);
	increment_val := (max_val - min_val) / 8;
	DBMS_OUTPUT.PUT_LINE('Increment Value : ' || increment_val);
	FOR r IN (SELECT id,numerical_col_2 FROM RAW_DATA)
		LOOP					
			temp := FLOOR(r.numerical_col_2 / increment_val) + 1;
			IF temp > no_of_divisions THEN
				temp := no_of_divisions;
			END IF;			
			UPDATE raw_data SET numerical_col_2 = temp  WHERE id = r.id;			
	END LOOP;
	
	l_str := 'ALTER TABLE RAW_DATA ADD new_col number default 0'; 
	execute immediate l_str;
	
	DBMS_OUTPUT.PUT_LINE(CONCAT('Tech on', TO_CHAR(123)));
	
END;
/

commit;







