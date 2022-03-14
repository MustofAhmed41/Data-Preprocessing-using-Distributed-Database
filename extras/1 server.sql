SET SERVEROUTPUT ON;
SET VERIFY OFF;

--first run client create tables file
--then run this server file
--then run process_fragments file in client.


drop table RAW_DATA;

CREATE TABLE RAW_DATA (
	id INt NOT NULL , 
	numerical_col_1 INT NULL, 	
	categorical_col_1 varchar2(30) NULL,
	PRIMARY KEY(id)
);




INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (1,632, 'Gray');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (2,474, 'White');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (3,593, 'Black');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (4,687, 'Brown');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (5,543, 'Silver');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (6,527, 'Red');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (7,330, 'Blue');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (8,589, 'Purple');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (9,665, 'Burgundy');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (10,372, 'Burgundy');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (11,368, 'Purple');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (12,307, 'Red');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (13,316, 'Brown');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (14,495, 'Gray');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (15,377, 'White');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (16,425, 'Brown');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (17,646, 'Black');
INSERT INTO RAW_DATA(id, categorical_col_1) VALUES (18, 'Gray');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (19,528, 'Black');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (20,688, 'Gray');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (21,665, 'Brown');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (22,519, 'Red');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (23,481, 'Silver');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (24,470, 'Maroon');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (25,445, 'Blue');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (26,526, 'Black');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (27,680, 'Purple');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (28,670, 'Gray');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (29,318, 'Brown');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (30,344, 'White');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (31,365, 'Burgundy');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (32,502, 'Blue');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (33,368, 'Burgundy');
INSERT INTO RAW_DATA(id, categorical_col_1) VALUES (34, 'Silver');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (35,365, 'Gray');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (36,432, 'Red');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (37,460, 'White');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (38,403, 'Blue');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (39,481, 'Silver');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (40,322, 'Purple');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (41,408, 'Burgundy');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (42,642, 'Brown');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (43,700, 'Maroon');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (44,480, 'White');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (45,395, 'Gray');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (46,376, 'Maroon');
INSERT INTO RAW_DATA(id, categorical_col_1) VALUES (47, 'White');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (48,548, 'Black');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (49,557, 'Blue');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (50,529, 'Red');

--inserting outlier values
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (51,950, 'Silver');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (52,1000, 'Purple');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (53,25, 'Black');
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1) VALUES (54,40, 'Gray');


SELECT * FROM raw_data WHERE numerical_col_1 IS NULL;  -- PRINT NULL VALUES.

SELECT * FROM raw_data;


DECLARE
	
BEGIN
	
	FOR r IN (SELECT id,numerical_col_1, categorical_col_1 FROM RAW_DATA) 
		LOOP					
			INSERT INTO fragment_1@site1(id, numerical_col_1) VALUES (r.id,r.numerical_col_1);			
			INSERT INTO fragment_2@site1(id, categorical_col_1) VALUES (r.id,r.categorical_col_1);			
	END LOOP;
	
END;
/

commit;
