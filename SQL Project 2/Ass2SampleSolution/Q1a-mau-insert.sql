--- FIT2094 Assignment 2 2020 S2
-- Sample Solution

/*
(a) Load selected tables with your own additional test data using the supplied Q1a-mau-insert.sql script file, and SQL commands which will insert, as a minimum,
the following sample data -
15 ARTWORKs
10 EXHIBITs
2 SALEs, and
the required AW_STATUS entries to support the ARTWORK, EXHIBIT and SALE data you add.
*/

--------------------------------------
--INSERT INTO artwork
--------------------------------------
INSERT INTO artwork VALUES (1, 1, 'The Creation of Adam', 30000, TO_DATE('2-Jan-2019', 'DD-MON-YYYY'));
UPDATE artist SET artist_noworks = artist_noworks + 1 WHERE artist_code = 1;
INSERT INTO artwork VALUES (2, 1, 'The Starry Night', 55400, TO_DATE('10-Jan-2019', 'DD-MON-YYYY'));
UPDATE artist SET artist_noworks = artist_noworks + 1 WHERE artist_code = 2;
INSERT INTO artwork VALUES (3, 1, 'Saint Francis of Assisi', 24500, TO_DATE('3-Feb-2019', 'DD-MON-YYYY'));
UPDATE artist SET artist_noworks = artist_noworks + 1 WHERE artist_code = 3;
INSERT INTO artwork VALUES (4, 1, 'The Last Supper', 17900, TO_DATE('23-Feb-2019', 'DD-MON-YYYY'));
UPDATE artist SET artist_noworks = artist_noworks + 1 WHERE artist_code = 4;
INSERT INTO artwork VALUES (7, 1, 'Sunday Afternoon on an Island', 12900, TO_DATE('4-Mar-2019', 'DD-MON-YYYY'));
UPDATE artist SET artist_noworks = artist_noworks + 1 WHERE artist_code = 7;
INSERT INTO artwork VALUES (8, 1, 'Girl with a Pearl Earring', 23100, TO_DATE('7-Jun-2019', 'DD-MON-YYYY'));
UPDATE artist SET artist_noworks = artist_noworks + 1 WHERE artist_code = 8;
INSERT INTO artwork VALUES (5, 1, 'The Lady of Shalott', 45000, TO_DATE('15-Aug-2019', 'DD-MON-YYYY'));
UPDATE artist SET artist_noworks = artist_noworks + 1 WHERE artist_code = 5;
INSERT INTO artwork VALUES (9, 1, 'The Mystic', 34000, TO_DATE('14-Sep-2019', 'DD-MON-YYYY'));
UPDATE artist SET artist_noworks = artist_noworks + 1 WHERE artist_code = 9;
INSERT INTO artwork VALUES (10, 1, 'The Scientist', 24000, TO_DATE('20-Sep-2019', 'DD-MON-YYYY'));
UPDATE artist SET artist_noworks = artist_noworks + 1 WHERE artist_code = 10;
INSERT INTO artwork VALUES (21, 1, 'Inner World', 90450, TO_DATE('20-Sep-2019', 'DD-MON-YYYY'));
UPDATE artist SET artist_noworks = artist_noworks + 1 WHERE artist_code = 21;
INSERT INTO artwork VALUES (19, 1, 'The Astronomer', 34000, TO_DATE('1-Nov-2019', 'DD-MON-YYYY'));
UPDATE artist SET artist_noworks = artist_noworks + 1 WHERE artist_code = 19;
INSERT INTO artwork VALUES (1, 2, 'Luncheon of the Boating Party', 14500, TO_DATE('18-Nov-2019', 'DD-MON-YYYY'));
UPDATE artist SET artist_noworks = artist_noworks + 1 WHERE artist_code = 1;
INSERT INTO artwork VALUES (7, 2, 'Saint Francis of Assisi', 34536.9, TO_DATE('4-Jan-2020', 'DD-MON-YYYY'));
UPDATE artist SET artist_noworks = artist_noworks + 1 WHERE artist_code = 7;
INSERT INTO artwork VALUES (8, 2, 'Cafe Terrace at Night', 45600.35, TO_DATE('18-Feb-2020', 'DD-MON-YYYY'));
UPDATE artist SET artist_noworks = artist_noworks + 1 WHERE artist_code = 8;
INSERT INTO artwork VALUES (5, 2, 'The Sojourn', 46700.45, TO_DATE('23-Feb-2020', 'DD-MON-YYYY'));
UPDATE artist SET artist_noworks = artist_noworks + 1 WHERE artist_code = 5;


--------------------------------------
--INSERT INTO aw_display
--------------------------------------
INSERT INTO aw_display VALUES (1, 1, 1, TO_DATE('14-Jun-2019', 'DD-MON-YYYY'), TO_DATE('20-Jun-2019', 'DD-MON-YYYY'), 2);
INSERT INTO aw_display VALUES (2, 2, 1, TO_DATE('14-Jun-2019', 'DD-MON-YYYY'), TO_DATE('20-Jun-2019', 'DD-MON-YYYY'), 2);
INSERT INTO aw_display VALUES (3, 3, 1, TO_DATE('14-Jun-2019', 'DD-MON-YYYY'), TO_DATE('20-Jun-2019', 'DD-MON-YYYY'), 2);
INSERT INTO aw_display VALUES (4, 4, 1, TO_DATE('14-Jun-2019', 'DD-MON-YYYY'), TO_DATE('20-Jun-2019', 'DD-MON-YYYY'), 2);
INSERT INTO aw_display VALUES (5, 8, 1, TO_DATE('14-Jun-2019', 'DD-MON-YYYY'), TO_DATE('20-Jun-2019', 'DD-MON-YYYY'), 2);
INSERT INTO aw_display VALUES (6, 2, 1, TO_DATE('7-Nov-2019', 'DD-MON-YYYY'), TO_DATE('19-Nov-2019', 'DD-MON-YYYY'), 5);
INSERT INTO aw_display VALUES (7, 8, 1, TO_DATE('7-Nov-2019', 'DD-MON-YYYY'), TO_DATE('19-Nov-2019', 'DD-MON-YYYY'), 5);
INSERT INTO aw_display VALUES (8, 5, 1, TO_DATE('7-Nov-2019', 'DD-MON-YYYY'), TO_DATE('19-Nov-2019', 'DD-MON-YYYY'), 5);
INSERT INTO aw_display VALUES (9, 9, 1, TO_DATE('7-Nov-2019', 'DD-MON-YYYY'), TO_DATE('19-Nov-2019', 'DD-MON-YYYY'), 5);
INSERT INTO aw_display VALUES (10, 10, 1, TO_DATE('7-Nov-2019', 'DD-MON-YYYY'), TO_DATE('19-Nov-2019', 'DD-MON-YYYY'), 5);
INSERT INTO aw_display VALUES (11, 21, 1, TO_DATE('7-Nov-2019', 'DD-MON-YYYY'), TO_DATE('19-Nov-2019', 'DD-MON-YYYY'), 5);
INSERT INTO aw_display VALUES (12, 19, 1, TO_DATE('7-Nov-2019', 'DD-MON-YYYY'), TO_DATE('19-Nov-2019', 'DD-MON-YYYY'), 5);
INSERT INTO aw_display VALUES (13, 2, 1, TO_DATE('5-July-2020', 'DD-MON-YYYY'), TO_DATE('18-Jul-2020', 'DD-MON-YYYY'), 5);
INSERT INTO aw_display VALUES (14, 8, 1, TO_DATE('5-July-2020', 'DD-MON-YYYY'), TO_DATE('18-Jul-2020', 'DD-MON-YYYY'), 5);
INSERT INTO aw_display VALUES (15, 1, 2, TO_DATE('5-July-2020', 'DD-MON-YYYY'), TO_DATE('10-Jul-2020', 'DD-MON-YYYY'), 5);
INSERT INTO aw_display VALUES (16, 8, 2, TO_DATE('5-July-2020', 'DD-MON-YYYY'), TO_DATE('18-Jul-2020', 'DD-MON-YYYY'), 5);
INSERT INTO aw_display VALUES (17, 5, 2, TO_DATE('5-July-2020', 'DD-MON-YYYY'), TO_DATE('18-Jul-2020', 'DD-MON-YYYY'), 5);
INSERT INTO aw_display VALUES (18, 1, 2, TO_DATE('21-July-2020', 'DD-MON-YYYY'), TO_DATE('26-Jul-2020', 'DD-MON-YYYY'), 5);

--------------------------------------
--INSERT INTO aw_status
--------------------------------------
INSERT INTO aw_status VALUES (1, 1, 1, TO_DATE('2-Jan-2019 16:00', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (2, 2, 1, TO_DATE('10-Jan-2019 12:30', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (3, 3, 1, TO_DATE('3-Feb-2019 11:45', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (4, 4, 1, TO_DATE('23-Feb-2019 16:45', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (5, 7, 1, TO_DATE('4-Mar-2019 13:05', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (6, 8, 1, TO_DATE('7-Jun-2019 11:00', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (7, 1, 1, TO_DATE('13-Jun-2019 10:00', 'DD-MON-YYYY HH24:MI'), 'T', 2);
INSERT INTO aw_status VALUES (8, 2, 1, TO_DATE('13-Jun-2019 10:00', 'DD-MON-YYYY HH24:MI'), 'T', 2);
INSERT INTO aw_status VALUES (9, 3, 1, TO_DATE('13-Jun-2019 10:00', 'DD-MON-YYYY HH24:MI'), 'T', 2);
INSERT INTO aw_status VALUES (10, 4, 1, TO_DATE('13-Jun-2019 10:00', 'DD-MON-YYYY HH24:MI'), 'T', 2);
INSERT INTO aw_status VALUES (11, 8, 1, TO_DATE('13-Jun-2019 10:00', 'DD-MON-YYYY HH24:MI'), 'T', 2);
INSERT INTO aw_status VALUES (12, 1, 1, TO_DATE('13-Jun-2019 13:00', 'DD-MON-YYYY HH24:MI'), 'G', 2);
INSERT INTO aw_status VALUES (13, 2, 1, TO_DATE('13-Jun-2019 13:00', 'DD-MON-YYYY HH24:MI'), 'G', 2);
INSERT INTO aw_status VALUES (14, 3, 1, TO_DATE('13-Jun-2019 13:00', 'DD-MON-YYYY HH24:MI'), 'G', 2);
INSERT INTO aw_status VALUES (15, 4, 1, TO_DATE('13-Jun-2019 13:00', 'DD-MON-YYYY HH24:MI'), 'G', 2);
INSERT INTO aw_status VALUES (16, 8, 1, TO_DATE('13-Jun-2019 13:00', 'DD-MON-YYYY HH24:MI'), 'G', 2);
INSERT INTO aw_status VALUES (17, 1, 1, TO_DATE('15-Jun-2019 13:08', 'DD-MON-YYYY HH24:MI'), 'S', null);
INSERT INTO aw_status VALUES (18, 3, 1, TO_DATE('16-Jun-2019 13:02', 'DD-MON-YYYY HH24:MI'), 'S', null);
INSERT INTO aw_status VALUES (19, 4, 1, TO_DATE('19-Jun-2019 13:03', 'DD-MON-YYYY HH24:MI'), 'S', null);
INSERT INTO aw_status VALUES (20, 2, 1, TO_DATE('21-Jun-2019 11:00', 'DD-MON-YYYY HH24:MI'), 'T', 2);
INSERT INTO aw_status VALUES (21, 8, 1, TO_DATE('21-Jun-2019 11:00', 'DD-MON-YYYY HH24:MI'), 'T', 2);
INSERT INTO aw_status VALUES (22, 2, 1, TO_DATE('21-Jun-2019 14:00', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (23, 8, 1, TO_DATE('21-Jun-2019 14:00', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (24, 5, 1, TO_DATE('15-Aug-2019 11:08', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (25, 9, 1, TO_DATE('14-Sep-2019 12:07', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (26, 10, 1, TO_DATE('20-Sep-2019 18:00', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (27, 21, 1, TO_DATE('20-Sep-2019 13:00', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (28, 19, 1, TO_DATE('1-Nov-2019 13:07', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (29, 2, 1, TO_DATE('6-Nov-2019 10:00', 'DD-MON-YYYY HH24:MI'), 'T', 5);
INSERT INTO aw_status VALUES (30, 8, 1, TO_DATE('6-Nov-2019 10:00', 'DD-MON-YYYY HH24:MI'), 'T', 5);
INSERT INTO aw_status VALUES (31, 5, 1, TO_DATE('6-Nov-2019 10:00', 'DD-MON-YYYY HH24:MI'), 'T', 5);
INSERT INTO aw_status VALUES (32, 9, 1, TO_DATE('6-Nov-2019 10:00', 'DD-MON-YYYY HH24:MI'), 'T', 5);
INSERT INTO aw_status VALUES (33, 10, 1, TO_DATE('6-Nov-2019 10:00', 'DD-MON-YYYY HH24:MI'), 'T', 5);
INSERT INTO aw_status VALUES (34, 21, 1, TO_DATE('6-Nov-2019 10:00', 'DD-MON-YYYY HH24:MI'), 'T', 5);
INSERT INTO aw_status VALUES (35, 19, 1, TO_DATE('6-Nov-2019 10:00', 'DD-MON-YYYY HH24:MI'), 'T', 5);
INSERT INTO aw_status VALUES (36, 2, 1, TO_DATE('6-Nov-2019 11:30', 'DD-MON-YYYY HH24:MI'), 'G', 5);
INSERT INTO aw_status VALUES (37, 8, 1, TO_DATE('6-Nov-2019 11:30', 'DD-MON-YYYY HH24:MI'), 'G', 5);
INSERT INTO aw_status VALUES (38, 5, 1, TO_DATE('6-Nov-2019 11:30', 'DD-MON-YYYY HH24:MI'), 'G', 5);
INSERT INTO aw_status VALUES (39, 9, 1, TO_DATE('6-Nov-2019 11:30', 'DD-MON-YYYY HH24:MI'), 'G', 5);
INSERT INTO aw_status VALUES (40, 10, 1, TO_DATE('6-Nov-2019 11:30', 'DD-MON-YYYY HH24:MI'), 'G', 5);
INSERT INTO aw_status VALUES (41, 21, 1, TO_DATE('6-Nov-2019 11:30', 'DD-MON-YYYY HH24:MI'), 'G', 5);
INSERT INTO aw_status VALUES (42, 19, 1, TO_DATE('6-Nov-2019 11:30', 'DD-MON-YYYY HH24:MI'), 'G', 5);
INSERT INTO aw_status VALUES (43, 19, 1, TO_DATE('12-Nov-2019 14:30', 'DD-MON-YYYY HH24:MI'), 'S', null);
INSERT INTO aw_status VALUES (44, 1, 2, TO_DATE('18-Nov-2019 11:05', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (45, 2, 1, TO_DATE('19-Nov-2019 19:30', 'DD-MON-YYYY HH24:MI'), 'T', 5);
INSERT INTO aw_status VALUES (46, 8, 1, TO_DATE('19-Nov-2019 19:30', 'DD-MON-YYYY HH24:MI'), 'T', 5);
INSERT INTO aw_status VALUES (47, 5, 1, TO_DATE('19-Nov-2019 19:30', 'DD-MON-YYYY HH24:MI'), 'T', 5);
INSERT INTO aw_status VALUES (48, 9, 1, TO_DATE('19-Nov-2019 19:30', 'DD-MON-YYYY HH24:MI'), 'T', 5);
INSERT INTO aw_status VALUES (49, 10, 1, TO_DATE('19-Nov-2019 19:30', 'DD-MON-YYYY HH24:MI'), 'T', 5);
INSERT INTO aw_status VALUES (50, 21, 1, TO_DATE('19-Nov-2019 19:30', 'DD-MON-YYYY HH24:MI'), 'T', 5);
INSERT INTO aw_status VALUES (51, 2, 1, TO_DATE('19-Nov-2019 21:00', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (52, 8, 1, TO_DATE('19-Nov-2019 21:00', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (53, 5, 1, TO_DATE('19-Nov-2019 21:00', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (54, 9, 1, TO_DATE('19-Nov-2019 21:00', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (55, 10, 1, TO_DATE('19-Nov-2019 21:00', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (56, 21, 1, TO_DATE('19-Nov-2019 21:00', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (57, 7, 2, TO_DATE('4-Jan-2020 14:15', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (58, 8, 2, TO_DATE('18-Feb-2020 16:30', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (59, 5, 2, TO_DATE('23-Feb-2020 11:50', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (60, 7, 2, TO_DATE('4-Mar-2020 12:35', 'DD-MON-YYYY HH24:MI'), 'R', null);
UPDATE artist SET artist_noworks = artist_noworks - 1 WHERE artist_code = 7;
INSERT INTO aw_status VALUES (61, 2, 1, TO_DATE('4-July-2020 9:00', 'DD-MON-YYYY HH24:MI'), 'T', 5);
INSERT INTO aw_status VALUES (62, 8, 1, TO_DATE('4-July-2020 9:00', 'DD-MON-YYYY HH24:MI'), 'T', 5);
INSERT INTO aw_status VALUES (63, 1, 2, TO_DATE('4-July-2020 9:00', 'DD-MON-YYYY HH24:MI'), 'T', 5);
INSERT INTO aw_status VALUES (64, 8, 2, TO_DATE('4-July-2020 9:00', 'DD-MON-YYYY HH24:MI'), 'T', 5);
INSERT INTO aw_status VALUES (65, 5, 2, TO_DATE('4-July-2020 9:00', 'DD-MON-YYYY HH24:MI'), 'T', 5);
INSERT INTO aw_status VALUES (66, 2, 1, TO_DATE('4-July-2020 10:30', 'DD-MON-YYYY HH24:MI'), 'G', 5);
INSERT INTO aw_status VALUES (67, 8, 1, TO_DATE('4-July-2020 10:30', 'DD-MON-YYYY HH24:MI'), 'G', 5);
INSERT INTO aw_status VALUES (68, 1, 2, TO_DATE('4-July-2020 10:30', 'DD-MON-YYYY HH24:MI'), 'G', 5);
INSERT INTO aw_status VALUES (69, 8, 2, TO_DATE('4-July-2020 10:30', 'DD-MON-YYYY HH24:MI'), 'G', 5);
INSERT INTO aw_status VALUES (70, 5, 2, TO_DATE('4-July-2020 10:30', 'DD-MON-YYYY HH24:MI'), 'G', 5);
INSERT INTO aw_status VALUES (71, 1, 2, TO_DATE('10-July-2020 20:30', 'DD-MON-YYYY HH24:MI'), 'T', 5);
INSERT INTO aw_status VALUES (72, 1, 2, TO_DATE('10-July-2020 22:00', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (73, 2, 1, TO_DATE('18-July-2020 20:30', 'DD-MON-YYYY HH24:MI'), 'T', 5);
INSERT INTO aw_status VALUES (74, 8, 1, TO_DATE('18-July-2020 20:30', 'DD-MON-YYYY HH24:MI'), 'T', 5);
INSERT INTO aw_status VALUES (75, 8, 2, TO_DATE('18-July-2020 20:30', 'DD-MON-YYYY HH24:MI'), 'T', 5);
INSERT INTO aw_status VALUES (76, 2, 1, TO_DATE('18-July-2020 22:00', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (77, 8, 1, TO_DATE('18-July-2020 22:00', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (78, 8, 2, TO_DATE('18-July-2020 22:00', 'DD-MON-YYYY HH24:MI'), 'W', null);
INSERT INTO aw_status VALUES (79, 1, 2, TO_DATE('21-July-2020 08:00', 'DD-MON-YYYY HH24:MI'), 'T', 5);
INSERT INTO aw_status VALUES (80, 1, 2, TO_DATE('21-July-2020 09:30', 'DD-MON-YYYY HH24:MI'), 'G', 5);
INSERT INTO aw_status VALUES (81, 1, 2, TO_DATE('26-July-2020 17:00', 'DD-MON-YYYY HH24:MI'), 'T', 5);
INSERT INTO aw_status VALUES (82, 1, 2, TO_DATE('27-July-2020 18:30', 'DD-MON-YYYY HH24:MI'), 'W', null);

--------------------------------------
--INSERT INTO sale
--------------------------------------
INSERT INTO sale VALUES (1, TO_DATE('15-Jun-2019', 'DD-MON-YYYY'), 49000.00, 1, 1);
UPDATE artist SET artist_noworks = artist_noworks - 1 WHERE artist_code = 1;
UPDATE aw_display SET aw_display_end_date = TO_DATE('15-Jun-2019', 'DD-MON-YYYY') WHERE aw_display_id = 1;
INSERT INTO sale VALUES (2, TO_DATE('16-Jun-2019', 'DD-MON-YYYY'), 38000.00, 3, 3);
UPDATE artist SET artist_noworks = artist_noworks - 1 WHERE artist_code = 3;
UPDATE aw_display SET aw_display_end_date = TO_DATE('16-Jun-2019', 'DD-MON-YYYY') WHERE aw_display_id = 3;
INSERT INTO sale VALUES (3, TO_DATE('19-Jun-2019', 'DD-MON-YYYY'), 32000.00, 7, 4);
UPDATE artist SET artist_noworks = artist_noworks - 1 WHERE artist_code = 4;
UPDATE aw_display SET aw_display_end_date = TO_DATE('19-Jun-2019', 'DD-MON-YYYY') WHERE aw_display_id = 4;
INSERT INTO sale VALUES (4, TO_DATE('12-Nov-2019', 'DD-MON-YYYY'), 60000.00, 7, 12);
UPDATE artist SET artist_noworks = artist_noworks - 1 WHERE artist_code = 19;
UPDATE aw_display SET aw_display_end_date = TO_DATE('12-Nov-2019', 'DD-MON-YYYY') WHERE aw_display_id = 12;

COMMIT;
