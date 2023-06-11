


create table purchase_history
(userid int
,productid int
,purchasedate date
);


insert into purchase_history values
(1,1,'23-01-2012');
insert into purchase_history values
(1,2,'23-01-2012');
insert into purchase_history values
(1,3,'25-01-2012');
insert into purchase_history values
(2,1,'23-01-2012');
insert into purchase_history values
(2,2,'23-01-2012');
insert into purchase_history values
(2,2,'25-01-2012');
insert into purchase_history values
(2,4,'25-01-2012');
insert into purchase_history values
(3,4,'23-01-2012');
insert into purchase_history values
(3,1,'23-01-2012');
insert into purchase_history values
(4,1,'23-01-2012');
insert into purchase_history values
(4,2,'25-01-2012')
;

select userid,count(distinct(purchasedate))c1 ,count(distinct productid),count(productid) from 
purchase_history group by userid having count(distinct purchasedate)>1 and count(distinct productid)=count(productid) ;



CREATE TABLE booking_table(
   Booking_id       VARCHAR(3) NOT NULL 
  ,Booking_date     date NOT NULL
  ,User_id          VARCHAR(2) NOT NULL
  ,Line_of_business VARCHAR(6) NOT NULL
);



INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b1','23-03-2022','u1','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b2','27-03-2022','u2','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b3','28-03-2022','u1','Hotel');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b4','31-03-2022','u4','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b5','02-04-2022','u1','Hotel');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b6','02-04-2022','u2','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b7','06-04-2022','u5','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b8','06-04-2022','u6','Hotel');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b9','06-04-2022','u2','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b10','10-04-2022','u1','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b11','12-04-2022','u4','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b12','16-04-2022','u1','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b13','19-04-2022','u2','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b14','20-04-2022','u5','Hotel');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b15','22-04-2022','u6','Flight');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b16','26-04-2022','u4','Hotel');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b17','28-04-2022','u2','Hotel');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b18','30-04-2022','u1','Hotel');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b19','04-05-2022','u4','Hotel');
INSERT INTO booking_table(Booking_id,Booking_date,User_id,Line_of_business) VALUES ('b20','06-05-2022','u1','Flight');
;

select * from booking_table;


CREATE TABLE user_table(
   User_id VARCHAR(3) NOT NULL
  ,Segment VARCHAR(2) NOT NULL
);
INSERT INTO user_table(User_id,Segment) VALUES ('u1','s1');
INSERT INTO user_table(User_id,Segment) VALUES ('u2','s1');
INSERT INTO user_table(User_id,Segment) VALUES ('u3','s1');
INSERT INTO user_table(User_id,Segment) VALUES ('u4','s2');
INSERT INTO user_table(User_id,Segment) VALUES ('u5','s2');
INSERT INTO user_table(User_id,Segment) VALUES ('u6','s3');
INSERT INTO user_table(User_id,Segment) VALUES ('u7','s3');
INSERT INTO user_table(User_id,Segment) VALUES ('u8','s3');
INSERT INTO user_table(User_id,Segment) VALUES ('u9','s3');
INSERT INTO user_table(User_id,Segment) VALUES ('u10','s3');


select * from user_table;
select * from booking_table;

select segment,count(distinct uk.user_id)tc,count(distinct case when line_of_business='Flight' and booking_date between'01-04-2022' and '30-04-2022'
then uk1.user_id end)
from user_table uk left join booking_table uk1 
on uk.user_id=uk1.user_id group by segment;

--user whose first booking is hotel

select * from booking_table;
select * from(
select user_id,booking_date,line_of_business,rank() over(partition by user_id order by booking_date)dr from booking_table)
where dr=1 and line_of_business='Hotel';
 

select * from booking_table;

--query for calculate the days between first booking and last booking
select user_id,min(booking_date),max(booking_date),max(booking_date)-min(booking_date)days from  booking_table
group by user_id;

--the number of flight and hotel booking in each segemnt 
select segment, count(case when line_of_business='Hotel' then 1 end)hotel_booking,
count(case when line_of_business='Flight' then 1 end)flight_booking from user_table uk join booking_table uk1 
on uk.user_id=uk1.user_id
group by segment
;




 
 
