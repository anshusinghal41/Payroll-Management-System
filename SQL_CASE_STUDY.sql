-------------CASE STUDY-------------
--#1
create table LOCATION
(
 Location_ID int primary key,
 City varchar(20)
 )
 insert into LOCATION
 select 122,'New York' union all
 select 123,'Dallas' union all
 select 124,'Chicago' union all
 select 167,'Boston'

 select*from LOCATION

 --#2
 create table DEPARTMNT
 (
  Department_ID int primary key,
  [Name] varchar(20),
  Location_ID int
  )
insert into DEPARTMNT
 select 10,'Accounting',122 union all
 select 20,'Sales',124 union all
 select 30,'Research',123 union all
 select 40,'Opeartions',
 
 select*from DEPARTMNT

 --#3
 create table JOB
 (
   Job_ID int,
   Designation varchar(20)
 )
 insert into JOB
 select 667,'Clerk' union all
 select 668,'Staff' union all
 select 669,'Analyst' union all
 select 670,'Sales Person' union all
 select 671,'Manager' union all
 select 672,'President' 
 
 select*from JOB
 
 --#4
 create table Employeee
 ( 
   Employee_ID int,
   Last_Name varchar(20),
   First_Name varchar(20),
   Middle_Name varchar(5),
   Job_id int ,
   Manager_ID int,
   [Hire Date] Date,
   Salary int,
   Comm int,
   Department_ID int
)
insert into Employeee
select 7369,'SMITH','JOHN','Q',667,7902,'17-DEC-84',800,Null,20 union all
select 7499,'ALLEN','KEVIN','J',670,7698,'20-FEB-85',1600,300,30 union all
select 7505,'DOYLE','JEAN','K',671,7839,'04-APR-85',2850,Null,30 union all
select 7506,'DENNIS','LYNN','S',671,7839,'15-MAY-85',2750,Null,30 union all
select 7507,'BAKER','LESLIE','D',671,7839,'10-JUN-85',2200,Null,40 union all
select 7521,'WARK','CYNTHIA','D',670,7698,'22-FEB-85',1250,500,30 

--SIMPLE QUERIES
--1. 
select*from Employeee
--2. 
select*from JOB
--3. 
select*from DEPARTMNT
--4. 
select*from LOCATION

--5
select First_Name,Last_Name,Salary,Comm from Employeee

--6
select Employee_ID as [ID OF THE EMPLOYEE],Last_Name as [NAME OF THE EMPLOYEE],Department_ID as DEP_ID from Employeee

--7
select First_Name, Salary from Employeee

--WHERE condition
--1
select* from Employeee
where Last_Name='SMITH'
--2
select*from Employeee
where Department_ID=20
--3
select*from Employeee
where Salary between 3000 and 4500
--4
select*from Employeee
where Department_ID=10 or Department_ID=20
--5
select*from Employeee
where Department_ID<>10 and Department_ID<>30
--6
select*from Employeee
where Last_Name like 'S%'
--7
select*from Employeee
where Last_Name like 'S%H'
--8
select*from Employeee
where Last_Name like 'S____'
--9
select*from Employeee
where Department_ID=10 and Salary>3500
--10
select*from Employeee
where Comm IS NULL

--ORDER BY Clause
--1
select Employee_ID,Last_Name from Employeee
order by Employee_ID ASC
--2
select Employee_ID, Last_Name from Employeee
order by Salary DESC
--3&4
select*from Employeee
order by Last_Name ASC, Department_ID DESC

--GROUP BY and HAVING clause
--1
select count(*) as nofemp, Department_ID from Employeee
group by Department_ID
--2
select max(salary) as maxsal,min(salary) as minsal,AVG(salary) as avgsal,Department_ID from Employeee
group by Department_ID
--3
select max(salary) as maxsal,min(salary) as minsal,AVG(salary) as avgsal,Job_id from Employeee
group by Job_id
--4
select count(*) as nofemp,month([Hire Date]) as Month from Employeee
group by month([Hire Date])
order by month([Hire Date]) ASC
--5
select count(*) as NUM_EMP,MONTH([Hire Date]) AS MONTH,YEAR([Hire Date]) AS YEAR from Employeee
group by MONTH([Hire Date]),YEAR([Hire Date])
order by MONTH([Hire Date]),YEAR([Hire Date])
--6
select count(*) as noofemp,Department_ID from Employeee
group by Department_ID
--7
select count(*) as noofemp from Employeee
where month([Hire Date])=01
--8
select count(*) as noofemp from Employeee
where month([Hire Date]) in (01,09)
--9
select COUNT(*) as noofemp from Employeee
where YEAR([Hire Date])=1985
--10
select COUNT(*) as noofemp,MONTH([Hire Date]) as Month from Employeee
where YEAR([Hire Date])=1985
group by MONTH([Hire Date])
--11
select COUNT(*) as noofemp from Employeee
where YEAR([Hire Date])=1985 and month([Hire Date])=06
--12
select Department_ID,count (*) from Employeee
where YEAR([Hire Date])=1985 and month([Hire Date])=03
having count (*)>=03

--JOINS
--1
select Last_Name, DEPARTMNT.Name from Employeee
left join DEPARTMNT on Employeee.Department_ID=DEPARTMNT.Department_ID
--2
select Last_Name,JOB.Designation from Employeee
left join JOB on Employeee.Job_id=JOB.Job_ID
--3
select Last_Name, DEPARTMNT.Name,LOCATION.City from Employeee
left join DEPARTMNT on Employeee.Department_ID=DEPARTMNT.Department_ID
left join LOCATION on DEPARTMNT.Location_ID=LOCATION.Location_ID
--4
select count(Last_Name), DEPARTMNT.Name from Employeee
left join DEPARTMNT on Employeee.Department_ID=DEPARTMNT.Department_ID
group by DEPARTMNT.Name
--5
select count(Last_Name), DEPARTMNT.Name from Employeee
left join DEPARTMNT on Employeee.Department_ID=DEPARTMNT.Department_ID
where DEPARTMNT.Name='Sales'
group by DEPARTMNT.Name
--6
select count(Last_Name), DEPARTMNT.Name from Employeee
left join DEPARTMNT on Employeee.Department_ID=DEPARTMNT.Department_ID
group by DEPARTMNT.Name
order by count(Last_Name)
--7
select JOB.Job_ID,JOB.Designation,DEPARTMNT.Name from JOB inner join
Employeee on JOB.Job_ID=Employeee.Job_id inner join DEPARTMNT on Employeee.Department_ID=DEPARTMNT.Department_ID
group by JOB.Job_ID,JOB.Designation,DEPARTMNT.Name
--8
select count(*) as noofemp from Employeee
left join DEPARTMNT on Employeee.Department_ID=DEPARTMNT.Department_ID
left join [LOCATION] on DEPARTMNT.Location_ID=LOCATION.Location_ID
where LOCATION.City='New York'
--9
select *, Grade=
case 
     when Salary>2500 then 'A'
	 when Salary>1500 then 'B'
	 else 'C'
	 end
	 from Employeee
	 go
--10
Alter table Employeee
add Grade varchar(5)
insert into Employeee(Grade)
values(
case 
     when Salary>2500 then 'A'
	 when Salary>1500 then 'B'
	 else 'C'
	 end
	 )
--11
select count(*) from Employeee
where Salary between 2000 and 5000
--12
--13
--14
--15
--16
select First_Name, Employeee.Department_ID,DEPARTMNT.Name from Employeee
left join DEPARTMNT on Employeee.Department_ID=DEPARTMNT.Department_ID
where DEPARTMNT.Name='Sales' or DEPARTMNT.Name='Opeartions'

--SET OPERATORS
--1
select Name,JOB.Designation from DEPARTMNT
left join Employeee on DEPARTMNT.Department_ID=Employeee.Department_ID
left join JOB on Employeee.Job_id=JOB.Job_ID
where DEPARTMNT.Name='Sales' or DEPARTMNT.Name='Accounting'
--2
select Name,JOB.Designation from DEPARTMNT
left join Employeee on DEPARTMNT.Department_ID=Employeee.Department_ID
left join JOB on Employeee.Job_id=JOB.Job_ID
where DEPARTMNT.Name='Sales' or DEPARTMNT.Name='Accounting'
--3
select Name,JOB.Designation from DEPARTMNT
left join Employeee on DEPARTMNT.Department_ID=Employeee.Department_ID
left join JOB on Employeee.Job_id=JOB.Job_ID
where DEPARTMNT.Name='Research' or DEPARTMNT.Name='Accounting'

--SUB QUERIES
--1
declare @maxsal int
set @maxsal= (select max(Salary) from Employeee)
select First_Name, Salary from Employeee
where Salary=@maxsal
--2
select Last_Name, DEPARTMNT.Name from Employeee
left join DEPARTMNT on Employeee.Department_ID=DEPARTMNT.Department_ID
where DEPARTMNT.Name='Sales'
--3
select Last_Name, JOB.Designation from Employeee
left join JOB on Employeee.Job_id=JOB.Job_ID
where job.Designation='Clerk'
--4
select count(*) as noofemp from Employeee
left join DEPARTMNT on Employeee.Department_ID=DEPARTMNT.Department_ID
left join [LOCATION] on DEPARTMNT.Location_ID=LOCATION.Location_ID
where LOCATION.City='New York'
--5
declare @depart varchar(20)
set @depart=(select Name from DEPARTMNT where Name='Sales')
select count(*) from Employeee
where 
--6
declare @JOBID int=(select Job_ID from JOB where Designation='Clerk')
select*from Employeee
UPDATE Employeee
set Salary=Salary+(10*Salary)/100
where Job_id=@JOBID
--7
declare @acc int=(select Department_ID from DEPARTMNT where Name='Accounting')
delete from Employeee
where Department_ID=@acc
--8
select*from
(select*, row_number() over(order by salary DESC) as Rankvalue from Employeee)
as sal
where Rankvalue=2
--9
select*from
(select*, row_number() over(order by salary DESC) as Rankvalue from Employeee)
as sal
where Rankvalue=6
--10
declare @emp30 int=(select salary from Employeee where Department_ID=30)
select * from Employeee
where Salary>(select salary from Employeee where Department_ID=30)
--11
declare @lowsal int= (select min(Salary) from Employeee group by Employee_ID)
select @lowsal as lowsal
select*from Employeee
where Salary>@lowsal
--12 and 13
select Departmnt.Department_ID, Employeee.First_Name from Departmnt
left join Employeee on DEPARTMNT.Department_ID=Employeee.Department_ID
--14
select Employee_ID,Salary,Department_ID from Employeee
where Salary>(select AVG(Salary),Department_ID from Employeee group by Department_ID)