CREATE TABLE [dbo].[Room]
(
    [Id] INT NOT NULL, 
	[Name] NVARCHAR(50) NOT NULL ,
    [BuildingId] INT NOT NULL,  
    [DefaultTemperature] DECIMAL NOT NULL, 
    [Occupied] BIT NOT NULL DEFAULT 0, 
    [Temperature] DECIMAL NULL, 
    [TargetTemperature] DECIMAL NULL, 
    PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Room_Building] FOREIGN KEY ([BuildingId]) REFERENCES [Building]([Id])
)
