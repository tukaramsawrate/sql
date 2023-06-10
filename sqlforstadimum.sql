
select * from score;

create table stadium (
id int,
visit_date date,
no_of_people int
);

insert into stadium
values (1,'01-07-2017',10);
insert into stadium
values(2,'02-07-2017',109);
insert into stadium
values(3,'03-07-2017',150);
insert into stadium
values(4,'04-07-2017',99);
insert into stadium
values(5,'05-07-2017',145);
insert into stadium
values(6,'06-07-2017',1455);
insert into stadium
values(7,'07-07-2017',199);
insert into stadium
values(8,'08-07-2017',188);


select * from stadium;
rollback;


with d1 as(
select id,visit_date,no_of_people,
id-row_number() over(order by id)rn from stadium where no_of_people>100)
select * from d1 where rn in(select rn from d1 group by rn having count(*)>=3);






create table business_city (
business_date date,
city_id int
);
insert into business_city
values(cast('02-01-2020' as date),3);
insert into business_city
values(cast('01-07-2020' as date),7);,
insert into business_city
values(cast('01-01-2021' as date),3);,
insert into business_city
values(cast('03-02-2021' as date),19);
insert into business_city
values(cast('01-12-2022' as date),3);,
insert into business_city
values(cast('15-12-2022' as date),3);,
insert into business_city
values(cast('28-02-2022' as date),12);


select * from business_city;


select to_char(business_date,'yyyy')year1,count(*)  from business_city
group by to_char(business_date,'yyyy');












create table locationlogg(user1 int,location1 varchar2(20));

insert into locationlogg values(1,'kolkata');
insert into locationlogg values(1,'mumbai');
insert into locationlogg values(1,'delhi');
insert into locationlogg values(2,'kolkata');
insert into locationlogg values(2,'chanii');
insert into locationlogg values(2,'lucknow');

select * from locationlogg;

with d1 as(
select location1,count(*)c from locationlogg group by location1)
select * from(select location1,c,dense_rank() over(order by c desc)d2 from d1)
where d2=1;
select * from locationlogg;

select user1,count(*) from locationlogg where location1='kolkata' group by user1
having count>2;


select user1 from locationlogg where location1='kolkata' group bu user1 having count(*)>2 and
user1 not in(select user1 from locationlogg where location1='mumbai');