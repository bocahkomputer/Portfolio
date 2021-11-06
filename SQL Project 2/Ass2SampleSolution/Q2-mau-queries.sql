-- FIT2094 Assignment 2 2020 S2
-- Sample Solution

/*
TASK 2: SQL Queries 
Your answers for these tasks must be placed in the supplied SQL Script Q2-mau-queries.sql
ANSI joins must be used where two or more tables are to be joined, under no circumstances can "implicit join notation" be used - see the week 7 workshop slide 22
and tutorial
*/


/*
(i)
*/
SELECT
    artist_code         "Artist Code",
    ltrim(artist_gname
          || ' '
          || artist_fname)    "Artist Name",
    CASE
        WHEN artist_state = 'VIC' THEN
            'Victoria'
        WHEN artist_state = 'NSW' THEN
            'New South Wales'
        WHEN artist_state = 'WA' THEN
            'Western Australia'
    END                 "Artist State"
FROM
    artist
WHERE artist_state IN ('VIC', 'NSW', 'WA') and
(artist_gname IS NULL
      OR artist_fname IS NULL OR artist_phone is null)
ORDER BY
    "Artist Name", artist_code;



/*
(ii)
*/
SELECT
    arw.artist_code                                         "Artist Code",
    ltrim(art.artist_gname
          || ' '
          || art.artist_fname)                                    "Artist Name",
    arw.artwork_no                                          AS "Artwork No.",
    arw.artwork_title                                       AS "Artwork Title",
    lpad('$' || ltrim(to_char(arw.artwork_minpayment, '9999990.99')), 23)             AS "Artwork Min. Payment",
    floor(aws.aws_date_time - artwork_submitdate)       AS "Number of Days with MAU"
FROM
         artwork arw
    JOIN artist     art ON arw.artist_code = art.artist_code
    JOIN aw_status  aws ON arw.artist_code = aws.artist_code
                          AND arw.artwork_no = aws.artwork_no
WHERE
        aws.aws_action = 'R'
    AND floor(aws.aws_date_time - artwork_submitdate) <= 120 /*floor(aws.aws_date_time - artwork_submitdate) -1 < 120 THIS WAS INITIALLY DONE WHICH IS ALSO CORRECT*/ 
    AND ( arw.artist_code, arw.artwork_no ) NOT IN (
        SELECT DISTINCT
            artist_code, artwork_no
        FROM
            aw_display
    )
ORDER BY
    arw.artist_code,
    "Number of Days with MAU" DESC;

/*
(iii)
*/
SELECT
    arw.artist_code                                                    AS "Artist Code",
    arw.artwork_no                                                     AS "Artwork No.",
    arw.artwork_title                                                  AS "Artwork Title",
    gal.gallery_id                                                     AS "Gallery ID",
    gal.gallery_name                                                   AS "Gallery Name",
    to_char(aw_display_start_date,'Dy DD Month YYYY')                  AS "Display Start Date",
    floor(awd.aw_display_end_date - awd.aw_display_start_date)         AS "Number of Days in Gallery"
FROM
         artwork arw
    JOIN aw_display  awd ON arw.artist_code = awd.artist_code
                           AND arw.artwork_no = awd.artwork_no
    JOIN gallery     gal ON awd.gallery_id = gal.gallery_id
WHERE
    awd.aw_display_end_date < sysdate - 1 and
    floor(awd.aw_display_end_date - awd.aw_display_start_date) < 13
ORDER BY
    arw.artist_code,
    arw.artwork_no,
    "Number of Days in Gallery",
    gal.gallery_id,
    aw_display_start_date;


/*
(iv)
*/
SELECT
    artist_code AS "Artist Code",
    artwork_no AS "Artwork No.",
    artwork_title AS "Artwork Title",
    COUNT(*) AS "Number of Movements"
FROM
         aw_status
    NATURAL JOIN artwork
WHERE
    aws_action = 'T'
GROUP BY
    artist_code,
    artwork_no,
    artwork_title
HAVING
    COUNT(*) < (
        SELECT
            AVG(COUNT(*))
        FROM
            aw_status
        WHERE
            aws_action = 'T'
        GROUP BY
            artist_code,
            artwork_no
    )
ORDER BY
    "Number of Movements",
    artist_code,
    artwork_no;



/*
(v)
*/
SELECT
    lpad(to_char(art.artist_code, '9999'), 10)              AS "Artist Code",
    art.artwork_title                                     AS "Artwork Title",
    lpad('$'
         || ltrim(to_char(ceil(art.artwork_minpayment /(1 -((
        SELECT
            gallery_sale_percent
        FROM
            gallery
        WHERE
            gallery_id = 1
    ) / 100 +(20 / 100)))),
                          '9999999')),
         30)                                              AS "Min. Sale Price Est. (Gallery 1)",
    lpad('$'
         || ltrim(to_char(ceil(art.artwork_minpayment /(1 -((
        SELECT
            gallery_sale_percent
        FROM
            gallery
        WHERE
            gallery_id = 2
    ) / 100 +(20 / 100)))),
                          '9999999')),
         30)                                              AS "Min. Sale Price Est. (Gallery 2)",
    lpad('$'
         || ltrim(to_char(round(art.artwork_minpayment /(1 -((
        SELECT
            gallery_sale_percent
        FROM
            gallery
        WHERE
            gallery_id = 3
    ) / 100 +(20 / 100))),
                                2),
                          '9999999')),
         30)                                              AS "Min. Sale Price Est. (Gallery 3)",
    lpad('$'
         || ltrim(to_char(ceil(art.artwork_minpayment /(1 -((
        SELECT
            gallery_sale_percent
        FROM
            gallery
        WHERE
            gallery_id = 4
    ) / 100 +(20 / 100)))),
                          '9999999')),
         30)                                              AS "Min. Sale Price Est. (Gallery 4)",
    lpad('$'
         || ltrim(to_char(ceil(art.artwork_minpayment /(1 -((
        SELECT
            gallery_sale_percent
        FROM
            gallery
        WHERE
            gallery_id = 5
    ) / 100 +(20 / 100)))),
                          '9999999')),
         30)                                              AS "Min. Sale Price Est. (Gallery 5)"
FROM
    artwork art
WHERE
    ( art.artist_code, art.artwork_no ) NOT IN (
        SELECT
            artist_code, artwork_no
        FROM
            aw_display
        WHERE
            aw_display_id IN (
                SELECT
                    aw_display_id
                FROM
                    sale
            )
    )
    AND ( art.artist_code, art.artwork_no ) NOT IN (
        SELECT
            artist_code, artwork_no
        FROM
            aw_status
        WHERE
            aws_action = 'R'
    )
ORDER BY
    art.artist_code,
    art.artwork_title;


/*
(vi)
*/

SELECT
    lpad(to_char(arw.artist_code,'9999'),10) as "Artist Code",
    ltrim(art.artist_gname
          || ' '
          || art.artist_fname)                                    AS "Artist Full Name",
    arw.artwork_title                                       AS "Artwork Title",
    lpad(to_char(gal.gallery_id,'999'),9)                                          "Gallery ID",
    lpad(to_char(sal.sale_price, '$999999'), 11)             "Sale Price",
    lpad(round(((sal.sale_price -(ceil(arw.artwork_minpayment /(1 -((
        SELECT
            gallery_sale_percent
        FROM
            gallery
        WHERE
            gallery_id = gal.gallery_id
    ) / 100 +(20 / 100)))))) /(ceil(arw.artwork_minpayment /(1 -((
        SELECT
            gallery_sale_percent
        FROM
            gallery
        WHERE
            gallery_id = gal.gallery_id
    ) / 100 +(20 / 100)))))) * 100,
               1)
         || '%',
         29)                                                AS "% Sold Above Min. Sell Price"
FROM
         artist art
    JOIN artwork     arw ON art.artist_code = arw.artist_code
    JOIN aw_display  exh ON exh.artist_code = arw.artist_code
                           AND exh.artwork_no = arw.artwork_no
    JOIN gallery     gal ON gal.gallery_id = exh.gallery_id
    JOIN sale        sal ON sal.aw_display_id = exh.aw_display_id
UNION
( SELECT
    ' ---------', 
    ' ----------------------- ',
    ' ----------------------- ',
    ' --------',
    lpad('AVERAGE:', 11),
    lpad(to_char(AVG((sal.sale_price -(ceil(arw.artwork_minpayment /(1 -((
        SELECT
            gallery_sale_percent
        FROM
            gallery
        WHERE
            gallery_id = gal.gallery_id
    ) / 100 +(20 / 100)))))) /(ceil(arw.artwork_minpayment /(1 -((
        SELECT
            gallery_sale_percent
        FROM
            gallery
        WHERE
            gallery_id = gal.gallery_id
    ) / 100 +(20 / 100))))) * 100),
                 '999.9')
         || '%',
         29) AS "% Sold Above Min. Sell Price"
FROM
         artist art
    JOIN artwork     arw ON art.artist_code = arw.artist_code
    JOIN aw_display  exh ON exh.artist_code = arw.artist_code
                           AND exh.artwork_no = arw.artwork_no
    JOIN gallery     gal ON gal.gallery_id = exh.gallery_id
    JOIN sale        sal ON sal.aw_display_id = exh.aw_display_id
);