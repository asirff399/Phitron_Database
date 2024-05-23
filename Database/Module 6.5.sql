														-- QUSTION NO 1
                                                        
-- Determine the third highest salary and which employee receives it?

-- 1st WAY
SELECT SALARY
FROM EMPLOYEES
WHERE SALARY = (SELECT DISTINCT SALARY
				FROM EMPLOYEES
				ORDER BY SALARY DESC
				LIMIT 1
				OFFSET 2
				);
        
-- 2nd WAY (VALID)

SELECT SALARY
FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY) 
				FROM EMPLOYEES
				WHERE SALARY < (SELECT MAX(SALARY) 
								FROM EMPLOYEES 
                                WHERE SALARY < (SELECT MAX(SALARY) 
												FROM EMPLOYEES ) ) );


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
														-- QUSTION NO 2
                                                        
-- Determine the third lowest salary and which employee receives it?													
       
SELECT FIRST_NAME,LAST_NAME,SALARY
FROM EMPLOYEES
WHERE SALARY = (SELECT MIN(SALARY) 
				FROM EMPLOYEES
				WHERE SALARY > (SELECT MIN(SALARY) 
								FROM EMPLOYEES 
                                WHERE SALARY > (SELECT MIN(SALARY) 
												FROM EMPLOYEES ) ) 
								);
  

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
														-- QUSTION NO 3

-- Which employee has been hired after Steven?

SELECT FIRST_NAME,LAST_NAME
FROM EMPLOYEES
WHERE HIRE_DATE > ( 
	SELECT HIRE_DATE
	FROM EMPLOYEES 
	WHERE FIRST_NAME = 'STEVEN'
)  
LIMIT 1;

SELECT FIRST_NAME, LAST_NAME,HIRE_DATE
FROM EMPLOYEES
WHERE HIRE_DATE >(SELECT HIRE_DATE
		FROM EMPLOYEES
		WHERE HIRE_DATE = (
			SELECT HIRE_DATE
			FROM EMPLOYEES
			WHERE FIRST_NAME = 'STEVEN'
));


SELECT *
FROM EMPLOYEES
ORDER BY HIRE_DATE DESC;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
                                                        -- QUSTION NO 4
                                                        
-- With common table expression solve the question 1 and 2													