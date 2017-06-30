USE [ZackMazaheriBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_ResetShip]    Script Date: 6/30/2017 2:22:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ResetShip]
@ShipID int,
@BoardID int
AS
IF EXISTS (SELECT ShipID FROM Cells WHERE @BoardID = @BoardID AND @ShipID = NULL)
	BEGIN
		SELECT 'Invalid'
	END
ELSE
	BEGIN
		UPDATE Cells SET @ShipID = NULL, StatusID = 0 WHERE @ShipID = ShipID AND @BoardID = BoardID
	END
GO
