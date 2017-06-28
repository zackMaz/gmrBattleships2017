USE [ZackMazaheriBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_LeaveRoom]    Script Date: 6/28/2017 2:49:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_LeaveRoom]
@RoomID int,
@GuestID int
AS
UPDATE Rooms SET @GuestID = NULL WHERE @RoomID = RoomID
GO
