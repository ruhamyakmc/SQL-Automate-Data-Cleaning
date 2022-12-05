USE [dbProject3]
GO

DROP PROCEDURE [dbo].[spRequiredCheck]
GO

SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[spRequiredCheck]
AS
DECLARE @SQLstring NVARCHAR(1500)

DECLARE @VN NVARCHAR(25), @DF NVARCHAR(10)

DECLARE ReqF CURSOR 
FOR
SELECT rtrim(DVARNAME), rtrim(DFORM)
FROM tblDD
WHERE DREQUIRED = '1' AND DFORM = 'CVF'
ORDER BY DORDER
OPEN ReqF
FETCH NEXT FROM ReqF INTO @VN, @DF
WHILE (@@FETCH_STATUS <> -1) 
BEGIN
    IF (@@FETCH_STATUS <> -2) 
   BEGIN
        SET @SQLstring =N'INSERT INTO queries_cvf(answered,form,formrecordid,cohortid,date,quest,problemvalue,problem,varname,qrydate,qryorig) ' + CHAR(13)
        SET @SQLstring = @SQLstring + N'SELECT ''0'',''' + @DF + N''',s.recordid,s.cohortid,s.date,d.ddescrip, ''Empty'', ''Missing'' ,d.dvarname, getdate(), ''SQL'' FROM ' + @DF + N' S, tblDD d' + CHAR(13)
        SET @SQLstring = @SQLstring + N'WHERE (' + @VN + N' IS NULL) And CLEAN = 0 And d.dvarname = ''' + @VN + N''' And d.dform = ''' + @DF + N''''
        SET @SQLstring = @SQLstring + N'AND NOT EXISTS (SELECT form,cohortid,date,problemvalue,problem,varname from queries_cvf where form = ''' + @DF + N''' and cohortid = s.cohortid and date = s.date and problemvalue = ''Empty'' and problem = ''Missing'' and varname = d.dvarname)'
        PRINT	@SQLstring
        EXEC sp_executesql @SQLstring
    END
    FETCH NEXT FROM ReqF INTO @VN, @DF
END
CLOSE ReqF
DEALLOCATE ReqF 
GO
