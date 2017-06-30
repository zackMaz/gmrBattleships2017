USE [ZackMazaheriBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_PlaceShip]    Script Date: 6/30/2017 2:22:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_PlaceShip]
@CellID int,
@DirectionID int,
@ShipID int
AS
IF NOT EXISTS (SELECT StatusID FROM Cells WHERE @CellID = CellID AND StatusID = 1)
	BEGIN
		DECLARE @shipSizeCounter int = 1
		DECLARE @testCounter int = 1
		DECLARE @shipSize int = (SELECT ShipSize FROM Ships WHERE @ShipID = ShipID)
		DECLARE @startingX int = (SELECT X FROM Cells WHERE @CellID = CellID)
		DECLARE @startingY int = (SELECT Y FROM Cells WHERE @CellID = CellID)

		WHILE (@shipSizeCounter < @shipSize)
			BEGIN
				
				IF (@DirectionID = 0)
					BEGIN
						IF NOT EXISTS (SELECT * FROM Cells WHERE Y = (@startingY + (@shipSize-1)))
							OR EXISTS (SELECT StatusID FROM Cells WHERE @startingX = X 
								AND @startingY + @testCounter = Y AND StatusID = 1)
							BEGIN
								PRINT 'INVALID'
								RETURN
							END
						ELSE
							BEGIN
								PRINT 'VALID'
								SET @testCounter = @testCounter + 1
							END
					END
				IF (@DirectionID = 1)
					BEGIN
						IF NOT EXISTS (SELECT * FROM Cells WHERE X = (@startingX + (@shipSize-1)))
							OR EXISTS (SELECT StatusID FROM Cells WHERE @startingX + @testCounter = X 
								AND @startingY = Y AND StatusID = 1)
							BEGIN
								PRINT 'INVALID'
								RETURN
							END
						ELSE
							BEGIN
								PRINT 'VALID'
								SET @testCounter = @testCounter + 1
							END
					END
				IF (@DirectionID = 2)
					BEGIN
						IF NOT EXISTS (SELECT * FROM Cells WHERE Y = (@startingY - (@shipSize-1)))
							OR EXISTS (SELECT StatusID FROM Cells WHERE @startingX = X 
								AND @startingY - @testCounter = Y AND StatusID = 1)
							BEGIN
								PRINT 'INVALID'
								RETURN
							END
						ELSE
							BEGIN
								PRINT 'VALID'
								SET @testCounter = @testCounter + 1
							END
					END
				IF (@DirectionID = 3)
					BEGIN
						IF NOT EXISTS (SELECT * FROM Cells WHERE X = (@startingX - (@shipSize-1)))
							OR EXISTS (SELECT StatusID FROM Cells WHERE @startingX - @testCounter = X 
								AND @startingY = Y AND StatusID = 1)
							BEGIN
								PRINT 'INVALID'
								RETURN
							END
						ELSE
							BEGIN
								PRINT 'VALID'
								SET @testCounter = @testCounter + 1
							END
					END


			SET @shipSizeCounter = @shipSizeCounter + 1

			END


		SET @shipSizeCounter = 1
		SET @testCounter = 1

		UPDATE Cells SET StatusID = 1, ShipID = @ShipID WHERE @startingX = X AND @startingY = Y
		UPDATE Ships SET isPlaced = 1 WHERE @ShipID = ShipID
		WHILE (@shipSizeCounter < @shipSize)
			BEGIN
				IF (@DirectionID = 0)
					BEGIN
						UPDATE Cells SET StatusID = 1, ShipID = @ShipID WHERE @startingX = X AND @startingY + @testCounter = Y
						SET @testCounter = @testCounter + 1
					END
				IF (@DirectionID = 1)
					BEGIN
						UPDATE Cells SET StatusID = 1, ShipID = @ShipID WHERE @startingX + @testCounter = X AND @startingY = Y
						SET @testCounter = @testCounter + 1
					END
				IF (@DirectionID = 2)
					BEGIN
						UPDATE Cells SET StatusID = 1, ShipID = @ShipID WHERE @startingX = X AND @startingY - @testCounter = Y
						SET @testCounter = @testCounter + 1
					END
				IF (@DirectionID = 3)
					BEGIN
						UPDATE Cells SET StatusID = 1, ShipID = @ShipID WHERE @startingX - @testCounter = X AND @startingY = Y
						SET @testCounter = @testCounter + 1
					END

				SET @shipSizeCounter = @shipSizeCounter + 1
			END


		DECLARE @BoardID int = (SELECT BoardID FROM Cells WHERE @CellID = CellID)
		SELECT CellID, StatusID, ShipID FROm Cells WHERE @BoardID = BoardID
		


	END
ELSE
	BEGIN
		PRINT 'taken place'
	END
GO
