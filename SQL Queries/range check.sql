USE [dbProject3]
GO

DROP PROCEDURE [dbo].[RangeCheck]
GO


CREATE PROCEDURE [dbo].[RangeCheck]
AS

DECLARE @SQLstring NVARCHAR(1500)

DECLARE @VN NVARCHAR(25), @DF NVARCHAR(25), @DLOWBD NVARCHAR(15), @DUPPBD NVARCHAR(15)

---------------------- CVF
DECLARE ReqF CURSOR 
FOR
SELECT rtrim(DVARNAME),rtrim(DFORM),DLOWBD,DUPPBD FROM tblDD WHERE (DLOWBD is not null) And (DUPPBD is not null) AND DFORM = 'CVF' ORDER BY DORDER 
OPEN ReqF 
FETCH NEXT FROM ReqF INTO @VN, @DF, @DLOWBD, @DUPPBD 
WHILE (@@FETCH_STATUS <> -1) 
BEGIN 
   IF (@@FETCH_STATUS <> -2) 
   BEGIN 
     SET @SQLstring =N'INSERT INTO queries_cvf(answered,form,formrecordid,cohortid,date,quest,problemvalue,problem,varname,qrydate,qryorig) ' + CHAR(13) 
     SET @SQLstring = @SQLstring + N'SELECT ''0'',''' + @DF + N''',s.recordid,s.cohortid,s.date,d.ddescrip,' + @VN + N',''Out of Range (' + @DLOWBD + ' - ' + @DUPPBD + ')'',d.dvarname,getdate(),''SQL'' FROM ' + @DF + N' S, tblDD d' + CHAR(13) 
     SET @SQLstring = @SQLstring + N'WHERE ((' + @VN + N' < ' + @DLOWBD + N') OR (' + @VN + N' > ' + @DUPPBD + N')) And CLEAN=0 And d.dvarname=''' + @VN + N''' And d.DFORM = ''' + @DF + N'''' 
     SET @SQLstring = @SQLstring + N'AND NOT EXISTS (SELECT form,cohortid,date, problemvalue, problem,varname from queries_cvf where form = ''' + @DF + N''' and cohortid = s.cohortid and date = s.date and problemvalue= cast(' + @VN + N' as varchar) and problem = ''Out of Range (' + @DLOWBD + ' - ' + @DUPPBD + ')'' and varname = d.dvarname)' 
     PRINT	@SQLstring 
     EXEC sp_executesql @SQLstring 
   END 
   FETCH NEXT FROM ReqF INTO @VN, @DF, @DLOWBD, @DUPPBD 
END 
CLOSE ReqF 
DEALLOCATE ReqF 