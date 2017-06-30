USE [ZackMazaheriBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_EndGame]    Script Date: 6/30/2017 2:22:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_EndGame]
@UserID int,
@BoardID int
AS
IF NOT EXISTS (SELECT StatusID FROM Cells WHERE @BoardID = BoardID AND StatusID = 1)
	BEGIN
		PRINT @UserID + 'loses'
	END
ELSE
	BEGIN
		PRINT 'still standing'
	END
GO
