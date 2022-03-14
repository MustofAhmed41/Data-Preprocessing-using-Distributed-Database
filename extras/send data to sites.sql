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
	
	DBMS_OUTPUT.PUT_LINE('Data sent to sites successfully');
	
END;
/


commit;
