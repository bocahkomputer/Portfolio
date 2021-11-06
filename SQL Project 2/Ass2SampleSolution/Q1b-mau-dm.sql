-- FIT9132 Assignment 2 2020 S2
-- Sample Solution

/*
(b) For the following tasks, your SQL must correctly manage transactions and use sequences to generate new primary keys for numeric primary key values
(under no circumstances may a new primary key value be hardcoded as a number or value). Your answers for these tasks must be placed in the supplied SQL
Script Q1b-mau-dm.sql
(i) Create sequences which will allow entry of data into the AW_STATUS, AW_DISPLAY and SALE tables - the sequences must begin at 300 and go up in steps
of 1 (i.e., the first value is 300, the next 301, etc.)
*/
DROP SEQUENCE aw_status_seq;

DROP SEQUENCE aw_display_seq;

DROP SEQUENCE sale_seq;

CREATE SEQUENCE aw_status_seq START WITH 300;

CREATE SEQUENCE aw_display_seq START WITH 300;

CREATE SEQUENCE sale_seq START WITH 300;



/*
(b) For the following tasks, your SQL must correctly manage transactions and use sequences to generate new primary keys for numeric primary key values
(under no circumstances may a new primary key value be hardcoded as a number or value). Your answers for these tasks must be placed in the supplied SQL
Script Q1b-mau-dm.sql
You can use the following artwork statuses with an artwork as and when required:
W -  in MAU storage at the MAU central warehouse
T - in transit (being shipped to/from a gallery), include to/from which gallery id
G - located at the gallery, include gallery id
S -  sold, or
R - returned to the artist
(ii) Suppose now it is 10 AM on 22nd October 2020 and an artwork called "Saint Catherine of Siena" has just been received by MAU central warehouse by the
artist with artist code 17. The minimum price at which this artist wants to sell this masterpiece is $500,000. Take the necessary steps in the database
to record the required activities for this new arrival.
*/
INSERT INTO artwork VALUES (
    17,
    (
        SELECT
            artist_noworks + 1
        FROM
            artist
        WHERE
            artist_code = 17
    ),
    'Saint Catherine of Siena',
    500000,
    TO_DATE('22-Oct-2020', 'DD-MON-YYYY')
);

UPDATE artist
SET
    artist_noworks = artist_noworks + 1
WHERE
    artist_code = 17;

INSERT INTO aw_status VALUES (
    aw_status_seq.NEXTVAL,
    17,
    (
        SELECT
            artist_noworks
        FROM
            artist
        WHERE
            artist_code = 17
    ),
    TO_DATE('22-Oct-2020 10:00', 'DD-MON-YYYY HH24:MI'),
    'W',
    NULL
);

COMMIT;



/*
(b) For the following tasks, your SQL must correctly manage transactions and use sequences to generate new primary keys for numeric primary key values
(under no circumstances may a new primary key value be hardcoded as a number or value). Your answers for these tasks must be placed in the supplied SQL
Script Q1b-mau-dm.sql
You can use the following artwork statuses with an artwork as and when required:
W -  in MAU storage at the MAU central warehouse
T - in transit (being shipped to/from a gallery), include to/from which gallery id
G - located at the gallery, include gallery id
S -  sold, or
R - returned to the artist
(iii) From time to time, take the necessary steps in the database to record the following required activities.* No other artworks have been added by this
artist (artist code 17).*
a) On the same day at 11 AM, this new arrival is sent to Karma Art gallery (Ph:0413432569).
b) It is received by the gallery in 3 hours and 15 minutes. MAU is immediately informed of the safe arrival of this extremely precious artwork through a
telephone call.
c) On the next day the gallery places the artwork on display for a total of 10 days.
*/
-- iii a
INSERT INTO aw_status VALUES (
    aw_status_seq.NEXTVAL,
    17,
    (
        SELECT
            artist_noworks
        FROM
            artist
        WHERE
            artist_code = 17
    ),
    TO_DATE('22-Oct-2020 11:00', 'DD-MON-YYYY HH24:MI'),
    'T',
    (
        SELECT
            gallery_id
        FROM
            gallery
        WHERE
            gallery_phone = '0413432569'
    )
);

COMMIT;

-- iii b
INSERT INTO aw_status VALUES (
    aw_status_seq.NEXTVAL,
    17,
    (
        SELECT
            artist_noworks
        FROM
            artist
        WHERE
            artist_code = 17
    ),
    TO_DATE('22-Oct-2020 11:00', 'DD-MON-YYYY HH24:MI') + 3 / 24 + ( 1 / (60*24) ) * 15,
    'G',
    (
        SELECT
            gallery_id
        FROM
            gallery
        WHERE
            gallery_phone = '0413432569'
    )
);

COMMIT;

-- iii c
INSERT INTO aw_display VALUES (
    aw_display_seq.NEXTVAL,
    17,
    (
        SELECT
            artist_noworks
        FROM
            artist
        WHERE
            artist_code = 17
    ),
    TO_DATE('22-Oct-2020', 'DD-MON-YYYY') + 1,
    TO_DATE('22-Oct-2020', 'DD-MON-YYYY') + 10,
    (
        SELECT
            gallery_id
        FROM
            gallery
        WHERE
            gallery_phone = '0413432569'
    )
);

COMMIT;



/*
(b) For the following tasks, your SQL must correctly manage transactions and use sequences to generate new primary keys for numeric primary key values
(under no circumstances may a new primary key value be hardcoded as a number or value). Your answers for these tasks must be placed in the supplied SQL
Script Q1b-mau-dm.sql
You can use the following artwork statuses with an artwork as and when required:
W -  in MAU storage at the MAU central warehouse
T - in transit (being shipped to/from a gallery), include to/from which gallery id
G - located at the gallery, include gallery id
S -  sold, or
R - returned to the artist
(iv) Today is the 5th day since this artwork has been displayed. It is now sold to a customer (customer id 1) for $850,000. Take the necessary steps in
the database to record the required activities.
*/
INSERT INTO sale VALUES (
    sale_seq.NEXTVAL,
    TO_DATE('22-Oct-2020', 'DD-MON-YYYY') + 5,
    850000.00,
    1,
    (
        SELECT
            MAX(aw_display_id)
        FROM
            aw_display
    )
);

INSERT INTO aw_status VALUES (
    aw_status_seq.NEXTVAL,
    17,
    (
        SELECT
            artist_noworks
        FROM
            artist
        WHERE
            artist_code = 17
    ),
    TO_DATE('22-Oct-2020 14:30', 'DD-MON-YYYY HH24:MI') + 5,
    'S',
    NULL
);

UPDATE artist
SET
    artist_noworks = artist_noworks - 1
WHERE
    artist_code = 17;

UPDATE aw_display
SET
    aw_display_end_date = TO_DATE('22-Oct-2020', 'DD-MON-YYYY') + 5
WHERE
    aw_display_id = (
        SELECT
            MAX(aw_display_id)
        FROM
            aw_display
    );


COMMIT;
