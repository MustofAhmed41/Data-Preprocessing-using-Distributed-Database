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
INSERT INTO RAW_DATA(id, numerical_col_1, numerical_col_2) VALUES (5,543, 37);
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
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (39,481, 'Silver', 200);
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
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (51,950, 'Silver', 165);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (52,1000, 'Purple', 139);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (53,25, 'Black', 97);
INSERT INTO RAW_DATA(id, numerical_col_1, categorical_col_1, numerical_col_2) VALUES (54,40, 'Gray', 42);



SELECT * FROM raw_data WHERE numerical_col_1 IS NULL;  -- PRINT NULL VALUES.

SELECT * FROM raw_data;

/*    SENDING DATA TO CLIENTS     */

/*
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
*/


DECLARE
	mean_val float := 0;
	mean_counter INT := 0;
	
BEGIN
	
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

select * from raw_data;


DECLARE
	
	most_frequent_val varchar2(30);
	num_of_occurences INT;	
	
BEGIN

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


select * from raw_data;



/*    OUTLIER DETECTION     */

drop view Outlier_Detector;

CREATE OR REPLACE VIEW Outlier_Detector(id, numerical_col_1) AS
SELECT R.id, R.numerical_col_1
FROM raw_data R ORDER BY R.numerical_col_1;



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
			DELETE FROM raw_data WHERE id = r.id;
		END IF;
	END LOOP;
	
END;
/

commit;



/*    STANDARDIZING VALUES     */



DECLARE
	min_val INT := 0;
	max_val INT := 0;
	val float := 0;
BEGIN
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
select * from raw_data;



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

	
END;
/

commit;
select * from raw_data;











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