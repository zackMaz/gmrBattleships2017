USE [ZackMazaheriBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_LeaveRoom]    Script Date: 6/30/2017 2:22:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_LeaveRoom]
@RoomID int
AS
UPDATE Rooms SET GuestID = NULL WHERE @RoomID = RoomID
GO
