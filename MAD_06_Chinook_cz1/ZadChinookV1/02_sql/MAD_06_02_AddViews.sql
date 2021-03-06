USE [Chinook]
GO

	DROP VIEW IF EXISTS [dbo].[vw_Track]
	DROP VIEW IF EXISTS [dbo].[vw_Album]
	DROP VIEW IF EXISTS [dbo].[vw_Customer]
	DROP VIEW IF EXISTS [dbo].[vw_Playlist]
	GO

	CREATE VIEW [dbo].[vw_Track]
	AS
	SELECT 
		[tr].[TrackId]
	,	[tr].[Name]				AS [TrackName]
	,	[tr].[AlbumId]
	,	[tr].[Composer]
	,	[tr].[Milliseconds]
	,	[tr].[Bytes]
	,	[tr].[UnitPrice]
	,	[gr].[Name]				AS [GenreName]
	,	[mt].[Name]				AS [MediaTypeName]
	FROM 
				[dbo].[Track]		AS tr
	INNER JOIN	[dbo].[Genre]		AS gr ON [gr].[GenreId]		= [tr].[GenreId]
	INNER JOIN	[dbo].[MediaType]	AS mt ON [mt].[MediaTypeId] = [tr].[MediaTypeId]
	GO

	CREATE VIEW [dbo].[vw_Album]
	AS
	SELECT 
		[al].[AlbumId]
	,	[al].[Title]	AS [AlbumTitle]
	,	[ar].[Name]		AS [ArtistName]
	FROM 
				[dbo].[Album] AS al
	INNER JOIN	[dbo].[Artist] AS ar ON [ar].[ArtistId] = [al].[ArtistId]
	GO
	
	CREATE VIEW [dbo].[vw_Customer]
	AS
	SELECT 
		[cs].[CustomerId]
	,	ISNULL([cs].[FirstName] + ' ', '') + ISNULL([cs].[LastName], '')  AS [FullName]
	,	[cs].[Company]
	,	[cs].[Address]
	,	[cs].[City]
	,	[cs].[State]
	,	[cs].[Country]
	,	[cs].[PostalCode]
	,	[cs].[Phone]
	,	[cs].[Fax]
	,	[cs].[Email]
	,	ISNULL([em].[FirstName] + ' ', '') + ISNULL([em].[LastName], '')  AS [Suport_FullName]
	,	[em].[FirstName]	AS [Suport_FirstName]
	,	[em].[Title]		AS [Suport_Title]
	,	[em].[ReportsTo]	AS [Suport_ReportsTo]
	,	[em].[BirthDate]	AS [Suport_BirthDate]
	,	[em].[HireDate]		AS [Suport_HireDate]
	,	[em].[Address]		AS [Suport_Address]
	,	[em].[City]			AS [Suport_City]
	,	[em].[State]		AS [Suport_State]
	,	[em].[Country]		AS [Suport_Country]
	,	[em].[PostalCode]	AS [Suport_PostalCode]
	,	[em].[Phone]		AS [Suport_Phone]
	,	[em].[Fax]			AS [Suport_Fax]
	,	[em].[Email]		AS [Suport_Email]
	FROM 
				[dbo].[Customer] AS cs
	INNER JOIN	[dbo].[Employee] AS em ON [em].[EmployeeId] = [cs].[SupportRepId]
	GO

	CREATE VIEW [dbo].[vw_Playlist]
	AS
	SELECT
		[PlaylistId]
	,	RIGHT('00' + CAST([PlaylistId] AS VARCHAR(10)),2) +': ' + [Name] AS [PlaylistName]
	FROM [Chinook].[dbo].[Playlist]
	GO

	SELECT * FROM InvoiceLine
	

	update InvoiceLine

	set [Quantity] = InvoiceLineId % 5 + 1


	UPDATE InvoiceLine
	SET [UnitPrice]=UnitPrice*(InvoiceLineId % 2 + 1)
