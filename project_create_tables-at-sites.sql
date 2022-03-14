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


create or replace view fragment_1_view(id, numeric_1, numeric_2, numeric_3) AS
select F.id, f.numerical_col_1, f.numerical_col_2, f.numerical_col_3
from Fragment_1 F;

create or replace view fragment_2_view(id, category_1, category_2) AS
select F.id, f.categorical_col_1, f.categorical_col_2
from Fragment_2 F;


CREATE OR REPLACE TRIGGER UpdatedData1
BEFORE UPDATE
OF numerical_col_1
ON Fragment_1
FOR EACH ROW
DECLARE
BEGIN
	if :OLD.numerical_col_1 is null then
		DBMS_OUTPUT.PUT_LINE('Filled missing Data in Fragment 1, notified using trigger');
	end if;
END;
/


CREATE OR REPLACE TRIGGER UpdatedData2
BEFORE UPDATE
OF categorical_col_1
ON Fragment_2   
FOR EACH ROW
DECLARE
BEGIN
	if :OLD.categorical_col_1 is null then
		DBMS_OUTPUT.PUT_LINE('Filled missing Data in Fragment 2, notified using trigger');
	end if;
END;
/


create or replace package fill_missing_values AS 
	
	PROCEDURE fill_col;
	
END fill_missing_values;
/







