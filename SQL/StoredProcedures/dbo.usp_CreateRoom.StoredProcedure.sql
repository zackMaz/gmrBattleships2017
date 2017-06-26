USE [ZackMazaheriBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateRoom]    Script Date: 6/26/2017 1:57:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_CreateRoom]
@RoomName varchar(10),
@HostID int
AS
INSERT Rooms VALUES (@RoomName, GETDATE(), @HostID, NULL, 0, 0)
GO
