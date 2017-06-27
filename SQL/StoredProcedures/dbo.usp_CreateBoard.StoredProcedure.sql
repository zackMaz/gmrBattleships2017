USE [ZackMazaheriBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateBoard]    Script Date: 6/27/2017 1:28:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_CreateBoard]
@RoomID int,
@UserID int
AS
INSERT Board VALUES (@RoomID)
DECLARE @BoardID int 
SELECT @BoardID = BoardID FROM Board WHERE @RoomID = RoomID
DECLARE @xCounter int = 1
DECLARE @yCounter int = 1
WHILE (@xCounter <= 10)
BEGIN

WHILE (@yCounter <=10)
BEGIN
PRINT @xCounter
PRINT @yCounter
INSERT Cells VALUES (@xCounter, @yCounter, 0, @BoardID, @RoomID, @UserID)
SET @yCounter = @yCounter + 1
END

SET @xCounter = @xCounter + 1
SET @yCounter = 1
END
GO
