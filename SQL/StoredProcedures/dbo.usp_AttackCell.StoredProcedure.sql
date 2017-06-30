USE [ZackMazaheriBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_AttackCell]    Script Date: 6/30/2017 2:22:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_AttackCell]
@CellID int
AS
DECLARE @statusID int = (SELECT StatusID FROM Cells WHERE @CellID = CellID)
IF (@statusID = 0)
	BEGIN
		UPDATE Cells SET StatusID = 2 WHERE @CellID = CellID
	END
IF (@statusID = 1)
	BEGIN
		UPDATE Cells SET STatusID = 3 WHERE @CellID = CellID
	END
IF (@statusID = 2 OR @statusID = 3)
	BEGIN
		PRINT 'Invalid'
	END

DECLARE @RoomID int = (SELECT RoomID FROM Cells WHERE @CellID = CellID)
DECLARE @isHostTurn bit = (SELECT isHostTurn FROM Rooms WHERE @RoomID = RoomID)
IF (@isHostTurn = 1)
	BEGIN
		UPDATE Rooms SET isHostTurn = 0 WHERE @RoomID = RoomID
	END
ELSE
	BEGIN
		UPDATE Rooms SET isHostTurn = 1 WHERE @RoomID = RoomID
	END
GO
