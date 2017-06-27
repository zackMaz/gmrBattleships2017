USE [ZackMazaheriBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_JoinRoom]    Script Date: 6/27/2017 1:28:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_JoinRoom]
@RoomName varchar(10),
@GuestID int
AS
IF ((SELECT GuestID FROM Rooms WHERE @RoomName = RoomName) = NULL)
	BEGIN
		UPDATE Rooms SET GuestID = @GuestID WHERE @RoomName = RoomName
	END
ELSE
	BEGIN
		PRINT 'Invalid'
	END
GO
