SET SERVEROUTPUT ON;
SET VERIFY OFF;



-- FILLING NULL VALUES WITH MEAN

select * from fragment_1;

DECLARE
	mean_val float := 0;
	mean_counter INT := 0;
	
BEGIN
	
	FOR r IN (SELECT numerical_col_1 FROM fragment_1) 
		LOOP
		IF  r.numerical_col_1 IS NOT NULL then 
			mean_val := mean_val + r.numerical_col_1;
			mean_counter := mean_counter + 1;
		END IF;
	END LOOP;
	
	mean_val := (mean_val / mean_counter);
	
	DBMS_OUTPUT.PUT_LINE('Mean Value to fill the missing values : ' ||  mean_val);
	
	FOR r IN (SELECT id,numerical_col_1 FROM fragment_1) 
		LOOP
		IF  r.numerical_col_1 IS NULL then 
			UPDATE fragment_1 SET numerical_col_1 = mean_val WHERE id = r.id;
		END IF;
	END LOOP;

	
	FOR r IN (SELECT id,numerical_col_1 FROM fragment_1) 
		LOOP
		IF  r.numerical_col_1 IS NULL then 
			UPDATE fragment_1 SET numerical_col_1 = mean_val WHERE id = r.id;
		END IF;
	END LOOP;
	
END;
/

commit;

select * from fragment_1;


drop view Outlier_Detector;

CREATE OR REPLACE VIEW Outlier_Detector(id, numerical_col_1) AS
SELECT R.id, R.numerical_col_1
FROM fragment_1 R ORDER BY R.numerical_col_1;


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
	SELECT COUNT(*) INTO size_of_data FROM fragment_1;
	
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
			DELETE FROM fragment_1 WHERE id = r.id;
		END IF;
	END LOOP;
	
	
	
END;
/

select * From fragment_1;


---STANDARDIZING VALUES


DECLARE
	min_val INT := 0;
	max_val INT := 0;
	val float := 0;
BEGIN
	select MIN(numerical_col_1) into min_val from fragment_1;
	select MAX(numerical_col_1) into max_val from fragment_1;
	DBMS_OUTPUT.PUT_LINE( min_val || ' ' || max_val);
	
	
	FOR r IN (SELECT id,numerical_col_1 FROM fragment_1) 
		LOOP					
			val := ((r.numerical_col_1 - min_val) / (max_val - min_val));			
			UPDATE fragment_1 SET numerical_col_1 = val WHERE id = r.id;				
	END LOOP;
	
END;
/


select * From fragment_1;





