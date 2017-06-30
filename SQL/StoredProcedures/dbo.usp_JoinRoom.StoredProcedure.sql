USE [ZackMazaheriBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_JoinRoom]    Script Date: 6/30/2017 2:22:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_JoinRoom]
@RoomID int,
@GuestID int
AS
IF ((SELECT GuestID FROM Rooms WHERE @RoomID = RoomID) IS NULL)
	BEGIN
		UPDATE Rooms SET GuestID = @GuestID WHERE @RoomID = RoomID
		UPDATE Rooms SET GameStatusID = 1 WHERE @RoomID = RoomID
		SELECT RoomName, GameStatusID FROM Rooms WHERE @RoomID = RoomID
		
	END
ELSE
	BEGIN
		SELECT 'Invalid' AS ErrorMessage
	END
GO
