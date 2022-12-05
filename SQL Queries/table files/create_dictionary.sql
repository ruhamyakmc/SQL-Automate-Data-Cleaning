USE [dbProject3]
GO

/****** Object:  Table [dbo].[tblDD]    Script Date: 03/12/2022 09:12:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblDD]
(
    [DVARNAME] [varchar](50) NOT NULL,
    [DDESCRIP] [varchar](255) NULL,
    [DFORM] [varchar](15) NOT NULL,
    [DFORM2] [nvarchar](255) NULL,
    [GRP] [int] NULL,
    [DORDER] [int] NULL,
    [DVARTYPE] [int] NULL,
    [DPOSVAL] [varchar](255) NULL,
    [DREQUIRED] [int] NULL,
    [DLOWBD] [int] NULL,
    [DUPPBD] [int] NULL,
    [DLOWDT] [datetime] NULL,
    [DUPPDT] [datetime] NULL,
    [DOTHCHK1] [varchar](255) NULL,
    [DCHK1MSG] [varchar](255) NULL,
    [DOTHCHK2] [varchar](255) NULL,
    [DCHK2MSG] [varchar](255) NULL,
    [DOTHCHK3] [varchar](255) NULL,
    [DCHK3MSG] [varchar](255) NULL,
    [DOTHCHK4] [varchar](255) NULL,
    [DCHK4MSG] [varchar](255) NULL,
    [DOCROSSCHK1] [varchar](255) NULL,
    [DCROSSMSG1] [varchar](255) NULL,
    [DOCROSSCHK2] [varchar](255) NULL,
    [DCROSSMSG2] [varchar](255) NULL,
    [DOCROSSCHK3] [varchar](255) NULL,
    [DCROSSMSG3] [varchar](255) NULL,
    [DOCROSSCHK4] [varchar](255) NULL,
    [DCROSSMSG4] [varchar](255) NULL,
    CONSTRAINT [PK_tblDD] PRIMARY KEY CLUSTERED 
(
	[DVARNAME] ASC,
	[DFORM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO