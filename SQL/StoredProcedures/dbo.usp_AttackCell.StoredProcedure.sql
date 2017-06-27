USE [ZackMazaheriBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_AttackCell]    Script Date: 6/27/2017 1:28:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_AttackCell]
@CellID int
AS
DECLARE @statusID int = (SELECT StatusID FROM Cells WHERE @CellID = CellID)
IF (@statusID = 0)
BEGIN
UPDATE Cells SET StatusID = 2 WHERE @CellID = CellID
END
IF (@statusID = 1)
BEGIN
UPDATE Cells SET STatusID = 3 WHERE @CellID = CellID
END
IF (@statusID = 2 OR @statusID = 3)
BEGIN
PRINT 'Already hit'
END
GO
