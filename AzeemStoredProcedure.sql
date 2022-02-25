create database HRDB5
USE HRDB5

create table Departments(id int primary key identity,name varchar(50))
create table Employees
(id int primary key identity, name varchar (max),email varchar (max),gender varchar (15),mobile varchar (15),
department_id int  foreign key references Departments(id))
select * from Departments
select * from Employees

exec SP_Department 'select'
exec SP_Department 'create',0,'Account'
exec SP_Department 'update',2,'hrdepartment'
exec SP_Department 'delete',2


create proc SP_Department
@action varchar(25),
@id int = 0,
@name varchar(100)=null
as
begin
if(@action= 'create')
begin
insert into  Departments(name)values (@name)
select 1 as result
end
else if (@action='delete')
begin
delete from Departments where id =@id
select 1 as result
end
else if (@action='select')
begin
select * from Departments
end
else if(@action='update')
begin
update Departments set name =@name where id =@id 
select 1 as result
end
end

-----------------------------------------------------------------------------------

