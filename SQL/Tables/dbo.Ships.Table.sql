USE [ZackMazaheriBattleships2017]
GO
/****** Object:  Table [dbo].[Ships]    Script Date: 6/28/2017 2:49:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ships](
	[ShipID] [int] NOT NULL,
	[ShipName] [varchar](50) NOT NULL,
	[ShipSize] [int] NOT NULL,
	[UserID] [int] NULL,
	[isPlaced] [bit] NULL,
 CONSTRAINT [PK_ShipTypes] PRIMARY KEY CLUSTERED 
(
	[ShipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ships]  WITH CHECK ADD  CONSTRAINT [FK_Ships_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Ships] CHECK CONSTRAINT [FK_Ships_Users]
GO
