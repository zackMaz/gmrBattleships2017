USE [ZackMazaheriBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_ValidateShipsPlaced]    Script Date: 6/28/2017 2:49:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_ValidateShipsPlaced]
@HostID int,
@GuestID int,
@RoomID int
AS
IF NOT EXISTS (SELECT * FROM Ships WHERE @HostID = UserID AND @GuestID = UserID)
	BEGIN
		UPDATE Rooms SET GameStatusID = 2 WHERE @RoomID = RoomID
	END
GO
