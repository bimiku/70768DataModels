USE [ContosoRetailDW];
GO

CREATE VIEW [olap].[vDimEntity]
AS
    SELECT
        [EntityKey]
    ,   [EntityLabel]
    ,   [ParentEntityKey]
    ,   [EntityName]
    ,   [EntityDescription]
    ,   [EntityType]
    ,   [Status]
    FROM
        [dbo].[DimEntity];