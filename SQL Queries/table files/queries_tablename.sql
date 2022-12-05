USE [dbProject3]
GO

/****** Object:  Table [dbo].[queries_cvf]    Script Date: 03/12/2022 09:16:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[queries_cvf]
(
    [Recordid] [int] IDENTITY(1,1) NOT NULL,
    [Formrecordid] [int] NOT NULL,
    [Form] [nvarchar](50) NOT NULL,
    [cohortid] [int] NOT NULL,
    [date] [datetime] NOT NULL,
    [Quest] [varchar](255) NOT NULL,
    [ProblemValue] [varchar](255) NOT NULL,
    [Problem] [varchar](255) NOT NULL,
    [VarName] [varchar](40) NOT NULL,
    [Comments] [varchar](255) NOT NULL,
    [ANSWERED] [tinyint] NOT NULL,
    [QryDate] [datetime] NOT NULL,
    [QryOrig] [varchar](50) NOT NULL,
    CONSTRAINT [PK_queries_cvf] PRIMARY KEY CLUSTERED 
(
	[cohortid] ASC,
	[date] ASC,
	[ProblemValue] ASC,
	[Problem] ASC,
	[VarName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[queries_cvf] ADD  CONSTRAINT [DF_queries_cvf_Comments_1]  DEFAULT ('Pending') FOR [Comments]
GO


