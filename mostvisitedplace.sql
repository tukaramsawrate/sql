


select * from locationlogg;

--most visited place
SELECT Location1, COUNT(*) AS TravelCount
FROM locationlogg
GROUP BY Location1
ORDER BY TravelCount DESC
fetch first 1 rows only  ;


--user visited at least 2 times in kolkata but same user not visited mumbai
select user1 from locationlogg where Location1='kolkata' group by user1 having count(*)>1
and user1 not in(select user1 from locationlogg  where location1='mumbai');


--count the year wise new city_id
select * from business_city;


--select to_char(b1.business_date,'yyyy')yr,b1.city_id,to_char(b2.business_date,'yyyy')yr1,b2.city_id
select to_char(b1.business_date,'yyyy')yr,count(case when b2.city_id is null then b1.city_id end)cnt
 from business_city
b1 left join business_city b2 on to_char(b1.business_date,'yyyy')>to_char(b2.business_date,'yyyy')
and b2.city_id = b1.city_id
group by to_char(b1.business_date,'yyyy');





create table call_details  (
call_type varchar(10),
call_number varchar(12),
call_duration int
);

insert into call_details
values ('OUT','181868',13);
insert into call_details
values('OUT','2159010',8);
insert into call_details
values('OUT','2159010',178);
insert into call_details
values('SMS','4153810',1);
insert into call_details
values('OUT','2159010',152);
insert into call_details
values('OUT','9140152',18);
insert into call_details
values('SMS','4162672',1);
insert into call_details
values('SMS','9168204',1);
insert into call_details
values('OUT','9168204',576);
insert into call_details
values('INC','2159010',5);
insert into call_details
values('INC','2159010',4);
insert into call_details
values('SMS','2159010',1);
insert into call_details
values('SMS','4535614',1);
insert into call_details
values('OUT','181868',20);
insert into call_details
values('INC','181868',54);
insert into call_details
values('INC','218748',20);
insert into call_details
values('INC','2159010',9);
insert into call_details
values('INC','197432',66);
insert into call_details
values('SMS','2159010',1);
insert into call_details
values('SMS','4535614',1);


select * from call_details;


select * from call_details where call_type ='INC' or call_type='OUT';

--find the phone no which have incoming and outgoing call and outgoining duration is more than incoming
with d1 as(
select call_number,sum(case when call_type='INC' then call_duration else null end)i,
sum(case when call_type='OUT' then call_duration else null end)o from call_details group by call_number)
select * from d1 where i is not null and o is not null and o>i;

--find out the available balance in each date
select transcation_date,sum(case when type='deposit' then amount else -1*amount end) over(order by transcation_date)su
from transcation;