create table employee( 
eid varchar(20) primary key, 
name varchar(20), 
address varchar(20), 
gender varchar(20), 
salary number, 
supereid varchar(20), 
dno varchar(20), 
foreign key(supereid) references employee(eid) on delete cascade 
); 
insert into employee values('1','Rahul','Mangalore','M','40000','1','0'); 
insert into employee values('2','Ramya','Mumbai','F','90000','1','0'); 
insert into employee values('3','Raksha','Mysore','F','140000','1','0'); 
insert into employee values('4','Aksha','Bangalore','F','480000','1','0'); 
insert into employee values('5','Sujnan','Kolkatta','M','94000','1','0'); 
insert into employee values('6','Keerthi','Mangalore','F','40000','1','0'); 
create table department( 
dno varchar(20) primary key, 
dname varchar(20), 
dmgrid varchar(20), 
mgrstart number, 
foreign key(dmgrid) references employee(eid) on delete cascade 
); 
insert into department values('1','IT','1','2015'); 
insert into department values('2','AIML','2','2016'); 
insert into department values('3','ISE','3','2019'); 
insert into department values('5','FINANCE','4','2020'); 
insert into department values('4','CSE','5','2021'); 
create table dlocation( 
dno varchar(20), 
dloc varchar(20), 
primary key(dno,dloc), 
foreign key(dno) references department(dno) on delete cascade 
); 
insert into dlocation values('1','Mangalore'); 
insert into dlocation values('2','Mumbai'); 
insert into dlocation values('3','Mysore'); 
insert into dlocation values('4','Bangalore'); 
insert into dlocation values('5','Delhi'); 
create table project( 
pno varchar(20) primary key, 
pname varchar(20), 
ploc varchar(20), 
dno varchar(20), 
foreign key(dno) references department(dno) on delete cascade 
); 
insert into project values('100','IOT','Mangalore','1'); 
insert into project values('101','DBMS','Mysore','2'); 
insert into project values('102','Research','Bangalore','5'); 
insert into project values('103','ARM','Delhi','4'); 
insert into project values('104','Python','Bantwal','3'); 
create table workson( 
eid varchar(20), 
pno varchar(20), 
hours number, 
primary key(eid,pno), 
foreign key(eid) references employee(eid)on delete cascade, 
foreign key(pno) references project(pno)on delete cascade 
); 
insert into workson values('1','100','10'); 
insert into workson values('2','101','11'); 
insert into workson values('3','102','8'); 
insert into workson values('4','103','12'); 
insert into workson values('5','104','15'); 
create table dependent( 
depno varchar(20), 
eid varchar(20), 
gender varchar(10), 
bdate date, 
relation varchar(20), 
foreign key(eid) references employee(eid) on delete cascade    
); 
insert into dependent values('d1','1','M','14-jan-2000','brother'); 
insert into dependent values('d2','3','F','14-jan-1998','wife'); 
insert into dependent values('d3','2','M','14-jan-1990','brother'); 
ALTER TABLE employee ADD CONSTRAINT FK FOREIGN KEY (dno) REFERENCES department(dno); 
update employee set dno='1' wehere eid='1'; 
update employee set dno='2' wehere eid='2'; 
update employee set dno='3' wehere eid='3'; 
update employee set dno='4' wehere eid='4'; 
update employee set dno='5' wehere eid='5'; 
update employee set dno='1' wehere eid='6'; 
1).
select pno from workson where eid in(select eid from employee where name='Rahul')UNION 
select pno from project where dno in(select dno from department where dmgrid in(select eid from 
employee where name='Rahul')); 
2.
SELECT E.NAME, 1.1*SALARY AS INCREASED_SALARY FROM EMPLOYEE E, PROJECT P, WORKS_ON W 
WHERE E.SSN=W.SSN AND P.PNO=W.PNO AND P.PNAME='IOT'; 
3. 
select sum(salary),avg(salary),max(salary),min(salary) from  employee e ,department d where 
e.dno=e.dno AND dname='FINANCE'; 
4. 
select eid,name from employee e where not exists((select pno from project where dno=5)MINUS 
(select pno from workson where e.eid=w.eid)); 
5. 
create view dep(dname,emp_no,total_sal) 
select d.dname,count(*),sum(salary) from department d inner join employee e  
where d.dno=e.dno group by d.dname;