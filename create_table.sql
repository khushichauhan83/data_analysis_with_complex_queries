
/* Department table */

create table dept(
did number primary key,
dname varchar(50)
);

/* Employee table */


create table emp(
emp_id number primary key,
emp_name varchar(50),
email varchar(50),
phone varchar(20),
gender varchar(20),
dob date,
salary number,
did number,
foreign key(did) references dept(did)
);


/* insert value in department table */


insert into dept values(1,'Marketing');
insert into dept values(2,'Purchasing');
insert into dept values(3,'IT');
insert into dept values(4,'sales');
insert into dept values(5,'finance');


/* insert value in employee table */ 


insert into emp values(1,'khushi','khushi@gmail.com','9988776655','female','1-jan-2005',30000,1);
insert into emp values(2,'jigna','jigna@gmail.com','9908888099','female','20-jun-2002',15000,3);
insert into emp values(3,'kartik','kartik@gmail.com','8899045329','male','18-dec-2001',35000,3);
insert into emp values(4,'rihanshi','rihanshi@gmail.com','9090909090','female','28-mar-2000',10000,2);
insert into emp values(5,'riyaan','riyaan@gmail.com','8990914545','male','2-feb-2004',25000,5);
insert into emp values(6,'anjali','anjali@gmail.com','9824598245','female','11-may-2000',20000,4);
insert into emp values(7,'fenil','fenil@gmail.com','9919555199','male','10-sep-2002',5000,1);
insert into emp values(8,'nivya','nivya@gmail.com','9019223411','female','5-nov-2003',15000,3);
insert into emp values(9,'khyati','khyati@gmail.com','9229223411','female','25-aug-2000',55000,5);
insert into emp values(10,'dhruv','dhruv@gmail.com','9998887776','male','27-jan-2005',5000,4);

