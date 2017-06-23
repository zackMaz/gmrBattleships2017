USE [ZackMazaheriBattleships2017]
GO
/****** Object:  User [ZackMazaheri]    Script Date: 6/23/2017 1:00:56 PM ******/
CREATE USER [ZackMazaheri] FOR LOGIN [ZackMazaheri] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [ZackMazaheri]
GO
