--****PLEASE ENTER YOUR DETAILS BELOW****
--Q3-mau-mods.sql
--Student ID: 29051754
--Student Name: DARREN LUWI
--Tutorial No: 12

/* Comments for your marker:
Since we are not allowed to look up values manually from the table, I assume that we are required to code queries to help us answer these questions.
"Commission in Dolars" --> round values to the nearest dollar.


*/


/*
3(i) Changes to live database 1
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE
alter table CUSTOMER 
            add (total_no_of_purchase number (3,0) default 0);

comment on column customer.total_no_of_purchase is 'Total Number of Times Each Customer Has Bought An Artwork'; 

select count(customer_id) from CUSTOMER natural join SALE where customer_id = 1;
update CUSTOMER 
        set total_no_of_purchase = 2
        where customer_id = 1;

select count(customer_id) from CUSTOMER natural join SALE where customer_id = 2;
update CUSTOMER 
        set total_no_of_purchase = 1
        where customer_id = 2;

select count(customer_id) from CUSTOMER natural join SALE where customer_id = 3;
update CUSTOMER 
        set total_no_of_purchase = 1
        where customer_id = 3;

select count(customer_id) from CUSTOMER natural join SALE where customer_id = 4;

select count(customer_id) from CUSTOMER natural join SALE where customer_id = 5;

select count(customer_id) from CUSTOMER natural join SALE where customer_id = 6;

select count(customer_id) from CUSTOMER natural join SALE where customer_id = 7;
update CUSTOMER 
        set total_no_of_purchase = 1
        where customer_id = 7;

select count(customer_id) from CUSTOMER natural join SALE where customer_id = 8;

select count(customer_id) from CUSTOMER natural join SALE where customer_id = 9;

select count(customer_id) from CUSTOMER natural join SALE where customer_id = 10;
update CUSTOMER 
        set total_no_of_purchase = 2
        where customer_id = 10;




/*
3(ii) Changes to live database 2
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE
select aw_display_id,sale_price
from SALE;

select gallery_id, gallery_sale_percent, aw_display_id
from (AW_DISPLAY natural join GALLERY)natural join SALE
where (gallery_id,aw_display_id) in (select gallery_id, aw_display_id from AW_DISPLAY natural join SALE);


select aw_display_id, artwork_title 
from (ARTWORK natural join AW_DISPLAY)natural join SALE;


alter table SALE  
            add(
                mau_commission number(10,2),
                gallery_commission number(10,2),
                artist_actualpayment number(10,2)
            );

comment on column sale.mau_commission is 'The commission in dollars that should be paid to MAU';
comment on column sale.gallery_commission is 'The commission in dollars that should be paid to the gallery';
comment on column sale.artist_actualpayment is 'The actual payment in dollars that should be made to the artist';





select round((sale_price*0.2)) from SALE where aw_display_id = 1;
select round((sale_price*0.2)) from SALE where aw_display_id = 3;
select round((sale_price*0.2)) from SALE where aw_display_id = 5;
select round((sale_price*0.2)) from SALE where aw_display_id = 11;
select round((sale_price*0.2)) from SALE where aw_display_id = 13;
select round((sale_price*0.2)) from SALE where aw_display_id = 14;
select round((sale_price*0.2)) from SALE where aw_display_id = 303;

update SALE
        set mau_commission = 96000
        where aw_display_id = 1;

update SALE
        set mau_commission = 100000
        where aw_display_id = 3;
        
update SALE
        set mau_commission = 98000
        where aw_display_id = 5;

update SALE
        set mau_commission = 136000
        where aw_display_id = 11;
        
update SALE
        set mau_commission = 156000
        where aw_display_id = 13;
        
update SALE
        set mau_commission = 116000
        where aw_display_id = 14;
        
update SALE
        set mau_commission = 170000
        where aw_display_id = 303;

select round((gallery_sale_percent/100) * (select sale_price from SALE where aw_display_id = 1)) from GALLERY where gallery_id = 4;
select round((gallery_sale_percent/100) * (select sale_price from SALE where aw_display_id = 3)) from GALLERY where gallery_id = 2;
select round((gallery_sale_percent/100) * (select sale_price from SALE where aw_display_id = 5)) from GALLERY where gallery_id = 1;
select round((gallery_sale_percent/100) * (select sale_price from SALE where aw_display_id = 11)) from GALLERY where gallery_id = 1;
select round((gallery_sale_percent/100) * (select sale_price from SALE where aw_display_id = 13)) from GALLERY where gallery_id = 3;
select round((gallery_sale_percent/100) * (select sale_price from SALE where aw_display_id = 14)) from GALLERY where gallery_id = 3;
select round((gallery_sale_percent/100) * (select sale_price from SALE where aw_display_id = 303)) from GALLERY where gallery_id = 1;


update SALE
        set gallery_commission = 46080
        where aw_display_id = 1;
        
update SALE
        set gallery_commission = 51500
        where aw_display_id = 3;

update SALE
        set gallery_commission = 27440
        where aw_display_id = 5;
        
update SALE
        set gallery_commission = 38080
        where aw_display_id = 11;
        
update SALE
        set gallery_commission = 58500
        where aw_display_id = 13;
        
update SALE
        set gallery_commission = 43500
        where aw_display_id = 14;
        
update SALE
        set gallery_commission = 47600
        where aw_display_id = 303;


select round (sale_price * (1 - 0.20 - 0.096)) from SALE where aw_display_id = 1;
select round (sale_price * (1 - 0.20 - 0.096)) from SALE where aw_display_id = 3;
select round (sale_price * (1 - 0.20 - 0.096)) from SALE where aw_display_id = 5;
select round (sale_price * (1 - 0.20 - 0.096)) from SALE where aw_display_id = 11;
select round (sale_price * (1 - 0.20 - 0.096)) from SALE where aw_display_id = 13;
select round (sale_price * (1 - 0.20 - 0.096)) from SALE where aw_display_id = 14;
select round (sale_price * (1 - 0.20 - 0.096)) from SALE where aw_display_id = 303;

update SALE
        set artist_actualpayment = 337920
        where aw_display_id = 1;
        
update SALE
        set artist_actualpayment = 352000
        where aw_display_id = 3;
        
update SALE
        set artist_actualpayment = 344960
        where aw_display_id = 5;
        
update SALE
        set artist_actualpayment = 478720
        where aw_display_id = 11;
        
update SALE
        set artist_actualpayment = 549120
        where aw_display_id = 13;
        
update SALE
        set artist_actualpayment = 408320
        where aw_display_id = 14;
        
update SALE
        set artist_actualpayment = 598400
        where aw_display_id = 303;

alter table SALE modify (mau_commission not null);
alter table SALE modify (gallery_commission not null);
alter table SALE modify (artist_actualpayment not null);

/*
3(iii) Changes to live database 3
*/
--PLEASE PLACE REQUIRED SQL STATEMENTS FOR THIS PART HERE

create table GALLERY_EXHIBITION(
            exhibition_code number(2) not null,
            exhibition_name varchar2(50) not null,
            exhibition_theme char(1) not null,
            artwork_details varchar2(50) not null,
            total_no_of_artworks number(2) not null,
            exhibition_startdate date not null,
            exhibition_enddate date not null,
            constraint gallery_exhibition_pk primary key(exhibition_code)
        );
        
alter table GALLERY_EXHIBITION
            add (constraint exhibition_theme_chk CHECK (exhibition_theme in ('A','M','O')));
            
commit;
 










