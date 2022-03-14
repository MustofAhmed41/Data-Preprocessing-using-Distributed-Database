set serverOUTPUT ON;

create or replace function check_validity(A IN raw_data.categorical_col_1%type)
return number
is
x number;
begin

	for i in 1..LENGTH(A) LOOP
		DBMS_OUTPUT.PUT_LINE('Character at index ' || i || ' is ' || substr(A,i,1));
		if SUBSTR(A, i , 1) >= '1' and SUBSTR(A, i ,1) <= '9' then
			x := 1;
		else			
			return 0;
		END IF;
		
	END LOOP;
	return 1;
	
END check_validity;
/


declare 
	A varchar(30) := '918961aa';
	b number;
	number_exception EXCEPTION;
begin

	b := check_validity(A);
	
	IF B = 0 THEN
		RAISE number_exception;
	END IF;
	
	IF B = 1 THEN
		DBMS_OUTPUT.PUT_LINE('Valid Data');	
	END IF;

	
	
	
EXCEPTION
	WHEN number_exception THEN
		DBMS_OUTPUT.PUT_LINE('Numerical Input detected');		
END;
/















	
	
	
	
	
	
	