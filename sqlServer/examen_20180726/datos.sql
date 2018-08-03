USE [examen]
GO

/****** Object:  Table [dbo].[datos]    Script Date: 26/07/2018 09:10:02 a. m. ******/
DROP TABLE [dbo].[datos]
GO

/****** Object:  Table [dbo].[datos]    Script Date: 26/07/2018 09:10:02 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[datos](
	[ci] [char](15) NULL,
	[nombre] [char](30) NULL,
	[dirrecion] [char](30) NULL,
	[telef] [char](10) NULL,
	[mes] [int] NULL,
	[codConep_1] [int] NULL,
	[nombreConepto1] [char](30) NULL,
	[valores] [decimal](18, 2) NULL,
	[codConep_2] [int] NULL,
	[nombreConepto2] [char](30) NULL,
	[valores2] [decimal](18, 2) NULL,
	[codConep_3] [int] NULL,
	[nombreConepto3] [char](30) NULL,
	[valores3] [decimal](18, 2) NULL,
	[fechaInicio] [date] NULL,
	[fechaFin] [date] NULL
) ON [PRIMARY]
GO


