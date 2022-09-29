/* Select black samples*/
drop table if exists black_event;
create table black_event as
select *
from account_all
where user_id in (select userid from account_black)
and substr(register_dt,1,10) between '2019-12-01' and '2020-03-31';

/*Select white samples*/
drop table if exists white_event;
create table white_event as
select * from (select * 
from account_all
where user_id not in (select userid from account_black)
and substr(register_dt,1,10) between '2019-12-01' and '2020-03-31') as white_event;

/*Calculate numbers of rows*/
select 'Black events' Tablename, 
count(*) rows
from black_event
union
select 'White events' Tablename,
count(*) rows
from white_event;


/*Fetch random samples from white events*/
drop table if exists random_sample_white;
create table random_sample_white as
select * 
from white_event
order by rand()
limit 30;


/* Drive table*/
drop table if exists drive_table;
create table drive_table as
select a.user_id, a.user_name, a.devise_sign, a.register_dt, b.eventid, b.amt, b.opposing_id, b.gmt_occur,
case
when exists (select * from black_event be where a.user_id = be.user_id) Then '1'
when exists (select * from white_event we where a.user_id = we.user_id) Then '0'
else 'Null'
end as 'Target'
from account_all a
left join account_black b 
on a.user_id = b.userid

/* Drive table (methods 2)*/
create table drive_table as select a.*,
case when b.eventid is null then 'White'
else 'BLACK' end as Label 
from account_all as a
left join account_black as b on a.user_id = b.user_id
where a.register_dt between 2019-12-01 and 2020-03-31
order by a.register_dt;