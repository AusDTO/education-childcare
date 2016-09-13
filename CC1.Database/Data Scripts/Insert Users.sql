USE [CCAttendance]
GO

INSERT INTO [dbo].[user]
           ([FirstName]
           ,[Surname]
           ,[EmailAddress]
           ,[StatusCd]
           ,[LogonId]
           ,[Password]
           ,[Comments]
           ,[CreateUserId]
           ,[CreateDate]
           ,[UpdateUserId]
           ,[UpdateDate]
           ,[Title]
           ,[SecondName]
           ,[OtherNames]
           ,[BirthDate]
           ,[AddressLine1]
           ,[AddressLine2]
           ,[AddressLine3]
           ,[Locality]
           ,[Postcode]
           ,[CountryCode]
           ,[PhonePrefix]
           ,[PhoneNumber]
           ,[MobileNumber]
           ,[ValidFromDate]
           ,[ValidToDate])
     VALUES
           ('Paul'
           ,'Lomax'
           ,'paul.lomax@digital.gov.au'
           ,'A'
           ,'pl1510'
           ,'123456'
           ,null
           ,1
           ,GETDATE()
           ,1
           ,GETDATE()
           ,'Mr'
           ,null
           ,null
           ,null
		   ,'50 Marcus Clarke St'
           ,null
           ,null
           ,'Canberra'
           ,'2600'
           ,null
           ,null
           ,12345678
           ,null
           ,GETDATE()
           ,null)
GO


