create database database1;
use database1;
create table Employee(
empid int,
empname varchar(34),
emp_age int,
emp_addr varchar(256)
);
alter table Employee
add column emp_gender boolean;
insert into Employee values (1002,"Shreya",23,"mumbai","M");
alter table Employee
modify column emp_gender varchar(12);
create table Emp_backup as 
select * from Employee
create table EmpDetails(
id int,
name varchar(23));
insert into EmpDetails values(12,'gyandas');
select * from EmpDetails;
insert into Employee values(1008,'shudhansh',23,'mumbai','male');
alter table Employee
drop column emp_gender;
insert into Employee values(1008,'shudhansh',23,'mumbai');
alter table Employee
add column emp_salary int;
insert into Employee values(1008,'shudhansh',20,'bandra',3400);
insert into Employee values(1006,'shudhansh',23,'mumbai',4500);
insert into Employee values(1004,'shudhansh',24,'delhi',5500);
insert into Employee values(1003,'shudhansh',22,'mumbai',4510);
insert into Employee values(1007,'shudhansh',24,'mumbai',3490);
select * from Employee;
select count (empid)
from Employee;
select max(emp_salary)
from Employee;
select * from Employee where emp_salary between 3000 and 4000 and emp_age between 20 and 25;
select * from Employee 
select * from Employee where emp_age in(20,23);
select * from Employee where emp_age>22 and emp_addr ='bandra'; 
select * from Employee where emp_age>22 or emp_addr ='bandra'; 
select empname,emp_addr,emp_age  from Employee where not emp_addr='mumbai'; 
select empname,emp_addr,emp_age  from Employee where  emp_addr<>'mumbai';
select empname,emp_salary from Employee order by emp_salary desc;
select empname,emp_salary from Employee order by emp_salary asc;
select empid,empname from Employee group by emp_addr;
select emp_addr,count(empname) from Employee group by emp_addr;
select emp_age,count(empname) from Employee group by emp_age;
select emp_age,count(empname) as count from Employee group by emp_age;
select * from Employee having emp_age=24;
select empname,sum(emp_salary) as total from Employee 
group by empname 
having sum(emp_salary)>=67000
order by emp_salary desc;
create table Emp_detail(
emp_id int,
emp_name varchar(34),
gender varchar(23),
department varchar(256),
education varchar(256),
month_of_joining varchar(256),
salary int
);
insert into Emp_detail values (1001,'Ajay','m','Engineering','doctoral','january',25);
insert into Emp_detail values (1002,'bablu','m','Engineering','UG','february',23);
insert into Emp_detail values (1003,'chhavi','f','hr','PG','march',15);
insert into Emp_detail values (1004,'Dheeraj','m','hr','UG','january',12);
insert into Emp_detail values (1005,'Evina','f','marketing','UG','march',16);
insert into Emp_detail values (1006,'Fredy','m','Sales','UG','december',10);
insert into Emp_detail values (1007,'garima','f','Sales','UG','march',10);
insert into Emp_detail values (1008,'Hans','m','Admin','PG','november',8);
insert into Emp_detail values (1009,'Ivanka','f','Admin','intermediate','April',7);
insert into Emp_detail values (1010,'Jai','m','peon','10th std','December',4);
select * from Emp_detail
select emp_id,emp_name ,department 
from Emp_detail
where education != 'UG'
group by education having sum(salary)>=20;
select emp_name,department,sum(salary) as total
FROM Emp_detail 
group by department 
having total>=15
order by salary desc;
create table customers(
custid int  primary key,
cust_name varchar(256) not null
);
create table orders(
orderid  varchar(256) primary key,
ordernumber int not null,
customerid int,
foreign key (customerid) references  
customers(custid)
);
insert into customers values(1,'ram');
insert into customers values(2,'shyam');
insert into customers values(3,'rani');
insert into orders values(1,101,1);
insert into orders values(2,678,2);
insert into orders values(3,556,3);
insert into orders  values(5,667,4);
select * from customers;
select * from orders;
delete from customers 
where custid='3';
create table emp1 (
empid int primary key,
emp_name varchar(256),
country varchar(256)
);
create table emp2 (
empid int primary key,
emp_name varchar(256),
country varchar(256)
);
insert into emp1 values(1001,'shyam','india');
insert into emp1 values(1002,'shyam','iraq');
insert into emp1 values(1003,'shyam','iran');
insert into emp1 values(1004,'shyam','america');
insert into emp1 values(1005,'shyam','UK');
insert into emp2 values(1006,'shyam','France');
insert into emp2 values(1007,'shyam','england');
insert into emp2 values(1008,'shyam','india');
insert into emp2 values(1009,'shyam','india');
select country from emp1 
union 
select country from emp2
order by country;
select   * from emp1;
select   * from emp2;
select country from emp1 
union all
select country from emp2
order by country;
select country from emp1 
union all
select country from emp2
order by country;
select country from emp1 
intersect
select country from emp2
order by country;
select country from emp1 
except
select country from emp2
order by country;
select column name
from table1
inner join/outerjoin/etc table2
on primary key =foreign key 
create table Customer1(
cust_id int primary key,
fname varchar(23) not null,
lname varchar(30) not null,
Adrr_id int not null
);
create table payments(
pay_id int primary key,
amount int not null,
modes  varchar(30) not null,
dates date not null,
customerid int,
foreign key (customerid) references  
Customer1(cust_id)
);
insert into Customer1 values(1,'mary','jane',4);
insert into Customer1 values(3,'mary','jane',4);
insert into Customer1 values(4,'mary','jane',4);
insert into Customer1 values(2,'mary','jane',4);
insert into Customer1 values(8,'mary','jane',4);
insert into payments values(1,60,'cash','3/4/16',3);
insert into payments values(2,30,'cash','3/4/16',4);
insert into payments values(3,80,'cash','3/4/16',1);
insert into payments values(4,70,'online','3/4/16',2);
select * from payments
select * from Customer1;
insert  into Customer1 values(8,'mary','jane',4);
create table test(
newid int primary key,
new_cat varchar(256)
);
insert into test values(1,'Agni');
insert into test values(2,'vayu');
insert into test values(3,'Agni');
insert into test values(4,'dharti');
insert into test values(5,'Jal');
insert into test values(6,'Agni');
select newid,new_cat,
sum(newid) over( partition by new_cat order by newid)as "total",
count(newid) over( partition by new_cat order by newid)as "count",
avg(newid) over( partition by new_cat order by newid)as "average",
min(newid) over( partition by new_cat order by newid)as "minimum",
max(newid) over( partition by new_cat order by newid)as "maximum"

from test
select newid,new_cat,
sum(newid) over( order by newid rows between unbounded preceding and unbounded following)as "total",
count(newid) over(order by newid rows between unbounded preceding and unbounded following)as "count",
avg(newid) over( order by newid rows between unbounded preceding and unbounded following)as "average",
min(newid) over( order by newid rows between unbounded preceding and unbounded following)as "minimum",
max(newid) over( order by newid rows between unbounded preceding and unbounded following)as "maximum"

from test


 

