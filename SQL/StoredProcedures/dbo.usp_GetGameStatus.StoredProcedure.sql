USE [ZackMazaheriBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetGameStatus]    Script Date: 6/30/2017 2:22:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_GetGameStatus]
@RoomID int
AS
SELECT GameStatusID FROM Rooms WHERE @RoomID = RoomID
GO
