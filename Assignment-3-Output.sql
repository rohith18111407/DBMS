SQL> 
SQL> @"C:\Rohith\Backup\Desktop\SEM 4\Database lab\Exercise-3\creation.sql"
SQL> set long 50000
SQL> set linesize 130
SQL> col x format a80 word_wrapped;
SQL> 
SQL> 
SQL> 
SQL> Rem ********************************DROPPING*****************************************
SQL> 
SQL> Rem Dropping of existing tables:
SQL> DROP TABLE CAR_dETAILS CASCADE CONSTRAINTS;

Table dropped.

SQL> drop table CAR_NAMES CASCADE CONSTRAINTS;

Table dropped.

SQL> Drop table model_details CASCADE CONSTRAINTS;

Table dropped.

SQL> drop table CAR_MAKERS CASCADE CONSTRAINTS;

Table dropped.

SQL> Drop table COUNTRIES CASCADE CONSTRAINTS;

Table dropped.

SQL> drop table CONTINENTS CASCADE CONSTRAINTS;

Table dropped.

SQL> 
SQL> Rem *******************************CONTINENTS*****************************************
SQL> 
SQL> Rem Creating the continents table:
SQL> Create table Continents(
  2  	     ContId int constraint cont_id_pk primary key,
  3  	     Continent varchar2(20) constraint continent_uk unique
  4  );

Table created.

SQL> 
SQL> Rem Describing the table:
SQL> Describe Continents;
 Name                                                                    Null?    Type
 ----------------------------------------------------------------------- -------- ------------------------------------------------
 CONTID                                                                  NOT NULL NUMBER(38)
 CONTINENT                                                                        VARCHAR2(20)

SQL> 
SQL> Rem Inserting the given tuples into the table:
SQL> INSERT INTO CONTINENTS VALUES(1,'america');

1 row created.

SQL> INSERT INTO CONTINENTS VALUES(2,'europe');

1 row created.

SQL> INSERT INTO CONTINENTS VALUES(3,'asia');

1 row created.

SQL> INSERT INTO CONTINENTS VALUES(4,'africa');

1 row created.

SQL> INSERT INTO CONTINENTS VALUES(5,'australia');

1 row created.

SQL> 
SQL> Rem The final table:
SQL> Select * from continents;

    CONTID CONTINENT                                                                                                              
---------- --------------------                                                                                                   
         1 america                                                                                                                
         2 europe                                                                                                                 
         3 asia                                                                                                                   
         4 africa                                                                                                                 
         5 australia                                                                                                              

SQL> 
SQL> Rem *******************************COUNTRIES*****************************************
SQL> 
SQL> Rem Creating the Country table:
SQL> Create table countries(
  2  	     CountryId int constraint country_id_pk primary key,
  3  	     CountryName varchar2(20),
  4  	     Continent int constraint Continent_fk references Continents(ContId)
  5  );

Table created.

SQL> 
SQL> Rem Describing the table:
SQL> Describe Country;
ERROR:
ORA-04043: object Country does not exist 


SQL> 
SQL> Rem Inserting the given tuples into the table:
SQL> INSERT INTO COUNTRIES VALUES(1,'usa',1);

1 row created.

SQL> INSERT INTO COUNTRIES VALUES(2,'germany',2);

1 row created.

SQL> INSERT INTO COUNTRIES VALUES(3,'france',2);

1 row created.

SQL> INSERT INTO COUNTRIES VALUES(4,'japan',3);

1 row created.

SQL> INSERT INTO COUNTRIES VALUES(5,'italy',2);

1 row created.

SQL> INSERT INTO COUNTRIES VALUES(6,'sweden',2);

1 row created.

SQL> INSERT INTO COUNTRIES VALUES(7,'uk',2);

1 row created.

SQL> INSERT INTO COUNTRIES VALUES(8,'korea',3);

1 row created.

SQL> INSERT INTO COUNTRIES VALUES(9,'russia',2);

1 row created.

SQL> INSERT INTO COUNTRIES VALUES(10,'nigeria',4);

1 row created.

SQL> INSERT INTO COUNTRIES VALUES(11,'australia',5);

1 row created.

SQL> INSERT INTO COUNTRIES VALUES(12,'new zealand',5);

1 row created.

SQL> INSERT INTO COUNTRIES VALUES(13,'egypt',4);

1 row created.

SQL> INSERT INTO COUNTRIES VALUES(14,'mexico',1);

1 row created.

SQL> INSERT INTO COUNTRIES VALUES(15,'brazil',1);

1 row created.

SQL> 
SQL> 
SQL> Rem The final table:
SQL> Select * from countries;

 COUNTRYID COUNTRYNAME           CONTINENT                                                                                        
---------- -------------------- ----------                                                                                        
         1 usa                           1                                                                                        
         2 germany                       2                                                                                        
         3 france                        2                                                                                        
         4 japan                         3                                                                                        
         5 italy                         2                                                                                        
         6 sweden                        2                                                                                        
         7 uk                            2                                                                                        
         8 korea                         3                                                                                        
         9 russia                        2                                                                                        
        10 nigeria                       4                                                                                        
        11 australia                     5                                                                                        

 COUNTRYID COUNTRYNAME           CONTINENT                                                                                        
---------- -------------------- ----------                                                                                        
        12 new zealand                   5                                                                                        
        13 egypt                         4                                                                                        
        14 mexico                        1                                                                                        
        15 brazil                        1                                                                                        

15 rows selected.

SQL> 
SQL> Rem *******************************CAR MAKERS****************************************
SQL> 
SQL> Rem Creation of Car maker table:
SQL> create table CAR_MAKERS (
  2  	 Id int constraint car_id_pk primary key,
  3  	 Maker varchar2(15),
  4  	 FullName varchar2(30),
  5  	 Country int constraint country_fk references Countries(countryID)
  6  );

Table created.

SQL> 
SQL> Rem Describing the Car maker table:
SQL> describe CAR_MAKERS;
 Name                                                                    Null?    Type
 ----------------------------------------------------------------------- -------- ------------------------------------------------
 ID                                                                      NOT NULL NUMBER(38)
 MAKER                                                                            VARCHAR2(15)
 FULLNAME                                                                         VARCHAR2(30)
 COUNTRY                                                                          NUMBER(38)

SQL> 
SQL> Rem Inserting the given tuples:
SQL> INSERT INTO CAR_MAKERS VALUES(1,'amc','American Motor Company',1);

1 row created.

SQL> INSERT INTO CAR_MAKERS VALUES(2,'volkswagen','Volkswagen',2);

1 row created.

SQL> INSERT INTO CAR_MAKERS VALUES(3,'bmw','BMW',2);

1 row created.

SQL> INSERT INTO CAR_MAKERS VALUES(4,'gm','General Motors',1);

1 row created.

SQL> INSERT INTO CAR_MAKERS VALUES(5,'ford','Ford Motor Company',1);

1 row created.

SQL> INSERT INTO CAR_MAKERS VALUES(6,'chrysler','Chrysler',1);

1 row created.

SQL> INSERT INTO CAR_MAKERS VALUES(7,'citroen','Citroen',3);

1 row created.

SQL> INSERT INTO CAR_MAKERS VALUES(8,'nissan','Nissan Motors',4);

1 row created.

SQL> INSERT INTO CAR_MAKERS VALUES(9,'fiat','Fiat',5);

1 row created.

SQL> INSERT INTO CAR_MAKERS VALUES(10,'hi','hi',null);

1 row created.

SQL> INSERT INTO CAR_MAKERS VALUES(11,'honda','Honda',4);

1 row created.

SQL> INSERT INTO CAR_MAKERS VALUES(12,'mazda','Mazda',4);

1 row created.

SQL> INSERT INTO CAR_MAKERS VALUES(13,'daimler benz','Daimler Benz',2);

1 row created.

SQL> INSERT INTO CAR_MAKERS VALUES(14,'opel','Opel',2);

1 row created.

SQL> INSERT INTO CAR_MAKERS VALUES(15,'peugeaut','Peugeaut',3);

1 row created.

SQL> INSERT INTO CAR_MAKERS VALUES(16,'renault','Renault',3);

1 row created.

SQL> INSERT INTO CAR_MAKERS VALUES(17,'saab','Saab',6);

1 row created.

SQL> INSERT INTO CAR_MAKERS VALUES(18,'subaru','Subaru',4);

1 row created.

SQL> INSERT INTO CAR_MAKERS VALUES(19,'toyota','Toyota',4);

1 row created.

SQL> INSERT INTO CAR_MAKERS VALUES(20,'triumph','Triumph',7);

1 row created.

SQL> INSERT INTO CAR_MAKERS VALUES(21,'volvo','Volvo',6);

1 row created.

SQL> INSERT INTO CAR_MAKERS VALUES(22,'kia','Kia Motors',8);

1 row created.

SQL> INSERT INTO CAR_MAKERS VALUES(23,'hyundai','Hyundai',8);

1 row created.

SQL> 
SQL> Rem The final car maker table:
SQL> select * from CAR_MAKERS;

        ID MAKER           FULLNAME                          COUNTRY                                                              
---------- --------------- ------------------------------ ----------                                                              
         1 amc             American Motor Company                  1                                                              
         2 volkswagen      Volkswagen                              2                                                              
         3 bmw             BMW                                     2                                                              
         4 gm              General Motors                          1                                                              
         5 ford            Ford Motor Company                      1                                                              
         6 chrysler        Chrysler                                1                                                              
         7 citroen         Citroen                                 3                                                              
         8 nissan          Nissan Motors                           4                                                              
         9 fiat            Fiat                                    5                                                              
        10 hi              hi                                                                                                     
        11 honda           Honda                                   4                                                              

        ID MAKER           FULLNAME                          COUNTRY                                                              
---------- --------------- ------------------------------ ----------                                                              
        12 mazda           Mazda                                   4                                                              
        13 daimler benz    Daimler Benz                            2                                                              
        14 opel            Opel                                    2                                                              
        15 peugeaut        Peugeaut                                3                                                              
        16 renault         Renault                                 3                                                              
        17 saab            Saab                                    6                                                              
        18 subaru          Subaru                                  4                                                              
        19 toyota          Toyota                                  4                                                              
        20 triumph         Triumph                                 7                                                              
        21 volvo           Volvo                                   6                                                              
        22 kia             Kia Motors                              8                                                              

        ID MAKER           FULLNAME                          COUNTRY                                                              
---------- --------------- ------------------------------ ----------                                                              
        23 hyundai         Hyundai                                 8                                                              

23 rows selected.

SQL> 
SQL> Rem *******************************MODEL DETAILS*****************************************
SQL> 
SQL> Rem Creating the model details table:
SQL> Create table MODEL_DETAILS(
  2  	     ModelId int constraint modelId_pk primary key,
  3  	     Maker int constraint Maker_fk references car_makers(Id),
  4  	     Model varchar2(15) constraint model_uk unique
  5  );

Table created.

SQL> 
SQL> Rem Describing the table:
SQL> Describe Model_details;
 Name                                                                    Null?    Type
 ----------------------------------------------------------------------- -------- ------------------------------------------------
 MODELID                                                                 NOT NULL NUMBER(38)
 MAKER                                                                            NUMBER(38)
 MODEL                                                                            VARCHAR2(15)

SQL> 
SQL> Rem Inserting the tuples into the table:
SQL> INSERT INTO MODEL_DETAILS VALUES(1,1,'amc');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(2,2,'audi');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(3,3,'bmw');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(4,4,'buick');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(5,4,'cadillac');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(6,5,'capri');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(7,4,'chevrolet');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(8,6,'chrysler');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(9,7,'citroen');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(10,8,'datsun');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(11,6,'dodge');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(12,9,'fiat');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(13,5,'ford');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(14,10,'hi');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(15,11,'honda');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(16,12,'mazda');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(17,13,'mercedes');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(18,13,'mercedes-benz');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(19,5,'mercury');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(20,8,'nissan');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(21,4,'oldsmobile');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(22,14,'opel');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(23,15,'peugeot');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(24,6,'plymouth');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(25,4,'pontiac');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(26,16,'renault');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(27,17,'saab');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(28,18,'subaru');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(29,19,'toyota');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(30,20,'triumph');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(31,2,'volkswagen');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(32,21,'volvo');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(33,22,'kia');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(34,23,'hyundai');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(35,6,'jeep');

1 row created.

SQL> INSERT INTO MODEL_DETAILS VALUES(36,19,'scion');

1 row created.

SQL> 
SQL> 
SQL> Rem The final table is:
SQL> Select * from Model_details;

   MODELID      MAKER MODEL                                                                                                       
---------- ---------- ---------------                                                                                             
         1          1 amc                                                                                                         
         2          2 audi                                                                                                        
         3          3 bmw                                                                                                         
         4          4 buick                                                                                                       
         5          4 cadillac                                                                                                    
         6          5 capri                                                                                                       
         7          4 chevrolet                                                                                                   
         8          6 chrysler                                                                                                    
         9          7 citroen                                                                                                     
        10          8 datsun                                                                                                      
        11          6 dodge                                                                                                       

   MODELID      MAKER MODEL                                                                                                       
---------- ---------- ---------------                                                                                             
        12          9 fiat                                                                                                        
        13          5 ford                                                                                                        
        14         10 hi                                                                                                          
        15         11 honda                                                                                                       
        16         12 mazda                                                                                                       
        17         13 mercedes                                                                                                    
        18         13 mercedes-benz                                                                                               
        19          5 mercury                                                                                                     
        20          8 nissan                                                                                                      
        21          4 oldsmobile                                                                                                  
        22         14 opel                                                                                                        

   MODELID      MAKER MODEL                                                                                                       
---------- ---------- ---------------                                                                                             
        23         15 peugeot                                                                                                     
        24          6 plymouth                                                                                                    
        25          4 pontiac                                                                                                     
        26         16 renault                                                                                                     
        27         17 saab                                                                                                        
        28         18 subaru                                                                                                      
        29         19 toyota                                                                                                      
        30         20 triumph                                                                                                     
        31          2 volkswagen                                                                                                  
        32         21 volvo                                                                                                       
        33         22 kia                                                                                                         

   MODELID      MAKER MODEL                                                                                                       
---------- ---------- ---------------                                                                                             
        34         23 hyundai                                                                                                     
        35          6 jeep                                                                                                        
        36         19 scion                                                                                                       

36 rows selected.

SQL> 
SQL> Rem *******************************CAR NAMES*****************************************
SQL> 
SQL> Rem Creating the Car names table:
SQL> create table CAR_NAMES(
  2  	 Id int constraint Id_pk primary key,
  3  	 Model varchar2(15) constraint model_fk references model_details(model),
  4  	 MakeDescription varchar2(40)
  5  );

Table created.

SQL> 
SQL> Rem Describing the car names Table:
SQL> describe CAR_NAMES;
 Name                                                                    Null?    Type
 ----------------------------------------------------------------------- -------- ------------------------------------------------
 ID                                                                      NOT NULL NUMBER(38)
 MODEL                                                                            VARCHAR2(15)
 MAKEDESCRIPTION                                                                  VARCHAR2(40)

SQL> 
SQL> Rem Inserting the given tuples into the table:
SQL> INSERT INTO CAR_NAMES VALUES(1,'chevrolet','chevrolet chevelle malibu');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(2,'buick','buick skylark 320');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(3,'plymouth','plymouth satellite');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(4,'amc','amc rebel sst');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(5,'ford','ford torino');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(6,'ford','ford galaxie 500');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(7,'chevrolet','chevrolet impala');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(8,'plymouth','plymouth fury iii');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(9,'pontiac','pontiac catalina');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(10,'amc','amc ambassador dpl');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(11,'citroen','citroen ds-21 pallas');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(12,'chevrolet','chevrolet chevelle concours (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(13,'ford','ford torino (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(14,'plymouth','plymouth satellite (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(15,'amc','amc rebel sst (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(16,'dodge','dodge challenger se');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(17,'plymouth','plymouth cuda 340');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(18,'ford','ford mustang boss 302');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(19,'chevrolet','chevrolet monte carlo');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(20,'buick','buick estate wagon (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(21,'toyota','toyota corona mark ii');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(22,'plymouth','plymouth duster');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(23,'amc','amc hornet');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(24,'ford','ford maverick');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(25,'datsun','datsun pl510');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(26,'volkswagen','volkswagen 1131 deluxe sedan');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(27,'peugeot','peugeot 504');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(28,'audi','audi 100 ls');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(29,'saab','saab 99e');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(30,'bmw','bmw 2002');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(31,'amc','amc gremlin');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(32,'ford','ford f250');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(33,'chevrolet','chevy c20');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(34,'dodge','dodge d200');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(35,'hi','hi 1200d');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(36,'datsun','datsun pl510');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(37,'chevrolet','chevrolet vega 2300');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(38,'toyota','toyota corona');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(39,'ford','ford pinto');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(40,'volkswagen','volkswagen super beetle 117');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(41,'amc','amc gremlin');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(42,'plymouth','plymouth satellite custom');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(43,'chevrolet','chevrolet chevelle malibu');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(44,'ford','ford torino 500');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(45,'amc','amc matador');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(46,'chevrolet','chevrolet impala');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(47,'pontiac','pontiac catalina brougham');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(48,'ford','ford galaxie 500');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(49,'plymouth','plymouth fury iii');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(50,'dodge','dodge monaco (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(51,'ford','ford country squire (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(52,'pontiac','pontiac safari (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(53,'amc','amc hornet sportabout (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(54,'chevrolet','chevrolet vega (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(55,'pontiac','pontiac firebird');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(56,'ford','ford mustang');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(57,'mercury','mercury capri 2000');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(58,'opel','opel 1900');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(59,'peugeot','peugeot 304');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(60,'fiat','fiat 124b');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(61,'toyota','toyota corolla 1200');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(62,'datsun','datsun 1200');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(63,'volkswagen','volkswagen model 111');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(64,'plymouth','plymouth cricket');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(65,'toyota','toyota corona hardtop');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(66,'dodge','dodge colt hardtop');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(67,'volkswagen','volkswagen type 3');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(68,'chevrolet','chevrolet vega');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(69,'ford','ford pinto runabout');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(70,'chevrolet','chevrolet impala');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(71,'pontiac','pontiac catalina');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(72,'plymouth','plymouth fury iii');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(73,'ford','ford galaxie 500');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(74,'amc','amc ambassador sst');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(75,'mercury','mercury marquis');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(76,'buick','buick lesabre custom');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(77,'oldsmobile','oldsmobile delta 88 royale');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(78,'chrysler','chrysler newport royal');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(79,'mazda','mazda rx2 coupe');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(80,'amc','amc matador (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(81,'chevrolet','chevrolet chevelle concours (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(82,'ford','ford gran torino (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(83,'plymouth','plymouth satellite custom (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(84,'volvo','volvo 145e (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(85,'volkswagen','volkswagen 411 (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(86,'peugeot','peugeot 504 (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(87,'renault','renault 12 (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(88,'ford','ford pinto (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(89,'datsun','datsun 510 (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(90,'toyota','toyota corona mark ii (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(91,'dodge','dodge colt (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(92,'toyota','toyota corolla 1600 (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(93,'buick','buick century 350');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(94,'amc','amc matador');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(95,'chevrolet','chevrolet malibu');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(96,'ford','ford gran torino');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(97,'dodge','dodge coronet custom');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(98,'mercury','mercury marquis brougham');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(99,'chevrolet','chevrolet caprice classic');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(100,'ford','ford ltd');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(101,'plymouth','plymouth fury gran sedan');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(102,'chrysler','chrysler new yorker brougham');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(103,'buick','buick electra 225 custom');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(104,'amc','amc ambassador brougham');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(105,'plymouth','plymouth valiant');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(106,'chevrolet','chevrolet nova custom');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(107,'amc','amc hornet');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(108,'ford','ford maverick');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(109,'plymouth','plymouth duster');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(110,'volkswagen','volkswagen super beetle');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(111,'chevrolet','chevrolet impala');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(112,'ford','ford country');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(113,'plymouth','plymouth custom suburb');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(114,'oldsmobile','oldsmobile vista cruiser');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(115,'amc','amc gremlin');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(116,'toyota','toyota carina');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(117,'chevrolet','chevrolet vega');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(118,'datsun','datsun 610');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(119,'mazda','mazda rx3');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(120,'ford','ford pinto');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(121,'mercury','mercury capri v6');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(122,'fiat','fiat 124 sport coupe');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(123,'chevrolet','chevrolet monte carlo s');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(124,'pontiac','pontiac grand prix');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(125,'fiat','fiat 128');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(126,'opel','opel manta');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(127,'audi','audi 100ls');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(128,'volvo','volvo 144ea');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(129,'dodge','dodge dart custom');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(130,'saab','saab 99le');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(131,'toyota','toyota mark ii');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(132,'oldsmobile','oldsmobile omega');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(133,'plymouth','plymouth duster');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(134,'ford','ford maverick');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(135,'amc','amc hornet');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(136,'chevrolet','chevrolet nova');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(137,'datsun','datsun b210');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(138,'ford','ford pinto');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(139,'toyota','toyota corolla 1200');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(140,'chevrolet','chevrolet vega');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(141,'chevrolet','chevrolet chevelle malibu classic');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(142,'amc','amc matador');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(143,'plymouth','plymouth satellite sebring');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(144,'ford','ford gran torino');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(145,'buick','buick century luxus (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(146,'dodge','dodge coronet custom (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(147,'ford','ford gran torino (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(148,'amc','amc matador (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(149,'audi','audi fox');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(150,'volkswagen','volkswagen dasher');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(151,'opel','opel manta');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(152,'toyota','toyota corona');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(153,'datsun','datsun 710');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(154,'dodge','dodge colt');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(155,'fiat','fiat 128');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(156,'fiat','fiat 124 tc');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(157,'honda','honda civic');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(158,'subaru','subaru');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(159,'fiat','fiat x1.9');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(160,'plymouth','plymouth valiant custom');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(161,'chevrolet','chevrolet nova');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(162,'mercury','mercury monarch');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(163,'ford','ford maverick');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(164,'pontiac','pontiac catalina');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(165,'chevrolet','chevrolet bel air');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(166,'plymouth','plymouth grand fury');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(167,'ford','ford ltd');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(168,'buick','buick century');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(169,'chevrolet','chevrolet chevelle malibu');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(170,'amc','amc matador');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(171,'plymouth','plymouth fury');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(172,'buick','buick skyhawk');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(173,'chevrolet','chevrolet monza 2+2');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(174,'ford','ford mustang ii');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(175,'toyota','toyota corolla');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(176,'ford','ford pinto');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(177,'amc','amc gremlin');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(178,'pontiac','pontiac astro');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(179,'toyota','toyota corona');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(180,'volkswagen','volkswagen dasher');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(181,'datsun','datsun 710');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(182,'ford','ford pinto');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(183,'volkswagen','volkswagen rabbit');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(184,'amc','amc pacer');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(185,'audi','audi 100ls');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(186,'peugeot','peugeot 504');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(187,'volvo','volvo 244dl');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(188,'saab','saab 99le');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(189,'honda','honda civic cvcc');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(190,'fiat','fiat 131');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(191,'opel','opel 1900');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(192,'capri','capri ii');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(193,'dodge','dodge colt');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(194,'renault','renault 12tl');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(195,'chevrolet','chevrolet chevelle malibu classic');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(196,'dodge','dodge coronet brougham');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(197,'amc','amc matador');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(198,'ford','ford gran torino');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(199,'plymouth','plymouth valiant');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(200,'chevrolet','chevrolet nova');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(201,'ford','ford maverick');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(202,'amc','amc hornet');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(203,'chevrolet','chevrolet chevette');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(204,'chevrolet','chevrolet woody');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(205,'volkswagen','vw rabbit');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(206,'honda','honda civic');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(207,'dodge','dodge aspen se');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(208,'ford','ford granada ghia');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(209,'pontiac','pontiac ventura sj');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(210,'amc','amc pacer d/l');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(211,'volkswagen','volkswagen rabbit');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(212,'datsun','datsun b-210');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(213,'toyota','toyota corolla');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(214,'ford','ford pinto');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(215,'volvo','volvo 245');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(216,'plymouth','plymouth volare premier v8');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(217,'peugeot','peugeot 504');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(218,'toyota','toyota mark ii');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(219,'mercedes-benz','mercedes-benz 280s');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(220,'cadillac','cadillac seville');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(221,'chevrolet','chevy c10');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(222,'ford','ford f108');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(223,'dodge','dodge d100');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(224,'honda','honda accord cvcc');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(225,'buick','buick opel isuzu deluxe');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(226,'renault','renault 5 gtl');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(227,'plymouth','plymouth arrow gs');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(228,'datsun','datsun f-10 hatchback');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(229,'chevrolet','chevrolet caprice classic');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(230,'oldsmobile','oldsmobile cutlass supreme');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(231,'dodge','dodge monaco brougham');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(232,'mercury','mercury cougar brougham');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(233,'chevrolet','chevrolet concours');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(234,'buick','buick skylark');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(235,'plymouth','plymouth volare custom');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(236,'ford','ford granada');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(237,'pontiac','pontiac grand prix lj');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(238,'chevrolet','chevrolet monte carlo landau');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(239,'chrysler','chrysler cordoba');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(240,'ford','ford thunderbird');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(241,'volkswagen','volkswagen rabbit custom');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(242,'pontiac','pontiac sunbird coupe');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(243,'toyota','toyota corolla liftback');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(244,'ford','ford mustang ii 2+2');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(245,'chevrolet','chevrolet chevette');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(246,'dodge','dodge colt m/m');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(247,'subaru','subaru dl');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(248,'volkswagen','volkswagen dasher');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(249,'datsun','datsun 810');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(250,'bmw','bmw 320i');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(251,'mazda','mazda rx-4');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(252,'volkswagen','volkswagen rabbit custom diesel');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(253,'ford','ford fiesta');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(254,'mazda','mazda glc deluxe');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(255,'datsun','datsun b210 gx');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(256,'honda','honda civic cvcc');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(257,'oldsmobile','oldsmobile cutlass salon brougham');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(258,'dodge','dodge diplomat');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(259,'mercury','mercury monarch ghia');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(260,'pontiac','pontiac phoenix lj');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(261,'chevrolet','chevrolet malibu');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(262,'ford','ford fairmont (auto)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(263,'ford','ford fairmont (man)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(264,'plymouth','plymouth volare');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(265,'amc','amc concord');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(266,'buick','buick century special');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(267,'mercury','mercury zephyr');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(268,'dodge','dodge aspen');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(269,'amc','amc concord d/l');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(270,'chevrolet','chevrolet monte carlo landau');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(271,'buick','buick regal sport coupe (turbo)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(272,'ford','ford futura');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(273,'dodge','dodge magnum xe');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(274,'chevrolet','chevrolet chevette');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(275,'toyota','toyota corona');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(276,'datsun','datsun 510');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(277,'dodge','dodge omni');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(278,'toyota','toyota celica gt liftback');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(279,'plymouth','plymouth sapporo');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(280,'oldsmobile','oldsmobile starfire sx');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(281,'datsun','datsun 200-sx');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(282,'audi','audi 5000');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(283,'volvo','volvo 264gl');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(284,'saab','saab 99gle');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(285,'peugeot','peugeot 604sl');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(286,'volkswagen','volkswagen scirocco');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(287,'honda','honda accord lx');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(288,'pontiac','pontiac lemans v6');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(289,'mercury','mercury zephyr 6');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(290,'ford','ford fairmont 4');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(291,'amc','amc concord dl 6');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(292,'dodge','dodge aspen 6');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(293,'chevrolet','chevrolet caprice classic');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(294,'ford','ford ltd landau');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(295,'mercury','mercury grand marquis');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(296,'dodge','dodge st. regis');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(297,'buick','buick estate wagon (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(298,'ford','ford country squire (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(299,'chevrolet','chevrolet malibu classic (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(300,'chrysler','chrysler lebaron town @ country (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(301,'volkswagen','vw rabbit custom');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(302,'mazda', 'mazda glc deluxe');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(303,'dodge','dodge colt hatchback custom');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(304,'amc','amc spirit dl');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(305,'mercedes','mercedes benz 300d');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(306,'cadillac','cadillac eldorado');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(307,'peugeot','peugeot 504');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(308,'oldsmobile','oldsmobile cutlass salon brougham');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(309,'plymouth','plymouth horizon');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(310,'plymouth','plymouth horizon tc3');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(311,'datsun','datsun 210');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(312,'fiat','fiat strada custom');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(313,'buick','buick skylark limited');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(314,'chevrolet','chevrolet citation');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(315,'oldsmobile','oldsmobile omega brougham');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(316,'pontiac','pontiac phoenix');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(317,'volkswagen','vw rabbit');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(318,'toyota','toyota corolla tercel');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(319,'chevrolet','chevrolet chevette');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(320,'datsun','datsun 310');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(321,'chevrolet','chevrolet citation');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(322,'ford','ford fairmont');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(323,'amc','amc concord');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(324,'dodge','dodge aspen');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(325,'audi','audi 4000');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(326,'toyota','toyota corona liftback');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(327,'mazda','mazda 626');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(328,'datsun','datsun 510 hatchback');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(329,'toyota','toyota corolla');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(330,'mazda','mazda glc');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(331,'dodge','dodge colt');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(332,'datsun','datsun 210');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(333,'volkswagen','vw rabbit c (diesel)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(334,'volkswagen','vw dasher (diesel)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(335,'audi','audi 5000s (diesel)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(336,'mercedes-benz','mercedes-benz 240d');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(337,'honda','honda civic 1500 gl');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(338,'renault','renault lecar deluxe');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(339,'subaru','subaru dl');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(340, 'volkswagen','volkswagen rabbit');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(341,'datsun','datsun 280-zx');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(342,'mazda','mazda rx-7 gs');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(343,'triumph','triumph tr7 coupe');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(344,'ford','ford mustang cobra');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(345,'honda','honda accord');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(346,'plymouth','plymouth reliant');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(347,'buick','buick skylark');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(348,'dodge','dodge aries wagon (sw)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(349,'chevrolet','chevrolet citation');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(350,'plymouth','plymouth reliant');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(351,'toyota','toyota starlet');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(352,'plymouth','plymouth champ');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(353,'honda','honda civic 1300');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(354,'subaru','subaru');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(355,'datsun','datsun 210 mpg');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(356,'toyota','toyota tercel');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(357,'mazda','mazda glc 4');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(358,'plymouth','plymouth horizon 4');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(359,'ford','ford escort 4w');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(360,'ford','ford escort 2h');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(361,'volkswagen','volkswagen jetta');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(362,'renault','renault 18i');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(363,'honda','honda prelude');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(364,'toyota','toyota corolla');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(365,'datsun','datsun 200sx');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(366,'mazda','mazda 626');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(367,'peugeot','peugeot 505s turbo diesel');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(368,'saab','saab 900s');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(369,'volvo','volvo diesel');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(370,'toyota','toyota cressida');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(371,'datsun','datsun 810 maxima');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(372,'buick','buick century');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(373,'oldsmobile','oldsmobile cutlass ls');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(374,'ford','ford granada gl');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(375,'chrysler','chrysler lebaron salon');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(376,'chevrolet','chevrolet cavalier');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(377,'chevrolet','chevrolet cavalier wagon');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(378,'chevrolet','chevrolet cavalier 2-door');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(379,'pontiac','pontiac j2000 se hatchback');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(380,'dodge','dodge aries se');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(381,'pontiac','pontiac phoenix');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(382,'ford','ford fairmont futura');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(383,'amc','amc concord dl');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(384,'volkswagen','volkswagen rabbit l');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(385,'mazda','mazda glc custom l');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(386,'mazda','mazda glc custom');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(387,'plymouth','plymouth horizon miser');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(388,'mercury','mercury lynx l');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(389,'nissan','nissan stanza xe');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(390,'honda','honda accord');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(391,'toyota','toyota corolla');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(392,'honda','honda civic');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(393,'honda','honda civic (auto)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(394,'datsun','datsun 310 gx');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(395,'buick','buick century limited');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(396,'oldsmobile','oldsmobile cutlass ciera (diesel)');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(397,'chrysler','chrysler lebaron medallion');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(398,'ford','ford granada l');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(399,'toyota','toyota celica gt');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(400,'dodge','dodge charger 2.2');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(401,'chevrolet','chevrolet camaro');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(402,'ford','ford mustang gl');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(403,'volkswagen','vw pickup');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(404,'dodge','dodge rampage');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(405,'ford','ford ranger');

1 row created.

SQL> INSERT INTO CAR_NAMES VALUES(406,'chevrolet','chevy s-10');

1 row created.

SQL> 
SQL> 
SQL> Rem The final Car names table:
SQL> select * from CAR_NAMES;

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
         1 chevrolet       chevrolet chevelle malibu                                                                              
         2 buick           buick skylark 320                                                                                      
         3 plymouth        plymouth satellite                                                                                     
         4 amc             amc rebel sst                                                                                          
         5 ford            ford torino                                                                                            
         6 ford            ford galaxie 500                                                                                       
         7 chevrolet       chevrolet impala                                                                                       
         8 plymouth        plymouth fury iii                                                                                      
         9 pontiac         pontiac catalina                                                                                       
        10 amc             amc ambassador dpl                                                                                     
        11 citroen         citroen ds-21 pallas                                                                                   

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
        12 chevrolet       chevrolet chevelle concours (sw)                                                                       
        13 ford            ford torino (sw)                                                                                       
        14 plymouth        plymouth satellite (sw)                                                                                
        15 amc             amc rebel sst (sw)                                                                                     
        16 dodge           dodge challenger se                                                                                    
        17 plymouth        plymouth cuda 340                                                                                      
        18 ford            ford mustang boss 302                                                                                  
        19 chevrolet       chevrolet monte carlo                                                                                  
        20 buick           buick estate wagon (sw)                                                                                
        21 toyota          toyota corona mark ii                                                                                  
        22 plymouth        plymouth duster                                                                                        

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
        23 amc             amc hornet                                                                                             
        24 ford            ford maverick                                                                                          
        25 datsun          datsun pl510                                                                                           
        26 volkswagen      volkswagen 1131 deluxe sedan                                                                           
        27 peugeot         peugeot 504                                                                                            
        28 audi            audi 100 ls                                                                                            
        29 saab            saab 99e                                                                                               
        30 bmw             bmw 2002                                                                                               
        31 amc             amc gremlin                                                                                            
        32 ford            ford f250                                                                                              
        33 chevrolet       chevy c20                                                                                              

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
        34 dodge           dodge d200                                                                                             
        35 hi              hi 1200d                                                                                               
        36 datsun          datsun pl510                                                                                           
        37 chevrolet       chevrolet vega 2300                                                                                    
        38 toyota          toyota corona                                                                                          
        39 ford            ford pinto                                                                                             
        40 volkswagen      volkswagen super beetle 117                                                                            
        41 amc             amc gremlin                                                                                            
        42 plymouth        plymouth satellite custom                                                                              
        43 chevrolet       chevrolet chevelle malibu                                                                              
        44 ford            ford torino 500                                                                                        

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
        45 amc             amc matador                                                                                            
        46 chevrolet       chevrolet impala                                                                                       
        47 pontiac         pontiac catalina brougham                                                                              
        48 ford            ford galaxie 500                                                                                       
        49 plymouth        plymouth fury iii                                                                                      
        50 dodge           dodge monaco (sw)                                                                                      
        51 ford            ford country squire (sw)                                                                               
        52 pontiac         pontiac safari (sw)                                                                                    
        53 amc             amc hornet sportabout (sw)                                                                             
        54 chevrolet       chevrolet vega (sw)                                                                                    
        55 pontiac         pontiac firebird                                                                                       

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
        56 ford            ford mustang                                                                                           
        57 mercury         mercury capri 2000                                                                                     
        58 opel            opel 1900                                                                                              
        59 peugeot         peugeot 304                                                                                            
        60 fiat            fiat 124b                                                                                              
        61 toyota          toyota corolla 1200                                                                                    
        62 datsun          datsun 1200                                                                                            
        63 volkswagen      volkswagen model 111                                                                                   
        64 plymouth        plymouth cricket                                                                                       
        65 toyota          toyota corona hardtop                                                                                  
        66 dodge           dodge colt hardtop                                                                                     

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
        67 volkswagen      volkswagen type 3                                                                                      
        68 chevrolet       chevrolet vega                                                                                         
        69 ford            ford pinto runabout                                                                                    
        70 chevrolet       chevrolet impala                                                                                       
        71 pontiac         pontiac catalina                                                                                       
        72 plymouth        plymouth fury iii                                                                                      
        73 ford            ford galaxie 500                                                                                       
        74 amc             amc ambassador sst                                                                                     
        75 mercury         mercury marquis                                                                                        
        76 buick           buick lesabre custom                                                                                   
        77 oldsmobile      oldsmobile delta 88 royale                                                                             

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
        78 chrysler        chrysler newport royal                                                                                 
        79 mazda           mazda rx2 coupe                                                                                        
        80 amc             amc matador (sw)                                                                                       
        81 chevrolet       chevrolet chevelle concours (sw)                                                                       
        82 ford            ford gran torino (sw)                                                                                  
        83 plymouth        plymouth satellite custom (sw)                                                                         
        84 volvo           volvo 145e (sw)                                                                                        
        85 volkswagen      volkswagen 411 (sw)                                                                                    
        86 peugeot         peugeot 504 (sw)                                                                                       
        87 renault         renault 12 (sw)                                                                                        
        88 ford            ford pinto (sw)                                                                                        

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
        89 datsun          datsun 510 (sw)                                                                                        
        90 toyota          toyota corona mark ii (sw)                                                                             
        91 dodge           dodge colt (sw)                                                                                        
        92 toyota          toyota corolla 1600 (sw)                                                                               
        93 buick           buick century 350                                                                                      
        94 amc             amc matador                                                                                            
        95 chevrolet       chevrolet malibu                                                                                       
        96 ford            ford gran torino                                                                                       
        97 dodge           dodge coronet custom                                                                                   
        98 mercury         mercury marquis brougham                                                                               
        99 chevrolet       chevrolet caprice classic                                                                              

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       100 ford            ford ltd                                                                                               
       101 plymouth        plymouth fury gran sedan                                                                               
       102 chrysler        chrysler new yorker brougham                                                                           
       103 buick           buick electra 225 custom                                                                               
       104 amc             amc ambassador brougham                                                                                
       105 plymouth        plymouth valiant                                                                                       
       106 chevrolet       chevrolet nova custom                                                                                  
       107 amc             amc hornet                                                                                             
       108 ford            ford maverick                                                                                          
       109 plymouth        plymouth duster                                                                                        
       110 volkswagen      volkswagen super beetle                                                                                

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       111 chevrolet       chevrolet impala                                                                                       
       112 ford            ford country                                                                                           
       113 plymouth        plymouth custom suburb                                                                                 
       114 oldsmobile      oldsmobile vista cruiser                                                                               
       115 amc             amc gremlin                                                                                            
       116 toyota          toyota carina                                                                                          
       117 chevrolet       chevrolet vega                                                                                         
       118 datsun          datsun 610                                                                                             
       119 mazda           mazda rx3                                                                                              
       120 ford            ford pinto                                                                                             
       121 mercury         mercury capri v6                                                                                       

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       122 fiat            fiat 124 sport coupe                                                                                   
       123 chevrolet       chevrolet monte carlo s                                                                                
       124 pontiac         pontiac grand prix                                                                                     
       125 fiat            fiat 128                                                                                               
       126 opel            opel manta                                                                                             
       127 audi            audi 100ls                                                                                             
       128 volvo           volvo 144ea                                                                                            
       129 dodge           dodge dart custom                                                                                      
       130 saab            saab 99le                                                                                              
       131 toyota          toyota mark ii                                                                                         
       132 oldsmobile      oldsmobile omega                                                                                       

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       133 plymouth        plymouth duster                                                                                        
       134 ford            ford maverick                                                                                          
       135 amc             amc hornet                                                                                             
       136 chevrolet       chevrolet nova                                                                                         
       137 datsun          datsun b210                                                                                            
       138 ford            ford pinto                                                                                             
       139 toyota          toyota corolla 1200                                                                                    
       140 chevrolet       chevrolet vega                                                                                         
       141 chevrolet       chevrolet chevelle malibu classic                                                                      
       142 amc             amc matador                                                                                            
       143 plymouth        plymouth satellite sebring                                                                             

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       144 ford            ford gran torino                                                                                       
       145 buick           buick century luxus (sw)                                                                               
       146 dodge           dodge coronet custom (sw)                                                                              
       147 ford            ford gran torino (sw)                                                                                  
       148 amc             amc matador (sw)                                                                                       
       149 audi            audi fox                                                                                               
       150 volkswagen      volkswagen dasher                                                                                      
       151 opel            opel manta                                                                                             
       152 toyota          toyota corona                                                                                          
       153 datsun          datsun 710                                                                                             
       154 dodge           dodge colt                                                                                             

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       155 fiat            fiat 128                                                                                               
       156 fiat            fiat 124 tc                                                                                            
       157 honda           honda civic                                                                                            
       158 subaru          subaru                                                                                                 
       159 fiat            fiat x1.9                                                                                              
       160 plymouth        plymouth valiant custom                                                                                
       161 chevrolet       chevrolet nova                                                                                         
       162 mercury         mercury monarch                                                                                        
       163 ford            ford maverick                                                                                          
       164 pontiac         pontiac catalina                                                                                       
       165 chevrolet       chevrolet bel air                                                                                      

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       166 plymouth        plymouth grand fury                                                                                    
       167 ford            ford ltd                                                                                               
       168 buick           buick century                                                                                          
       169 chevrolet       chevrolet chevelle malibu                                                                              
       170 amc             amc matador                                                                                            
       171 plymouth        plymouth fury                                                                                          
       172 buick           buick skyhawk                                                                                          
       173 chevrolet       chevrolet monza 2+2                                                                                    
       174 ford            ford mustang ii                                                                                        
       175 toyota          toyota corolla                                                                                         
       176 ford            ford pinto                                                                                             

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       177 amc             amc gremlin                                                                                            
       178 pontiac         pontiac astro                                                                                          
       179 toyota          toyota corona                                                                                          
       180 volkswagen      volkswagen dasher                                                                                      
       181 datsun          datsun 710                                                                                             
       182 ford            ford pinto                                                                                             
       183 volkswagen      volkswagen rabbit                                                                                      
       184 amc             amc pacer                                                                                              
       185 audi            audi 100ls                                                                                             
       186 peugeot         peugeot 504                                                                                            
       187 volvo           volvo 244dl                                                                                            

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       188 saab            saab 99le                                                                                              
       189 honda           honda civic cvcc                                                                                       
       190 fiat            fiat 131                                                                                               
       191 opel            opel 1900                                                                                              
       192 capri           capri ii                                                                                               
       193 dodge           dodge colt                                                                                             
       194 renault         renault 12tl                                                                                           
       195 chevrolet       chevrolet chevelle malibu classic                                                                      
       196 dodge           dodge coronet brougham                                                                                 
       197 amc             amc matador                                                                                            
       198 ford            ford gran torino                                                                                       

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       199 plymouth        plymouth valiant                                                                                       
       200 chevrolet       chevrolet nova                                                                                         
       201 ford            ford maverick                                                                                          
       202 amc             amc hornet                                                                                             
       203 chevrolet       chevrolet chevette                                                                                     
       204 chevrolet       chevrolet woody                                                                                        
       205 volkswagen      vw rabbit                                                                                              
       206 honda           honda civic                                                                                            
       207 dodge           dodge aspen se                                                                                         
       208 ford            ford granada ghia                                                                                      
       209 pontiac         pontiac ventura sj                                                                                     

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       210 amc             amc pacer d/l                                                                                          
       211 volkswagen      volkswagen rabbit                                                                                      
       212 datsun          datsun b-210                                                                                           
       213 toyota          toyota corolla                                                                                         
       214 ford            ford pinto                                                                                             
       215 volvo           volvo 245                                                                                              
       216 plymouth        plymouth volare premier v8                                                                             
       217 peugeot         peugeot 504                                                                                            
       218 toyota          toyota mark ii                                                                                         
       219 mercedes-benz   mercedes-benz 280s                                                                                     
       220 cadillac        cadillac seville                                                                                       

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       221 chevrolet       chevy c10                                                                                              
       222 ford            ford f108                                                                                              
       223 dodge           dodge d100                                                                                             
       224 honda           honda accord cvcc                                                                                      
       225 buick           buick opel isuzu deluxe                                                                                
       226 renault         renault 5 gtl                                                                                          
       227 plymouth        plymouth arrow gs                                                                                      
       228 datsun          datsun f-10 hatchback                                                                                  
       229 chevrolet       chevrolet caprice classic                                                                              
       230 oldsmobile      oldsmobile cutlass supreme                                                                             
       231 dodge           dodge monaco brougham                                                                                  

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       232 mercury         mercury cougar brougham                                                                                
       233 chevrolet       chevrolet concours                                                                                     
       234 buick           buick skylark                                                                                          
       235 plymouth        plymouth volare custom                                                                                 
       236 ford            ford granada                                                                                           
       237 pontiac         pontiac grand prix lj                                                                                  
       238 chevrolet       chevrolet monte carlo landau                                                                           
       239 chrysler        chrysler cordoba                                                                                       
       240 ford            ford thunderbird                                                                                       
       241 volkswagen      volkswagen rabbit custom                                                                               
       242 pontiac         pontiac sunbird coupe                                                                                  

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       243 toyota          toyota corolla liftback                                                                                
       244 ford            ford mustang ii 2+2                                                                                    
       245 chevrolet       chevrolet chevette                                                                                     
       246 dodge           dodge colt m/m                                                                                         
       247 subaru          subaru dl                                                                                              
       248 volkswagen      volkswagen dasher                                                                                      
       249 datsun          datsun 810                                                                                             
       250 bmw             bmw 320i                                                                                               
       251 mazda           mazda rx-4                                                                                             
       252 volkswagen      volkswagen rabbit custom diesel                                                                        
       253 ford            ford fiesta                                                                                            

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       254 mazda           mazda glc deluxe                                                                                       
       255 datsun          datsun b210 gx                                                                                         
       256 honda           honda civic cvcc                                                                                       
       257 oldsmobile      oldsmobile cutlass salon brougham                                                                      
       258 dodge           dodge diplomat                                                                                         
       259 mercury         mercury monarch ghia                                                                                   
       260 pontiac         pontiac phoenix lj                                                                                     
       261 chevrolet       chevrolet malibu                                                                                       
       262 ford            ford fairmont (auto)                                                                                   
       263 ford            ford fairmont (man)                                                                                    
       264 plymouth        plymouth volare                                                                                        

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       265 amc             amc concord                                                                                            
       266 buick           buick century special                                                                                  
       267 mercury         mercury zephyr                                                                                         
       268 dodge           dodge aspen                                                                                            
       269 amc             amc concord d/l                                                                                        
       270 chevrolet       chevrolet monte carlo landau                                                                           
       271 buick           buick regal sport coupe (turbo)                                                                        
       272 ford            ford futura                                                                                            
       273 dodge           dodge magnum xe                                                                                        
       274 chevrolet       chevrolet chevette                                                                                     
       275 toyota          toyota corona                                                                                          

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       276 datsun          datsun 510                                                                                             
       277 dodge           dodge omni                                                                                             
       278 toyota          toyota celica gt liftback                                                                              
       279 plymouth        plymouth sapporo                                                                                       
       280 oldsmobile      oldsmobile starfire sx                                                                                 
       281 datsun          datsun 200-sx                                                                                          
       282 audi            audi 5000                                                                                              
       283 volvo           volvo 264gl                                                                                            
       284 saab            saab 99gle                                                                                             
       285 peugeot         peugeot 604sl                                                                                          
       286 volkswagen      volkswagen scirocco                                                                                    

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       287 honda           honda accord lx                                                                                        
       288 pontiac         pontiac lemans v6                                                                                      
       289 mercury         mercury zephyr 6                                                                                       
       290 ford            ford fairmont 4                                                                                        
       291 amc             amc concord dl 6                                                                                       
       292 dodge           dodge aspen 6                                                                                          
       293 chevrolet       chevrolet caprice classic                                                                              
       294 ford            ford ltd landau                                                                                        
       295 mercury         mercury grand marquis                                                                                  
       296 dodge           dodge st. regis                                                                                        
       297 buick           buick estate wagon (sw)                                                                                

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       298 ford            ford country squire (sw)                                                                               
       299 chevrolet       chevrolet malibu classic (sw)                                                                          
       300 chrysler        chrysler lebaron town @ country (sw)                                                                   
       301 volkswagen      vw rabbit custom                                                                                       
       302 mazda           mazda glc deluxe                                                                                       
       303 dodge           dodge colt hatchback custom                                                                            
       304 amc             amc spirit dl                                                                                          
       305 mercedes        mercedes benz 300d                                                                                     
       306 cadillac        cadillac eldorado                                                                                      
       307 peugeot         peugeot 504                                                                                            
       308 oldsmobile      oldsmobile cutlass salon brougham                                                                      

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       309 plymouth        plymouth horizon                                                                                       
       310 plymouth        plymouth horizon tc3                                                                                   
       311 datsun          datsun 210                                                                                             
       312 fiat            fiat strada custom                                                                                     
       313 buick           buick skylark limited                                                                                  
       314 chevrolet       chevrolet citation                                                                                     
       315 oldsmobile      oldsmobile omega brougham                                                                              
       316 pontiac         pontiac phoenix                                                                                        
       317 volkswagen      vw rabbit                                                                                              
       318 toyota          toyota corolla tercel                                                                                  
       319 chevrolet       chevrolet chevette                                                                                     

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       320 datsun          datsun 310                                                                                             
       321 chevrolet       chevrolet citation                                                                                     
       322 ford            ford fairmont                                                                                          
       323 amc             amc concord                                                                                            
       324 dodge           dodge aspen                                                                                            
       325 audi            audi 4000                                                                                              
       326 toyota          toyota corona liftback                                                                                 
       327 mazda           mazda 626                                                                                              
       328 datsun          datsun 510 hatchback                                                                                   
       329 toyota          toyota corolla                                                                                         
       330 mazda           mazda glc                                                                                              

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       331 dodge           dodge colt                                                                                             
       332 datsun          datsun 210                                                                                             
       333 volkswagen      vw rabbit c (diesel)                                                                                   
       334 volkswagen      vw dasher (diesel)                                                                                     
       335 audi            audi 5000s (diesel)                                                                                    
       336 mercedes-benz   mercedes-benz 240d                                                                                     
       337 honda           honda civic 1500 gl                                                                                    
       338 renault         renault lecar deluxe                                                                                   
       339 subaru          subaru dl                                                                                              
       340 volkswagen      volkswagen rabbit                                                                                      
       341 datsun          datsun 280-zx                                                                                          

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       342 mazda           mazda rx-7 gs                                                                                          
       343 triumph         triumph tr7 coupe                                                                                      
       344 ford            ford mustang cobra                                                                                     
       345 honda           honda accord                                                                                           
       346 plymouth        plymouth reliant                                                                                       
       347 buick           buick skylark                                                                                          
       348 dodge           dodge aries wagon (sw)                                                                                 
       349 chevrolet       chevrolet citation                                                                                     
       350 plymouth        plymouth reliant                                                                                       
       351 toyota          toyota starlet                                                                                         
       352 plymouth        plymouth champ                                                                                         

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       353 honda           honda civic 1300                                                                                       
       354 subaru          subaru                                                                                                 
       355 datsun          datsun 210 mpg                                                                                         
       356 toyota          toyota tercel                                                                                          
       357 mazda           mazda glc 4                                                                                            
       358 plymouth        plymouth horizon 4                                                                                     
       359 ford            ford escort 4w                                                                                         
       360 ford            ford escort 2h                                                                                         
       361 volkswagen      volkswagen jetta                                                                                       
       362 renault         renault 18i                                                                                            
       363 honda           honda prelude                                                                                          

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       364 toyota          toyota corolla                                                                                         
       365 datsun          datsun 200sx                                                                                           
       366 mazda           mazda 626                                                                                              
       367 peugeot         peugeot 505s turbo diesel                                                                              
       368 saab            saab 900s                                                                                              
       369 volvo           volvo diesel                                                                                           
       370 toyota          toyota cressida                                                                                        
       371 datsun          datsun 810 maxima                                                                                      
       372 buick           buick century                                                                                          
       373 oldsmobile      oldsmobile cutlass ls                                                                                  
       374 ford            ford granada gl                                                                                        

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       375 chrysler        chrysler lebaron salon                                                                                 
       376 chevrolet       chevrolet cavalier                                                                                     
       377 chevrolet       chevrolet cavalier wagon                                                                               
       378 chevrolet       chevrolet cavalier 2-door                                                                              
       379 pontiac         pontiac j2000 se hatchback                                                                             
       380 dodge           dodge aries se                                                                                         
       381 pontiac         pontiac phoenix                                                                                        
       382 ford            ford fairmont futura                                                                                   
       383 amc             amc concord dl                                                                                         
       384 volkswagen      volkswagen rabbit l                                                                                    
       385 mazda           mazda glc custom l                                                                                     

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       386 mazda           mazda glc custom                                                                                       
       387 plymouth        plymouth horizon miser                                                                                 
       388 mercury         mercury lynx l                                                                                         
       389 nissan          nissan stanza xe                                                                                       
       390 honda           honda accord                                                                                           
       391 toyota          toyota corolla                                                                                         
       392 honda           honda civic                                                                                            
       393 honda           honda civic (auto)                                                                                     
       394 datsun          datsun 310 gx                                                                                          
       395 buick           buick century limited                                                                                  
       396 oldsmobile      oldsmobile cutlass ciera (diesel)                                                                      

        ID MODEL           MAKEDESCRIPTION                                                                                        
---------- --------------- ----------------------------------------                                                               
       397 chrysler        chrysler lebaron medallion                                                                             
       398 ford            ford granada l                                                                                         
       399 toyota          toyota celica gt                                                                                       
       400 dodge           dodge charger 2.2                                                                                      
       401 chevrolet       chevrolet camaro                                                                                       
       402 ford            ford mustang gl                                                                                        
       403 volkswagen      vw pickup                                                                                              
       404 dodge           dodge rampage                                                                                          
       405 ford            ford ranger                                                                                            
       406 chevrolet       chevy s-10                                                                                             

406 rows selected.

SQL> 
SQL> Rem *******************************CAR DETAILS*****************************************
SQL> 
SQL> Rem Creating the Car details table:
SQL> create table CAR_DETAILS(
  2  	 Id int constraint Id_fk references car_names(Id),
  3  	 MPG float,
  4  	 Cylinders float,
  5  	 Edispl float,
  6  	 Horsepower float,
  7  	 Weight float,
  8  	 Accelerate float,
  9  	 Year int
 10  );

Table created.

SQL> 
SQL> Rem Describing the car details table:
SQL> describe CAR_DETAILS;
 Name                                                                    Null?    Type
 ----------------------------------------------------------------------- -------- ------------------------------------------------
 ID                                                                               NUMBER(38)
 MPG                                                                              FLOAT(126)
 CYLINDERS                                                                        FLOAT(126)
 EDISPL                                                                           FLOAT(126)
 HORSEPOWER                                                                       FLOAT(126)
 WEIGHT                                                                           FLOAT(126)
 ACCELERATE                                                                       FLOAT(126)
 YEAR                                                                             NUMBER(38)

SQL> 
SQL> 
SQL> Rem Inserting the given tuples into the table:
SQL> INSERT INTO CAR_dETAILS VALUES(1,18,8,307,130,3504,12,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(2,15,8,350,165,3693,11.5,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(3,18,8,318,150,3436,11,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(4,16,8,304,150,3433,12,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(5,17,8,302,140,3449,10.5,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(6,15,8,429,198,4341,10,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(7,14,8,454,220,4354,9,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(8,14,8,440,215,4312,8.5,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(9,14,8,455,225,4425,10,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(10,15,8,390,190,3850,8.5,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(11,null,4,133,115,3090,17.5,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(12,null,8,350,165,4142,11.5,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(13,null,8,351,153,4034,11,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(14,null,8,383,175,4166,10.5,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(15,null,8,360,175,3850,11,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(16,15,8,383,170,3563,10,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(17,14,8,340,160,3609,8,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(18,null,8,302,140,3353,8,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(19,15,8,400,150,3761,9.5,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(20,14,8,455,225,3086,10,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(21,24,4,113,95,2372,15,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(22,22,6,198,95,2833,15.5,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(23,18,6,199,97,2774,15.5,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(24,21,6,200,85,2587,16,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(25,27,4,97,88,2130,14.5,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(26,26,4,97,46,1835,20.5,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(27,25,4,110,87,2672,17.5,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(28,24,4,107,90,2430,14.5,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(29,25,4,104,95,2375,17.5,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(30,26,4,121,113,2234,12.5,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(31,21,6,199,90,2648,15,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(32,10,8,360,215,4615,14,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(33,10,8,307,200,4376,15,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(34,11,8,318,210,4382,13.5,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(35,9,8,304,193,4732,18.5,1970);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(36,27,4,97,88,2130,14.5,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(37,28,4,140,90,2264,15.5,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(38,25,4,113,95,2228,14,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(39,25,4,98,null,2046,19,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(40,null,4,97,48,1978,20,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(41,19,6,232,100,2634,13,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(42,16,6,225,105,3439,15.5,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(43,17,6,250,100,3329,15.5,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(44,19,6,250,88,3302,15.5,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(45,18,6,232,100,3288,15.5,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(46,14,8,350,165,4209,12,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(47,14,8,400,175,4464,11.5,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(48,14,8,351,153,4154,13.5,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(49,14,8,318,150,4096,13,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(50,12,8,383,180,4955,11.5,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(51,13,8,400,170,4746,12,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(52,13,8,400,175,5140,12,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(53,18,6,258,110,2962,13.5,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(54,22,4,140,72,2408,19,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(55,19,6,250,100,3282,15,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(56,18,6,250,88,3139,14.5,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(57,23,4,122,86,2220,14,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(58,28,4,116,90,2123,14,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(59,30,4,79,70,2074,19.5,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(60,30,4,88,76,2065,14.5,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(61,31,4,71,65,1773,19,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(62,35,4,72,69,1613,18,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(63,27,4,97,60,1834,19,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(64,26,4,91,70,1955,20.5,1971);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(65,24,4,113,95,2278,15.5,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(66,25,4,97.5,80,2126,17,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(67,23,4,97,54,2254,23.5,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(68,20,4,140,90,2408,19.5,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(69,21,4,122,86,2226,16.5,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(70,13,8,350,165,4274,12,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(71,14,8,400,175,4385,12,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(72,15,8,318,150,4135,13.5,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(73,14,8,351,153,4129,13,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(74,17,8,304,150,3672,11.5,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(75,11,8,429,208,4633,11,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(76,13,8,350,155,4502,13.5,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(77,12,8,350,160,4456,13.5,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(78,13,8,400,190,4422,12.5,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(79,19,3,70,97,2330,13.5,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(80,15,8,304,150,3892,12.5,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(81,13,8,307,130,4098,14,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(82,13,8,302,140,4294,16,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(83,14,8,318,150,4077,14,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(84,18,4,121,112,2933,14.5,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(85,22,4,121,76,2511,18,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(86,21,4,120,87,2979,19.5,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(87,26,4,96,69,2189,18,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(88,22,4,122,86,2395,16,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(89,28,4,97,92,2288,17,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(90,23,4,120,97,2506,14.5,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(91,28,4,98,80,2164,15,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(92,27,4,97,88,2100,16.5,1972);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(93,13,8,350,175,4100,13,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(94,14,8,304,150,3672,11.5,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(95,13,8,350,145,3988,13,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(96,14,8,302,137,4042,14.5,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(97,15,8,318,150,3777,12.5,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(98,12,8,429,198,4952,11.5,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(99,13,8,400,150,4464,12,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(100,13,8,351,158,4363,13,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(101,14,8,318,150,4237,14.5,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(102,13,8,440,215,4735,11,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(103,12,8,455,225,4951,11,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(104,13,8,360,175,3821,11,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(105,18,6,225,105,3121,16.5,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(106,16,6,250,100,3278,18,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(107,18,6,232,100,2945,16,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(108,18,6,250,88,3021,16.5,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(109,23,6,198,95,2904,16,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(110,26,4,97,46,1950,21,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(111,11,8,400,150,4997,14,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(112,12,8,400,167,4906,12.5,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(113,13,8,360,170,4654,13,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(114,12,8,350,180,4499,12.5,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(115,18,6,232,100,2789,15,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(116,20,4,97,88,2279,19,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(117,21,4,140,72,2401,19.5,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(118,22,4,108,94,2379,16.5,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(119,18,3,70,90,2124,13.5,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(120,19,4,122,85,2310,18.5,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(121,21,6,155,107,2472,14,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(122,26,4,98,90,2265,15.5,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(123,15,8,350,145,4082,13,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(124,16,8,400,230,4278,9.5,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(125,29,4,68,49,1867,19.5,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(126,24,4,116,75,2158,15.5,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(127,20,4,114,91,2582,14,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(128,19,4,121,112,2868,15.5,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(129,15,8,318,150,3399,11,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(130,24,4,121,110,2660,14,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(131,20,6,156,122,2807,13.5,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(132,11,8,350,180,3664,11,1973);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(133,20,6,198,95,3102,16.5,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(134,21,6,200,null,2875,17,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(135,19,6,232,100,2901,16,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(136,15,6,250,100,3336,17,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(137,31,4,79,67,1950,19,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(138,26,4,122,80,2451,16.5,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(139,32,4,71,65,1836,21,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(140,25,4,140,75,2542,17,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(141,16,6,250,100,3781,17,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(142,16,6,258,110,3632,18,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(143,18,6,225,105,3613,16.5,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(144,16,8,302,140,4141,14,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(145,13,8,350,150,4699,14.5,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(146,14,8,318,150,4457,13.5,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(147,14,8,302,140,4638,16,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(148,14,8,304,150,4257,15.5,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(149,29,4,98,83,2219,16.5,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(150,26,4,79,67,1963,15.5,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(151,26,4,97,78,2300,14.5,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(152,31,4,76,52,1649,16.5,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(153,32,4,83,61,2003,19,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(154,28,4,90,75,2125,14.5,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(155,24,4,90,75,2108,15.5,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(156,26,4,116,75,2246,14,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(157,24,4,120,97,2489,15,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(158,26,4,108,93,2391,15.5,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(159,31,4,79,67,2000,16,1974);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(160,19,6,225,95,3264,16,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(161,18,6,250,105,3459,16,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(162,15,6,250,72,3432,21,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(163,15,6,250,72,3158,19.5,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(164,16,8,400,170,4668,11.5,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(165,15,8,350,145,4440,14,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(166,16,8,318,150,4498,14.5,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(167,14,8,351,148,4657,13.5,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(168,17,6,231,110,3907,21,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(169,16,6,250,105,3897,18.5,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(170,15,6,258,110,3730,19,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(171,18,6,225,95,3785,19,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(172,21,6,231,110,3039,15,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(173,20,8,262,110,3221,13.5,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(174,13,8,302,129,3169,12,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(175,29,4,97,75,2171,16,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(176,23,4,140,83,2639,17,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(177,20,6,232,100,2914,16,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(178,23,4,140,78,2592,18.5,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(179,24,4,134,96,2702,13.5,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(180,25,4,90,71,2223,16.5,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(181,24,4,119,97,2545,17,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(182,18,6,171,97,2984,14.5,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(183,29,4,90,70,1937,14,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(184,19,6,232,90,3211,17,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(185,23,4,115,95,2694,15,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(186,23,4,120,88,2957,17,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(187,22,4,121,98,2945,14.5,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(188,25,4,121,115,2671,13.5,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(189,33,4,91,53,1795,17.5,1975);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(190,28,4,107,86,2464,15.5,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(191,25,4,116,81,2220,16.9,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(192,25,4,140,92,2572,14.9,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(193,26,4,98,79,2255,17.7,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(194,27,4,101,83,2202,15.3,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(195,17.5,8,305,140,4215,13,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(196,16,8,318,150,4190,13,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(197,15.5,8,304,120,3962,13.9,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(198,14.5,8,351,152,4215,12.8,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(199,22,6,225,100,3233,15.4,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(200,22,6,250,105,3353,14.5,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(201,24,6,200,81,3012,17.6,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(202,22.5,6,232,90,3085,17.6,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(203,29,4,85,52,2035,22.2,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(204,24.5,4,98,60,2164,22.1,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(205,29,4,90,70,1937,14.2,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(206,33,4,91,53,1795,17.4,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(207,20,6,225,100,3651,17.7,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(208,18,6,250,78,3574,21,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(209,18.5,6,250,110,3645,16.2,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(210,17.5,6,258,95,3193,17.8,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(211,29.5,4,97,71,1825,12.2,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(212,32,4,85,70,1990,17,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(213,28,4,97,75,2155,16.4,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(214,26.5,4,140,72,2565,13.6,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(215,20,4,130,102,3150,15.7,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(216,13,8,318,150,3940,13.2,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(217,19,4,120,88,3270,21.9,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(218,19,6,156,108,2930,15.5,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(219,16.5,6,168,120,3820,16.7,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(220,16.5,8,350,180,4380,12.1,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(221,13,8,350,145,4055,12,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(222,13,8,302,130,3870,15,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(223,13,8,318,150,3755,14,1976);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(224,31.5,4,98,68,2045,18.5,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(225,30,4,111,80,2155,14.8,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(226,36,4,79,58,1825,18.6,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(227,25.5,4,122,96,2300,15.5,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(228,33.5,4,85,70,1945,16.8,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(229,17.5,8,305,145,3880,12.5,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(230,17,8,260,110,4060,19,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(231,15.5,8,318,145,4140,13.7,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(232,15,8,302,130,4295,14.9,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(233,17.5,6,250,110,3520,16.4,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(234,20.5,6,231,105,3425,16.9,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(235,19,6,225,100,3630,17.7,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(236,18.5,6,250,98,3525,19,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(237,16,8,400,180,4220,11.1,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(238,15.5,8,350,170,4165,11.4,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(239,15.5,8,400,190,4325,12.2,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(240,16,8,351,149,4335,14.5,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(241,29,4,97,78,1940,14.5,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(242,24.5,4,151,88,2740,16,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(243,26,4,97,75,2265,18.2,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(244,25.5,4,140,89,2755,15.8,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(245,30.5,4,98,63,2051,17,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(246,33.5,4,98,83,2075,15.9,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(247,30,4,97,67,1985,16.4,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(248,30.5,4,97,78,2190,14.1,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(249,22,6,146,97,2815,14.5,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(250,21.5,4,121,110,2600,12.8,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(251,21.5,3,80,110,2720,13.5,1977);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(252,43.1,4,90,48,1985,21.5,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(253,36.1,4,98,66,1800,14.4,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(254,32.8,4,78,52,1985,19.4,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(255,39.4,4,85,70,2070,18.6,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(256,36.1,4,91,60,1800,16.4,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(257,19.9,8,260,110,3365,15.5,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(258,19.4,8,318,140,3735,13.2,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(259,20.2,8,302,139,3570,12.8,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(260,19.2,6,231,105,3535,19.2,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(261,20.5,6,200,95,3155,18.2,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(262,20.2,6,200,85,2965,15.8,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(263,25.1,4,140,88,2720,15.4,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(264,20.5,6,225,100,3430,17.2,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(265,19.4,6,232,90,3210,17.2,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(266,20.6,6,231,105,3380,15.8,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(267,20.8,6,200,85,3070,16.7,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(268,18.6,6,225,110,3620,18.7,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(269,18.1,6,258,120,3410,15.1,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(270,19.2,8,305,145,3425,13.2,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(271,17.7,6,231,165,3445,13.4,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(272,18.1,8,302,139,3205,11.2,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(273,17.5,8,318,140,4080,13.7,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(274,30,4,98,68,2155,16.5,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(275,27.5,4,134,95,2560,14.2,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(276,27.2,4,119,97,2300,14.7,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(277,30.9,4,105,75,2230,14.5,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(278,21.1,4,134,95,2515,14.8,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(279,23.2,4,156,105,2745,16.7,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(280,23.8,4,151,85,2855,17.6,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(281,23.9,4,119,97,2405,14.9,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(282,20.3,5,131,103,2830,15.9,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(283,17,6,163,125,3140,13.6,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(284,21.6,4,121,115,2795,15.7,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(285,16.2,6,163,133,3410,15.8,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(286,31.5,4,89,71,1990,14.9,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(287,29.5,4,98,68,2135,16.6,1978);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(288,21.5,6,231,115,3245,15.4,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(289,19.8,6,200,85,2990,18.2,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(290,22.3,4,140,88,2890,17.3,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(291,20.2,6,232,90,3265,18.2,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(292,20.6,6,225,110,3360,16.6,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(293,17,8,305,130,3840,15.4,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(294,17.6,8,302,129,3725,13.4,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(295,16.5,8,351,138,3955,13.2,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(296,18.2,8,318,135,3830,15.2,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(297,16.9,8,350,155,4360,14.9,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(298,15.5,8,351,142,4054,14.3,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(299,19.2,8,267,125,3605,15,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(300,18.5,8,360,150,3940,13,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(301,31.9,4,89,71,1925,14,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(302,34.1,4,86,65,1975,15.2,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(303,35.7,4,98,80,1915,14.4,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(304,27.4,4,121,80,2670,15,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(305,25.4,5,183,77,3530,20.1,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(306,23,8,350,125,3900,17.4,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(307,27.2,4,141,71,3190,24.8,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(308,23.9,8,260,90,3420,22.2,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(309,34.2,4,105,70,2200,13.2,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(310,34.5,4,105,70,2150,14.9,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(311,31.8,4,85,65,2020,19.2,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(312,37.3,4,91,69,2130,14.7,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(313,28.4,4,151,90,2670,16,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(314,28.8,6,173,115,2595,11.3,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(315,26.8,6,173,115,2700,12.9,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(316,33.5,4,151,90,2556,13.2,1979);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(317,41.5,4,98,76,2144,14.7,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(318,38.1,4,89,60,1968,18.8,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(319,32.1,4,98,70,2120,15.5,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(320,37.2,4,86,65,2019,16.4,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(321,28,4,151,90,2678,16.5,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(322,26.4,4,140,88,2870,18.1,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(323,24.3,4,151,90,3003,20.1,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(324,19.1,6,225,90,3381,18.7,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(325,34.3,4,97,78,2188,15.8,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(326,29.8,4,134,90,2711,15.5,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(327,31.3,4,120,75,2542,17.5,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(328,37,4,119,92,2434,15,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(329,32.2,4,108,75,2265,15.2,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(330,46.6,4,86,65,2110,17.9,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(331,27.9,4,156,105,2800,14.4,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(332,40.8,4,85,65,2110,19.2,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(333,44.3,4,90,48,2085,21.7,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(334,43.4,4,90,48,2335,23.7,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(335,36.4,5,121,67,2950,19.9,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(336,30,4,146,67,3250,21.8,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(337,44.6,4,91,67,1850,13.8,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(338,40.9,4,85,null,1835,17.3,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(339,33.8,4,97,67,2145,18,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(340,29.8,4,89,62,1845,15.3,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(341,32.7,6,168,132,2910,11.4,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(342,23.7,3,70,100,2420,12.5,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(343,35,4,122,88,2500,15.1,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(344,23.6,4,140,null,2905,14.3,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(345,32.4,4,107,72,2290,17,1980);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(346,27.2,4,135,84,2490,15.7,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(347,26.6,4,151,84,2635,16.4,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(348,25.8,4,156,92,2620,14.4,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(349,23.5,6,173,110,2725,12.6,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(350,30,4,135,84,2385,12.9,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(351,39.1,4,79,58,1755,16.9,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(352,39,4,86,64,1875,16.4,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(353,35.1,4,81,60,1760,16.1,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(354,32.3,4,97,67,2065,17.8,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(355,37,4,85,65,1975,19.4,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(356,37.7,4,89,62,2050,17.3,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(357,34.1,4,91,68,1985,16,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(358,34.7,4,105,63,2215,14.9,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(359,34.4,4,98,65,2045,16.2,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(360,29.9,4,98,65,2380,20.7,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(361,33,4,105,74,2190,14.2,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(362,34.5,4,100,null,2320,15.8,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(363,33.7,4,107,75,2210,14.4,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(364,32.4,4,108,75,2350,16.8,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(365,32.9,4,119,100,2615,14.8,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(366,31.6,4,120,74,2635,18.3,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(367,28.1,4,141,80,3230,20.4,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(368,null,4,121,110,2800,15.4,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(369,30.7,6,145,76,3160,19.6,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(370,25.4,6,168,116,2900,12.6,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(371,24.2,6,146,120,2930,13.8,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(372,22.4,6,231,110,3415,15.8,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(373,26.6,8,350,105,3725,19,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(374,20.2,6,200,88,3060,17.1,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(375,17.6,6,225,85,3465,16.6,1981);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(376,28,4,112,88,2605,19.6,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(377,27,4,112,88,2640,18.6,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(378,34,4,112,88,2395,18,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(379,31,4,112,85,2575,16.2,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(380,29,4,135,84,2525,16,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(381,27,4,151,90,2735,18,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(382,24,4,140,92,2865,16.4,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(383,23,4,151,null,3035,20.5,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(384,36,4,105,74,1980,15.3,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(385,37,4,91,68,2025,18.2,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(386,31,4,91,68,1970,17.6,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(387,38,4,105,63,2125,14.7,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(388,36,4,98,70,2125,17.3,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(389,36,4,120,88,2160,14.5,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(390,36,4,107,75,2205,14.5,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(391,34,4,108,70,2245,16.9,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(392,38,4,91,67,1965,15,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(393,32,4,91,67,1965,15.7,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(394,38,4,91,67,1995,16.2,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(395,25,6,181,110,2945,16.4,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(396,38,6,262,85,3015,17,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(397,26,4,156,92,2585,14.5,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(398,22,6,232,112,2835,14.7,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(399,32,4,144,96,2665,13.9,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(400,36,4,135,84,2370,13,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(401,27,4,151,90,2950,17.3,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(402,27,4,140,86,2790,15.6,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(403,44,4,97,52,2130,24.6,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(404,32,4,135,84,2295,11.6,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(405,28,4,120,79,2625,18.6,1982);

1 row created.

SQL> INSERT INTO CAR_dETAILS VALUES(406,31,4,119,82,2720,19.4,1982);

1 row created.

SQL> 
SQL> Rem The final car details table :
SQL> select * from CAR_DETAILS;

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
         1         18          8        307        130       3504         12       1970                                           
         2         15          8        350        165       3693       11.5       1970                                           
         3         18          8        318        150       3436         11       1970                                           
         4         16          8        304        150       3433         12       1970                                           
         5         17          8        302        140       3449       10.5       1970                                           
         6         15          8        429        198       4341         10       1970                                           
         7         14          8        454        220       4354          9       1970                                           
         8         14          8        440        215       4312        8.5       1970                                           
         9         14          8        455        225       4425         10       1970                                           
        10         15          8        390        190       3850        8.5       1970                                           
        11                     4        133        115       3090       17.5       1970                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
        12                     8        350        165       4142       11.5       1970                                           
        13                     8        351        153       4034         11       1970                                           
        14                     8        383        175       4166       10.5       1970                                           
        15                     8        360        175       3850         11       1970                                           
        16         15          8        383        170       3563         10       1970                                           
        17         14          8        340        160       3609          8       1970                                           
        18                     8        302        140       3353          8       1970                                           
        19         15          8        400        150       3761        9.5       1970                                           
        20         14          8        455        225       3086         10       1970                                           
        21         24          4        113         95       2372         15       1970                                           
        22         22          6        198         95       2833       15.5       1970                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
        23         18          6        199         97       2774       15.5       1970                                           
        24         21          6        200         85       2587         16       1970                                           
        25         27          4         97         88       2130       14.5       1970                                           
        26         26          4         97         46       1835       20.5       1970                                           
        27         25          4        110         87       2672       17.5       1970                                           
        28         24          4        107         90       2430       14.5       1970                                           
        29         25          4        104         95       2375       17.5       1970                                           
        30         26          4        121        113       2234       12.5       1970                                           
        31         21          6        199         90       2648         15       1970                                           
        32         10          8        360        215       4615         14       1970                                           
        33         10          8        307        200       4376         15       1970                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
        34         11          8        318        210       4382       13.5       1970                                           
        35          9          8        304        193       4732       18.5       1970                                           
        36         27          4         97         88       2130       14.5       1971                                           
        37         28          4        140         90       2264       15.5       1971                                           
        38         25          4        113         95       2228         14       1971                                           
        39         25          4         98                  2046         19       1971                                           
        40                     4         97         48       1978         20       1971                                           
        41         19          6        232        100       2634         13       1971                                           
        42         16          6        225        105       3439       15.5       1971                                           
        43         17          6        250        100       3329       15.5       1971                                           
        44         19          6        250         88       3302       15.5       1971                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
        45         18          6        232        100       3288       15.5       1971                                           
        46         14          8        350        165       4209         12       1971                                           
        47         14          8        400        175       4464       11.5       1971                                           
        48         14          8        351        153       4154       13.5       1971                                           
        49         14          8        318        150       4096         13       1971                                           
        50         12          8        383        180       4955       11.5       1971                                           
        51         13          8        400        170       4746         12       1971                                           
        52         13          8        400        175       5140         12       1971                                           
        53         18          6        258        110       2962       13.5       1971                                           
        54         22          4        140         72       2408         19       1971                                           
        55         19          6        250        100       3282         15       1971                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
        56         18          6        250         88       3139       14.5       1971                                           
        57         23          4        122         86       2220         14       1971                                           
        58         28          4        116         90       2123         14       1971                                           
        59         30          4         79         70       2074       19.5       1971                                           
        60         30          4         88         76       2065       14.5       1971                                           
        61         31          4         71         65       1773         19       1971                                           
        62         35          4         72         69       1613         18       1971                                           
        63         27          4         97         60       1834         19       1971                                           
        64         26          4         91         70       1955       20.5       1971                                           
        65         24          4        113         95       2278       15.5       1972                                           
        66         25          4       97.5         80       2126         17       1972                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
        67         23          4         97         54       2254       23.5       1972                                           
        68         20          4        140         90       2408       19.5       1972                                           
        69         21          4        122         86       2226       16.5       1972                                           
        70         13          8        350        165       4274         12       1972                                           
        71         14          8        400        175       4385         12       1972                                           
        72         15          8        318        150       4135       13.5       1972                                           
        73         14          8        351        153       4129         13       1972                                           
        74         17          8        304        150       3672       11.5       1972                                           
        75         11          8        429        208       4633         11       1972                                           
        76         13          8        350        155       4502       13.5       1972                                           
        77         12          8        350        160       4456       13.5       1972                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
        78         13          8        400        190       4422       12.5       1972                                           
        79         19          3         70         97       2330       13.5       1972                                           
        80         15          8        304        150       3892       12.5       1972                                           
        81         13          8        307        130       4098         14       1972                                           
        82         13          8        302        140       4294         16       1972                                           
        83         14          8        318        150       4077         14       1972                                           
        84         18          4        121        112       2933       14.5       1972                                           
        85         22          4        121         76       2511         18       1972                                           
        86         21          4        120         87       2979       19.5       1972                                           
        87         26          4         96         69       2189         18       1972                                           
        88         22          4        122         86       2395         16       1972                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
        89         28          4         97         92       2288         17       1972                                           
        90         23          4        120         97       2506       14.5       1972                                           
        91         28          4         98         80       2164         15       1972                                           
        92         27          4         97         88       2100       16.5       1972                                           
        93         13          8        350        175       4100         13       1973                                           
        94         14          8        304        150       3672       11.5       1973                                           
        95         13          8        350        145       3988         13       1973                                           
        96         14          8        302        137       4042       14.5       1973                                           
        97         15          8        318        150       3777       12.5       1973                                           
        98         12          8        429        198       4952       11.5       1973                                           
        99         13          8        400        150       4464         12       1973                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       100         13          8        351        158       4363         13       1973                                           
       101         14          8        318        150       4237       14.5       1973                                           
       102         13          8        440        215       4735         11       1973                                           
       103         12          8        455        225       4951         11       1973                                           
       104         13          8        360        175       3821         11       1973                                           
       105         18          6        225        105       3121       16.5       1973                                           
       106         16          6        250        100       3278         18       1973                                           
       107         18          6        232        100       2945         16       1973                                           
       108         18          6        250         88       3021       16.5       1973                                           
       109         23          6        198         95       2904         16       1973                                           
       110         26          4         97         46       1950         21       1973                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       111         11          8        400        150       4997         14       1973                                           
       112         12          8        400        167       4906       12.5       1973                                           
       113         13          8        360        170       4654         13       1973                                           
       114         12          8        350        180       4499       12.5       1973                                           
       115         18          6        232        100       2789         15       1973                                           
       116         20          4         97         88       2279         19       1973                                           
       117         21          4        140         72       2401       19.5       1973                                           
       118         22          4        108         94       2379       16.5       1973                                           
       119         18          3         70         90       2124       13.5       1973                                           
       120         19          4        122         85       2310       18.5       1973                                           
       121         21          6        155        107       2472         14       1973                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       122         26          4         98         90       2265       15.5       1973                                           
       123         15          8        350        145       4082         13       1973                                           
       124         16          8        400        230       4278        9.5       1973                                           
       125         29          4         68         49       1867       19.5       1973                                           
       126         24          4        116         75       2158       15.5       1973                                           
       127         20          4        114         91       2582         14       1973                                           
       128         19          4        121        112       2868       15.5       1973                                           
       129         15          8        318        150       3399         11       1973                                           
       130         24          4        121        110       2660         14       1973                                           
       131         20          6        156        122       2807       13.5       1973                                           
       132         11          8        350        180       3664         11       1973                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       133         20          6        198         95       3102       16.5       1974                                           
       134         21          6        200                  2875         17       1974                                           
       135         19          6        232        100       2901         16       1974                                           
       136         15          6        250        100       3336         17       1974                                           
       137         31          4         79         67       1950         19       1974                                           
       138         26          4        122         80       2451       16.5       1974                                           
       139         32          4         71         65       1836         21       1974                                           
       140         25          4        140         75       2542         17       1974                                           
       141         16          6        250        100       3781         17       1974                                           
       142         16          6        258        110       3632         18       1974                                           
       143         18          6        225        105       3613       16.5       1974                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       144         16          8        302        140       4141         14       1974                                           
       145         13          8        350        150       4699       14.5       1974                                           
       146         14          8        318        150       4457       13.5       1974                                           
       147         14          8        302        140       4638         16       1974                                           
       148         14          8        304        150       4257       15.5       1974                                           
       149         29          4         98         83       2219       16.5       1974                                           
       150         26          4         79         67       1963       15.5       1974                                           
       151         26          4         97         78       2300       14.5       1974                                           
       152         31          4         76         52       1649       16.5       1974                                           
       153         32          4         83         61       2003         19       1974                                           
       154         28          4         90         75       2125       14.5       1974                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       155         24          4         90         75       2108       15.5       1974                                           
       156         26          4        116         75       2246         14       1974                                           
       157         24          4        120         97       2489         15       1974                                           
       158         26          4        108         93       2391       15.5       1974                                           
       159         31          4         79         67       2000         16       1974                                           
       160         19          6        225         95       3264         16       1975                                           
       161         18          6        250        105       3459         16       1975                                           
       162         15          6        250         72       3432         21       1975                                           
       163         15          6        250         72       3158       19.5       1975                                           
       164         16          8        400        170       4668       11.5       1975                                           
       165         15          8        350        145       4440         14       1975                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       166         16          8        318        150       4498       14.5       1975                                           
       167         14          8        351        148       4657       13.5       1975                                           
       168         17          6        231        110       3907         21       1975                                           
       169         16          6        250        105       3897       18.5       1975                                           
       170         15          6        258        110       3730         19       1975                                           
       171         18          6        225         95       3785         19       1975                                           
       172         21          6        231        110       3039         15       1975                                           
       173         20          8        262        110       3221       13.5       1975                                           
       174         13          8        302        129       3169         12       1975                                           
       175         29          4         97         75       2171         16       1975                                           
       176         23          4        140         83       2639         17       1975                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       177         20          6        232        100       2914         16       1975                                           
       178         23          4        140         78       2592       18.5       1975                                           
       179         24          4        134         96       2702       13.5       1975                                           
       180         25          4         90         71       2223       16.5       1975                                           
       181         24          4        119         97       2545         17       1975                                           
       182         18          6        171         97       2984       14.5       1975                                           
       183         29          4         90         70       1937         14       1975                                           
       184         19          6        232         90       3211         17       1975                                           
       185         23          4        115         95       2694         15       1975                                           
       186         23          4        120         88       2957         17       1975                                           
       187         22          4        121         98       2945       14.5       1975                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       188         25          4        121        115       2671       13.5       1975                                           
       189         33          4         91         53       1795       17.5       1975                                           
       190         28          4        107         86       2464       15.5       1976                                           
       191         25          4        116         81       2220       16.9       1976                                           
       192         25          4        140         92       2572       14.9       1976                                           
       193         26          4         98         79       2255       17.7       1976                                           
       194         27          4        101         83       2202       15.3       1976                                           
       195       17.5          8        305        140       4215         13       1976                                           
       196         16          8        318        150       4190         13       1976                                           
       197       15.5          8        304        120       3962       13.9       1976                                           
       198       14.5          8        351        152       4215       12.8       1976                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       199         22          6        225        100       3233       15.4       1976                                           
       200         22          6        250        105       3353       14.5       1976                                           
       201         24          6        200         81       3012       17.6       1976                                           
       202       22.5          6        232         90       3085       17.6       1976                                           
       203         29          4         85         52       2035       22.2       1976                                           
       204       24.5          4         98         60       2164       22.1       1976                                           
       205         29          4         90         70       1937       14.2       1976                                           
       206         33          4         91         53       1795       17.4       1976                                           
       207         20          6        225        100       3651       17.7       1976                                           
       208         18          6        250         78       3574         21       1976                                           
       209       18.5          6        250        110       3645       16.2       1976                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       210       17.5          6        258         95       3193       17.8       1976                                           
       211       29.5          4         97         71       1825       12.2       1976                                           
       212         32          4         85         70       1990         17       1976                                           
       213         28          4         97         75       2155       16.4       1976                                           
       214       26.5          4        140         72       2565       13.6       1976                                           
       215         20          4        130        102       3150       15.7       1976                                           
       216         13          8        318        150       3940       13.2       1976                                           
       217         19          4        120         88       3270       21.9       1976                                           
       218         19          6        156        108       2930       15.5       1976                                           
       219       16.5          6        168        120       3820       16.7       1976                                           
       220       16.5          8        350        180       4380       12.1       1976                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       221         13          8        350        145       4055         12       1976                                           
       222         13          8        302        130       3870         15       1976                                           
       223         13          8        318        150       3755         14       1976                                           
       224       31.5          4         98         68       2045       18.5       1977                                           
       225         30          4        111         80       2155       14.8       1977                                           
       226         36          4         79         58       1825       18.6       1977                                           
       227       25.5          4        122         96       2300       15.5       1977                                           
       228       33.5          4         85         70       1945       16.8       1977                                           
       229       17.5          8        305        145       3880       12.5       1977                                           
       230         17          8        260        110       4060         19       1977                                           
       231       15.5          8        318        145       4140       13.7       1977                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       232         15          8        302        130       4295       14.9       1977                                           
       233       17.5          6        250        110       3520       16.4       1977                                           
       234       20.5          6        231        105       3425       16.9       1977                                           
       235         19          6        225        100       3630       17.7       1977                                           
       236       18.5          6        250         98       3525         19       1977                                           
       237         16          8        400        180       4220       11.1       1977                                           
       238       15.5          8        350        170       4165       11.4       1977                                           
       239       15.5          8        400        190       4325       12.2       1977                                           
       240         16          8        351        149       4335       14.5       1977                                           
       241         29          4         97         78       1940       14.5       1977                                           
       242       24.5          4        151         88       2740         16       1977                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       243         26          4         97         75       2265       18.2       1977                                           
       244       25.5          4        140         89       2755       15.8       1977                                           
       245       30.5          4         98         63       2051         17       1977                                           
       246       33.5          4         98         83       2075       15.9       1977                                           
       247         30          4         97         67       1985       16.4       1977                                           
       248       30.5          4         97         78       2190       14.1       1977                                           
       249         22          6        146         97       2815       14.5       1977                                           
       250       21.5          4        121        110       2600       12.8       1977                                           
       251       21.5          3         80        110       2720       13.5       1977                                           
       252       43.1          4         90         48       1985       21.5       1978                                           
       253       36.1          4         98         66       1800       14.4       1978                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       254       32.8          4         78         52       1985       19.4       1978                                           
       255       39.4          4         85         70       2070       18.6       1978                                           
       256       36.1          4         91         60       1800       16.4       1978                                           
       257       19.9          8        260        110       3365       15.5       1978                                           
       258       19.4          8        318        140       3735       13.2       1978                                           
       259       20.2          8        302        139       3570       12.8       1978                                           
       260       19.2          6        231        105       3535       19.2       1978                                           
       261       20.5          6        200         95       3155       18.2       1978                                           
       262       20.2          6        200         85       2965       15.8       1978                                           
       263       25.1          4        140         88       2720       15.4       1978                                           
       264       20.5          6        225        100       3430       17.2       1978                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       265       19.4          6        232         90       3210       17.2       1978                                           
       266       20.6          6        231        105       3380       15.8       1978                                           
       267       20.8          6        200         85       3070       16.7       1978                                           
       268       18.6          6        225        110       3620       18.7       1978                                           
       269       18.1          6        258        120       3410       15.1       1978                                           
       270       19.2          8        305        145       3425       13.2       1978                                           
       271       17.7          6        231        165       3445       13.4       1978                                           
       272       18.1          8        302        139       3205       11.2       1978                                           
       273       17.5          8        318        140       4080       13.7       1978                                           
       274         30          4         98         68       2155       16.5       1978                                           
       275       27.5          4        134         95       2560       14.2       1978                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       276       27.2          4        119         97       2300       14.7       1978                                           
       277       30.9          4        105         75       2230       14.5       1978                                           
       278       21.1          4        134         95       2515       14.8       1978                                           
       279       23.2          4        156        105       2745       16.7       1978                                           
       280       23.8          4        151         85       2855       17.6       1978                                           
       281       23.9          4        119         97       2405       14.9       1978                                           
       282       20.3          5        131        103       2830       15.9       1978                                           
       283         17          6        163        125       3140       13.6       1978                                           
       284       21.6          4        121        115       2795       15.7       1978                                           
       285       16.2          6        163        133       3410       15.8       1978                                           
       286       31.5          4         89         71       1990       14.9       1978                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       287       29.5          4         98         68       2135       16.6       1978                                           
       288       21.5          6        231        115       3245       15.4       1979                                           
       289       19.8          6        200         85       2990       18.2       1979                                           
       290       22.3          4        140         88       2890       17.3       1979                                           
       291       20.2          6        232         90       3265       18.2       1979                                           
       292       20.6          6        225        110       3360       16.6       1979                                           
       293         17          8        305        130       3840       15.4       1979                                           
       294       17.6          8        302        129       3725       13.4       1979                                           
       295       16.5          8        351        138       3955       13.2       1979                                           
       296       18.2          8        318        135       3830       15.2       1979                                           
       297       16.9          8        350        155       4360       14.9       1979                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       298       15.5          8        351        142       4054       14.3       1979                                           
       299       19.2          8        267        125       3605         15       1979                                           
       300       18.5          8        360        150       3940         13       1979                                           
       301       31.9          4         89         71       1925         14       1979                                           
       302       34.1          4         86         65       1975       15.2       1979                                           
       303       35.7          4         98         80       1915       14.4       1979                                           
       304       27.4          4        121         80       2670         15       1979                                           
       305       25.4          5        183         77       3530       20.1       1979                                           
       306         23          8        350        125       3900       17.4       1979                                           
       307       27.2          4        141         71       3190       24.8       1979                                           
       308       23.9          8        260         90       3420       22.2       1979                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       309       34.2          4        105         70       2200       13.2       1979                                           
       310       34.5          4        105         70       2150       14.9       1979                                           
       311       31.8          4         85         65       2020       19.2       1979                                           
       312       37.3          4         91         69       2130       14.7       1979                                           
       313       28.4          4        151         90       2670         16       1979                                           
       314       28.8          6        173        115       2595       11.3       1979                                           
       315       26.8          6        173        115       2700       12.9       1979                                           
       316       33.5          4        151         90       2556       13.2       1979                                           
       317       41.5          4         98         76       2144       14.7       1980                                           
       318       38.1          4         89         60       1968       18.8       1980                                           
       319       32.1          4         98         70       2120       15.5       1980                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       320       37.2          4         86         65       2019       16.4       1980                                           
       321         28          4        151         90       2678       16.5       1980                                           
       322       26.4          4        140         88       2870       18.1       1980                                           
       323       24.3          4        151         90       3003       20.1       1980                                           
       324       19.1          6        225         90       3381       18.7       1980                                           
       325       34.3          4         97         78       2188       15.8       1980                                           
       326       29.8          4        134         90       2711       15.5       1980                                           
       327       31.3          4        120         75       2542       17.5       1980                                           
       328         37          4        119         92       2434         15       1980                                           
       329       32.2          4        108         75       2265       15.2       1980                                           
       330       46.6          4         86         65       2110       17.9       1980                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       331       27.9          4        156        105       2800       14.4       1980                                           
       332       40.8          4         85         65       2110       19.2       1980                                           
       333       44.3          4         90         48       2085       21.7       1980                                           
       334       43.4          4         90         48       2335       23.7       1980                                           
       335       36.4          5        121         67       2950       19.9       1980                                           
       336         30          4        146         67       3250       21.8       1980                                           
       337       44.6          4         91         67       1850       13.8       1980                                           
       338       40.9          4         85                  1835       17.3       1980                                           
       339       33.8          4         97         67       2145         18       1980                                           
       340       29.8          4         89         62       1845       15.3       1980                                           
       341       32.7          6        168        132       2910       11.4       1980                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       342       23.7          3         70        100       2420       12.5       1980                                           
       343         35          4        122         88       2500       15.1       1980                                           
       344       23.6          4        140                  2905       14.3       1980                                           
       345       32.4          4        107         72       2290         17       1980                                           
       346       27.2          4        135         84       2490       15.7       1981                                           
       347       26.6          4        151         84       2635       16.4       1981                                           
       348       25.8          4        156         92       2620       14.4       1981                                           
       349       23.5          6        173        110       2725       12.6       1981                                           
       350         30          4        135         84       2385       12.9       1981                                           
       351       39.1          4         79         58       1755       16.9       1981                                           
       352         39          4         86         64       1875       16.4       1981                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       353       35.1          4         81         60       1760       16.1       1981                                           
       354       32.3          4         97         67       2065       17.8       1981                                           
       355         37          4         85         65       1975       19.4       1981                                           
       356       37.7          4         89         62       2050       17.3       1981                                           
       357       34.1          4         91         68       1985         16       1981                                           
       358       34.7          4        105         63       2215       14.9       1981                                           
       359       34.4          4         98         65       2045       16.2       1981                                           
       360       29.9          4         98         65       2380       20.7       1981                                           
       361         33          4        105         74       2190       14.2       1981                                           
       362       34.5          4        100                  2320       15.8       1981                                           
       363       33.7          4        107         75       2210       14.4       1981                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       364       32.4          4        108         75       2350       16.8       1981                                           
       365       32.9          4        119        100       2615       14.8       1981                                           
       366       31.6          4        120         74       2635       18.3       1981                                           
       367       28.1          4        141         80       3230       20.4       1981                                           
       368                     4        121        110       2800       15.4       1981                                           
       369       30.7          6        145         76       3160       19.6       1981                                           
       370       25.4          6        168        116       2900       12.6       1981                                           
       371       24.2          6        146        120       2930       13.8       1981                                           
       372       22.4          6        231        110       3415       15.8       1981                                           
       373       26.6          8        350        105       3725         19       1981                                           
       374       20.2          6        200         88       3060       17.1       1981                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       375       17.6          6        225         85       3465       16.6       1981                                           
       376         28          4        112         88       2605       19.6       1982                                           
       377         27          4        112         88       2640       18.6       1982                                           
       378         34          4        112         88       2395         18       1982                                           
       379         31          4        112         85       2575       16.2       1982                                           
       380         29          4        135         84       2525         16       1982                                           
       381         27          4        151         90       2735         18       1982                                           
       382         24          4        140         92       2865       16.4       1982                                           
       383         23          4        151                  3035       20.5       1982                                           
       384         36          4        105         74       1980       15.3       1982                                           
       385         37          4         91         68       2025       18.2       1982                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       386         31          4         91         68       1970       17.6       1982                                           
       387         38          4        105         63       2125       14.7       1982                                           
       388         36          4         98         70       2125       17.3       1982                                           
       389         36          4        120         88       2160       14.5       1982                                           
       390         36          4        107         75       2205       14.5       1982                                           
       391         34          4        108         70       2245       16.9       1982                                           
       392         38          4         91         67       1965         15       1982                                           
       393         32          4         91         67       1965       15.7       1982                                           
       394         38          4         91         67       1995       16.2       1982                                           
       395         25          6        181        110       2945       16.4       1982                                           
       396         38          6        262         85       3015         17       1982                                           

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR                                           
---------- ---------- ---------- ---------- ---------- ---------- ---------- ----------                                           
       397         26          4        156         92       2585       14.5       1982                                           
       398         22          6        232        112       2835       14.7       1982                                           
       399         32          4        144         96       2665       13.9       1982                                           
       400         36          4        135         84       2370         13       1982                                           
       401         27          4        151         90       2950       17.3       1982                                           
       402         27          4        140         86       2790       15.6       1982                                           
       403         44          4         97         52       2130       24.6       1982                                           
       404         32          4        135         84       2295       11.6       1982                                           
       405         28          4        120         79       2625       18.6       1982                                           
       406         31          4        119         82       2720       19.4       1982                                           

406 rows selected.

SQL> 
SQL> 
SQL> @"C:\Rohith\Backup\Desktop\SEM 4\Database lab\Exercise-3\queries.sql"
SQL> 
SQL> Rem *******************************QUERIES*****************************************
SQL> Rem 1.Display the models that was not manufactured by any of the car makers.
SQL> 
SQL> Select m.model
  2  From model_details m
  3  Where m.model not in
  4  (Select distinct model
  5  from car_names );

MODEL                                                                                                                             
---------------                                                                                                                   
kia                                                                                                                               
hyundai                                                                                                                           
jeep                                                                                                                              
scion                                                                                                                             

SQL> 
SQL> 
SQL> 
SQL> 
SQL> 
SQL> 
SQL> Rem 2.For all the continents list the number of car makers if there were a car manufacturing company.
SQL> 
SQL> select c.continent, count(cm.maker)
  2  from continents c
  3  left join countries co
  4  on (c.contId = co.continent)
  5  left join car_makers cm
  6  on (co.countryID = cm.country)
  7  group by c.continent;

CONTINENT            COUNT(CM.MAKER)                                                                                              
-------------------- ---------------                                                                                              
europe                            11                                                                                              
africa                             0                                                                                              
america                            4                                                                                              
asia                               7                                                                                              
australia                          0                                                                                              

SQL> 
SQL> 
SQL> 
SQL> 
SQL> 
SQL> 
SQL> Rem 3. Display the pair of cars (ID) that has same mileage, horsepower and acceleration. The pairs should not be repeated in the result.
SQL> 
SQL> select unique cd.Id as carID,  cdc.Id as cdId2
  2  from car_details cd
  3  join car_details cdc
  4  on cd.Id <> cdc.ID
  5  and cd.MPG = cdc.MPG
  6  and cd.HorsePower = cdc.HorsePower
  7  and cd.Accelerate = cdc.Accelerate
  8  and cd.Id < cdc.Id;

     CARID      CDID2                                                                                                             
---------- ----------                                                                                                             
       105        143                                                                                                             
        80         97                                                                                                             
       126        155                                                                                                             
         9         20                                                                                                             
        25         36                                                                                                             

SQL> 
SQL> 
SQL> 
SQL> 
SQL> 
SQL> Rem 4. Display the number of cars produced by each car manufacturing company with in each model. Sort the result by the company name.
SQL> 
SQL>  select md.model, cm.maker, count(*) as NumberOfCars
  2   from car_names cn
  3   join model_details md
  4   on (md.model = cn.model)
  5   join car_makers cm
  6   on (cm.Id = md.maker)
  7   group by md.model, cm.maker
  8   order by cm.maker;

MODEL           MAKER           NUMBEROFCARS                                                                                      
--------------- --------------- ------------                                                                                      
amc             amc                       29                                                                                      
bmw             bmw                        2                                                                                      
chrysler        chrysler                   6                                                                                      
dodge           chrysler                  28                                                                                      
plymouth        chrysler                  32                                                                                      
citroen         citroen                    1                                                                                      
mercedes        daimler benz               1                                                                                      
mercedes-benz   daimler benz               2                                                                                      
fiat            fiat                       8                                                                                      
capri           ford                       1                                                                                      
ford            ford                      53                                                                                      

MODEL           MAKER           NUMBEROFCARS                                                                                      
--------------- --------------- ------------                                                                                      
mercury         ford                      11                                                                                      
buick           gm                        17                                                                                      
cadillac        gm                         2                                                                                      
chevrolet       gm                        48                                                                                      
oldsmobile      gm                        10                                                                                      
pontiac         gm                        16                                                                                      
hi              hi                         1                                                                                      
honda           honda                     13                                                                                      
mazda           mazda                     12                                                                                      
datsun          nissan                    23                                                                                      
nissan          nissan                     1                                                                                      

MODEL           MAKER           NUMBEROFCARS                                                                                      
--------------- --------------- ------------                                                                                      
opel            opel                       4                                                                                      
peugeot         peugeaut                   8                                                                                      
renault         renault                    5                                                                                      
saab            saab                       5                                                                                      
subaru          subaru                     4                                                                                      
toyota          toyota                    26                                                                                      
triumph         triumph                    1                                                                                      
audi            volkswagen                 7                                                                                      
volkswagen      volkswagen                23                                                                                      
volvo           volvo                      6                                                                                      

32 rows selected.

SQL> 
SQL> 
SQL> 
SQL> 
SQL> 
SQL> Rem 5.Display the model, name of car, mpg and weight of car(s) with maximum mileage among the heavy weight (bulky) cars.
SQL> REM The car with weight more than the average weight of all cars are known as heavy weight (bulky) cars.
SQL> 
SQL> select unique cn.model, cd.weight, cd.MPG
  2  from car_details cd
  3  join car_names cn on (cn.id = cd.id)
  4  where cd.weight > (select avg(weight) from car_details)
  5  and cd.mpg in (select max(mpg) from car_details
  6  where weight > (select avg(weight) from car_details));

MODEL               WEIGHT        MPG                                                                                             
--------------- ---------- ----------                                                                                             
oldsmobile            3015         38                                                                                             

SQL> 
SQL> 
SQL> 
SQL> 
SQL> 
SQL> Rem 6. Display the details (model,car_name,mileage,horsepower,acceleration,weight) of car(s) having mileage, horsepower, acceleration more than the average of mpg, horsepower, accel of all cars and its weight should be lesser than the average weight of all cars.
SQL> 
SQL>  select unique c1.*, cn.model
  2   from car_details c1
  3   join car_names cn
  4   on cn.Id = c1.Id
  5   join model_details md
  6   on md.model = cn.model
  7   where c1.MPG > (select avg(MPG) from car_details)
  8   and c1.horsepower > (select avg(horsepower) from car_details)
  9   and c1.accelerate > (select avg(accelerate) from car_details)
 10   and c1.weight < (select avg(weight) from car_details);

        ID        MPG  CYLINDERS     EDISPL HORSEPOWER     WEIGHT ACCELERATE       YEAR MODEL                                     
---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------- ---------------                           
       395         25          6        181        110       2945       16.4       1982 buick                                     

SQL> 
SQL> 
SQL> 
SQL> 
SQL> 
SQL> Rem 7. List the year, car maker that manufactured maximum number of cars.
SQL> 
SQL>  select cd.year, cm.maker, count(*) as carCount
  2   from car_details cd
  3   join car_names cn
  4   on (cd.Id = cn.Id)
  5   join model_details md
  6   on (md.model = cn.model)
  7   join car_makers cm
  8   on (cm.Id = md.maker)
  9   group by cd.year, cm.maker
 10   having count(*) = (
 11   select max(count(*))
 12   from car_details cd1
 13   join car_names cn1
 14   on (cd1.Id = cn1.Id)
 15   join model_details md1
 16   on (md1.model = cn1.model)
 17   join car_makers cm1
 18   on (cm1.Id = md1.maker)
 19   group by cd1.year, cm1.maker
 20   );

      YEAR MAKER             CARCOUNT                                                                                             
---------- --------------- ----------                                                                                             
      1973 gm                      11                                                                                             

SQL> 
SQL> 
SQL> 
SQL> 
SQL> 
SQL> Rem 8. Display the maker name, model name, car name, mileage and year of the car with the maximum mileage for each model
SQL> REM having more than one car. Sort the result by the car maker.
SQL> 
SQL> select md.model, cm.fullname, cd.mpg, cd.year
  2   from car_details cd
  3   join car_names cn
  4   on (cd.Id = cn.Id)
  5   join model_details md
  6   on (md.model = cn.model)
  7   join car_makers cm
  8   on (cm.Id = md.maker)
  9  where cd.mpg =
 10  (
 11  select max(cd1.mpg)
 12  from car_details cd1
 13  join car_names cn1
 14  on (cd1.Id = cn1.Id)
 15  join model_details md1
 16  on (md1.model = cn1.model)
 17  group by md1.model
 18  having md1.model = md.model and count(cd.Id)>1
 19  )
 20  order by cm.fullname;

MODEL           FULLNAME                              MPG       YEAR                                                              
--------------- ------------------------------ ---------- ----------                                                              
amc             American Motor Company               27.4       1979                                                              
bmw             BMW                                    26       1970                                                              
chrysler        Chrysler                               26       1982                                                              
dodge           Chrysler                               36       1982                                                              
plymouth        Chrysler                               39       1981                                                              
mercedes-benz   Daimler Benz                           30       1980                                                              
fiat            Fiat                                 37.3       1979                                                              
ford            Ford Motor Company                   36.1       1978                                                              
mercury         Ford Motor Company                     36       1982                                                              
pontiac         General Motors                       33.5       1979                                                              
cadillac        General Motors                         23       1979                                                              

MODEL           FULLNAME                              MPG       YEAR                                                              
--------------- ------------------------------ ---------- ----------                                                              
chevrolet       General Motors                         34       1982                                                              
oldsmobile      General Motors                         38       1982                                                              
buick           General Motors                         30       1977                                                              
honda           Honda                                44.6       1980                                                              
mazda           Mazda                                46.6       1980                                                              
datsun          Nissan Motors                        40.8       1980                                                              
opel            Opel                                   28       1971                                                              
peugeot         Peugeaut                               30       1971                                                              
renault         Renault                              40.9       1980                                                              
saab            Saab                                   25       1975                                                              
saab            Saab                                   25       1970                                                              

MODEL           FULLNAME                              MPG       YEAR                                                              
--------------- ------------------------------ ---------- ----------                                                              
subaru          Subaru                               33.8       1980                                                              
toyota          Toyota                               39.1       1981                                                              
volkswagen      Volkswagen                           44.3       1980                                                              
audi            Volkswagen                           36.4       1980                                                              
volvo           Volvo                                30.7       1981                                                              

27 rows selected.

SQL> 
SQL> 
SQL> 
SQL> 
SQL> 
SQL> Rem Write the following using Set Operations:
SQL> 
SQL> Rem 9. Rewritethequery1. (Display the models that was not manufactured by any of the car makers.)
SQL> 
SQL>  Select m.model
  2   From model_details m
  3   minus
  4   Select distinct cn.model
  5   from car_names cn;

MODEL                                                                                                                             
---------------                                                                                                                   
hyundai                                                                                                                           
jeep                                                                                                                              
kia                                                                                                                               
scion                                                                                                                             

SQL> 
SQL> 
SQL> 
SQL> 
SQL> Rem 10. List the car names (description) and its details that was manufactured on 1976 and 1982.
SQL> 
SQL> Select cn.model, cn.makedescription
  2  from car_details cd
  3  join car_names cn
  4  on (cn.Id = cd.Id)
  5  where cd.year = 1976
  6  intersect
  7  Select cn.model, cn.makedescription
  8  from car_details cd
  9  join car_names cn
 10  on (cn.Id = cd.Id)
 11  where cd.year = 1982;

MODEL           MAKEDESCRIPTION                                                                                                   
--------------- ----------------------------------------                                                                          
honda           honda civic                                                                                                       
toyota          toyota corolla                                                                                                    

SQL> 
SQL> 
SQL> spool off;
