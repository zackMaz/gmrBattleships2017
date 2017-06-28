USE [ZackMazaheriBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_PlaceShip]    Script Date: 6/28/2017 2:49:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_PlaceShip]
@cellID int,
@directionID int,
@shipID int
AS
IF NOT EXISTS (SELECT StatusID FROM Cells WHERE @cellID = CellID AND StatusID = 1)
	BEGIN
		DECLARE @shipSizeCounter int = 1
		DECLARE @testCounter int = 1
		DECLARE @shipSize int = (SELECT ShipSize FROM Ships WHERE @shipID = ShipID)
		DECLARE @startingX int = (SELECT X FROM Cells WHERE @cellID = CellID)
		DECLARE @startingY int = (SELECT Y FROM Cells WHERE @cellID = CellID)

		WHILE (@shipSizeCounter < @shipSize)
			BEGIN
				
				IF (@directionID = 0)
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
				IF (@directionID = 1)
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
				IF (@directionID = 2)
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
				IF (@directionID = 3)
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

		UPDATE Cells SET StatusID = 1, ShipID = @shipID WHERE @startingX = X AND @startingY = Y
		UPDATE Ships SET isPlaced = 1 WHERE @shipID = ShipID
		WHILE (@shipSizeCounter < @shipSize)
			BEGIN
				IF (@directionID = 0)
					BEGIN
						UPDATE Cells SET StatusID = 1, ShipID = @shipID WHERE @startingX = X AND @startingY + @testCounter = Y
						SET @testCounter = @testCounter + 1
					END
				IF (@directionID = 1)
					BEGIN
						UPDATE Cells SET StatusID = 1, ShipID = @shipID WHERE @startingX + @testCounter = X AND @startingY = Y
						SET @testCounter = @testCounter + 1
					END
				IF (@directionID = 2)
					BEGIN
						UPDATE Cells SET StatusID = 1, ShipID = @shipID WHERE @startingX = X AND @startingY - @testCounter = Y
						SET @testCounter = @testCounter + 1
					END
				IF (@directionID = 3)
					BEGIN
						UPDATE Cells SET StatusID = 1, ShipID = @shipID WHERE @startingX - @testCounter = X AND @startingY = Y
						SET @testCounter = @testCounter + 1
					END

				SET @shipSizeCounter = @shipSizeCounter + 1
			END

	END



ELSE
	BEGIN
		PRINT 'taken place'
	END
GO
