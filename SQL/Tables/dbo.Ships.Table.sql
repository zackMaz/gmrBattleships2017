USE [ZackMazaheriBattleships2017]
GO
/****** Object:  Table [dbo].[Ships]    Script Date: 6/26/2017 1:57:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ships](
	[BoardID] [int] NOT NULL,
	[CellID] [int] IDENTITY(1,1) NOT NULL,
	[ShipSize] [int] NOT NULL,
	[Direction] [varchar](10) NOT NULL
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
