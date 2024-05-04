create table branch( 
bid varchar(45) primary key, 
bname varchar(45), 
brname varchar(45), 
assets number 
); 
insert into branch values('b1','canara','mangalore',123456); 
insert into branch values('b2','SBI','bangalore',50876); 
insert into branch values('b3','Bharat Bank','Mysore',523456); 
insert into branch values('b4','Karnataka','mangalore',343456); 
insert into branch values('b5','vijaya','delhi',509456); 
insert into branch values('b6','Union','mangalore',73456); 
insert into branch values('b7','Union','ballary',73456); 
create table customer( 
cid varchar(45) primary key, 
cname varchar(45), 
caddr varchar(45), 
cphone varchar(45) 
); 
insert into customer values('c1','Prajna','mangalore','9764314679'); 
insert into customer values('c2','Pooja','Puttur','9764314679'); 
insert into customer values('c3','Raksha','padil','9764314679'); 
insert into customer values('c4','Aksha','adyar','9764314679'); 
insert into customer values('c5','Keerthi','surathkal','9764314679'); 
create table account( 
accno varchar(45) primary key, 
acctype varchar(45), 
accbal number, 
cid varchar(45), 
bid varchar(45), 
foreign key(cid) references customer(cid) on delete cascade, 
foreign key(bid) references branch(bid) on delete cascade 
); 
insert into account values('a1','fixed','587643','c1','b1'); 
insert into account values('a2','current','87643','c2','b2'); 
insert into account values('a3','savings','7643','c3','b3'); 
insert into account values('a4','checking','643','c4','b4'); 
insert into account values('a5','fixed','5874','c5','b5'); 
insert into account values('a7','fixed','5874','c5','b7'); 
create table loan( 
loanno varchar(45), 
bid varchar(45), 
cid varchar(45), 
amount number, 
foreign key(cid) references customer(cid) on delete cascade, 
foreign key(bid) references branch(bid) on delete cascade 
); 
insert into loan values('l1','b1','c1',50000); 
insert into loan values('l2','b2','c4',500000); 
insert into loan values('l3','b3','c5',90000); 
insert into loan values('l4','b4','c2',45000); 
insert into loan values('l5','b5','c3',900000); 
1.
select * from customer c,account a,branch b where c.cid=a.cid AND b.bid=a.bid AND 
b.brname='mangalore'; 
2. 
select * from customer c, account a where c.cid=a.cid AND a.accbal=(select max(accbal) from 
account); 
3. 
select distinct c.cname,l.amount from customer c, loan l WHERE c.cid=l.cid AND l.amount>500000; 
4. 
select * from branch where assets=(select max(assets) from branch)  
UNION 
select * from branch where assets=(select min(assets) from branch); 
5. 
delete from branch where brname='ballary'; 
select * from branch; 
select * from account;