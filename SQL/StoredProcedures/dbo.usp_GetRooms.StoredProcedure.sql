USE [ZackMazaheriBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetRooms]    Script Date: 6/30/2017 2:22:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROC [dbo].[usp_GetRooms]
@PageNumber int,
@PageSize int = 10
AS
SELECT * FROM (SELECT ROW_NUMBER() OVER 
	(ORDER BY Rooms.CreationDate DESC) 
	AS RowNumber, 
		Users.Username, 
		RoomName, 
		CreationDate
	FROM Rooms 
	JOIN Users
	ON	Rooms.HostID = Users.UserID
	WHERE GuestID IS NULL ) list
	WHERE list.RowNumber > ((@PageNumber - 1) * @PageSize) AND list.RowNumber <= (@PageNumber * @PageSize)
	ORDER BY RowNumber


--usp_GetRooms 1
GO
