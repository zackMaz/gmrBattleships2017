USE [ZackMazaheriBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_JoinRoom]    Script Date: 6/26/2017 2:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_JoinRoom]
@RoomName varchar(10),
@GuestID int
AS
UPDATE Rooms SET GuestID = @GuestID WHERE @RoomName = RoomName
GO
