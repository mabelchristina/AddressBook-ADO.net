--UC1 creating addressBook database
create database Address_Book_Service

--Use query is used to change the database which we are using
use Address_Book_Service


--UC2Create table in the addressbook database
Create table Person(
PersonId int identity(1,1) primary Key,
Firstname varchar(50) Not Null,
Lastname varchar(50) Not Null,
Address varchar(50),
City varchar(50),
State varchar(50),
Zip int,
MobileNumber varchar(10) unique,
EmailId varchar(50)
)

--UC3_Insert values in to table
Insert into Person(Firstname,Lastname,Address,City,State,Zip,MobileNumber,EmailId)
values('Mabel','Christina','NGV colony','Koramangala','Bangalore',560030,'8553635345','maybelchristina@gmail.com'),
('Nancy','Padma','Times Square','Brooklyn','Texas',213224,'9646857869','padmaNancy@yahoo.com'),
('Joel','Johnson','Broadway','NewYorkCity','Newyork',4521441,'1403234256','joel1990@gmail.com'),
('Sachin','Paul','Thambaram','Chennai','TamilNadu',8484512,'9449874563','sachu@gmail.com'),
('Joe','Keere','NGV colony','Koramangala','Bangalore',568030,'8787853475','jor@gmail.com'),
('Liah','Sharon','Broadway','Manhattan','NewYork',213224,'9646857866','padmaNancy@yahoo.com'),
('Joel','Johnson','Broadway','NewYorkCity','Newyork',4521441,'1403225611','joel1990@gmail.com'),
('James','Nord','Downtown','NewYorkCity','Newyork',4521441,'1403225678','James@gmail.com')


--Retrive all rows from person table
select * from Person

--UC4_Update data using person name
update Person
set State='karnataka'
where Firstname='Joe'

--UC5_Delete data using Firstname
delete from Person
Where Firstname='Joel' or MobileNumber='1403225611'

--UC6_Retrive data using city or state
Select * from Person
where City='NewYorkCity' or State='Newyork'

--UC7_CountPersons in persons table
Select Count(State) as CountPersons from Person
where City='NewYorkCity' and State='Newyork'


--UC8_Sort persons alphabetically by FirstName on basis of City
Select * from Person
where City='NewYorkCity'
order by Firstname desc

Select Count(City) as CountCity,State,City from Person
Group by City,State

--UC9--Creating table addressBook type to main the relation ship
create table Address_Book(
AddressBookID int identity(1,1) primary key,
AddressBookName varchar(100)
)

Insert into Address_Book values ('Family'),('Freinds')

select * from Address_Book

create table Contact_Person(
AddressBook_ID int,
ContactID int identity(1,1) primary key,
FirstName varchar(100),
LastName varchar(100),
Address varchar(250),
City varchar(100),
StateName varchar(100),
ZipCode BigInt,
PhoneNum BigInt,
EmailId varchar(200),
foreign key (AddressBook_ID) references Address_Book(AddressBookID))

Insert into Contact_Person values
(1,'eswar','yasash','nizampet','hyderabad','telangana',543215,7688876888,'eswar@gmail.com'),
(2,'madhu','varri','mgroad','vijayawada',' andhra',532678,9182501714,'madhu@gmail.com'),
(2,'manoj','Kumar','tidel park','chennai','tamilNadu',600119,9989912345,'mm@gmail.com'),
(1,'girish','guptha','bazzar street','nellore','andhra',524406,7660094458,'v.g@gmail.com');

select * from Contact_Person

---Create contact_type table
create table Contact_Type
(ContactTypeID int identity(1,1) primary key,
ContactTypeName varchar(100)
)

---Insert the values in contat_type
Insert into Contact_Type values
('Family'),('Friends')

--Retrieve the data
Select * from Contact_Type

---Create relation type table
create Table Relation_Type(
ContactType_ID int,
Contact_ID int,
foreign key (ContactType_ID) references Contact_Type(ContactTypeID),
foreign key (Contact_ID) references Contact_Person(ContactID)
)

---Insert the values in relation_type
insert into Relation_Type values
(1,1),
(2,2),
(1,3),
(1,4)

--Retrieve the data
Select * from Relation_Type


----------UC12---------
select AddressBookName,FirstName,LastName,Address,City,StateName,ZipCode,PhoneNum,EmailId,ContactTypeName
from Address_Book 
Full JOIN Contact_Person on Address_Book.AddressBookID=Contact_Person.AddressBook_ID 
Full JOIN Relation_Type on Relation_Type.Contact_ID=Contact_Person.ContactID
Full JOIN Contact_Type on Relation_Type.ContactType_ID=Contact_Type.ContactTypeID


--------UC13--------
----UC6---
select AddressBookName,FirstName,LastName,Address,City,StateName,ZipCode,PhoneNum,EmailId,ContactTypeName
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.AddressBookID=Contact_Person.AddressBook_ID and (City='Chennai' or StateName='tamilNadu')
INNER JOIN Relation_Type on Relation_Type.Contact_ID=Contact_Person.ContactID
INNER JOIN Contact_Type on Relation_Type.ContactType_ID=Contact_Type.ContactTypeID
----UC7----
select Count(*)As CountOfStateAndCity ,StateName,City
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.AddressBookID=AddressBook_ID 
Group by StateName,City
-----UC8-----
select AddressBookName,FirstName,LastName,Address,City,StateName,ZipCode,PhoneNum,EmailId,ContactTypeName
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.AddressBookID=AddressBook_ID 
INNER JOIN Relation_Type on Relation_Type.Contact_Id=Contact_Person.ContactID
INNER JOIN Contact_Type on Relation_Type.ContactType_ID=Contact_Type.ContactTypeID
order by(FirstName)
---	UC9----
select Count(*) as NumberOfContacts,Contact_Type.ContactTypeName
from Contact_Person 
INNER JOIN  Address_Book on Address_Book.AddressBookID=Contact_Person.AddressBook_ID
INNER JOIN Relation_Type on Relation_Type.Contact_ID=Contact_Person.ContactID
INNER JOIN Contact_Type on Relation_Type.ContactType_ID=Contact_Type.ContactTypeID
Group by ContactTypeName