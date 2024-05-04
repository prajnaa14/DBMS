create table publisher( 
name varchar(20) primary key, 
paddr varchar(20), 
phone number     
); 
insert into publisher values('elite','mangalore',876543234); 
insert into publisher values('zen','mysore',876543234); 
insert into publisher values('express','bangalore',876543234); 
insert into publisher values('sudha moorthi','mumbai',876543234); 
insert into publisher values('aptimitra','mangalore',876543234); 
create table libprogramme( 
pgmid varchar(20)primary key, 
pgmname varchar(20), 
pgmaddr varchar(20) 
); 
insert into libprogramme values('p1','akriti','mysore'); 
insert into libprogramme values('p2','sahyadri','mangalore'); 
insert into libprogramme values('p3','agnes','bangalore'); 
insert into libprogramme values('p4','sankalp','mumbai'); 
insert into libprogramme values('p5','the best','delhi'); 
create table borrower( 
cardno varchar(20) primary key, 
bname varchar(20), 
baddr varchar(20), 
phone varchar(20) 
); 
insert into borrower values('c1','raksha','padil',98765423); 
insert into borrower values('c2','aksha','tumbe',98765423); 
insert into borrower values('c3','prajna','mangalore',98765423); 
insert into borrower values('c4','keerthi','surathkal',98765423); 
insert into borrower values('c5','pooja','puttur',98765423); 
insert into borrower values('c6','navami','bantwal',98765423); 
create table book( 
bid varchar(20) primary key, 
t
 itle varchar(20), 
pname varchar(20), 
pubyear varchar(20), 
foreign key(pname) references publisher(name) on delete cascade 
); 
select * from book; 
insert into book values('b1','the wings of fire','elite','2012'); 
insert into book values('b2','hello','zen','2023'); 
insert into book values('b3','mud town','express','2015'); 
insert into book values('b4','hello','aptimitra','2016'); 
insert into book values('b5','10 seconds','sudhamoorthi','2020'); 
create table bookauthor( 
bid varchar(20) primary key, 
authname varchar(20), 
foreign key(bid) references book(bid) on delete cascade 
); 
insert into bookauthor values('b1','abhishek'); 
insert into bookauthor values('b2','abhishek'); 
insert into bookauthor values('b3','abdul kalam'); 
insert into bookauthor values('b4','chethan'); 
insert into bookauthor values('b5','raman'); 
create table bookcopies( 
bid varchar(20), 
pgmid varchar(20), 
noofcopues number, 
primary key(bid,pgmid), 
foreign key(bid) references book(bid) on delete cascade, 
foreign key(pgmid) references libprogramme(pgmid) on delete cascade 
); 
insert into bookcopies values('b1','p1',10); 
insert into bookcopies values('b2','p2',15); 
insert into bookcopies values('b3','p3',19); 
insert into bookcopies values('b4','p4',20); 
insert into bookcopies values('b5','p5',30); 
create table booklending( 
bid varchar(20), 
cardno varchar(20), 
pgmid varchar(20), 
dateout date, 
duedate date, 
primary key(bid,cardno,pgmid), 
foreign key(bid) references book(bid) on delete cascade, 
foreign key(cardno) references borrower(cardno) on delete cascade, 
foreign key(pgmid) references libprogramme(pgmid) on delete cascade 
); 
insert into booklending values('b1','c1','p1','2-JAN-2023','29-July-2023'); 
insert into booklending values('b2','c2','p2','3-JAN-2010','30-may-2019'); 
insert into booklending values('b3','c3','p3','2-may-2013','10-July-2019'); 
insert into booklending values('b4','c4','p4','2-dec-2020','10-July-2022'); 
insert into booklending values('b5','c5','p5','3-feb-2023','30-June-2023'); 
insert into booklending values('b2','c1','p1','3-JAN-2023','26-July-2023'); 
insert into booklending values('b3','c1','p1','4-JAN-2023','25-July-2023'); 
1.
select b.bid,b.title,b.pname,a.authname,c.noofcopues from book b,bookauthor a, bookcopies c 
where b.bid=c.bid AND b.bid=a.bid; 
2.
SELECT cardno, bname, baddr  
FROM borrower  
WHERE cardno IN ( 
SELECT cardno  
FROM booklending  
WHERE dateout BETWEEN '1-jan-2023' AND '30-july-2023' 
GROUP BY cardno  
HAVING COUNT(*) >= 3 
); 
3.
delete from book where bid='b5'; 
select * from book; 
select * from booklending; 
4.
create table book1( 
bid varchar(20) primary key, 
t
 itle varchar(20), 
pname varchar(20), 
pubyear varchar(20), 
foreign key(pname) references publisher(name) on delete cascade 
)  
partition by range(pubyear) 
( 
partition p1 values less than (2010), 
partition p2 values less than (2015), 
partition p3 values less than (2020), 
partition p4 values less than (maxvalue) 
); 
insert into book1 values('b1','the wings of fire','elite','2012'); 
insert into book1 values('b2','hello','zen','2023'); 
insert into book1 values('b3','mud town','express','2015'); 
insert into book1 values('b4','hello','aptimitra','2016'); 
insert into book1 values('b5','10 seconds','sudhamoorthi','2020'); 
insert into book1 values('b6','the wings of fire','elite','2012'); 
insert into book1 values('b7','hello','zen','2006'); 
insert into book1 values('b8','mud town','express','2005'); 
insert into book1 values('b9','hello','aptimitra','2016'); 
insert into book1 values('b10','10 seconds','sudhamoorthi','2020'); 
select * from book1 partition(p1); 
5.
create view LIB as 
select a.bid,a.title,b.pgmid,b.noofcopues from book a, bookcopies b where a.bid=b.bid; 
select * from LIB;