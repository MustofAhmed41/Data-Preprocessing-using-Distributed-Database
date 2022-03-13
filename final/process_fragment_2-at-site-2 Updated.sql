set lines 300
set trimout on
set tab off

SET SERVEROUTPUT ON;
SET VERIFY OFF;


SELECT * FROM fragment_2;


create or replace function check_validity(A IN fragment_2.categorical_col_1%type)
return number
is
x number;
begin
	for i in 1..LENGTH(A) LOOP		
		if SUBSTR(A, i , 1) >= '1' and SUBSTR(A, i ,1) <= '9' then
			x := 1;
		else			
			return 0;
		END IF;		
	END LOOP;
	return 1;	
END check_validity;
/


DECLARE
	
	most_frequent_val varchar2(30);
	num_of_occurences INT;	
	
BEGIN
	
	DBMS_OUTPUT.PUT_LINE('Finding Missing Values For Categorical Features');
	
	select * into most_frequent_val,num_of_occurences from (select categorical_col_1, count(*) from fragment_2 
	group by categorical_col_1 order by count(*) desc) where rownum = 1;
	
	DBMS_OUTPUT.PUT_LINE('Most Frequent value: ' || most_frequent_val);
	DBMS_OUTPUT.PUT_LINE(' Number of times appeared: ' || num_of_occurences);
	
	FOR r IN (SELECT id,categorical_col_1 FROM fragment_2) 
		LOOP
		IF  r.categorical_col_1 IS NULL then 
			DBMS_OUTPUT.PUT_LINE('Missing Categorical Value with id : ' ||  r.id);
			UPDATE fragment_2 SET categorical_col_1 = most_frequent_val WHERE id = r.id;
		END IF;
	END LOOP;
	
END;
/

commit;


SELECT id, categorical_col_1 FROM fragment_2;


DECLARE
	valid_flag number;
	number_exception EXCEPTION;
BEGIN
	valid_flag := 0;
	FOR r IN (SELECT categorical_col_1 FROM fragment_2)  LOOP
		valid_flag := check_validity(r.categorical_col_1);		
		if valid_flag = 1 then
			exit;
		end if;
	END LOOP;
	
	if valid_flag = 1 then
		RAISE number_exception;
	else
		DBMS_OUTPUT.PUT_LINE('Data is valid');
	end if;
	
EXCEPTION
	WHEN number_exception THEN
		DBMS_OUTPUT.PUT_LINE('Data is INVALID');
	
END;
/



SELECT id, categorical_col_2 FROM fragment_2;

DECLARE
	create_column_command varchar2(100);
	first_part varchar2(100);
	counter int := 1;
	update_col_command varchar2(200);
BEGIN
	

	DBMS_OUTPUT.PUT_LINE('Discretization of categorical Data');	
	
	FOR r IN (SELECT categorical_col_2 FROM (SELECT DISTINCT categorical_col_2 FROM fragment_2)) 
		LOOP										
			create_column_command := 'ALTER TABLE fragment_2 ADD col_';
			create_column_command := CONCAT(create_column_command, r.categorical_col_2);
			create_column_command := CONCAT(create_column_command, ' number default 0');
			counter := counter + 1;
			--DBMS_OUTPUT.PUT_LINE(create_column_command);
			execute immediate create_column_command;
			
	END LOOP;
	
	
	
	FOR r IN (SELECT categorical_col_2 FROM (SELECT DISTINCT categorical_col_2 FROM fragment_2)) 
		LOOP										
			
			FOR x IN (SELECT id,categorical_col_2 FROM fragment_2 where categorical_col_2 = r.categorical_col_2)
			LOOP					
				update_col_command := 'UPDATE fragment_2 SET col_';
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

SELECT * FROM fragment_2;

DECLARE
no_of_unique_val int;
counter int;
BEGIN
	SELECT DISTINCT count(*) into no_of_unique_val FROM fragment_2;
	counter := 0;
	
	FOR r IN (SELECT distinct categorical_col_1 FROM fragment_2) 
		LOOP								
		
		DBMS_OUTPUT.PUT_LINE(r.categorical_col_1 || ' : ' || counter);		
		FOR x IN (SELECT id,categorical_col_1 FROM fragment_2 where categorical_col_1 = r.categorical_col_1) 
		LOOP								
			UPDATE fragment_2 SET categorical_col_1 = TO_CHAR(counter) WHERE id = x.id;				
		END LOOP;
		counter := counter + 1;
		
	END LOOP;
	
END;
/

select id, categorical_col_1 from fragment_2;



commit;
