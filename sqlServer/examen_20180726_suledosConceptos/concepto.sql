USE [examen]
GO

/****** Object:  Table [dbo].[concepto]    Script Date: 26/07/2018 09:09:23 a. m. ******/
DROP TABLE [dbo].[concepto]
GO

/****** Object:  Table [dbo].[concepto]    Script Date: 26/07/2018 09:09:23 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[concepto](
	[idconcepto] [int] IDENTITY(1,1) NOT NULL,
	[cod] [char](30) NULL,
	[nombre] [char](30) NULL,
	[valor] [decimal](18, 2) NULL,
 CONSTRAINT [PK_concepto] PRIMARY KEY CLUSTERED 
(
	[idconcepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


