CREATE TABLE [dbo].[RoomSensor]
(
	[RoomName] NVARCHAR(50) NOT NULL , 
    [SensorDate] DATETIME NOT NULL, 
    [Occupied] BIT NOT NULL, 
    [Temperature] DECIMAL NOT NULL, 
    PRIMARY KEY ([SensorDate], [RoomName]), 
    CONSTRAINT [FK_RoomSensor_Room] FOREIGN KEY ([RoomName]) REFERENCES [Room]([Name])
)

GO

CREATE TRIGGER [dbo].[Trigger_RoomSensor]
    ON [dbo].[RoomSensor]
    FOR INSERT, UPDATE
    AS
    BEGIN
        SET NoCount ON

		--TODO Update Room.TargetTemperature

    END