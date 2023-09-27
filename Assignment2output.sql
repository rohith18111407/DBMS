SQL> @"Z:\Rohith_085\Assignment-2\Assignment-2.sql"
SQL> REM Dropping table Sailor
SQL> 
SQL> DROP TABLE Sailor CASCADE CONSTRAINTS;

Table dropped.

SQL> 
SQL> 
SQL> CREATE TABLE Sailor(
    sailor_id VARCHAR(10) CONSTRAINT sailor_id_pk PRIMARY KEY,
    name VARCHAR(20),
    rating VARCHAR(1),
    dob DATE,
    salary NUMBER
    );

Table created.

SQL> 
SQL> REM Description of table
SQL> 
SQL> DESCRIBE Sailor;
 Name                                                                    Null?    Type
 ----------------------------------------------------------------------- -------- ------------------------------------------------
 SAILOR_ID                                                               NOT NULL VARCHAR2(10)
 NAME                                                                             VARCHAR2(20)
 RATING                                                                           VARCHAR2(1)
 DOB                                                                              DATE
 SALARY                                                                           NUMBER

SQL> 
SQL> 
SQL> REM Insertion of valid data
SQL> 
SQL> INSERT INTO Sailor VALUES('S100','Raman','A',TO_DATE('01-OCT-1980','DD-MON-YYYY'),27000);

1 row created.

SQL> INSERT INTO Sailor VALUES('S200','Krishna','B',TO_DATE('04-JUL-1978','DD-MON-YYYY'),21000);

1 row created.

SQL> INSERT INTO Sailor VALUES('S300','Gokul','C',TO_DATE('05-FEB-1975','DD-MON-YYYY'),16000);

1 row created.

SQL> INSERT INTO Sailor VALUES('S400','Ravi','D',TO_DATE('06-APR-1984','DD-MON-YYYY'),10000);

1 row created.

SQL> INSERT INTO Sailor VALUES('S500','James','A',TO_DATE('07-MAR-1983','DD-MON-YYYY'),25000);

1 row created.

SQL> INSERT INTO Sailor VALUES('S600','Vasanth','B',TO_DATE('20-MAR-1985','DD-MON-YYYY'),20600);

1 row created.

SQL> INSERT INTO Sailor VALUES('S700','Rahul','C',TO_DATE('13-DEC-1985','DD-MON-YYYY'),15500);

1 row created.

SQL> INSERT INTO Sailor VALUES('S800','Vijay',NULL,TO_DATE('13-DEC-1990','DD-MON-YYYY'),5000);

1 row created.

SQL> 
SQL> 
SQL> SELECT *
    FROM Sailor;

SAILOR_ID  NAME                 R DOB           SALARY                                                                            
---------- -------------------- - --------- ----------                                                                            
S100       Raman                A 01-OCT-80      27000                                                                            
S200       Krishna              B 04-JUL-78      21000                                                                            
S300       Gokul                C 05-FEB-75      16000                                                                            
S400       Ravi                 D 06-APR-84      10000                                                                            
S500       James                A 07-MAR-83      25000                                                                            
S600       Vasanth              B 20-MAR-85      20600                                                                            
S700       Rahul                C 13-DEC-85      15500                                                                            
S800       Vijay                  13-DEC-90       5000                                                                            

8 rows selected.

SQL> 
SQL> 
SQL> REM 2. Display the name and salary of sailors earning more than $10000.
SQL> SELECT name,salary
    FROM Sailor
    WHERE salary>10000;

NAME                     SALARY                                                                                                   
-------------------- ----------                                                                                                   
Raman                     27000                                                                                                   
Krishna                   21000                                                                                                   
Gokul                     16000                                                                                                   
James                     25000                                                                                                   
Vasanth                   20600                                                                                                   
Rahul                     15500                                                                                                   

6 rows selected.

SQL> 
SQL> 
SQL> 
SQL> REM 3. Display the unique ratings of sailor from the SAILOR relation.
SQL> SELECT DISTINCT rating
    FROM Sailor;

R                                                                                                                                 
-                                                                                                                                 
                                                                                                                                  
D                                                                                                                                 
A                                                                                                                                 
B                                                                                                                                 
C                                                                                                                                 

SQL> 
SQL> 
SQL> REM 4. Display sailor name, hike salary by 10% and label the columns as Sailor Name and New Salary respectively
SQL> SELECT name AS "Sailor Name",(salary+(salary*0.1)) AS "New Salary"
    FROM Sailor;

Sailor Name          New Salary                                                                                                   
-------------------- ----------                                                                                                   
Raman                     29700                                                                                                   
Krishna                   23100                                                                                                   
Gokul                     17600                                                                                                   
Ravi                      11000                                                                                                   
James                     27500                                                                                                   
Vasanth                   22660                                                                                                   
Rahul                     17050                                                                                                   
Vijay                      5500                                                                                                   

8 rows selected.

SQL> 
SQL> 
SQL> 
SQL> REM 5. List sailor id, name, salary of all sailor(s) who was not rated yet.
SQL> SELECT sailor_id,name,salary
    FROM Sailor
    WHERE rating IS NULL;

SAILOR_ID  NAME                     SALARY                                                                                        
---------- -------------------- ----------                                                                                        
S800       Vijay                      5000                                                                                        

SQL> 
SQL> 
SQL> 
SQL> REM 6. Show all data for sailors whose name starts with R and born before the year 1985.
SQL> SELECT *
    FROM Sailor
    WHERE name LIKE 'R%' AND ((EXTRACT(year FROM dob))<1985);

SAILOR_ID  NAME                 R DOB           SALARY                                                                            
---------- -------------------- - --------- ----------                                                                            
S100       Raman                A 01-OCT-80      27000                                                                            
S400       Ravi                 D 06-APR-84      10000                                                                            

SQL> 
SQL> 
SQL> 
SQL> REM 7.Modify the query in 2 to display the name and salary of all sailors whose salary is not in the range of $21000 to $25000.
SQL> SELECT name,rating,salary
    FROM Sailor
    WHERE rating='A' OR rating='B' AND (salary NOT IN(21000,25000));

NAME                 R     SALARY                                                                                                 
-------------------- - ----------                                                                                                 
Raman                A      27000                                                                                                 
James                A      25000                                                                                                 
Vasanth              B      20600                                                                                                 

SQL> 
SQL> 
SQL> 
SQL> 
SQL> 
SQL> REM 8.Modify the query in 2 to display the name and salary of all sailors whose salary is not in the range of $10000 to $16000
SQL> SELECT name,salary
    FROM Sailor
    WHERE salary NOT BETWEEN 10000 AND 16000;

NAME                     SALARY                                                                                                   
-------------------- ----------                                                                                                   
Raman                     27000                                                                                                   
Krishna                   21000                                                                                                   
James                     25000                                                                                                   
Vasanth                   20600                                                                                                   
Vijay                      5000                                                                                                   

SQL> 
SQL> 
SQL> 
SQL> 
SQL> REM 9. List the sailors who was born between Jan 1985 and Dec 1985.
SQL> SELECT *
    FROM Sailor
    WHERE dob BETWEEN '01-JAN-1985' AND '31-DEC-1985';

SAILOR_ID  NAME                 R DOB           SALARY                                                                            
---------- -------------------- - --------- ----------                                                                            
S600       Vasanth              B 20-MAR-85      20600                                                                            
S700       Rahul                C 13-DEC-85      15500                                                                            

SQL> 
SQL> 
SQL> 
SQL> 
SQL> 
SQL> REM 10. Show the name of sailors together with their age in number of years and months[eg. 18 Yrs 4 Months]
SQL> SELECT name,ROUND(MONTHS_BETWEEN(SYSDATE,dob)/12) || ' Yrs ' || FLOOR(((MONTHS_BETWEEN(SYSDATE,dob)/12)-FLOOR(MONTHS_BETWEEN(SYSDATE,dob)/12))*12) || ' Months' AS "Age"
  2  FROM Sailor;

NAME                 Age                                                                                                          
-------------------- --------------------------------------------------------------------------------------------                 
Raman                43 Yrs 6 Months                                                                                              
Krishna              45 Yrs 9 Months                                                                                              
Gokul                48 Yrs 2 Months                                                                                              
Ravi                 39 Yrs 0 Months                                                                                              
James                40 Yrs 1 Months                                                                                              
Vasanth              38 Yrs 0 Months                                                                                              
Rahul                37 Yrs 3 Months                                                                                              
Vijay                32 Yrs 3 Months                                                                                              

8 rows selected.

SQL> 
SQL> 
SQL> 
SQL> REM 11. Display the sailor id and name of a sailor whose name has second letter a. Sort the result by name in descending order
SQL> SELECT sailor_id,name
    FROM Sailor
    WHERE name LIKE '_a%'
    ORDER BY name DESC;

SAILOR_ID  NAME                                                                                                                   
---------- --------------------                                                                                                   
S600       Vasanth                                                                                                                
S400       Ravi                                                                                                                   
S100       Raman                                                                                                                  
S700       Rahul                                                                                                                  
S500       James                                                                                                                  

SQL> 
SQL> 
SQL> 
SQL> 
SQL> REM 12. Show those sailors whose name starts with J,K, or R
SQL> SELECT *
    FROM Sailor
    WHERE name LIKE 'J%' OR name LIKE 'K%' OR name LIKE 'R%';

SAILOR_ID  NAME                 R DOB           SALARY                                                                            
---------- -------------------- - --------- ----------                                                                            
S100       Raman                A 01-OCT-80      27000                                                                            
S200       Krishna              B 04-JUL-78      21000                                                                            
S400       Ravi                 D 06-APR-84      10000                                                                            
S500       James                A 07-MAR-83      25000                                                                            
S700       Rahul                C 13-DEC-85      15500                                                                            

SQL> 
SQL> 
SQL> 
SQL> REM 13. How many sailors have a name that ends with letter l.
SQL> SELECT COUNT(name)
    FROM Sailor
    WHERE name LIKE '%l';

COUNT(NAME)                                                                                                                       
-----------                                                                                                                       
          2                                                                                                                       

SQL> 
SQL> 
SQL> 
SQL> REM 14. Display highest, lowest, sum and average salary earned by the sailors in ratingwise. Label the columns as Max, Min, Sum, and Avg respectively. Round your results to the nearest whole number. Sort your result by alphabetical order of rating.
SQL> 
SQL> SELECT ROUND(MAX(salary)) "Max",ROUND(MIN(salary)) "Min",ROUND(SUM(salary)) "Sum",ROUND(AVG(salary)) "Avg"
    FROM Sailor
    GROUP BY rating
    ORDER BY rating;

       Max        Min        Sum        Avg                                                                                       
---------- ---------- ---------- ----------                                                                                       
     27000      25000      52000      26000                                                                                       
     21000      20600      41600      20800                                                                                       
     16000      15500      31500      15750                                                                                       
     10000      10000      10000      10000                                                                                       
      5000       5000       5000       5000                                                                                       

SQL> 
SQL> 
SQL> REM 15. Display the total salary for each rating. Exclude the ratings where the total salary is less than $25000
SQL> SELECT SUM(salary) "Total salary"
  2  FROM Sailor
  3  GROUP BY rating
  4  HAVING SUM(Salary)>=25000;

Total salary                                                                                                                      
------------                                                                                                                      
       52000                                                                                                                      
       41600                                                                                                                      
       31500                                                                                                                      

SQL> 
SQL> 
SQL> 
SQL> 
SQL> REM 16. Display the rating and salary of the lowest paid sailor in each rating. Exclude anyone whose rating is not known. Exclude any groups where the minimum salary is $15000 or less. Sort the output in descending order of salary.
SQL> 
SQL> SELECT rating,MIN(salary)
    FROM Sailor
    WHERE rating IS NOT NULL
    GROUP BY rating
    HAVING MIN(salary)>15000
    ORDER BY MIN(salary) DESC;

R MIN(SALARY)                                                                                                                     
- -----------                                                                                                                     
A       25000                                                                                                                     
B       20600                                                                                                                     
C       15500                                                                                                                     

SQL> 
SQL> @"Z:\Rohith_085\Assignment-2\Assignment-2TCL.sql"
SQL> REM 17. Mark an intermediate point in the transaction (savepoint).
SQL> SAVEPOINT step_17;

Savepoint created.

SQL> 
SQL> 
SQL> 
SQL> 
SQL> 
SQL> REM 18. Update the rating, salary of S800 to A, 10000 respectively.
SQL> SELECT *
    FROM Sailor;

SAILOR_ID  NAME                 R DOB           SALARY                                                                            
---------- -------------------- - --------- ----------                                                                            
S100       Raman                A 01-OCT-80      27000                                                                            
S200       Krishna              B 04-JUL-78      21000                                                                            
S300       Gokul                C 05-FEB-75      16000                                                                            
S400       Ravi                 D 06-APR-84      10000                                                                            
S500       James                A 07-MAR-83      25000                                                                            
S600       Vasanth              B 20-MAR-85      20600                                                                            
S700       Rahul                C 13-DEC-85      15500                                                                            
S800       Vijay                  13-DEC-90       5000                                                                            

8 rows selected.

SQL> 
SQL> UPDATE Sailor
    SET rating='A',salary=10000
    WHERE sailor_id='S800';

1 row updated.

SQL> 
SQL> SELECT *
    FROM Sailor;

SAILOR_ID  NAME                 R DOB           SALARY                                                                            
---------- -------------------- - --------- ----------                                                                            
S100       Raman                A 01-OCT-80      27000                                                                            
S200       Krishna              B 04-JUL-78      21000                                                                            
S300       Gokul                C 05-FEB-75      16000                                                                            
S400       Ravi                 D 06-APR-84      10000                                                                            
S500       James                A 07-MAR-83      25000                                                                            
S600       Vasanth              B 20-MAR-85      20600                                                                            
S700       Rahul                C 13-DEC-85      15500                                                                            
S800       Vijay                A 13-DEC-90      10000                                                                            

8 rows selected.

SQL> 
SQL> 
SQL> 
SQL> 
SQL> REM 19. Mark an intermediate point in the transaction (savepoint).
SQL> SAVEPOINT step_19;

Savepoint created.

SQL> 
SQL> 
SQL> 
SQL> 
SQL> REM 20. Update the salary of all sailors with a hike by 5%.
SQL> SELECT *
    FROM Sailor;

SAILOR_ID  NAME                 R DOB           SALARY                                                                            
---------- -------------------- - --------- ----------                                                                            
S100       Raman                A 01-OCT-80      27000                                                                            
S200       Krishna              B 04-JUL-78      21000                                                                            
S300       Gokul                C 05-FEB-75      16000                                                                            
S400       Ravi                 D 06-APR-84      10000                                                                            
S500       James                A 07-MAR-83      25000                                                                            
S600       Vasanth              B 20-MAR-85      20600                                                                            
S700       Rahul                C 13-DEC-85      15500                                                                            
S800       Vijay                A 13-DEC-90      10000                                                                            

8 rows selected.

SQL> 
SQL> UPDATE Sailor
  2  SET salary=salary+(salary*0.05);

8 rows updated.

SQL> 
SQL> SELECT *
    FROM Sailor;

SAILOR_ID  NAME                 R DOB           SALARY                                                                            
---------- -------------------- - --------- ----------                                                                            
S100       Raman                A 01-OCT-80      28350                                                                            
S200       Krishna              B 04-JUL-78      22050                                                                            
S300       Gokul                C 05-FEB-75      16800                                                                            
S400       Ravi                 D 06-APR-84      10500                                                                            
S500       James                A 07-MAR-83      26250                                                                            
S600       Vasanth              B 20-MAR-85      21630                                                                            
S700       Rahul                C 13-DEC-85      16275                                                                            
S800       Vijay                A 13-DEC-90      10500                                                                            

8 rows selected.

SQL> 
SQL> 
SQL> REM 21. Delete the sailor(s) who was born before 1985.
SQL> SELECT *
    FROM Sailor;

SAILOR_ID  NAME                 R DOB           SALARY                                                                            
---------- -------------------- - --------- ----------                                                                            
S100       Raman                A 01-OCT-80      28350                                                                            
S200       Krishna              B 04-JUL-78      22050                                                                            
S300       Gokul                C 05-FEB-75      16800                                                                            
S400       Ravi                 D 06-APR-84      10500                                                                            
S500       James                A 07-MAR-83      26250                                                                            
S600       Vasanth              B 20-MAR-85      21630                                                                            
S700       Rahul                C 13-DEC-85      16275                                                                            
S800       Vijay                A 13-DEC-90      10500                                                                            

8 rows selected.

SQL> 
SQL> DELETE FROM Sailor
    WHERE dob<'01-JAN-1985';

5 rows deleted.

SQL> 
SQL> SELECT *
    FROM Sailor;

SAILOR_ID  NAME                 R DOB           SALARY                                                                            
---------- -------------------- - --------- ----------                                                                            
S600       Vasanth              B 20-MAR-85      21630                                                                            
S700       Rahul                C 13-DEC-85      16275                                                                            
S800       Vijay                A 13-DEC-90      10500                                                                            

SQL> 
SQL> 
SQL> 
SQL> REM 22. Display the sailor relation
SQL> SELECT *
    FROM Sailor;

SAILOR_ID  NAME                 R DOB           SALARY                                                                            
---------- -------------------- - --------- ----------                                                                            
S600       Vasanth              B 20-MAR-85      21630                                                                            
S700       Rahul                C 13-DEC-85      16275                                                                            
S800       Vijay                A 13-DEC-90      10500                                                                            

SQL> 
SQL> 
SQL> 
SQL> 
SQL> 
SQL> 
SQL> REM 23. Discard the most recent update operations (rollback)
SQL> ROLLBACK TO step_19;

Rollback complete.

SQL> 
SQL> SELECT *
    FROM Sailor;

SAILOR_ID  NAME                 R DOB           SALARY                                                                            
---------- -------------------- - --------- ----------                                                                            
S100       Raman                A 01-OCT-80      27000                                                                            
S200       Krishna              B 04-JUL-78      21000                                                                            
S300       Gokul                C 05-FEB-75      16000                                                                            
S400       Ravi                 D 06-APR-84      10000                                                                            
S500       James                A 07-MAR-83      25000                                                                            
S600       Vasanth              B 20-MAR-85      20600                                                                            
S700       Rahul                C 13-DEC-85      15500                                                                            
S800       Vijay                A 13-DEC-90      10000                                                                            

8 rows selected.

SQL> 
SQL> 
SQL> 
SQL> 
SQL> REM 24. Commit the changes
SQL> COMMIT;

Commit complete.

SQL> 
SQL> spool off;
