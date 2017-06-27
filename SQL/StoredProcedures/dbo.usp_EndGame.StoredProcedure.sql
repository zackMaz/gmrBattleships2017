USE [ZackMazaheriBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_EndGame]    Script Date: 6/27/2017 1:28:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_EndGame]
@userID int,
@boardID int
AS
IF NOT EXISTS (SELECT StatusID FROM Cells WHERE @boardID = BoardID AND StatusID = 1)
	BEGIN
		PRINT @userID + 'loses'
	END
ELSE
	BEGIN
		PRINT 'still standing'
	END
GO
