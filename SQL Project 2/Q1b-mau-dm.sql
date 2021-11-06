--****PLEASE ENTER YOUR DETAILS BELOW****
--Q1b-mau-dm.sql
--Student ID: 29051754
--Student Name: DARREN LUWI
--Tutorial No: 12

/* Comments for your marker:




*/


/*
1b(i) Create a sequence 
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE
DROP SEQUENCE entry_of_data;

CREATE SEQUENCE entry_of_data START WITH 300 INCREMENT BY 1;
COMMIT;

/*
1b(ii) Take the necessary steps in the database to record data.
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE

INSERT INTO ARTWORK values (17,2,'Saint Catherine of Siena',500000.00,to_date('22-Oct-2020 10:00','dd-mm-yyyy hh24:mi'));
INSERT INTO AW_STATUS values (entry_of_data.nextval, 17,2,to_date('22-Oct-2020 10:00','dd-mm-yyyy hh24:mi'),'W',null);
commit;




/*
1b(iii) Take the necessary steps in the database to record changes. 
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE
-- (a)
INSERT INTO AW_STATUS values (entry_of_data.nextval, 17,2, to_date('22-Oct-2020 11:00','dd-mm-yyyy hh24:mi'),'T',1);
commit;

-- (b)
INSERT INTO AW_STATUS values (entry_of_data.nextval, 17,2,to_date('22-Oct-2020 14:15','dd-mm-yyyy hh24:mi'),'G',1);
commit;
-- (c)
INSERT INTO AW_DISPLAY values (entry_of_data.nextval, 17,2, to_date( '23-Oct-2020 11:00', 'dd-mm-yyyy hh24:mi'), to_date('02-Nov-2020 21:00','dd-mm-yyyy hh24:mi'),1);
commit;


/*
1b(iv) Take the necessary steps in the database to record changes. 
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE
INSERT INTO AW_STATUS values (entry_of_data.nextval, 17,2,to_date('28-Oct-2020 14:30','dd-mm-yyyy hh24:mi'),'S',null);
INSERT INTO SALE values (entry_of_data.nextval, to_date('28-Oct-2020 14:30','dd-mm-yyyy hh24:mi'), 850000.00, 1, 303);
commit;
