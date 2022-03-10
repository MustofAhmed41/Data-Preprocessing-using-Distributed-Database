set lines 300
set trimout on
set tab off

SET SERVEROUTPUT ON;
SET VERIFY OFF;

drop table Fragment_1;

CREATE TABLE Fragment_1(
	id INt NOT NULL, 
	numerical_col_1 FLOAT NULL, 
	numerical_col_2 int NULL, 
	numerical_col_3 float NULL,
	PRIMARY KEY(id)
);


--INSERT INTO Fragment_1(id, numerical_col_1) VALUES (45,395);

commit;

select * from Fragment_1;

drop table Fragment_2;

CREATE TABLE Fragment_2 (
	id int NOT NULL, 	
	categorical_col_1 varchar2(30) NULL,
	categorical_col_2 varchar2(30) NULL,
	PRIMARY KEY(id)
);

--INSERT INTO Fragment_2(id, categorical_col_1, categorical_col_2) VALUES (45,'Gray', 'TOyota');

select * from Fragment_2;

commit;


