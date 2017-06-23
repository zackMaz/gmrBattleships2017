USE [ZackMazaheriBattleships2017]
GO
/****** Object:  Table [dbo].[Ships]    Script Date: 6/23/2017 1:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ships](
	[UserID] [int] NOT NULL,
	[CellSize] [int] NOT NULL,
	[X] [int] NOT NULL,
	[Y] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ships]  WITH CHECK ADD  CONSTRAINT [FK_Ships_Board] FOREIGN KEY([X], [Y])
REFERENCES [dbo].[Board] ([X], [Y])
GO
ALTER TABLE [dbo].[Ships] CHECK CONSTRAINT [FK_Ships_Board]
GO
ALTER TABLE [dbo].[Ships]  WITH CHECK ADD  CONSTRAINT [FK_Ships_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Ships] CHECK CONSTRAINT [FK_Ships_Users]
GO
