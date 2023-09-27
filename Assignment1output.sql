SQL> @"Z:\Rohith_085\Assignment-1\Creation.sql"

SQL> REM Dropping tables

SQL> DROP table Reservation;
Table dropped.

SQL> DROP TABLE Tourist;
Table dropped.

SQL> DROP TABLE Sailor;
Table dropped.

SQL> DROP TABLE Boat;
Table dropped.

 
SQL> REM Boat table creation
 
SQL> CREATE TABLE Boat(
    boat_id VARCHAR(10) CONSTRAINT boat_id_pk PRIMARY KEY,
    boat_name VARCHAR(20),
    type VARCHAR(20) CONSTRAINT type_check CHECK(type in ('LUX','CAR','CRU')),
    capacity NUMBER(4),
    price_per_seat NUMBER(12),
    colour VARCHAR(20)
    );

Table created.


SQL> REM Description values

SQL> DESCRIBE Boat;
 Name                                                                    Null?    Type
 ----------------------------------------------------------------------- -------- ------------------------------------------------
 BOAT_ID                                                                 NOT NULL VARCHAR2(10)
 BOAT_NAME                                                                        VARCHAR2(20)
 TYPE                                                                             VARCHAR2(20)
 CAPACITY                                                                         NUMBER(4)
 PRICE_PER_SEAT                                                                   NUMBER(12)
 COLOUR                                                                           VARCHAR2(20)



SQL> REM insertion of valid rows in Boat

SQL> INSERT INTO Boat VALUES('B101','Greater Chennai','LUX',100,60000,'White');
1 row created.

SQL> INSERT INTO Boat VALUES('B102','Fantastic four','CRU',200,150000,'Green');
1 row created.

SQL> INSERT INTO Boat VALUES('B103','Avengers','CAR',150,60000,'Red');
1 row created.

SQL> INSERT INTO Boat VALUES('B104','Bessy_Beach','LUX',200,450000,'Gold');
1 row created.

SQL> INSERT INTO Boat VALUES('B105','Luck fellow','CAR',130,780000,'Black');
1 row created.



SQL> REM Violation of PRIMARY KEY

SQL> INSERT INTO Boat VALUES('B101','Feast','LUX',160,60000,'White');
INSERT INTO Boat VALUES('B101','Feast','LUX',160,60000,'White')
*
ERROR at line 1:
ORA-00001: unique constraint (01085.BOAT_ID_PK) violated 


SQL> REM Violation of Check Constraint - Rating

SQL> INSERT INTO Boat VALUES('B102','Fantastic','XYZ',210,30000,'Red');
INSERT INTO Boat VALUES('B102','Fantastic','XYZ',210,30000,'Red')
*
ERROR at line 1:
ORA-02290: check constraint (01085.TYPE_CHECK) violated 



SQL> REM Sailor Table creation

SQL> CREATE TABLE Sailor(
  2  sailor_id VARCHAR(10) CONSTRAINT sailor_id PRIMARY KEY,
  3  sailor_name VARCHAR(20),
  4  rating VARCHAR(1) CONSTRAINT rating_check CHECK(rating IN ('A','B','C')),
  5  sailor_DOB DATE CONSTRAINT date_check CHECK((2023-extract(year from sailor_DOB)>25))
  6  );

Table created.


SQL> REM Description of Sailor

SQL> DESCRIBE  Sailor;
 Name                                                                    Null?    Type
 ----------------------------------------------------------------------- -------- ------------------------------------------------
 SAILOR_ID                                                               NOT NULL VARCHAR2(10)
 SAILOR_NAME                                                                      VARCHAR2(20)
 RATING                                                                           VARCHAR2(1)
 SAILOR_DOB                                                                       DATE

 
SQL> REM inserting valid values into Sailor

SQL> INSERT INTO Sailor VALUES('S001','Jackie Chan','A',TO_DATE('1993-10-12','YYYY-MM-DD'));
1 row created.

SQL> INSERT INTO Sailor VALUES('S002','James Bond','A',TO_DATE('1993-10-12','YYYY-MM-DD'));
1 row created.

SQL> INSERT INTO Sailor VALUES('S003','John Smith','B',TO_DATE('1990-10-12','YYYY-MM-DD'));
1 row created.

SQL> INSERT INTO Sailor VALUES('S004','Leo','C',TO_DATE('1991-10-12','YYYY-MM-DD'));
1 row created.

SQL> INSERT INTO Sailor VALUES('S005','Neil Arms','A',TO_DATE('1995-10-12','YYYY-MM-DD'));
1 row created.

 
SQL> REM violation of primary key
 
SQL> INSERT INTO Sailor VALUES('S001','Jason','B',TO_DATE('1990-11-5','YYYY-MM-DD'));
INSERT INTO Sailor VALUES('S001','Jason','B',TO_DATE('1990-11-5','YYYY-MM-DD'))
*
ERROR at line 1:
ORA-00001: unique constraint (01085.SAILOR_ID) violated 


SQL> REM violation of check constraint - DOB

SQL> INSERT INTO Sailor VALUES('S001','Jill','B',TO_DATE('2012-11-5','YYYY-MM-DD'));
INSERT INTO Sailor VALUES('S001','Jill','B',TO_DATE('2012-11-5','YYYY-MM-DD'))
*
ERROR at line 1:
ORA-02290: check constraint (01085.DATE_CHECK) violated 


SQL> REM Violation of CHECK constraint - Rating

SQL> INSERT INTO Sailor VALUES('S002','Jane','E',TO_DATE('1993-10-12','YYYY-MM-DD'));
INSERT INTO Sailor VALUES('S002','Jane','E',TO_DATE('1993-10-12','YYYY-MM-DD'))
*
ERROR at line 1:
ORA-02290: check constraint (01085.RATING_CHECK) violated 


SQL> REM Tourist table creation

SQL> CREATE TABLE Tourist(
    tourist_id VARCHAR(10) CONSTRAINT tourist_id_pk PRIMARY KEY,
    tourist_name VARCHAR(20),
    address VARCHAR(20),
    tourist_DOB DATE,
    phone INT
    );

Table created.

 
SQL> REM description of Tourist table

SQL> DESCRIBE Tourist;
 Name                                                                    Null?    Type
 ----------------------------------------------------------------------- -------- ------------------------------------------------
 TOURIST_ID                                                              NOT NULL VARCHAR2(10)
 TOURIST_NAME                                                                     VARCHAR2(20)
 ADDRESS                                                                          VARCHAR2(20)
 TOURIST_DOB                                                                      DATE
 PHONE                                                                            NUMBER(38)

 
SQL> REM Insertion of valid values into Tourist

SQL> INSERT INTO Tourist VALUES('T001','David','1st Main RD',TO_DATE('2000-10-12','YYYY-MM-DD'),1234567890);
1 row created.

SQL> INSERT INTO Tourist VALUES('T002','Ashwin','3rd Main RD',TO_DATE('2003-10-12','YYYY-MM-DD'),1232367890);
1 row created.

SQL> INSERT INTO Tourist VALUES('T003','Khwaja','4th Main RD',TO_DATE('2010-11-12','YYYY-MM-DD'),1234567831);
1 row created.

SQL> INSERT INTO Tourist VALUES('T004','Hello','5th Main RD',TO_DATE('2011-02-09','YYYY-MM-DD'),1234567878);
1 row created.

SQL> INSERT INTO Tourist VALUES('T005','Smith','6th Main RD',TO_DATE('2015-02-10','YYYY-MM-DD'),1234555878);
1 row created.


SQL> REM violation of primary key

SQL> INSERT INTO Tourist VALUES('T001','Root','2nd Main RD',TO_DATE('2010-10-12','YYYY-MM-DD'),1234567890);
INSERT INTO Tourist VALUES('T001','Root','2nd Main RD',TO_DATE('2010-10-12','YYYY-MM-DD'),1234567890)
*
ERROR at line 1:
ORA-00001: unique constraint (01085.TOURIST_ID_PK) violated 

 
SQL> REM Creation of Reservation

SQL> CREATE TABLE Reservation(
    boat_id VARCHAR(10) CONSTRAINT boat_id_fk REFERENCES Boat(boat_id),
    sailor_id VARCHAR(10) CONSTRAINT sailor_id_fk REFERENCES Sailor(sailor_id),
    tourist_id VARCHAR(10) CONSTRAINT tourist_id_fk REFERENCES Tourist(tourist_id),
    number_persons INT,
    date_reserve DATE,
    date_sail DATE,
    CONSTRAINT Reservation_ck PRIMARY KEY(boat_id,sailor_id,date_sail),
    CONSTRAINT advance_check CHECK(date_reserve <=(date_sail-INTERVAL '12' DAY))
   );

Table created.


SQL> REM Description of Reservation
 
SQL> DESCRIBE Reservation;
 Name                                                                    Null?    Type
 ----------------------------------------------------------------------- -------- ------------------------------------------------
 BOAT_ID                                                                 NOT NULL VARCHAR2(10)
 SAILOR_ID                                                               NOT NULL VARCHAR2(10)
 TOURIST_ID                                                                       VARCHAR2(10)
 NUMBER_PERSONS                                                                   NUMBER(38)
 DATE_RESERVE                                                                     DATE
 DATE_SAIL                                                               NOT NULL DATE


SQL> REM Insertion of Valid Rows

SQL> INSERT INTO Reservation VALUES('B101','S001','T001',10,TO_DATE('2000-10-12','YYYY-MM-DD'),TO_DATE('2000-10-25','YYYY-MM-DD'));
1 row created.

SQL> INSERT INTO Reservation VALUES('B102','S002','T002',10,TO_DATE('2011-10-12','YYYY-MM-DD'),TO_DATE('2011-10-25','YYYY-MM-DD'));
1 row created.

SQL> INSERT INTO Reservation VALUES('B103','S003','T003',10,TO_DATE('2012-05-11','YYYY-MM-DD'),TO_DATE('2012-05-30','YYYY-MM-DD'));
1 row created.

SQL> INSERT INTO Reservation VALUES('B104','S004','T004',10,TO_DATE('2013-01-12','YYYY-MM-DD'),TO_DATE('2013-01-25','YYYY-MM-DD'));
1 row created.


SQL> REM Violation of primary key

SQL> INSERT INTO Reservation Values('B101','S001','T002',10,TO_DATE('2000-10-12','YYYY-MM-DD'),TO_DATE('2000-10-25','YYYY-MM-DD'));
INSERT INTO Reservation Values('B101','S001','T002',10,TO_DATE('2000-10-12','YYYY-MM-DD'),TO_DATE('2000-10-25','YYYY-MM-DD'))
*
ERROR at line 1:
ORA-00001: unique constraint (01085.RESERVATION_CK) violated 



SQL> REM violation of Check constraint

SQL> INSERT INTO Reservation VALUES('B105','S005','T005',10,TO_DATE('2014-09-12','YYYY-MM-DD'),TO_DATE('2014-09-15','YYYY-MM-DD'));
INSERT INTO Reservation VALUES('B105','S005','T005',10,TO_DATE('2014-09-12','YYYY-MM-DD'),TO_DATE('2014-09-15','YYYY-MM-DD'))
*
ERROR at line 1:
ORA-02290: check constraint (01085.ADVANCE_CHECK) violated 



SQL> REM Violation of Foreign key constraint
 
SQL> INSERT INTO Reservation Values('T101','B001','S002',11,TO_DATE('2000-10-12','YYYY-MM-DD'),TO_DATE('2000-10-25','YYYY-MM-DD'));
INSERT INTO Reservation Values('T101','B001','S002',11,TO_DATE('2000-10-12','YYYY-MM-DD'),TO_DATE('2000-10-25','YYYY-MM-DD'))
*
ERROR at line 1:
ORA-02291: integrity constraint (01085.TOURIST_ID_FK) violated - parent key not found 



SQL> SELECT *
    FROM Boat;

BOAT_ID    BOAT_NAME            TYPE                   CAPACITY PRICE_PER_SEAT COLOUR                                             
---------- -------------------- -------------------- ---------- -------------- --------------------                               
B101       Greater Chennai      LUX                         100          60000 White                                              
B102       Fantastic four       CRU                         200         150000 Green                                              
B103       Avengers             CAR                         150          60000 Red                                                
B104       Bessy_Beach          LUX                         200         450000 Gold                                               
B105       Luck fellow          CAR                         130         780000 Black                                              


 
SQL> SELECT *
    FROM Sailor;

SAILOR_ID  SAILOR_NAME          R SAILOR_DO                                                                                       
---------- -------------------- - ---------                                                                                       
S001       Jackie Chan          A 12-OCT-93                                                                                       
S002       James Bond           A 12-OCT-93                                                                                       
S003       John Smith           B 12-OCT-90                                                                                       
S004       Leo                  C 12-OCT-91                                                                                       
S005       Neil Arms            A 12-OCT-95                                                                                       


 
SQL> SELECT *
   FROM Tourist;

TOURIST_ID TOURIST_NAME         ADDRESS              TOURIST_D      PHONE                                                         
---------- -------------------- -------------------- --------- ----------                                                         
T001       David                1st Main RD          12-OCT-00 1234567890                                                         
T002       Ashwin               3rd Main RD          12-OCT-03 1232367890                                                         
T003       Khwaja               4th Main RD          12-NOV-10 1234567831                                                         
T004       Hello                5th Main RD          09-FEB-11 1234567878                                                         
T005       Smith                6th Main RD          10-FEB-15 1234555878                                                         


 
SQL> SELECT *
    FROM Reservation;

BOAT_ID    SAILOR_ID  TOURIST_ID NUMBER_PERSONS DATE_RESE DATE_SAIL                                                               
---------- ---------- ---------- -------------- --------- ---------                                                               
B101       S001       T001                   10 12-OCT-00 25-OCT-00                                                               
B102       S002       T002                   10 12-OCT-11 25-OCT-11                                                               
B103       S003       T003                   10 11-MAY-12 30-MAY-12                                                               
B104       S004       T004                   10 12-JAN-13 25-JAN-13                                                               



SQL> @"Z:\Rohith_085\Assignment-1\Alter.sql"
SQL> REM Alter Commands


SQL> REM 8. It is identified that the number of children have to be mentioned while booking the boat by the tourists.

SQL> ALTER TABLE RESERVATION
   ADD children_count INT;

Table altered.


SQL> DESCRIBE Reservation;
 Name                                                                    Null?    Type
 ----------------------------------------------------------------------- -------- ------------------------------------------------
 BOAT_ID                                                                 NOT NULL VARCHAR2(10)
 SAILOR_ID                                                               NOT NULL VARCHAR2(10)
 TOURIST_ID                                                                       VARCHAR2(10)
 NUMBER_PERSONS                                                                   NUMBER(38)
 DATE_RESERVE                                                                     DATE
 DATE_SAIL                                                               NOT NULL DATE
 CHILDREN_COUNT                                                                   NUMBER(38)




SQL> REM 9. The width of a tourist name is not adequate for most of the tourists.
 
SQL> REM Inserting large name into Tourist
SQL> INSERT INTO Tourist VALUES('T001','adadadadadadadadadadad','1st Main RD',TO_DATE('2000-10-12','YYYY-MM-DD'),1234567890);
INSERT INTO Tourist VALUES('T001','adadadadadadadadadadad','1st Main RD',TO_DATE('2000-10-12','YYYY-MM-DD'),1234567890)
                                  *
ERROR at line 1:
ORA-12899: value too large for column "01085"."TOURIST"."TOURIST_NAME" (actual: 22, maximum: 20) 


 
SQL> REM Altering the constraint
SQL> ALTER TABLE Tourist
    MODIFY tourist_name VARCHAR(60);

Table altered.


SQL> DESCRIBE Tourist;
 Name                                                                    Null?    Type
 ----------------------------------------------------------------------- -------- ------------------------------------------------
 TOURIST_ID                                                              NOT NULL VARCHAR2(10)
 TOURIST_NAME                                                                     VARCHAR2(60)
 ADDRESS                                                                          VARCHAR2(20)
 TOURIST_DOB                                                                      DATE
 PHONE                                                                            NUMBER(38)


SQL> REM Insertion of large name
SQL> INSERT INTO Tourist VALUES('T010','adadadadadadadadadadad','1st Main RD',TO_DATE('2000-10-12','YYYY-MM-DD'),1234567890);
1 row created.


SQL> REM 10. Reservation can not be done without the reserve_date.

SQL> ALTER TABLE Reservation
    MODIFY date_reserve DATE NOT NULL;

Table altered.


SQL> DESCRIBE Reservation;
 Name                                                                    Null?    Type
 ----------------------------------------------------------------------- -------- ------------------------------------------------
 BOAT_ID                                                                 NOT NULL VARCHAR2(10)
 SAILOR_ID                                                               NOT NULL VARCHAR2(10)
 TOURIST_ID                                                                       VARCHAR2(10)
 NUMBER_PERSONS                                                                   NUMBER(38)
 DATE_RESERVE                                                            NOT NULL DATE
 DATE_SAIL                                                               NOT NULL DATE
 CHILDREN_COUNT                                                                   NUMBER(38)


SQL> REM Insertion of NULL value
SQL> INSERT INTO Reservation VALUES('B101','S001','T001',NULL,TO_DATE('2000-10-25','YYYY-MM-DD'),3);
INSERT INTO Reservation VALUES('B101','S001','T001',NULL,TO_DATE('2000-10-25','YYYY-MM-DD'),3)
            *
ERROR at line 1:
ORA-00947: not enough values 



SQL> REM Insertion of valid row in Reservation table
SQL> INSERT INTO Reservation VALUES('B101','S001','T001',10,TO_DATE('2000-10-04','YYYY-MM-DD'),TO_DATE('2000-10-26','YYYY-MM-DD'),2);

1 row created.

 
SQL> REM 11. The date of birth of a tourist can be addressed later.

SQL> ALTER TABLE Tourist
    DROP COLUMN tourist_dob;

Table altered.

 
SQL> DESCRIBE Tourist;
 Name                                                                    Null?    Type
 ----------------------------------------------------------------------- -------- ------------------------------------------------
 TOURIST_ID                                                              NOT NULL VARCHAR2(10)
 TOURIST_NAME                                                                     VARCHAR2(60)
 ADDRESS                                                                          VARCHAR2(20)
 PHONE                                                                            NUMBER(38)


SQL> REM Insertion of valid row after deletion of column
SQL> INSERT INTO Tourist VALUES('T009','David','1st Main RD',1234567890);
1 row created.



SQL> REM 12. The rating for sailor  D has to be added.

SQL> REM Constraint violation
SQL> INSERT INTO Sailor VALUES('S007','Minsker','D',TO_DATE('1993-10-12','YYYY-MM-DD'));
INSERT INTO Sailor VALUES('S007','Minsker','D',TO_DATE('1993-10-12','YYYY-MM-DD'))
*
ERROR at line 1:
ORA-02290: check constraint (01085.RATING_CHECK) violated 


 
SQL> REM Alter Statement
SQL> ALTER TABLE Sailor
    DROP CONSTRAINT rating_check;

Table altered.


SQL> ALTER TABLE Sailor
    ADD (CONSTRAINT rating_check CHECK(rating IN ('A','B','C','D')));

Table altered.


SQL> DESCRIBE Sailor;
 Name                                                                    Null?    Type
 ----------------------------------------------------------------------- -------- ------------------------------------------------
 SAILOR_ID                                                               NOT NULL VARCHAR2(10)
 SAILOR_NAME                                                                      VARCHAR2(20)
 RATING                                                                           VARCHAR2(1)
 SAILOR_DOB                                                                       DATE


SQL> REM Insertion of valid row after alter
SQL> INSERT INTO Sailor VALUES('S007','Minsker','D',TO_DATE('1993-10-12','YYYY-MM-DD'));

1 row created.


SQL> REM 13. All luxurious boats are colored yellow.

SQL> DELETE FROM Reservation;
5 rows deleted.

SQL> DELETE FROM Boat;
5 rows deleted.

 
SQL> ALTER TABLE Boat
    ADD CONSTRAINT colour_chk CHECK((colour IN ('yellow') AND type IN ('LUX')) OR type IN ('CAR','CRU'));

Table altered.

 
SQL> DESCRIBE Boat;
 Name                                                                    Null?    Type
 ----------------------------------------------------------------------- -------- ------------------------------------------------
 BOAT_ID                                                                 NOT NULL VARCHAR2(10)
 BOAT_NAME                                                                        VARCHAR2(20)
 TYPE                                                                             VARCHAR2(20)
 CAPACITY                                                                         NUMBER(4)
 PRICE_PER_SEAT                                                                   NUMBER(12)
 COLOUR                                                                           VARCHAR2(20)

 
SQL> REM : inserting row that will be accepted
SQL> INSERT INTO Boat VALUES ('B006', 'Boat-6', 'LUX', 10, 599, 'yellow');
1 row created.

SQL> INSERT INTO Boat VALUES ('B026', 'Boat-26', 'CAR', 10, 599, 'green');
1 row created.

 
SQL> REM: inserting row that will violate check constraint
SQL> INSERT INTO Boat VALUES ('B007', 'Boat-7', 'LUX', 10, 1200, 'black');
INSERT INTO Boat VALUES ('B007', 'Boat-7', 'LUX', 10, 1200, 'black')
*
ERROR at line 1:
ORA-02290: check constraint (01085.COLOUR_CHK) violated 


SQL> INSERT INTO Boat VALUES ('B007', 'Boat-7', 'LRT', 10, 1200, 'black');
INSERT INTO Boat VALUES ('B007', 'Boat-7', 'LRT', 10, 1200, 'black')
*
ERROR at line 1:
ORA-02290: check constraint (01085.COLOUR_CHK) violated 



SQL> REM 14. Each boat should have different name.

SQL> ALTER TABLE Boat
    ADD CONSTRAINT name_unique UNIQUE(boat_name);

Table altered.


SQL> DESCRIBE Boat;
 Name                                                                    Null?    Type
 ----------------------------------------------------------------------- -------- ------------------------------------------------
 BOAT_ID                                                                 NOT NULL VARCHAR2(10)
 BOAT_NAME                                                                        VARCHAR2(20)
 TYPE                                                                             VARCHAR2(20)
 CAPACITY                                                                         NUMBER(4)
 PRICE_PER_SEAT                                                                   NUMBER(12)
 COLOUR                                                                           VARCHAR2(20)


SQL> REM Constraint violation
SQL> INSERT INTO Boat VALUES('B106','Greater Chennai','LUX',100,60000,'White');
INSERT INTO Boat VALUES('B106','Greater Chennai','LUX',100,60000,'White')
*
ERROR at line 1:
ORA-02290: check constraint (01085.COLOUR_CHK) violated 


SQL> INSERT INTO Boat VALUES('B106','Greater Chennai','LUX',100,60000,'White');
INSERT INTO Boat VALUES('B106','Greater Chennai','LUX',100,60000,'White')
*
ERROR at line 1:
ORA-02290: check constraint (01085.COLOUR_CHK) violated 



SQL> REM Insertion of valid rows
SQL> INSERT INTO Boat VALUES('B107','Greater Tuty','LUX',100,60000,'yellow');
1 row created.

SQL> INSERT INTO Boat VALUES('B108','Greater Cbe','LUX',100,60000,'yellow');
1 row created.



SQL> REM 15. A sailor may resign his job later or a boat may get damaged. Hence on removing the details of the sailor / boat, ensure that all the corresponding details are also deleted.

SQL> ALTER TABLE Reservation
    DROP CONSTRAINT boat_id_fk;

Table altered.


SQL> ALTER TABLE Reservation
    DROP CONSTRAINT sailor_id_fk;

Table altered.


SQL> REM Adding constraint to reflect on all tables
 
SQL> ALTER TABLE Reservation
    MODIFY boat_id varchar2(10) CONSTRAINT boat_id_fk REFERENCES Boat(boat_id)
    ON DELETE CASCADE;

Table altered.


SQL> ALTER TABLE Reservation
    MODIFY sailor_id varchar2(10) CONSTRAINT sailor_id_fk REFERENCES Sailor(sailor_id)
    ON DELETE CASCADE;

Table altered.


SQL> DESCRIBE Reservation;
 Name                                                                    Null?    Type
 ----------------------------------------------------------------------- -------- ------------------------------------------------
 BOAT_ID                                                                 NOT NULL VARCHAR2(10)
 SAILOR_ID                                                               NOT NULL VARCHAR2(10)
 TOURIST_ID                                                                       VARCHAR2(10)
 NUMBER_PERSONS                                                                   NUMBER(38)
 DATE_RESERVE                                                            NOT NULL DATE
 DATE_SAIL                                                               NOT NULL DATE
 CHILDREN_COUNT                                                                   NUMBER(38)


SQL> REM Inserting values into Reservation Table
 
SQL> INSERT INTO Reservation values('B006','S001','T002',7,TO_DATE('2023-03-11', 'YYYY-MM-DD'),TO_DATE('2023-03-31', 'YYYY-MM-DD'),5);
1 row created.

SQL> INSERT INTO Reservation values('B107','S002','T004',12,TO_DATE('2023-03-05', 'YYYY-MM-DD'),TO_DATE('2023-03-25', 'YYYY-MM-DD'),6);
1 row created.

SQL> INSERT INTO Reservation values('B108','S004','T001',9,TO_DATE('2023-03-02', 'YYYY-MM-DD'),TO_DATE('2023-03-30', 'YYYY-MM-DD'),7);
1 row created.

SQL> INSERT INTO Reservation values('B026','S003','T003',25,TO_DATE('2023-03-06', 'YYYY-MM-DD'),TO_DATE('2023-03-28', 'YYYY-MM-DD'),8);
1 row created.

 
SQL> REM Reservation table before cascade

SQL> SELECT *
  2  FROM Reservation;

BOAT_ID    SAILOR_ID  TOURIST_ID NUMBER_PERSONS DATE_RESE DATE_SAIL CHILDREN_COUNT                                                
---------- ---------- ---------- -------------- --------- --------- --------------                                                
B006       S001       T002                    7 11-MAR-23 31-MAR-23              5                                                
B107       S002       T004                   12 05-MAR-23 25-MAR-23              6                                                
B108       S004       T001                    9 02-MAR-23 30-MAR-23              7                                                
B026       S003       T003                   25 06-MAR-23 28-MAR-23              8                                                


SQL> REM Boat table before the cascade
 
SQL> SELECT *
    FROM Boat;

BOAT_ID    BOAT_NAME            TYPE                   CAPACITY PRICE_PER_SEAT COLOUR                                             
---------- -------------------- -------------------- ---------- -------------- --------------------                               
B108       Greater Cbe          LUX                         100          60000 yellow                                             
B006       Boat-6               LUX                          10            599 yellow                                             
B026       Boat-26              CAR                          10            599 green                                              
B107       Greater Tuty         LUX                         100          60000 yellow                                             


SQL> REM Sailor table before the cascade
 
SQL> SELECT *
    FROM Sailor;

SAILOR_ID  SAILOR_NAME          R SAILOR_DO                                                                                       
---------- -------------------- - ---------                                                                                       
S001       Jackie Chan          A 12-OCT-93                                                                                       
S002       James Bond           A 12-OCT-93                                                                                       
S003       John Smith           B 12-OCT-90                                                                                       
S004       Leo                  C 12-OCT-91                                                                                       
S005       Neil Arms            A 12-OCT-95                                                                                       
S007       Minsker              D 12-OCT-93                                                                                       

6 rows selected.

 
SQL> REM : deleting values from Boats & Sailors table.
 
SQL> DELETE Boat
    WHERE boat_id = 'B107';

1 row deleted.

 
SQL> DELETE FROM Sailor
    WHERE sailor_id = 'S004';

1 row deleted.

 
SQL> REM Reservation table after cascade
 
SQL> SELECT *
    FROM Reservation;

BOAT_ID    SAILOR_ID  TOURIST_ID NUMBER_PERSONS DATE_RESE DATE_SAIL CHILDREN_COUNT                                                
---------- ---------- ---------- -------------- --------- --------- --------------                                                
B006       S001       T002                    7 11-MAR-23 31-MAR-23              5                                                
B026       S003       T003                   25 06-MAR-23 28-MAR-23              8                                                

 
SQL> REM Boat table after the cascade
 
SQL> SELECT *
    FROM Boat;

BOAT_ID    BOAT_NAME            TYPE                   CAPACITY PRICE_PER_SEAT COLOUR                                             
---------- -------------------- -------------------- ---------- -------------- --------------------                               
B108       Greater Cbe          LUX                         100          60000 yellow                                             
B006       Boat-6               LUX                          10            599 yellow                                             
B026       Boat-26              CAR                          10            599 green                                              

 
SQL> REM Sailor table after the cascade
 
SQL> SELECT *
   FROM Sailor;

SAILOR_ID  SAILOR_NAME          R SAILOR_DO                                                                                       
---------- -------------------- - ---------                                                                                       
S001       Jackie Chan          A 12-OCT-93                                                                                       
S002       James Bond           A 12-OCT-93                                                                                       
S003       John Smith           B 12-OCT-90                                                                                       
S005       Neil Arms            A 12-OCT-95                                                                                       
S007       Minsker              D 12-OCT-93                                                                                       


SQL> spool off;
