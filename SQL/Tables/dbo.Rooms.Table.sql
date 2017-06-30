USE [ZackMazaheriBattleships2017]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 6/30/2017 2:22:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomName] [varchar](50) NOT NULL,
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[HostID] [int] NOT NULL,
	[GuestID] [int] NULL,
	[isHostTurn] [bit] NOT NULL,
	[GameStatusID] [int] NOT NULL,
 CONSTRAINT [PK_Rooms] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_GameStatuses] FOREIGN KEY([GameStatusID])
REFERENCES [dbo].[GameStatuses] ([GameStatusID])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_GameStatuses]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_Users] FOREIGN KEY([HostID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_Users]
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD  CONSTRAINT [FK_Rooms_Users1] FOREIGN KEY([GuestID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Rooms] CHECK CONSTRAINT [FK_Rooms_Users1]
GO
