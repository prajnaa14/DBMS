create table student( 
usn varchar(45) primary key, 
sname varchar(45), 
addr varchar(45), 
phone number, 
gender varchar(10) 
); 
insert into student values('4SF21CD001','aby','Mangalore','98765445','M'); 
insert into student values('4SF21AD001','abhi','Mangalore','98765445','M'); 
insert into student values('4SF21AD002','abhijna','Mysore','98765445','F'); 
insert into student values('4SF21AD003','abhinaya','udupi','98765445','F'); 
insert into student values('4SF21AD004','abhishek','bangalore','98765445','M'); 
insert into student values('4SF21AD005','adithi','mumbai','98765445','F'); 
insert into student values('4SF21AD006','sujnan','Mangalore','98765445','M'); 
insert into student values('4SF21AD007','aksha','gujarath','98765445','F'); 
insert into student values('4SF21AD008','sujan','udupi','98765445','M'); 
insert into student values('4SF21AD009','sangam','Mangalore','98765445','M'); 
create table semsec( 
ssid varchar(45) primary key, 
sem number, 
sec varchar(4) 
); 
insert into semsec values('1','4','c'); 
insert into semsec values('2','4','c'); 
insert into semsec values('3','8','c'); 
insert into semsec values('4','8','a'); 
insert into semsec values('5','6','b'); 
insert into semsec values('7','6','c'); 
insert into semsec values('8','6','c'); 
insert into semsec values('9','8','b'); 
insert into semsec values('10','4','c'); 
create table class( 
usn varchar(45), 
ssid varchar(45), 
primary key(usn,ssid), 
foreign key(usn) references student(usn) on delete cascade, 
foreign key(ssid) references semsec(ssid) on delete cascade 
); 
insert into class values('4SF21CD001','10'); 
insert into class values('4SF21AD001','9'); 
insert into class values('4SF21AD002','8'); 
insert into class values('4SF21AD003','7'); 
insert into class values('4SF21AD004','6'); 
insert into class values('4SF21AD005','5'); 
insert into class values('4SF21AD006','4'); 
insert into class values('4SF21AD007','3'); 
insert into class values('4SF21AD008','2'); 
insert into class values('4SF21AD009','1'); 
create table course( 
subcode varchar(45) primary key, 
t
 itle  varchar(45), 
sem number, 
credits number 
); 
insert into course values('21CS31','PAI','6',3); 
insert into course values('21CS32','DAA','4',4); 
insert into course values('21CS33','OS','6',3); 
insert into course values('21CS34','DBMS','6',2); 
insert into course values('21CS35','MMl','4',3); 
insert into course values('21CS36','DS','8',2); 
create table iamarks( 
usn varchar(45), 
subcode varchar(45), 
ssid varchar(45), 
test1 number, 
test2 number, 
test3 number, 
f
 inalian number, 
primary key(usn,subcode,ssid), 
foreign key(usn) references student(usn)on delete cascade, 
foreign key(ssid) references semsec(ssid)on delete cascade, 
foreign key(subcode) references course(subcode)on delete cascade 
); 
insert into iamarks values('4SF21CD001','21CS31','1','43','32','35','0'); 
insert into iamarks values('4SF21CD001','21CS32','1','40','49','45','0'); 
insert into iamarks values('4SF21AD001','21CS31','2','45','32','39','0'); 
insert into iamarks values('4SF21AD001','21CS34','1','49','48','45','0'); 
insert into iamarks values('4SF21AD002','21CS35','3','42','46','35','0'); 
insert into iamarks values('4SF21AD003','21CS33','4','40','45','37','0'); 
insert into iamarks values('4SF21AD004','21CS34','5','48','40','39','0'); 
insert into iamarks values('4SF21AD005','21CS32','8','44','44','37','0'); 
insert into iamarks values('4SF21AD006','21CS31','9','39','37','49','0'); 
insert into iamarks values('4SF21AD007','21CS34','6','33','45','35','0'); 
insert into iamarks values('4SF21AD008','21CS33','1','35','42','40','0'); 
insert into iamarks values('4SF21AD009','21CS32','10','36','42','35','0'); 
1. 
select distinct a.*, b.sem,b.sec from semsec b, student a,class c where sem=4 AND sec='c' AND 
a.usn=c.usn AND b.ssid=c.ssid; 
2. 
SELECT SEM,SEC,GENDER,COUNT(*) FROM student S,semsec SL,class C  
WHERE S.USN =C.USN AND SL.SSID=C.SSID GROUP BY (GENDER,SEM,SEC)ORDER BY (SEM); 
3. 
create view test as 
select test1,subcode from iamarks where usn='4SF21CD001'; 
select * from test; 
4. 
update iamarks set finalian=(test1+test2+test3)/3; 
select * from iamarks; 
5. 
select ia.usn, ia.finalian, 
(case 
when ia.finalian between 45 and 50 then 'excellent' 
when ia.finalian between 40 and 44 then 'good' 
when ia.finalian between 30 and 39 then 'average' 
else 'weak' END  
) as CAT 
from student s ,iamarks ia,semsec se where s.usn=ia.usn AND se.ssid=ia.ssid AND se.sem=8; 