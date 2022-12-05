USE [dbproject3]
GO

/****** Object:  StoredProcedure [dbo].[spAllChecks]    Script Date: 05/12/2022 08:10:43 ******/
DROP PROCEDURE [dbo].[spAllChecks]
GO

/****** Object:  StoredProcedure [dbo].[spAllChecks]    Script Date: 05/12/2022 08:10:43 ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO



CREATE PROCEDURE [dbo].[spAllChecks] AS 
EXEC spRequiredCheck 
EXEC RangeCheck 
EXEC PossibleValuesCheck 
EXEC LogicCheck 

GO


