USE [ZackMazaheriBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateRoom]    Script Date: 6/28/2017 2:49:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_CreateRoom]
@RoomName varchar(10),
@HostID int
AS
INSERT Rooms OUTPUT INSERTED.RoomName, INSERTED.RoomID VALUES (@RoomName, GETDATE(), @HostID, NULL, 0, 0)
GO
