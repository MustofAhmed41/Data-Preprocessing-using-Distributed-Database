SET SERVEROUTPUT ON;
SET VERIFY OFF;



-- FILLING NULL VALUES WITH MEAN

CREATE OR REPLACE FUNCTION get_size_of_data
RETURN NUMBER
IS
C number;
BEGIN
	SELECT COUNT(*) INTO c FROM fragment_1;
	return C; 
END get_size_of_data;
/

CREATE OR REPLACE FUNCTION get_min_val
RETURN NUMBER
IS
C number;
BEGIN
	select MIN(numerical_col_1) into c from fragment_1;
	return C; 
END get_min_val;
/


CREATE OR REPLACE FUNCTION get_max_val
RETURN NUMBER
IS
C number;
BEGIN
	select MAX(numerical_col_1) into c from fragment_1;
	return C; 
END get_max_val;
/


CREATE OR REPLACE FUNCTION get_min_val2
RETURN NUMBER
IS
C number;
BEGIN
	SELECT MIN(numerical_col_2) INTO c FROM fragment_1;
	return C; 
END get_min_val2;
/


CREATE OR REPLACE FUNCTION get_max_val2
RETURN NUMBER
IS
C number;
BEGIN
	SELECT MAX(numerical_col_2) INTO c FROM fragment_1;
	return C; 
END get_max_val2;
/


CREATE OR REPLACE PROCEDURE mean_calculate(A in OUT float, B in out float)
IS
BEGIN	
	A := A/B; 
END mean_calculate;
/





select * from fragment_1;

DECLARE
	mean_val float := 0;
	mean_counter INT := 0;
BEGIN

	DBMS_OUTPUT.PUT_LINE('Finding Missing Values for Numerical Feature');
	
	FOR r IN (SELECT numerical_col_1 FROM fragment_1) 
		LOOP
		IF  r.numerical_col_1 IS NOT NULL then 
			mean_val := mean_val + r.numerical_col_1;
			mean_counter := mean_counter + 1;
		END IF;
	END LOOP;
	
		
	mean_calculate(mean_val,mean_counter);
	
	DBMS_OUTPUT.PUT_LINE('Mean Value to fill the missing values : ' ||  mean_val);
	
	FOR r IN (SELECT id,numerical_col_1 FROM fragment_1) 
		LOOP
		IF  r.numerical_col_1 IS NULL then 
			DBMS_OUTPUT.PUT_LINE('Missing Numerical Value with id : ' ||  r.id);
			UPDATE fragment_1 SET numerical_col_1 = mean_val WHERE id = r.id;
		END IF;
	END LOOP;

END;
/

commit;

SELECT id, numerical_col_1 FROM fragment_1;


/*    OUTLIER DETECTION     */


SELECT id, numerical_col_1 FROM fragment_1;

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
		
	size_of_data := get_size_of_data;
	
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
	
	FOR r IN (SELECT id,numerical_col_1 FROM fragment_1) 
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
	
	
	min_val := get_min_val;
	max_val := get_max_val;
	
	DBMS_OUTPUT.PUT_LINE( min_val || ' ' || max_val);
	
	
	FOR r IN (SELECT id,numerical_col_1 FROM fragment_1) 
		LOOP					
			val := ((r.numerical_col_1 - min_val) / (max_val - min_val));			
			UPDATE fragment_1 SET numerical_col_1 = ROUND(val,5)  WHERE id = r.id;				
	END LOOP;
	
	
END;
/

commit;

SELECT id, numerical_col_1 FROM fragment_1;


SELECT id, numerical_col_2 FROM fragment_1;

DECLARE
	min_val INT;
	max_val INT;	
	increment_val int;
	no_of_divisions INT := 8;
	temp int ;
	l_str varchar2(100);
BEGIN

	
	DBMS_OUTPUT.PUT_LINE('Binning');	
	
	min_val := get_min_val2;
	max_val := get_max_val2;
	
	DBMS_OUTPUT.PUT_LINE('Min and Max value for numerical_col_2');
	DBMS_OUTPUT.PUT_LINE(min_val || ' ' || max_val);
	increment_val := (max_val - min_val) / no_of_divisions;
	DBMS_OUTPUT.PUT_LINE('Increment Value : ' || increment_val);
	FOR r IN (SELECT id,numerical_col_2 FROM fragment_1) 
		LOOP					
			temp := FLOOR(r.numerical_col_2 / increment_val) + 1;
			IF temp > no_of_divisions THEN
				temp := no_of_divisions;
			END IF;			
			UPDATE fragment_1 SET numerical_col_2 = temp  WHERE id = r.id;			
	END LOOP;

	
END;
/

commit;

SELECT id, numerical_col_2 FROM fragment_1;


SELECT * FROM fragment_1;



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
	
	FOR r IN (SELECT numerical_col_3 FROM fragment_1)
		LOOP
			mean_val := mean_val + r.numerical_col_3;
			mean_counter := mean_counter + 1;
	END LOOP;
	
	mean_calculate(mean_val,mean_counter);			
	
	FOR r IN (SELECT numerical_col_3 FROM fragment_1) 
		LOOP					
			diff := (r.numerical_col_3 - mean_val);
			diff := diff * diff;
			sum_of_square_of_diff := sum_of_square_of_diff + diff;
	END LOOP;
	
	variancee := sum_of_square_of_diff / mean_counter;
	standard_deviation_r := SQRT(variancee);
	
	FOR r IN (SELECT id,numerical_col_3 FROM fragment_1) 
		LOOP
			standardized_val := (r.numerical_col_3 - mean_val) / standard_deviation_r;
			UPDATE fragment_1 SET numerical_col_3 = ROUND(standardized_val,5)  WHERE id = r.id;				
	END LOOP;
	
	
END;
/

select id, numerical_col_3 from fragment_1;


commit;
