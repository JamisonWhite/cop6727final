CREATE TABLE [dbo].[RoomSensor]
(
	[RoomName] NVARCHAR(50) NOT NULL , 
    [SensorDate] DATETIME NOT NULL, 
    [Occupied] BIT NOT NULL, 
    [Temperature] DECIMAL NOT NULL, 
    PRIMARY KEY ([SensorDate], [RoomName])
)
