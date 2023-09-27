SQL> 
SQL> set echo on;
SQL> @"C:\Rohith\Backup\Desktop\SEM 4\Database lab\Exercise-7\a7creation.sql"
SQL> set serveroutput on;
SQL> 
SQL> set long 50000
SQL> set linesize 130
SQL> col x format a80 word_wrapped;
SQL> 
SQL> drop table transaction;
drop table transaction
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> drop table accounts;
drop table accounts
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> drop table customers;
drop table customers
           *
ERROR at line 1:
ORA-00942: table or view does not exist 


SQL> 
SQL> create table customers(
  2  cid number(10) constraint cust_pk primary key,
  3  cname varchar2(30),
  4  age number(10),
  5  address varchar2(30),
  6  phone number(20)
  7  );

Table created.

SQL> 
SQL> create table accounts(
  2  ano varchar2(10) constraint acc_pk primary key,
  3  atype varchar2(2),
  4  balance number(10),
  5  cid number(10) constraint acc_fk references customers(cid)
  6  );

Table created.

SQL> 
SQL> 
SQL> create table transaction(
  2  tid number(10) constraint tran_pk primary key,
  3  ano varchar2(10) constraint trans_fk references accounts(ano),
  4  ttype varchar2(10),
  5  tdate date,
  6  tamount number(10)
  7  );

Table created.

SQL> 
SQL> 
SQL> REM --------------------------------------------------------------------------
> REM CUSTOMERS
SQL> REM ---------------
> REM CID, CNAME, AGE, ADDRESS, PHONE
SQL> 
SQL> INSERT INTO CUSTOMERS VALUES(100,'Adithya',25,'Anna nagar, Chennai',9843748255);

1 row created.

SQL> INSERT INTO CUSTOMERS VALUES(101,'Nikhil Arora',28,'Mogapair West, Chennai',9345672438);

1 row created.

SQL> INSERT INTO CUSTOMERS VALUES(102,'Aradhana',31,'East Tambaram, Chennai',9523495687);

1 row created.

SQL> INSERT INTO CUSTOMERS VALUES(103,'Raghav',34,'Nanganallur, Chennai',9441245636);

1 row created.

SQL> 
SQL> 
SQL> REM ACCOUNTS
SQL> REM ---------------
> REM ANO, ATYPE, BALANCE, CID
SQL> 
SQL> INSERT INTO ACCOUNTS VALUES('S103','S',1500,100);

1 row created.

SQL> INSERT INTO ACCOUNTS VALUES('C121','C',5000,100);

1 row created.

SQL> INSERT INTO ACCOUNTS VALUES('S201','S',45000,101);

1 row created.

SQL> INSERT INTO ACCOUNTS VALUES('S223','S',7200,102);

1 row created.

SQL> INSERT INTO ACCOUNTS VALUES('C135','C',245000,103);

1 row created.

SQL> 
SQL> 
SQL> REM TRANSACTION
SQL> REM ---------------
> REM TID, ANO, TTYPE, TDATE, TAMOUNT
SQL> 
SQL> REM --------------------------------------------------------------------------
> 
SQL> 
SQL> 
SQL> 
SQL> 
SQL> rem: rem: 1. During Withdrawal, check whether the transaction amount is less than the available balance. Event : Insert/Update (tamount)
SQL> rem: If ttype=Withdrawal and tamount>balance then
SQL> rem: raise 'Available Balance is lesser than the Transaction amount'
SQL> 
SQL> 
SQL> CREATE OR REPLACE TRIGGER min_bal
  2  BEFORE INSERT OR UPDATE of tamount ON transaction
  3  FOR EACH ROW
  4  DECLARE
  5      bal accounts.balance%TYPE;
  6  BEGIN
  7  
  8      SELECT balance INTO bal FROM accounts WHERE ano = :new.ANO;
  9      IF :new.TTYPE = 'W' AND bal < :new.TAMOUNT THEN
 10          RAISE_APPLICATION_ERROR(-20001, 'Available Balance is lesser than the Transaction amount');
 11      END IF;
 12      dbms_output.put_line('Execution of TRIGGER-1');
 13  END;
 14  /

Trigger created.

SQL> 
SQL> rem: Inserting Valid Row
SQL> 
SQL> SELECT * FROM transaction;

no rows selected

SQL> INSERT into transaction values(1,'C135','W','23-Jan-2023',10000);
Execution of TRIGGER-1                                                                                                            

1 row created.

SQL> SELECT * FROM transaction;

       TID ANO        TTYPE      TDATE        TAMOUNT                                                                             
---------- ---------- ---------- --------- ----------                                                                             
         1 C135       W          23-JAN-23      10000                                                                             

SQL> 
SQL> UPDATE TRANSACTION set tamount=90000 where tid=1;
Execution of TRIGGER-1                                                                                                            

1 row updated.

SQL> 
SQL> rem: Less balance amount than transaction amount(raise_application_error)
SQL> 
SQL> SELECT * FROM transaction;

       TID ANO        TTYPE      TDATE        TAMOUNT                                                                             
---------- ---------- ---------- --------- ----------                                                                             
         1 C135       W          23-JAN-23      90000                                                                             

SQL> INSERT into transaction values(2,'C121','W','19-Jan-2023',10000);
INSERT into transaction values(2,'C121','W','19-Jan-2023',10000)
            *
ERROR at line 1:
ORA-20001: Available Balance is lesser than the Transaction amount 
ORA-06512: at "SCOTT.MIN_BAL", line 7 
ORA-04088: error during execution of trigger 'SCOTT.MIN_BAL' 


SQL> SELECT * FROM transaction;

       TID ANO        TTYPE      TDATE        TAMOUNT                                                                             
---------- ---------- ---------- --------- ----------                                                                             
         1 C135       W          23-JAN-23      90000                                                                             

SQL> 
SQL> 
SQL> rem: 2.Implement the following constraint to update the balance of an account for the transactions of both the Deposit or Withdrawal type.
SQL> rem: Event : Insert/Update (tamount)
SQL> rem: If ttype = Deposit then balance = balance + tamount If ttype = Withdrawal then balance = balance - tamount
SQL> 
SQL> 
SQL> 
SQL> CREATE OR REPLACE TRIGGER update_balance
  2  BEFORE INSERT OR UPDATE OF tamount, ttype ON transaction
  3  FOR EACH ROW
  4  BEGIN
  5  
  6     IF :new.ttype = 'Deposit' THEN
  7  
  8        UPDATE accounts SET balance = balance + :new.tamount WHERE ano = :new.ano;
  9  
 10  
 11     ELSIF :new.ttype = 'Withdrawal' THEN
 12        UPDATE accounts SET balance = balance - :new.tamount WHERE ano = :new.ano;
 13  
 14     END IF;
 15     dbms_output.put_line('Execution of TRIGGER-2');
 16  END;
 17  /

Trigger created.

SQL> 
SQL> rem: Deposit - update the balance
SQL> 
SQL> select * from accounts where ano='S201';

ANO        AT    BALANCE        CID                                                                                               
---------- -- ---------- ----------                                                                                               
S201       S       45000        101                                                                                               

SQL> insert into transaction values(2,'S201','Deposit','19-Jan-2023',5000);
Execution of TRIGGER-2                                                                                                            
Execution of TRIGGER-1                                                                                                            

1 row created.

SQL> select * from accounts where ano='S201';

ANO        AT    BALANCE        CID                                                                                               
---------- -- ---------- ----------                                                                                               
S201       S       50000        101                                                                                               

SQL> 
SQL> 
SQL> rem: Withdrawal of the amount
SQL> 
SQL> select * from accounts where ano='S223';

ANO        AT    BALANCE        CID                                                                                               
---------- -- ---------- ----------                                                                                               
S223       S        7200        102                                                                                               

SQL> insert into transaction values(3,'S223','Withdrawal','25-Jan-2023',500);
Execution of TRIGGER-2                                                                                                            
Execution of TRIGGER-1                                                                                                            

1 row created.

SQL> select * from accounts where ano='S223';

ANO        AT    BALANCE        CID                                                                                               
---------- -- ---------- ----------                                                                                               
S223       S        6700        102                                                                                               

SQL> 
SQL> 
SQL> rem: 3.Implement the following constraint for Withdrawal transactions.
SQL> rem: Event : Insert
SQL> rem: a. A customer can have at most 3 withdrawals per day per account.
SQL> rem: b. The maximum amount of withdrawal for each transaction is Rs.30000
SQL> 
SQL> 
SQL> 
SQL> CREATE OR REPLACE TRIGGER trig_warn
  2  BEFORE INSERT ON transaction
  3  FOR EACH ROW
  4  DECLARE
  5    num NUMBER(10);
  6    daily_withdrawal_count NUMBER(10);
  7    temp transaction%rowtype ;
  8    cursor c1 is SELECT *
  9    FROM transaction
 10    WHERE ano = :new.ano AND tdate = :new.tdate AND ttype = 'W';
 11  BEGIN
 12  
 13    -- Check if the transaction type is 'W' for withdrawal
 14    IF :new.ttype = 'W' THEN
 15      -- Check the number of withdrawals for the account on the given date
 16      open c1;
 17      daily_withdrawal_count :=0;
 18      loop
 19        fetch c1 into temp;
 20        if c1%found then
 21          daily_withdrawal_count := daily_withdrawal_count+1;
 22        end if;
 23        exit when c1%notfound;
 24      end loop;
 25      close c1;
 26      -- Check constraint (a): Maximum 3 withdrawals per day per account
 27      IF daily_withdrawal_count >= 3 THEN
 28        raise_application_error(-20001, 'Maximum of 3 withdrawals reached for account number ' || :new.ano || ' on ' || :new.tdate);
 29      END IF;
 30  
 31      -- Check constraint (b): Maximum withdrawal amount of Rs.30000
 32      IF :new.tamount > 30000 THEN
 33        raise_application_error(-20002, 'Maximum withdrawal amount exceeded. Withdrawal limit for account ' || :new.ano || ' is Rs.30000');
 34      END IF;
 35    END IF;
 36    dbms_output.put_line('Execution of TRIGGER-3');
 37  END;
 38  /

Trigger created.

SQL> 
SQL> 
SQL> rem: Exceeding maximum withdrawal amount
SQL> 
SQL> select * from accounts;

ANO        AT    BALANCE        CID                                                                                               
---------- -- ---------- ----------                                                                                               
S103       S        1500        100                                                                                               
C121       C        5000        100                                                                                               
S201       S       50000        101                                                                                               
S223       S        6700        102                                                                                               
C135       C      245000        103                                                                                               

SQL> insert into transaction values(4,'S103','W','19-Jan-2023',355000);
insert into transaction values(4,'S103','W','19-Jan-2023',355000)
            *
ERROR at line 1:
ORA-20002: Maximum withdrawal amount exceeded. Withdrawal limit for account S103 is Rs.30000 
ORA-06512: at "SCOTT.TRIG_WARN", line 30 
ORA-04088: error during execution of trigger 'SCOTT.TRIG_WARN' 


SQL> 
SQL> rem : implementing withrawals 3 times
SQL> 
SQL> insert into transaction values(5,'S103','W','19-Jan-2023',100);
Execution of TRIGGER-3                                                                                                            
Execution of TRIGGER-2                                                                                                            
Execution of TRIGGER-1                                                                                                            

1 row created.

SQL> insert into transaction values(6,'S103','W','19-Jan-2023',200);
Execution of TRIGGER-3                                                                                                            
Execution of TRIGGER-2                                                                                                            
Execution of TRIGGER-1                                                                                                            

1 row created.

SQL> insert into transaction values(7,'S103','W','19-Jan-2023',300);
Execution of TRIGGER-3                                                                                                            
Execution of TRIGGER-2                                                                                                            
Execution of TRIGGER-1                                                                                                            

1 row created.

SQL> 
SQL> rem : exceeding daily withrawal limit of 3 times (raise application error)
SQL> 
SQL> insert into transaction values(8,'S103','W','19-Jan-2023',400);
insert into transaction values(8,'S103','W','19-Jan-2023',400)
            *
ERROR at line 1:
ORA-20001: Maximum of 3 withdrawals reached for account number S103 on 19-JAN-23 
ORA-06512: at "SCOTT.TRIG_WARN", line 25 
ORA-04088: error during execution of trigger 'SCOTT.TRIG_WARN' 


SQL> 
SQL> spool off;
