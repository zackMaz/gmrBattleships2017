USE [ZackMazaheriBattleships2017]
GO
/****** Object:  Table [dbo].[Directions]    Script Date: 6/26/2017 2:58:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Directions](
	[Direction] [varchar](10) NOT NULL,
	[DirectionValue] [int] NOT NULL,
 CONSTRAINT [PK_Directions] PRIMARY KEY CLUSTERED 
(
	[DirectionValue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
