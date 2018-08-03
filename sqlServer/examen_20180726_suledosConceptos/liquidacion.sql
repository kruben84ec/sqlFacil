USE [examen]
GO

/****** Object:  Table [dbo].[liquidacion]    Script Date: 26/07/2018 09:10:36 a. m. ******/
DROP TABLE [dbo].[liquidacion]
GO

/****** Object:  Table [dbo].[liquidacion]    Script Date: 26/07/2018 09:10:36 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[liquidacion](
	[idliquidacion] [int] IDENTITY(1,1) NOT NULL,
	[ci] [nchar](10) NULL,
	[idconcepto] [int] NULL,
	[fechaInicio] [date] NULL,
	[fechaFin] [date] NULL,
 CONSTRAINT [PK_liquidacion] PRIMARY KEY CLUSTERED 
(
	[idliquidacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


