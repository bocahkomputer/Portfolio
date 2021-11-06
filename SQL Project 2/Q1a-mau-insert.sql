--****PLEASE ENTER YOUR DETAILS BELOW****
--Q1a-mau-insert.sql
--Student ID: 29051754
--Student Name: DARREN LUWI
--Tutorial No: 12

/* Comments for your marker:
-For the sake of simplicity:  
I incremented sale_id, aw_display_id & aws_id by 1.
I used the same time values for transits, returns, and arrivals of artworks to gallery & warehouses (assume that all aw_status actions (excluding sales) operate on a fixed schedule).
Assume that all artwork_minpayment on question 1(a) have the same value
Assume that all unsold and unreturned AW_DISPLAY artworks have null enddates 



*/


/*
1(a) Load selected tables with your own additional test data
*/
--PLEASE PLACE REQUIRED SQL STATEMENT(S) FOR THIS PART HERE
INSERT INTO ARTWORK values (1,1,'Bikini Bottom',10000.00,to_date('21-Dec-2019','dd-mm-yyyy'));
INSERT INTO ARTWORK values (2,1,'Gotham',10000.00,to_date('31-Dec-2019','dd-mm-yyyy')); 
INSERT INTO ARTWORK values (3,1,'Indonesia',10000.00,to_date('17-Jan-2020','dd-mm-yyyy'));
INSERT INTO ARTWORK values (4,1,'Japan',10000.00,to_date('14-Mar-2020','dd-mm-yyyy'));
INSERT INTO ARTWORK values (5,1,'Ninja',10000.00,to_date('01-Dec-2019','dd-mm-yyyy'));
INSERT INTO ARTWORK values (6,1,'Coffee',10000.00,to_date('20-Jan-2020','dd-mm-yyyy'));
INSERT INTO ARTWORK values (7,1,'Forest',10000.00,to_date('22-Nov-2019','dd-mm-yyyy'));
INSERT INTO ARTWORK values (8,1,'Castle',10000.00,to_date('24-Nov-2019','dd-mm-yyyy'));
INSERT INTO ARTWORK values (9,1,'Darkness',10000.00,to_date('21-Dec-2019','dd-mm-yyyy'));
INSERT INTO ARTWORK values (10,1,'Summer',10000.00,to_date('10-Feb-2020','dd-mm-yyyy'));
INSERT INTO ARTWORK values (1,2,'Winter',10000.00,to_date('25-Dec-2019','dd-mm-yyyy'));
INSERT INTO ARTWORK values (15,1,'Beach',10000.00,to_date('20-Nov-2019','dd-mm-yyyy'));
INSERT INTO ARTWORK values (13,1,'Desert',10000.00,to_date('13-Feb-2020' , 'dd-mm-yyyy'));
INSERT INTO ARTWORK values (11,1,'Chess',10000.00,to_date('12-Mar-2020','dd-mm-yyyy'));
INSERT INTO ARTWORK values (5,2,'King',10000.00,to_date('13-Mar-2020','dd-mm-yyyy'));
INSERT INTO ARTWORK values (16,1,'Football',10000.00,to_date('14-Jan-2020','dd-mm-yyyy'));
INSERT INTO ARTWORK values (4,2,'Boxer',10000.00,to_date('11-Apr-2020','dd-mm-yyyy'));
INSERT INTO ARTWORK values (14,1,'Fountain',10000.00,to_date('02-Feb-2020','dd-mm-yyyy'));
INSERT INTO ARTWORK values (7,2,'Office',10000.00,to_date('03-Nov-2019','dd-mm-yyyy'));
INSERT INTO ARTWORK values (17,1,'Sunset',10000.00,to_date('04-Dec-2019','dd-mm-yyyy'));

INSERT INTO ARTWORK values (21,1,'Mount Everest', 10000.00, to_date('29-Dec-2019','dd-mm-yyyy'));
INSERT INTO ARTWORK values (19,1,'Field',10000.00, to_date('28-Dec-2019','dd-mm-yyyy'));
INSERT INTO ARTWORK values (18, 1,'Samurai',10000.00, to_date('28-Dec-2019','dd-mm-yyyy'));
INSERT INTO ARTWORK values (20, 1, 'Wakanda', 10000.00, to_date('30-Dec-2019','dd-mm-yyyy'));

commit;

INSERT INTO AW_DISPLAY values (1,1,2,to_date('01-Jan-2020','dd-mm-yyyy'),to_date('10-Jan-2020','dd-mm-yyyy'),4);
INSERT INTO AW_DISPLAY values (2,1,1, to_date('31-Dec-2019','dd-mm-yyyy'),to_date('11-Jan-2020','dd-mm-yyyy'),4); 
INSERT INTO AW_DISPLAY values (3,5,2,to_date('15-Mar-2020','dd-mm-yyyy'),to_date('25-Mar-2020','dd-mm-yyyy'),2);
INSERT INTO AW_DISPLAY values (4,17,1,to_date('10-Dec-2019','dd-mm-yyyy'),to_date('01-Jan-2020','dd-mm-yyyy'),1); 
INSERT INTO AW_DISPLAY values (5,5,1,to_date('01-Jan-2020','dd-mm-yyyy'),to_date('15-Apr-2020','dd-mm-yyyy'),1);
INSERT INTO AW_DISPLAY values (6,8,1,to_date('01-Dec-2019','dd-mm-yyyy'),to_date('15-Mar-2020','dd-mm-yyyy'),1);
INSERT INTO AW_DISPLAY values (7,4,1,to_date('16-Mar-2020','dd-mm-yyyy'),to_date('15-May-2020','dd-mm-yyyy'),2);
INSERT INTO AW_DISPLAY values (8,10,1,to_date('12-Feb-2020','dd-mm-yyyy'),null,3);
INSERT INTO AW_DISPLAY values (9,11,1,to_date('01-May-2020','dd-mm-yyyy'),null,5);
INSERT INTO AW_DISPLAY values (10,7,1,to_date('01-Dec-2019','dd-mm-yyyy'),to_date('03-Feb-2020','dd-mm-yyyy'),4);
INSERT INTO AW_DISPLAY values (11,4,2,to_date('13-Apr-2020','dd-mm-yyyy'),to_date('10-Jun-2020','dd-mm-yyyy'),1);
INSERT INTO AW_DISPLAY values (12,16,1,to_date('01-Feb-2020','dd-mm-yyyy'),to_date('15-Apr-2020','dd-mm-yyyy'),2);
INSERT INTO AW_DISPLAY values (13,3,1,to_date('18-Jan-2020','dd-mm-yyyy'),to_date('21-Jan-2020','dd-mm-yyyy'),3);
INSERT INTO AW_DISPLAY values (14,14,1,to_date('04-Feb-2020','dd-mm-yyyy'),to_date('15-Feb-2020','dd-mm-yyyy'),3);
INSERT INTO AW_DISPLAY values (15,1,1,to_date('13-Jan-2020','dd-mm-yyyy'),to_date('23-Jan-2020','dd-mm-yyyy'),3);
INSERT INTO AW_DISPLAY values (16,17,1,to_date('03-Jan-2020','dd-mm-yyyy'),null,2);
INSERT INTO AW_DISPLAY values (17,4,1,to_date('17-May-2020','dd-mm-yyyy'),to_date('28-May-2020','dd-mm-yyyy'),4);
INSERT INTO AW_DISPLAY values (18,7,1,to_date('05-Feb-2020','dd-mm-yyyy'),null,3);
INSERT INTO AW_DISPLAY values (19,16,1,to_date('17-Apr-2020','dd-mm-yyyy'),null,1);
INSERT INTO AW_DISPLAY values (20,1,1,to_date('23-Jan-2020','dd-mm-yyyy'),null,4);
INSERT INTO AW_DISPLAY values (21,4,1,to_date('28-May-2020','dd-mm-yyyy'),null,1);

INSERT INTO AW_DISPLAY values(22, 21, 1, to_date('01-Jan-2020','dd-mm-yyyy'), null, 1);
INSERT INTO AW_DISPLAY values(23, 19, 1, to_date('01-Jan-2020','dd-mm-yyyy'), null, 4);
INSERT INTO AW_DISPLAY values(24, 18, 1, to_date('01-Jan-2020','dd-mm-yyyy'), null, 3);
INSERT INTO AW_DISPLAY values(25, 20, 1, to_date('01-Jan-2020','dd-mm-yyyy'), null, 5);


commit;

INSERT INTO SALE values (1,to_date('10-Jan-2020','dd-mm-yyyy'),480000.00, 10,1);
INSERT INTO SALE values (2,to_date('25-Mar-2020','dd-mm-yyyy'),500000.00, 3,3);
INSERT INTO SALE values (3,to_date('15-Apr-2020','dd-mm-yyyy'),490000.00, 1,5);
INSERT INTO SALE values (4,to_date('10-Jun-2020','dd-mm-yyyy'),680000.00, 7,11);
INSERT INTO SALE values (5,to_date('15-Feb-2020','dd-mm-yyyy'),580000.00, 2,14);
INSERT INTO SALE values (6,to_date('21-Jan-2020','dd-mm-yyyy'),780000.00, 10,13);
commit;

INSERT INTO AW_STATUS values (1,1,1,to_date('21-Dec-2019 21:00','dd-mm-yyyy hh24:mi'),'W',null);
INSERT INTO AW_STATUS values (2,2,1,to_date('31-Dec-2019 21:00','dd-mm-yyyy hh24:mi'),'W',null);
INSERT INTO AW_STATUS values (3,3,1,to_date('17-Jan-2020 21:00','dd-mm-yyyy hh24:mi'),'W',null);
INSERT INTO AW_STATUS values (4,4,1,to_date('14-Mar-2020 21:00','dd-mm-yyyy hh24:mi'),'W',null);
INSERT INTO AW_STATUS values (5,5,1,to_date('01-Dec-2019 21:00','dd-mm-yyyy hh24:mi'),'W',null);
INSERT INTO AW_STATUS values (6,6,1,to_date('20-Jan-2020 21:00','dd-mm-yyyy hh24:mi'),'W',null);
INSERT INTO AW_STATUS values (7,7,1,to_date('22-Nov-2019 21:00','dd-mm-yyyy hh24:mi'),'W',null);
INSERT INTO AW_STATUS values (8,8,1,to_date('24-Nov-2019 21:00','dd-mm-yyyy hh24:mi'),'W',null);
INSERT INTO AW_STATUS values (9,9,1,to_date('21-Dec-2019 21:00','dd-mm-yyyy hh24:mi'),'W',null);
INSERT INTO AW_STATUS values (10,10,1,to_date('10-Feb-2020 21:00','dd-mm-yyyy hh24:mi'),'W',null);
INSERT INTO AW_STATUS values (11,1,2,to_date('25-Dec-2019 21:00','dd-mm-yyyy hh24:mi'),'W',null);
INSERT INTO AW_STATUS values (12,15,1,to_date('20-Nov-2019 21:00','dd-mm-yyyy hh24:mi'),'W',null);
INSERT INTO AW_STATUS values (13,13,1,to_date('13-Feb-2020 21:00','dd-mm-yyyy hh24:mi'),'W',null);
INSERT INTO AW_STATUS values (14,11,1,to_date('12-Mar-2020 21:00','dd-mm-yyyy hh24:mi'),'W',null);
INSERT INTO AW_STATUS values (15,5,2,to_date('13-Mar-2020 21:00','dd-mm-yyyy hh24:mi'),'W',null);
INSERT INTO AW_STATUS values (16,16,1,to_date('14-Jan-2020 21:00','dd-mm-yyyy hh24:mi'),'W',null);
INSERT INTO AW_STATUS values (17,4,2,to_date('11-Apr-2020 21:00','dd-mm-yyyy hh24:mi'),'W',null);
INSERT INTO AW_STATUS values (18,14,1,to_date('02-Feb-2020 21:00','dd-mm-yyyy hh24:mi'),'W',null);
INSERT INTO AW_STATUS values (19,7,2,to_date('03-Nov-2019 21:00','dd-mm-yyyy hh24:mi'),'W',null);
INSERT INTO AW_STATUS values (20,17,1,to_date('04-Dec-2019 21:00','dd-mm-yyyy hh24:mi'),'W',null);

INSERT INTO AW_STATUS values (75,21, 1, to_date ('30-Dec-2019 21:00','dd-mm-yyyy hh24:mi'),'W',null);
INSERT INTO AW_STATUS values (76,19, 1, to_date ('30-Dec-2019 21:00','dd-mm-yyyy hh24:mi'),'W',null);
INSERT INTO AW_STATUS values (77,18, 1, to_date ('30-Dec-2019 21:00','dd-mm-yyyy hh24:mi'),'W',null);
INSERT INTO AW_STATUS values (78,20, 1, to_date ('30-Dec-2019 21:00','dd-mm-yyyy hh24:mi'),'W',null);

commit;

INSERT INTO AW_STATUS values (21,1,2,to_date('30-Dec-2019 21:00','dd-mm-yyyy hh24:mi'),'T',4);
INSERT INTO AW_STATUS values (22,1,1,to_date('29-Dec-2019 21:00','dd-mm-yyyy hh24:mi'),'T',4);
INSERT INTO AW_STATUS values (23,5,2,to_date('14-Mar-2020 21:00','dd-mm-yyyy hh24:mi'),'T',2);
INSERT INTO AW_STATUS values (24,17,1,to_date('08-Dec-2019 21:00','dd-mm-yyyy hh24:mi'),'T',1);
INSERT INTO AW_STATUS values (25,5,1,to_date('30-Dec-2019 21:00','dd-mm-yyyy hh24:mi'),'T',1);
INSERT INTO AW_STATUS values (26,8,1,to_date('29-Nov-2019 21:00','dd-mm-yyyy hh24:mi'),'T',1);
INSERT INTO AW_STATUS values (27,4,1,to_date('15-Mar-2020 21:00','dd-mm-yyyy hh24:mi'),'T',2);
INSERT INTO AW_STATUS values (28,10,1,to_date('11-Feb-2020 21:00','dd-mm-yyyy hh24:mi'),'T',3);
INSERT INTO AW_STATUS values (29,11,1,to_date('28-Apr-2020 21:00','dd-mm-yyyy hh24:mi'),'T',5);
INSERT INTO AW_STATUS values (30,7,1,to_date('29-Nov-2019 21:00','dd-mm-yyyy hh24:mi'),'T',4);
INSERT INTO AW_STATUS values (31,4,2,to_date('12-Apr-2020 21:00','dd-mm-yyyy hh24:mi'),'T',1);
INSERT INTO AW_STATUS values (32,16,1,to_date('30-Jan-2020 21:00','dd-mm-yyyy hh24:mi'),'T',2);
INSERT INTO AW_STATUS values (33,3,1,to_date('16-Jan-2020 21:00','dd-mm-yyyy hh24:mi'),'T',3);
INSERT INTO AW_STATUS values (34,14,1,to_date('03-Feb-2020 21:00','dd-mm-yyyy hh24:mi'),'T',1);

INSERT INTO AW_STATUS values (79,21, 1, to_date ('31-Dec-2019 21:00','dd-mm-yyyy hh24:mi'),'T',1);
INSERT INTO AW_STATUS values (80,19, 1, to_date ('31-Dec-2019 21:00','dd-mm-yyyy hh24:mi'),'T',4);
INSERT INTO AW_STATUS values (81,18, 1, to_date ('31-Dec-2019 21:00','dd-mm-yyyy hh24:mi'),'T',3);
INSERT INTO AW_STATUS values (82,20, 1, to_date ('31-Dec-2019 21:00','dd-mm-yyyy hh24:mi'),'T',5);


commit;

INSERT INTO AW_STATUS values (35,1,2,to_date('01-Jan-2020 11:00','dd-mm-yyyy hh24:mi'),'G',4);
INSERT INTO AW_STATUS values (36,1,1,to_date('31-Dec-2019 11:00','dd-mm-yyyy hh24:mi'),'G',4);
INSERT INTO AW_STATUS values (37,5,2,to_date('15-Mar-2020 11:00','dd-mm-yyyy hh24:mi'),'G',2);
INSERT INTO AW_STATUS values (38,17,1,to_date('10-Dec-2019 11:00','dd-mm-yyyy hh24:mi'),'G',1);
INSERT INTO AW_STATUS values (39,5,1,to_date('01-Jan-2020 11:00','dd-mm-yyyy hh24:mi'),'G',1);
INSERT INTO AW_STATUS values (40,8,1,to_date('01-Dec-2019 11:00','dd-mm-yyyy hh24:mi'),'G',1);
INSERT INTO AW_STATUS values (41,4,1,to_date('16-Mar-2020 11:00','dd-mm-yyyy hh24:mi'),'G',2);
INSERT INTO AW_STATUS values (42,10,1,to_date('12-Feb-2020 11:00','dd-mm-yyyy hh24:mi'),'G',3);
INSERT INTO AW_STATUS values (43,11,1,to_date('01-May-2020 11:00','dd-mm-yyyy hh24:mi'),'G',5);
INSERT INTO AW_STATUS values (44,7,1,to_date('01-Dec-2019 11:00','dd-mm-yyyy hh24:mi'),'G',4);
INSERT INTO AW_STATUS values (45,4,2,to_date('13-Apr-2020 11:00','dd-mm-yyyy hh24:mi'),'G',1);
INSERT INTO AW_STATUS values (46,16,1,to_date('01-Feb-2020 11:00','dd-mm-yyyy hh24:mi'),'G',2);
INSERT INTO AW_STATUS values (47,3,1,to_date('18-Jan-2020 11:00','dd-mm-yyyy hh24:mi'),'G',3);
INSERT INTO AW_STATUS values (48,14,1,to_date('04-Feb-2020 11:00','dd-mm-yyyy hh24:mi'),'G',1);

INSERT INTO AW_STATUS values (83,21, 1, to_date ('01-Jan-2020 11:00','dd-mm-yyyy hh24:mi'),'G',1);
INSERT INTO AW_STATUS values (84,19, 1, to_date ('01-Jan-2020 11:00','dd-mm-yyyy hh24:mi'),'G',4);
INSERT INTO AW_STATUS values (85,18, 1, to_date ('01-Jan-2020 11:00','dd-mm-yyyy hh24:mi'),'G',3);
INSERT INTO AW_STATUS values (86,20, 1, to_date ('01-Jan-2020 11:00','dd-mm-yyyy hh24:mi'),'G',5);


commit;


INSERT INTO AW_STATUS values (49,2,1,to_date('21-Mar-2020 21:00','dd-mm-yyyy hh24:mi'),'R',null);
INSERT INTO AW_STATUS values (50,6,1,to_date('21-Mar-2020 21:00','dd-mm-yyyy hh24:mi'),'R',null);
INSERT INTO AW_STATUS values (51,15,1,to_date('13-May-2020 21:00','dd-mm-yyyy hh24:mi'),'R',null);
INSERT INTO AW_STATUS values (52,13,1,to_date('12-Apr-2020 21:00','dd-mm-yyyy hh24:mi'),'R',null);
INSERT INTO AW_STATUS values (53,7,2,to_date('11-Mar-2020 21:00','dd-mm-yyyy hh24:mi'),'R',null);
INSERT INTO AW_STATUS values (54,8,1,to_date('01-Mar-2020 21:00','dd-mm-yyyy hh24:mi'),'R',null);
commit;


INSERT INTO AW_STATUS values (55,1,1,to_date('12-Jan-2020 21:00','dd-mm-yyyy hh24:mi'),'T',4);
INSERT INTO AW_STATUS values (56,17,1,to_date('02-Jan-2020 21:00','dd-mm-yyyy hh24:mi'),'T',1);
INSERT INTO AW_STATUS values (57,4,1,to_date('16-May-2020 21:00','dd-mm-yyyy hh24:mi'),'T',2);
INSERT INTO AW_STATUS values (58,7,1,to_date('04-Feb-2020 21:00','dd-mm-yyyy hh24:mi'),'T',4);
INSERT INTO AW_STATUS values (59,16,1,to_date('16-Apr-2020 21:00','dd-mm-yyyy hh24:mi'),'T',2);
INSERT INTO AW_STATUS values (60,1,1,to_date('22-Jan-2020 21:00','dd-mm-yyyy hh24:mi'),'T',3);
INSERT INTO AW_STATUS values (61,4,1,to_date('27-May-2020 21:00','dd-mm-yyyy hh24:mi'),'T',4);
commit;

INSERT INTO AW_STATUS values (62,1,1,to_date('13-Jan-2020 11:00','dd-mm-yyyy hh24:mi'),'G',3);
INSERT INTO AW_STATUS values (63,17,1,to_date('03-Jan-2020 11:00','dd-mm-yyyy hh24:mi'),'G',2);
INSERT INTO AW_STATUS values (64,4,1,to_date('17-May-2020 11:00','dd-mm-yyyy hh24:mi'),'G',4);
INSERT INTO AW_STATUS values (65,7,1,to_date('05-Feb-2020 11:00','dd-mm-yyyy hh24:mi'),'G',3);
INSERT INTO AW_STATUS values (66,16,1,to_date('17-Apr-2020 11:00','dd-mm-yyyy hh24:mi'),'G',1);
INSERT INTO AW_STATUS values (67,1,1,to_date('23-Jan-2020 11:00','dd-mm-yyyy hh24:mi'),'G',4);
INSERT INTO AW_STATUS values (68,4,1,to_date('28-May-2020 11:00','dd-mm-yyyy hh24:mi'),'G',1);
commit;



INSERT INTO AW_STATUS values (69,1,2,to_date('10-Jan-2020 13:00','dd-mm-yyyy hh24:mi'),'S',null);
INSERT INTO AW_STATUS values (70,5,2,to_date('25-Mar-2020 14:30','dd-mm-yyyy hh24:mi'),'S',null);
INSERT INTO AW_STATUS values (71,5,1,to_date('15-Apr-2020 18:16','dd-mm-yyyy hh24:mi'),'S',null);
INSERT INTO AW_STATUS values (72,4,2,to_date('10-Jun-2020 15:40','dd-mm-yyyy hh24:mi'),'S',null);
INSERT INTO AW_STATUS values (73,14,1,to_date('15-Feb-2020 16:41','dd-mm-yyyy hh24:mi'),'S',null);
INSERT INTO AW_STATUS values (74,3,1,to_date('21-Jan-2020 17:59','dd-mm-yyyy hh24:mi'),'S',null);
commit;

