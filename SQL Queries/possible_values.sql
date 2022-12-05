USE [dbproject3]
GO


DROP PROCEDURE [dbo].[PossibleValuesCheck]
GO

SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[PossibleValuesCheck]
AS

DECLARE @SQLstring NVARCHAR(1500)

DECLARE @VN VARCHAR(25), @DF VARCHAR(10), @DP VARCHAR(200)

--------------------- CVF
DECLARE ReqF CURSOR 
FOR
SELECT rtrim(DVARNAME), rtrim(DFORM), DPOSVAL
FROM tblDD
WHERE (DPOSVAL is not null) and DFORM = 'CVF'
ORDER BY DORDER
OPEN ReqF
FETCH NEXT FROM ReqF INTO @VN, @DF, @DP
WHILE (@@FETCH_STATUS <> -1) 
BEGIN
    IF (@@FETCH_STATUS <> -2) 
   BEGIN
        SET @SQLstring =N'INSERT INTO queries_cvf(answered,form,formrecordid,cohortid,date,quest,problemvalue,problem,varname,qrydate,qryorig) ' + CHAR(13)
        SET @SQLstring = @SQLstring + N'SELECT ''0'',''' + @DF + N''',s.recordid,s.cohortid,s.date,d.ddescrip,' + @VN + N',''Value Not in (' + @DP + N')'',d.dvarname,getdate(),''SQL'' FROM ' + @DF + N' S, tblDD d' + CHAR(13)
        SET @SQLstring = @SQLstring + N'WHERE (' + @VN + N' not In (' + @DP + N')) And CLEAN = 0 And ' +@VN+ ' is not null And d.dvarname = ''' + @VN + N''' And d.DFORM = ''' + @DF + N''''
        SET @SQLstring = @SQLstring + N'AND NOT EXISTS (SELECT form,cohortid,date, problemvalue, problem,varname from queries_cvf where form = ''' + @DF + N''' and cohortid = s.cohortid and date = s.date and problemvalue= cast(' + @VN + N' as varchar) and problem = ''Value Not in (' + @DP + N')'' and varname = d.dvarname)'
        PRINT	@SQLstring
        EXEC sp_executesql @SQLstring
    END
    FETCH NEXT FROM ReqF INTO @VN, @DF, @DP
END
CLOSE ReqF
DEALLOCATE ReqF 
