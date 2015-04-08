CREATE TABLE [dbo].[Room]
(
	[Name] NVARCHAR(50) NOT NULL PRIMARY KEY, 
    [Occupied] BIT NOT NULL, 
    [Temperature] DECIMAL NULL, 
    [TargetTemperature] DECIMAL NULL
)
