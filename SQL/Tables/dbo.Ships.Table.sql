USE [ZackMazaheriBattleships2017]
GO
/****** Object:  Table [dbo].[Ships]    Script Date: 6/26/2017 2:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ships](
	[BoardID] [int] NOT NULL,
	[CellID] [int] NOT NULL,
	[ShipID] [int] NOT NULL,
	[DirectionValue] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ships]  WITH CHECK ADD  CONSTRAINT [FK_Ships_Board] FOREIGN KEY([BoardID])
REFERENCES [dbo].[Board] ([BoardID])
GO
ALTER TABLE [dbo].[Ships] CHECK CONSTRAINT [FK_Ships_Board]
GO
ALTER TABLE [dbo].[Ships]  WITH CHECK ADD  CONSTRAINT [FK_Ships_Cells] FOREIGN KEY([CellID])
REFERENCES [dbo].[Cells] ([CellID])
GO
ALTER TABLE [dbo].[Ships] CHECK CONSTRAINT [FK_Ships_Cells]
GO
ALTER TABLE [dbo].[Ships]  WITH CHECK ADD  CONSTRAINT [FK_Ships_Directions] FOREIGN KEY([DirectionValue])
REFERENCES [dbo].[Directions] ([DirectionValue])
GO
ALTER TABLE [dbo].[Ships] CHECK CONSTRAINT [FK_Ships_Directions]
GO
ALTER TABLE [dbo].[Ships]  WITH CHECK ADD  CONSTRAINT [FK_Ships_ShipTypes] FOREIGN KEY([ShipID])
REFERENCES [dbo].[ShipTypes] ([ShipID])
GO
ALTER TABLE [dbo].[Ships] CHECK CONSTRAINT [FK_Ships_ShipTypes]
GO
