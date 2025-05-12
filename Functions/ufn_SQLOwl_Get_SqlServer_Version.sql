CREATE FUNCTION dbo.ufn_SQLOwl_Get_SqlServer_Version (
	@ProductVersion VARCHAR(20) = NULL)
RETURNS VARCHAR(155)
BEGIN 
	IF @ProductVersion IS NULL 
		SET @ProductVersion = (SELECT CONVERT(NVARCHAR(155), SERVERPROPERTY('ProductVersion')));
	RETURN 
		(SELECT CASE WHEN @ProductVersion LIKE N'16%' 
							THEN N'SQL Server 2022'
				WHEN @ProductVersion LIKE N'15%' 
							THEN N'SQL Server 2019' 
				WHEN @ProductVersion LIKE N'14%' 
							THEN N'SQL Server 2017' 
				WHEN @ProductVersion LIKE N'13%' 
							THEN N'SQL Server 2016' 
				WHEN @ProductVersion LIKE N'12%' 
							THEN N'SQL Server 2015' 
				WHEN @ProductVersion LIKE N'11%' 
							THEN N'SQL Server 2012' 
				WHEN @ProductVersion LIKE N'10.5%' 
							THEN N'SQL Server 2008 R2' 
				WHEN @ProductVersion LIKE N'10%' 
							THEN N'SQL Server 2008'  
				WHEN @ProductVersion LIKE N'9%' 
							THEN N'SQL Server 2005'  
				WHEN @ProductVersion LIKE N'8%' 
							THEN N'SQL Server 2000'  
				WHEN @ProductVersion LIKE N'7%' 
							THEN N'SQL Server 7.0'  
				WHEN @ProductVersion LIKE N'6.50%' 
							THEN N'SQL Server 6.5' END)
END