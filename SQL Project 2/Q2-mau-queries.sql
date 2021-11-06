--****PLEASE ENTER YOUR DETAILS BELOW****
--Q2-mau-queries.sql
--Student ID: 29051754
--Student Name: DARREN LUWI
--Tutorial No: 12

/* Comments for your marker:




*/


/*
2(i) Query 1
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
select artist_code as "Artist Code", artist_gname ||' ' || artist_fname as "Artist Name",
       case artist_state
       when 'VIC' then 'Victoria'
       when 'NSW' then 'New South Wales'
       when 'WA' then 'Western Australia'
       end "Artist State"
from ARTIST
where artist_state IN ('VIC','NSW','WA')
      AND (artist_gname is null
      or artist_fname is null
      or artist_phone is null)
order by artist_gname ||' '|| artist_fname, artist_code ASC;





/*
2(ii) Query 2
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
select a.artist_code as "Artist Code", ar.artist_gname ||' '|| ar.artist_fname as "Artist Name", a.artwork_no as "Artwork No.", a.artwork_title as "Artwork Title", a.artwork_minpayment as "Artist Min.Payment", round(aw.aws_date_time - a.artwork_submitdate)as "Number of Days with MAU" 
from (ARTIST ar join ARTWORK a on ar.artist_code = a.artist_code) join AW_STATUS aw on a.artist_code = aw.artist_code
where aw.aws_action = 'R'
      and aw.aws_action != 'G'
      and round(aw.aws_date_time - a.artwork_submitdate) <= 120
group by a.artist_code, ar.artist_gname ||' '|| ar.artist_fname, a.artwork_no, a.artwork_title, a.artwork_minpayment, round(aw.aws_date_time - a.artwork_submitdate)
order by a.artist_code asc,  round(aw.aws_date_time - a.artwork_submitdate) desc;
/*
2(iii) Query 3
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
select aw.artist_code as "Artist Code", aw.artwork_no as "Artwork Number", a.artwork_title as "Artwork Title", g.gallery_id as "Gallery Id", g.gallery_name as "Gallery Name", aw.aw_display_start_date as "Display Start Date", round(aw.aw_display_end_date - aw.aw_display_start_date) as "Number of Days in Gallery"
from (gallery g join aw_display aw on g.gallery_id = aw.gallery_id)join artwork a on aw.artist_code = a.artist_code
where aw.aw_display_end_date is not null
      and round(aw.aw_display_end_date - aw.aw_display_start_date) < 13
order by aw.artist_code,aw.artwork_no, round(aw.aw_display_end_date - aw.aw_display_start_date) asc, aw.gallery_id,aw.aw_display_start_date;



/*
2(iv) Query 4
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
select artist_code as "Artist Code", artwork_no as "Artwork No.", artwork_title as "Artwork Title", count(artwork_no) as "Number of Movements"
from ARTWORK natural join AW_STATUS
where artwork_title in (select distinct artwork_title from ARTWORK)
      and (artwork_title, aws_id) in (select distinct artwork_title, aws_id from AW_STATUS where aws_action = 'T' group by aws_id having count(aws_id) = 1)
group by artist_code, artwork_no, artwork_title, artwork_no
having count(artwork_no) < (select avg(artwork_no) from  AW_STATUS where aws_action = 'T')
order by count(artwork_no), artist_code, artwork_title;


/*
2(v) Query 5
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
select
    artist_code as "Artist Code", 
    artwork_title as "Artwork Title",
    round(100*(artwork_minpayment/(100 - (((select gallery_sale_percent from GALLERY where gallery_id = 1)+ 20))))) as "Min. Sale Price Est.(Gallery 1)",
    round(100*(artwork_minpayment/(100 - (((select gallery_sale_percent from GALLERY where gallery_id = 2)+ 20))))) as "Min. Sale Price Est.(Gallery 2)",
    round(100*(artwork_minpayment/(100 - (((select gallery_sale_percent from GALLERY where gallery_id = 3)+ 20))))) as "Min. Sale Price Est.(Gallery 3)",
    round(100*(artwork_minpayment/(100 - (((select gallery_sale_percent from GALLERY where gallery_id = 4)+ 20))))) as "Min. Sale Price Est.(Gallery 4)",
    round(100*(artwork_minpayment/(100 - (((select gallery_sale_percent from GALLERY where gallery_id = 5)+ 20))))) as "Min. Sale Price Est.(Gallery 5)"
from 
    ARTWORK natural join AW_DISPLAY
where 
    aw_display_end_date is null
    and (artwork_no) in (select artwork_no from AW_STATUS where aws_action != 'S')
order by
    artist_code, artwork_title;


    
/*
2(vi) Query 6
*/
--PLEASE PLACE REQUIRED SQL STATEMENT FOR THIS PART HERE
select 
       artist_code as "Artist Code",
       artist_gname ||' '|| artist_fname as "Artist Full name",
       artwork_title as "Artwork Title", 
       gallery_id as "Gallery ID", 
       sale_price as "Sale Price", 
       round((((sale_price - 
      
      (100*((select artwork_minpayment from ARTWORK natural join AW_STATUS where aws_action = 'S' and artwork_minpayment in (select artwork_minpayment from ARTWORK natural join AW_STATUS where aws_action = 'S' group by artwork_minpayment having count(artwork_minpayment) =1 ))/

      (100 - ((select gallery_sale_percent from GALLERY natural join AW_STATUS where aws_action = 'S' and gallery_sale_percent in (select gallery_sale_percent from GALLERY natural join AW_STATUS where aws_action = 'S' group by gallery_sale_percent having count(gallery_sale_percent)=1 )) + 20)))))/ 

      (100*((select artwork_minpayment from ARTWORK natural join AW_STATUS where aws_action = 'S' and artwork_minpayment in (select artwork_minpayment from ARTWORK natural join AW_STATUS where aws_action = 'S' group by artwork_minpayment having count(artwork_minpayment) = 1))/
      
      (100-((select gallery_sale_percent from GALLERY natural join AW_STATUS where aws_action = 'S' and gallery_sale_percent in (select gallery_sale_percent from GALLERY natural join AW_STATUS where aws_action = 'S' group by gallery_sale_percent having count(gallery_sale_percent)= 1)) + 20))))) * 100),2) as "% Sale Above Min. Sell Price"

from
       ((ARTIST natural join ARTWORK)natural join AW_DISPLAY)natural join SALE
where
       (artist_code, artwork_no) in (select artist_code, artwork_no from AW_STATUS where aws_action = 'S');
                     
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       