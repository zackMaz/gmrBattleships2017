USE [ZackMazaheriBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_PlaceShip]    Script Date: 6/27/2017 1:28:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_PlaceShip]
@cellID int,
@directionID int,
@shipID int
AS
IF NOT EXISTS (SELECT StatusID FROM Cells WHERE  @cellID = CellID AND StatusID = 1)
BEGIN
	UPDATE Cells SET StatusID = 1, ShipID = @shipID WHERE @cellID = CellID
	DECLARE @shipSizeCounter int = 1
	DECLARE @shipSize int = (SELECT ShipSize FROM ShipTypes WHERE @shipID = ShipID)
	DECLARE @startingX int = (SELECT X FROM Cells WHERE @cellID = CellID)
	DECLARE @startingY int = (SELECT Y FROm Cells WHERE @cellID = CellID)
	DECLARE @counter int = 1
	WHILE (@shipSizeCounter < @shipSize)
		BEGIN

			IF (@directionID = 0)
				BEGIN
					IF EXISTS (SELECT * FROM Cells WHERE Y = (@startingY + (@shipSize-1)))
						BEGIN
							IF NOT EXISTS (SELECT StatusID FROM Cells WHERE @startingX = X AND @startingY + @counter = Y AND StatusID = 1)
								BEGIN
									UPDATE Cells SET StatusID = 1, ShipID = @shipID WHERE @startingX = X AND @startingY + @counter = Y
									SET @counter = @counter + 1
								END
							ELSE
								BEGIN
									PRINT 'intersected'
								END
						END
					ELSE
						BEGIN
							PRINT 'size out of bounds'
						END
				END
			IF (@directionID = 1)
				BEGIN
					IF EXISTS (SELECT * FROM Cells WHERE X = (@startingX + (@shipSize-1)))
						BEGIN
							IF NOT EXISTS (SELECT StatusID FROM Cells WHERE @startingX + @counter = X AND @startingY = Y AND StatusID = 1)
								BEGIN
									UPDATE Cells SET StatusID = 1, ShipID = @shipID WHERE @startingX + @counter = X AND @startingY = Y
									SET @counter = @counter + 1
								END
							ELSE
								BEGIN
									PRINT 'intersected'
								END
						END
					ELSE
						BEGIN
							PRINT 'size out of bounds'
						END
				END
			IF (@directionID = 2)
				BEGIN
					IF EXISTS (SELECT * FROM Cells WHERE Y = (@startingY - (@shipSize-1)))
						BEGIN
							IF NOT EXISTS (SELECT StatusID FROM Cells WHERE @startingX = X AND @startingY - @counter = Y AND StatusID = 1)
								BEGIN
									UPDATE Cells SET StatusID = 1, ShipID = @shipID WHERE @startingX = X AND @startingY - @counter = Y
									SET @counter = @counter + 1
								END
							ELSE
								BEGIN
									PRINT 'intersected'
								END
						END
					ELSE
						BEGIN
							PRINT 'size out of bounds'
						END
				END
			IF (@directionID = 3)
				BEGIN
					IF EXISTS (SELECT * FROM Cells WHERE X = (@startingX - (@shipSize-1)))
						BEGIN
							IF NOT EXISTS (SELECT StatusID FROM Cells WHERE @startingX - @counter = X AND @startingY = Y AND StatusID = 1)
								BEGIN
									UPDATE Cells SET StatusID = 1 , ShipID = @shipID WHERE @startingX - @counter = X AND @startingY = Y
									SET @counter = @counter + 1
								END
							ELSE
								BEGIN
									PRINT 'intersected'
								END
						END
					ELSE
						BEGIN
							PRINT 'size out of bounds'
						END
				END
			SET @shipSizeCounter = @shipSizeCounter + 1
		END
END
ELSE
BEGIN
	PRINT 'First Hit Wrong'
END
GO
