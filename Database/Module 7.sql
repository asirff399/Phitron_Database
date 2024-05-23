													-- 2. Joining Tables without using JOIN Query

SELECT FIRST_NAME , DEPARTMENT_NAME ,E.DEPARTMENT_ID
FROM EMPLOYEES AS E,DEPARTMENTS AS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID ;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
													-- 3. Joining Tables with JOIN Query

SELECT  FIRST_NAME , DEPARTMENT_NAME
FROM EMPLOYEES AS E JOIN DEPARTMENTS AS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

SELECT  FIRST_NAME , DEPARTMENT_NAME
FROM EMPLOYEES AS E JOIN DEPARTMENTS AS D USING( DEPARTMENT_ID );

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
												-- 4. INNER, LEFT, RIGHT, CROSS Join
                                                
SELECT  FIRST_NAME , DEPARTMENT_NAME
FROM EMPLOYEES AS E INNER JOIN DEPARTMENTS AS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

SELECT  FIRST_NAME , DEPARTMENT_NAME
FROM EMPLOYEES AS E LEFT JOIN DEPARTMENTS AS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

SELECT  FIRST_NAME , DEPARTMENT_NAME
FROM EMPLOYEES AS E RIGHT JOIN DEPARTMENTS AS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

SELECT  FIRST_NAME , DEPARTMENT_NAME
FROM EMPLOYEES AS E CROSS JOIN DEPARTMENTS AS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
											-- 6. Examples of JOIN Query
                                            
SELECT  M.FIRST_NAME AS EMPLOYEE , E.FIRST_NAME AS MANAGER
FROM EMPLOYEES AS E
JOIN EMPLOYEES AS M ON E.EMPLOYEE_ID = M.MANAGER_ID ;

SELECT D.DEPARTMENT_NAME
FROM DEPARTMENTS AS D
LEFT JOIN EMPLOYEES AS E ON D.DEPARTMENT_ID = E.DEPARTMENT_ID
WHERE E.DEPARTMENT_ID IS NULL;

SELECT EMPLOYEES.FIRST_NAME , EMPLOYEES.SALARY , (SELECT AVG(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID) - EMPLOYEES.SALARY
FROM EMPLOYEES JOIN DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID;

SELECT DEPARTMENT_NAME , MIN(SALARY) ,AVG(SALARY)
FROM EMPLOYEES  JOIN DEPARTMENTS ON EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
GROUP BY DEPARTMENT_NAME
HAVING MIN(SALARY) > 500;