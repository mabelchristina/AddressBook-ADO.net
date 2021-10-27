use Address_Book_Service


create procedure spGetAllAddressBook
As 
Begin try
select * from Person
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH 

exec spGetAllAddressBook

Create procedure spAddInAddressBook
(
@Firstname varchar(20),
@Lastname varchar(20),
@Address varchar(50),
@City varchar(20),
@State varchar(20),
@Zip int,
@MobileNumber varchar(10),
@EmailId varchar(50)
)
As 
Begin try
insert into Person(Firstname,Lastname,Address,City,State,Zip,MobileNumber,EmailId)values
(@Firstname,@Lastname,@Address,@City,@State,@Zip,@MobileNumber,@EmailId)
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH  

exec spAddInAddressBook
'kiran','kumar','VictoriaLayout','Bangalore','Karnataka',74434,9638527410,'kiran@gmail.com'


create procedure spUpdateInAddressBook
(
@Firstname varchar(20),
@State varchar(20)
)
As 
Begin try
update Person
set State=@State
where Firstname=@Firstname
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH  

exec spUpdateInAddressBook
'Mabel','Karnataka'



Create procedure spDeleteInAddressBook
(
@Firstname varchar(20)
)
As 
Begin try
delete from Person where Firstname=@Firstname 
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH  

exec spDeleteInAddressBook
'joel'

CREATE PROCEDURE spPersonsCityorState 
@City varchar(50),
@State varchar(50)
AS
Begin try
SELECT Firstname,City,State FROM Person WHERE City = @City or State=@State
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH  

exec spPersonsCityorState
'NewyorkCity','Newyork'


create procedure spRetrieveCountOfContactsByCity
(
@City varchar(20)
)
As
Begin try
select * from Person where City=@City
end try
Begin catch
SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH 

exec spRetrieveCountOfContactsByCity
'NewyorkCity'
