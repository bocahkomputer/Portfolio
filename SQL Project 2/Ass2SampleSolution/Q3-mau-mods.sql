-- FIT2094 Assignment 2 2020 S2
-- Sample Solution

/*TASK 3: Design Modifications
Your answers for these tasks must be placed in the supplied SQL Script Q3-mau-mods.sql
These tasks should be attempted only after task 1 and task 2 have been successfully completed. They are to be completed on the "live" database ie.
the database with the data loaded from your previous work.
*/

/*(i) MAU would like to be able to easily determine the total number of times each customer
has bought an artwork. Add a new attribute which will record this requirement.

Based on the data which is currently stored in the system​, this attribute must be initialised
to the correct current number of times each customer has bought an artwork.
*/

ALTER TABLE customer ADD customer_sale_count NUMBER(3) default 0;

COMMENT ON COLUMN customer.customer_sale_count IS
    'No. of times customer bought an artwork';

UPDATE customer
SET
    customer_sale_count = (
        SELECT
            COUNT(*)
        FROM
            sale
        WHERE
            customer_id = customer.customer_id
    );

COMMIT;



/*(ii) For each artwork that has been sold, MAU would like to record i) the commission in
dollars that should be paid to them ii) the commission in dollars that should be paid to the
gallery and iii) the actual payment in dollars that should be made to the artist.

Based on the data which is currently stored in the system​, change the database to meet
this requirement such that these individual amounts are now also readily available in the
database for all sales which have taken place. You may assume that the current
percentage commissions were the same when the artwork was sold.
*/

ALTER TABLE sale ADD sale_mau_comm_amt NUMBER(9, 2);

ALTER TABLE sale ADD sale_gall_comm_amt NUMBER(9, 2);

ALTER TABLE sale ADD sale_artist_act_pay_amt NUMBER(9, 2);

COMMENT ON COLUMN sale.sale_mau_comm_amt IS
    'Commission to MAU in dollars';

COMMENT ON COLUMN sale.sale_gall_comm_amt IS
    'Commission to Gallery in dollars';

COMMENT ON COLUMN sale.sale_artist_act_pay_amt IS
    'Actual Payment to Artist in dollars';

UPDATE sale sal
SET
    sale_mau_comm_amt = sale_price * 0.2,
    sale_gall_comm_amt = sale_price * (
        SELECT
            gallery_sale_percent
        FROM
            gallery
        WHERE
            gallery_id = (
                SELECT
                    gallery_id
                FROM
                    aw_display
                WHERE
                    aw_display_id = sal.aw_display_id
            )
    ) / 100,
    sale_artist_act_pay_amt = sale_price - ( sale_price * 0.2 ) - sale_price * (
        SELECT
            gallery_sale_percent
        FROM
            gallery
        WHERE
            gallery_id = (
                SELECT
                    gallery_id
                FROM
                    aw_display
                WHERE
                    aw_display_id = sal.aw_display_id
            )
    ) / 100;

COMMIT;

ALTER TABLE sale MODIFY
    sale_mau_comm_amt NUMBER(9, 2) NOT NULL;

ALTER TABLE sale MODIFY
    sale_gall_comm_amt NUMBER(9, 2) NOT NULL;

ALTER TABLE sale MODIFY
    sale_artist_act_pay_amt NUMBER(9, 2) NOT NULL;


/*(iii) MAU have observed that Galleries often display several items from the MAU stock
with the same starting date and for the same period. They in effect create a Gallery
Exhibition themed around a particular artist, media or other theme. To better record, and
publicise, these exhibitions MAU would like to record a numeric exhibition code as an
identifier, the name for the exhibition, the theme of the exhibition ( A: artist, M: media, or O:
other), the details of the artworks which are displayed and the total number of artworks
which make up the exhibition. An exhibition must contain at least one artwork.

Based on the data that is currently stored in the system, change the database to meet this
requirement. Add an exhibition themed around a particular artist for one of your galleries
using the artworks you have on display from Q1(a). You may hardcode the gallery id,
artist code and display start and end dates.

*/

DROP TABLE exhibition PURGE;

DROP SEQUENCE exhibition_seq;

ALTER TABLE aw_display DROP COLUMN exhibition_id;

CREATE SEQUENCE exhibition_seq;

CREATE TABLE exhibition (
    exhibition_id             NUMBER(5),
    exhibition_name           VARCHAR2(50) NOT NULL,
    exhibition_theme          CHAR(1) NOT NULL,
    exhibition_artwork_count  NUMBER(3) NOT NULL
);

COMMENT ON COLUMN exhibition.exhibition_id IS
    'Exhibition ID';

COMMENT ON COLUMN exhibition.exhibition_name IS
    'Exhibition Name';

COMMENT ON COLUMN exhibition.exhibition_theme IS
    'Exhibition Theme
A - Artist
M - Media
O - Other
';

COMMENT ON COLUMN exhibition.exhibition_artwork_count IS
    'Number of Artworks in an exhibition';

ALTER TABLE exhibition ADD CONSTRAINT exhibition_pk PRIMARY KEY ( exhibition_id );

ALTER TABLE exhibition
    ADD CONSTRAINT exhibition_chk CHECK ( exhibition_theme IN ( 'A', 'M', 'O' ) );

ALTER TABLE exhibition
    ADD CONSTRAINT exhibition_chk2 CHECK ( exhibition_artwork_count > 0 );

ALTER TABLE aw_display ADD exhibition_id NUMBER(5);

COMMENT ON COLUMN aw_display.exhibition_id IS
    'Exhibition ID';

alter table aw_display add constraint exhibition_aw_display foreign key (exhibition_id) references exhibition (exhibition_id);


--Add an exhibition of two artworks themed around a particular artist for one of
--your galleries using the artworks you have on display from Q1 (a).

INSERT INTO exhibition VALUES (
    exhibition_seq.NEXTVAL,
    'Reeba Wildman',
    'A',
    (select count(*) from  aw_display
    WHERE
        artist_code = 8
    AND gallery_id  = 5
    AND aw_display_start_date = TO_DATE('05-jul-2020', 'dd-mon-yyyy')
    AND aw_display_end_date = TO_DATE('18-jul-2020', 'dd-mon-yyyy'))
);

--artist_code = 8, aw_display_start_date = 05-jul-2020 & aw_display_end_date=to_date = 18-jul-2020
UPDATE aw_display
SET
    exhibition_id = exhibition_seq.CURRVAL
WHERE
        artist_code = 8
    AND gallery_id  = 5
    AND aw_display_start_date = TO_DATE('05-jul-2020', 'dd-mon-yyyy')
    AND aw_display_end_date = TO_DATE('18-jul-2020', 'dd-mon-yyyy');

COMMIT;