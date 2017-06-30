USE [ZackMazaheriBattleships2017]
GO
/****** Object:  Table [dbo].[Cells]    Script Date: 6/30/2017 2:22:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cells](
	[CellID] [int] IDENTITY(1,1) NOT NULL,
	[X] [int] NOT NULL,
	[Y] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[BoardID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[ShipID] [int] NULL,
 CONSTRAINT [PK_Cells] PRIMARY KEY CLUSTERED 
(
	[CellID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cells]  WITH CHECK ADD  CONSTRAINT [FK_Cells_Board] FOREIGN KEY([BoardID])
REFERENCES [dbo].[Board] ([BoardID])
GO
ALTER TABLE [dbo].[Cells] CHECK CONSTRAINT [FK_Cells_Board]
GO
ALTER TABLE [dbo].[Cells]  WITH CHECK ADD  CONSTRAINT [FK_Cells_Rooms] FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
GO
ALTER TABLE [dbo].[Cells] CHECK CONSTRAINT [FK_Cells_Rooms]
GO
ALTER TABLE [dbo].[Cells]  WITH CHECK ADD  CONSTRAINT [FK_Cells_ShipTypes] FOREIGN KEY([ShipID])
REFERENCES [dbo].[Ships] ([ShipID])
GO
ALTER TABLE [dbo].[Cells] CHECK CONSTRAINT [FK_Cells_ShipTypes]
GO
ALTER TABLE [dbo].[Cells]  WITH CHECK ADD  CONSTRAINT [FK_Cells_Statuses] FOREIGN KEY([StatusID])
REFERENCES [dbo].[Statuses] ([StatusID])
GO
ALTER TABLE [dbo].[Cells] CHECK CONSTRAINT [FK_Cells_Statuses]
GO
ALTER TABLE [dbo].[Cells]  WITH CHECK ADD  CONSTRAINT [FK_Cells_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Cells] CHECK CONSTRAINT [FK_Cells_Users]
GO
