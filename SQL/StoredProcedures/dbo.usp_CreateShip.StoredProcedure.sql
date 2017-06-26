USE [ZackMazaheriBattleships2017]
GO
/****** Object:  StoredProcedure [dbo].[usp_CreateShip]    Script Date: 6/26/2017 2:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_CreateShip]
@BoardID int,
@CellID int,
@ShipID int,
@DirectionValue int
AS
INSERT Ships VALUES (@BoardID, @CellID, @ShipID, @DirectionValue)
GO
