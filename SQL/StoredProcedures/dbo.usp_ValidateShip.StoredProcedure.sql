USE [ZackMazaheriBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_ValidateShip]    Script Date: 6/26/2017 9:53:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ValidateShip]
AS
DECLARE @X int = 2
DECLARE @Y int = 3
IF NOT EXISTS (SELECT * FROM Ships WHERE X = @X AND Y = @Y)
BEGIN
	INSERT Ships VALUES(1, 3, @X, @Y, 'up')
END
ELSE
BEGIN
	SELECT * FROM Ships WHERE X = @X AND Y = @Y
END
GO
