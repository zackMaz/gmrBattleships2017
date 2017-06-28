USE [ZackMazaheriBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateUser]    Script Date: 6/28/2017 2:49:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_CreateUser]
@Username varchar(10)
AS
INSERT Users OUTPUT INSERTED.Username, INSERTED.UserID VALUES (@Username)
GO
