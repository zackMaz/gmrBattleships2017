USE [ZackMazaheriBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetRoomUsers]    Script Date: 6/30/2017 2:22:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_GetRoomUsers]
@RoomID int
AS
DECLARE @HostID int = (SELECT HostID FROM Rooms WHERE @RoomID = RoomID)
DECLARE @GuestID int = (SELECT GuestID FROM Rooms WHERE @RoomID = RoomID)
SELECT Username FROM Users WHERE @HostID = UserID AND @GuestID = UserID
GO
