USE [ZackMazaheriBattleships2017]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 6/23/2017 1:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomName] [nvarchar](50) NOT NULL,
	[RoomID] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[HostID] [int] NOT NULL,
	[GuestID] [int] NULL,
	[HostReady] [bit] NOT NULL,
	[GuestReady] [bit] NOT NULL,
	[RoomStatus] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_Users1] FOREIGN KEY([HostID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_Users1]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_Users2] FOREIGN KEY([GuestID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_Users2]
GO
