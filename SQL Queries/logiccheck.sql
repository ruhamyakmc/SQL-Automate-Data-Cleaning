USE dbProject3
GO

/****** Object:  StoredProcedure [dbo].[spLogicCheck]    Script Date: 13/11/2022 15:28:34 ******/
SET ANSI_NULLS OFF
GO

SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[LogicCheck]
AS

DECLARE @SQLstring NVARCHAR(1500)

DECLARE @VN NVARCHAR(35), @DF NVARCHAR(10), @DC NVARCHAR(200), @DM NVARCHAR(200)
Print '================== 1st Logic check for: CVF'
DECLARE ReqF CURSOR 
FOR
SELECT rtrim(DVARNAME), rtrim(DFORM), DOTHCHK1, DCHK1MSG
FROM tblDD
WHERE (DOTHCHK1 is not null) and DFORM = 'CVF'
ORDER BY DORDER
OPEN ReqF
FETCH NEXT FROM ReqF INTO @VN, @DF, @DC, @DM
WHILE (@@FETCH_STATUS <> -1) 
BEGIN
    IF (@@FETCH_STATUS <> -2) 
   BEGIN
        SET @SQLstring =N'INSERT INTO queries_cvf(answered,form,formrecordid,cohortid,date,quest,problemvalue,problem,varname,qrydate,qryorig) ' + CHAR(13)
        SET @SQLstring = @SQLstring + N'SELECT ''0'',''' + @DF + N''',s.recordid,s.cohortid,s.date,d.ddescrip,Coalesce(cast(' + @VN + N' as varchar),''Empty''),''' + @DM + N''',d.dvarname,getdate(),''SQL'' FROM ' + @DF + N' S, tblDD d' + CHAR(13)
        SET @SQLstring = @SQLstring + N'WHERE (' + @DC + N') And CLEAN=0 And d.dvarname=''' + @VN + N''' And d.DFORM=''' + @DF + N''''
        SET @SQLstring = @SQLstring + N'AND NOT EXISTS (SELECT form,cohortid,date, problemvalue, problem,varname from queries_cvf where form = ''' + @DF + N''' and cohortid = s.cohortid and date = s.date and problemvalue = Coalesce(cast(' + @VN + N' as varchar),''Empty'') and problem = ''' + @DM + N''' and varname = d.dvarname)'
        PRINT	@SQLstring
        EXEC sp_executesql @SQLstring
    END
    FETCH NEXT FROM ReqF INTO @VN, @DF, @DC, @DM
END
CLOSE ReqF
DEALLOCATE ReqF


Print '================== 2nd Logic check for: CVF'
DECLARE ReqF CURSOR 
FOR
SELECT rtrim(DVARNAME), rtrim(DFORM), DOTHCHK2, DCHK2MSG
FROM tblDD
WHERE (DOTHCHK2 is not null) and DFORM = 'CVF'
ORDER BY DORDER
OPEN ReqF
FETCH NEXT FROM ReqF INTO @VN, @DF, @DC, @DM
WHILE (@@FETCH_STATUS <> -1) 
BEGIN
    IF (@@FETCH_STATUS <> -2) 
   BEGIN
        SET @SQLstring =N'INSERT INTO queries_cvf(answered,form,formrecordid,cohortid,date,quest,problemvalue,problem,varname,qrydate,qryorig) ' + CHAR(13)
        SET @SQLstring = @SQLstring + N'SELECT ''0'',''' + @DF + N''',s.recordid,s.cohortid,s.date,d.ddescrip,Coalesce(cast(' + @VN + N' as varchar),''Empty''),''' + @DM + N''',d.dvarname,getdate(),''SQL'' FROM ' + @DF + N' S, tblDD d' + CHAR(13)
        SET @SQLstring = @SQLstring + N'WHERE (' + @DC + N') And CLEAN=0 And d.dvarname=''' + @VN + N''' And d.DFORM=''' + @DF + N''''
        SET @SQLstring = @SQLstring + N'AND NOT EXISTS (SELECT form,cohortid,date, problemvalue, problem,varname from queries_cvf where form = ''' + @DF + N''' and cohortid = s.cohortid and date = s.date and problemvalue = Coalesce(cast(' + @VN + N' as varchar),''Empty'') and problem = ''' + @DM + N''' and varname = d.dvarname)'
        PRINT	@SQLstring
        EXEC sp_executesql @SQLstring
    END
    FETCH NEXT FROM ReqF INTO @VN, @DF, @DC, @DM
END
CLOSE ReqF
DEALLOCATE ReqF





Print '================== 3rd Logic check for: CVF'
DECLARE ReqF CURSOR 
FOR
SELECT rtrim(DVARNAME), rtrim(DFORM), DOTHCHK3, DCHK3MSG
FROM tblDD
WHERE (DOTHCHK3 is not null) and DFORM = 'CVF'
ORDER BY DORDER
OPEN ReqF
FETCH NEXT FROM ReqF INTO @VN, @DF, @DC, @DM
WHILE (@@FETCH_STATUS <> -1) 
BEGIN
    IF (@@FETCH_STATUS <> -2) 
   BEGIN
        SET @SQLstring =N'INSERT INTO queries_cvf(answered,form,formrecordid,cohortid,date,quest,problemvalue,problem,varname,qrydate,qryorig) ' + CHAR(13)
        SET @SQLstring = @SQLstring + N'SELECT ''0'',''' + @DF + N''',s.recordid,s.cohortid,s.date,d.ddescrip,Coalesce(cast(' + @VN + N' as varchar),''Empty''),''' + @DM + N''',d.dvarname,getdate(),''SQL'' FROM ' + @DF + N' S, tblDD d' + CHAR(13)
        SET @SQLstring = @SQLstring + N'WHERE (' + @DC + N') And CLEAN=0 And d.dvarname=''' + @VN + N''' And d.DFORM=''' + @DF + N''''
        SET @SQLstring = @SQLstring + N'AND NOT EXISTS (SELECT form,cohortid,date, problemvalue, problem,varname from queries_cvf where form = ''' + @DF + N''' and cohortid = s.cohortid and date = s.date and problemvalue = Coalesce(cast(' + @VN + N' as varchar),''Empty'') and problem = ''' + @DM + N''' and varname = d.dvarname)'
        PRINT	@SQLstring
        EXEC sp_executesql @SQLstring
    END
    FETCH NEXT FROM ReqF INTO @VN, @DF, @DC, @DM
END
CLOSE ReqF
DEALLOCATE ReqF


Print '================== 4th Logic check for: CVF'
DECLARE ReqF CURSOR 
FOR
SELECT rtrim(DVARNAME), rtrim(DFORM), DOTHCHK4, DCHK4MSG
FROM tblDD
WHERE (DOTHCHK4 is not null) and DFORM = 'CVF'
ORDER BY DORDER
OPEN ReqF
FETCH NEXT FROM ReqF INTO @VN, @DF, @DC, @DM
WHILE (@@FETCH_STATUS <> -1) 
BEGIN
    IF (@@FETCH_STATUS <> -2) 
   BEGIN
        SET @SQLstring =N'INSERT INTO queries_cvf(answered,form,formrecordid,cohortid,date,quest,problemvalue,problem,varname,qrydate,qryorig) ' + CHAR(13)
        SET @SQLstring = @SQLstring + N'SELECT ''0'',''' + @DF + N''',s.recordid,s.cohortid,s.date,d.ddescrip,Coalesce(cast(' + @VN + N' as varchar),''Empty''),''' + @DM + N''',d.dvarname,getdate(),''SQL'' FROM ' + @DF + N' S, tblDD d' + CHAR(13)
        SET @SQLstring = @SQLstring + N'WHERE (' + @DC + N') And CLEAN=0 And d.dvarname=''' + @VN + N''' And d.DFORM=''' + @DF + N''''
        SET @SQLstring = @SQLstring + N'AND NOT EXISTS (SELECT form,cohortid,date, problemvalue, problem,varname from queries_cvf where form = ''' + @DF + N''' and cohortid = s.cohortid and date = s.date and problemvalue = Coalesce(cast(' + @VN + N' as varchar),''Empty'') and problem = ''' + @DM + N''' and varname = d.dvarname)'
        PRINT	@SQLstring
        EXEC sp_executesql @SQLstring
    END
    FETCH NEXT FROM ReqF INTO @VN, @DF, @DC, @DM
END
CLOSE ReqF
DEALLOCATE ReqF 


