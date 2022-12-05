USE [dbproject3]
GO



IF  EXISTS (SELECT *
FROM sys.objects
WHERE object_id = OBJECT_ID(N'[dbo].[CVF]') AND type in (N'U'))
DROP TABLE [dbo].[CVF]
GO


SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CVF]
(
    [RecordID] [int] IDENTITY(1,1) NOT NULL,
    [LastMod] [datetime] NULL,
    [InputDate] [datetime] NULL,
    [cohortid] [smallint] NOT NULL,
    [date] [datetime] NOT NULL,
    [visittype] [smallint] NULL,
    [childbearing] [smallint] NULL,
    [pregnant] [smallint] NULL,
    [trimister] [smallint] NULL,
    [careoutside] [smallint] NULL,
    [wcaregiven1] [nvarchar](50) NULL,
    [cdate1] [datetime] NULL,
    [diagnosis1] [nvarchar](50) NULL,
    [bsdone1] [smallint] NULL,
    [wcaregiven2] [nvarchar](50) NULL,
    [cdate2] [datetime] NULL,
    [diagnosis2] [nvarchar](50) NULL,
    [bsdone2] [smallint] NULL,
    [osantimalarial] [smallint] NULL,
    [antimalarial1] [nvarchar](255) NULL,
    [dose1] [nvarchar](255) NULL,
    [lgdate1] [datetime] NULL,
    [antimalarial2] [nvarchar](255) NULL,
    [dose2] [nvarchar](255) NULL,
    [lgdate2] [datetime] NULL,
    [itnlastnight] [smallint] NULL,
    [lastvisit] [datetime] NULL,
    [travelout] [smallint] NULL,
    [temperature] [decimal](3, 1) NULL,
    [height] [smallint] NULL,
    [weight] [decimal](4, 1) NULL,
    [heartrate] [smallint] NULL,
    [sbp] [smallint] NULL,
    [dbp] [smallint] NULL,
    [resprate] [smallint] NULL,
    [fever] [smallint] NULL,
    [fduration] [smallint] NULL,
    [fatigue] [smallint] NULL,
    [fmduration] [smallint] NULL,
    [abdominalpain] [smallint] NULL,
    [apainduration] [smallint] NULL,
    [anorexia] [smallint] NULL,
    [aduration] [smallint] NULL,
    [vomiting] [smallint] NULL,
    [vduration] [smallint] NULL,
    [diarrhea] [smallint] NULL,
    [dduration] [smallint] NULL,
    [cough] [smallint] NULL,
    [cduration] [smallint] NULL,
    [headache] [smallint] NULL,
    [hduration] [smallint] NULL,
    [jointpains] [smallint] NULL,
    [djointpains] [smallint] NULL,
    [muscleaches] [smallint] NULL,
    [mduration] [smallint] NULL,
    [seizure] [smallint] NULL,
    [sduration] [smallint] NULL,
    [jaundice] [smallint] NULL,
    [jduration] [smallint] NULL,
    [labalgorithm] [smallint] NULL,
    [dx1code] [smallint] NULL,
    [dx2code] [smallint] NULL,
    [dx3code] [smallint] NULL,
    [dx4code] [smallint] NULL,
    [dx5code] [smallint] NULL,
    [dx6code] [smallint] NULL,
    [dx7code] [smallint] NULL,
    [dx8code] [smallint] NULL,
    [med1code] [smallint] NULL,
    [med2code] [smallint] NULL,
    [med3code] [smallint] NULL,
    [med4code] [smallint] NULL,
    [med5code] [smallint] NULL,
    [med6code] [smallint] NULL,
    [med7code] [smallint] NULL,
    [med8code] [smallint] NULL,
    [malaria] [smallint] NULL,
    [convulsions] [smallint] NULL,
    [unabletosit] [smallint] NULL,
    [vomitingc] [smallint] NULL,
    [unabletodrink] [smallint] NULL,
    [Lethargy] [smallint] NULL,
    [cerebral] [smallint] NULL,
    [3convulsions] [smallint] NULL,
    [severeanemia] [smallint] NULL,
    [distress] [smallint] NULL,
    [jaundicec] [smallint] NULL,
    [other] [smallint] NULL,
    [othersigns] [nvarchar](255) NULL,
    [bsreading] [int] NULL,
    [parasitedensity] [int] NULL,
    [gametocytes] [int] NULL,
    [falciparum] [smallint] NULL,
    [malariae] [smallint] NULL,
    [ovale] [smallint] NULL,
    [vivax] [smallint] NULL,
    [unknown] [smallint] NULL,
    [hemoglobin] [decimal](3, 1) NULL,
    [qpcr] [float] NULL,
    [hospitalizations] [smallint] NULL,
    [nextvisit] [datetime] NULL,
    [barcode] [nvarchar](4) NOT NULL,
    [clean] [bit] NULL,
    CONSTRAINT [PK_CVF] PRIMARY KEY CLUSTERED 
(
	[cohortid] ASC,
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CVF] ADD  CONSTRAINT [DF_CVF_LastMod]  DEFAULT (getdate()) FOR [LastMod]
GO

ALTER TABLE [dbo].[CVF] ADD  CONSTRAINT [DF_CVF_InputDate]  DEFAULT (getdate()) FOR [InputDate]
GO


