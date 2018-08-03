USE [examen]
GO

/****** Object:  Table [dbo].[empleados]    Script Date: 26/07/2018 09:10:13 a. m. ******/
DROP TABLE [dbo].[empleados]
GO

/****** Object:  Table [dbo].[empleados]    Script Date: 26/07/2018 09:10:13 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[empleados](
	[idempleado] [int] IDENTITY(1,1) NOT NULL,
	[ci] [char](15) NULL,
	[nombre] [char](30) NULL,
	[direccion] [char](30) NULL,
	[telefono] [char](10) NULL,
 CONSTRAINT [PK_empelados] PRIMARY KEY CLUSTERED 
(
	[idempleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


