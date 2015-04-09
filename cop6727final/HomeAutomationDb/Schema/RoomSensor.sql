CREATE TABLE [dbo].[RoomSensor]
(
	[RoomId] INT NOT NULL , 
    [SensorDate] DATETIME NOT NULL, 
    [Occupied] BIT NOT NULL, 
    [Temperature] DECIMAL NOT NULL, 
    PRIMARY KEY ([SensorDate], [RoomId]), 
    CONSTRAINT [FK_RoomSensor_Room] FOREIGN KEY ([RoomId]) REFERENCES [Room]([Id])
)

GO

CREATE TRIGGER [dbo].[Trigger_RoomSensor]
    ON [dbo].[RoomSensor]
    FOR INSERT
    AS
    BEGIN
        SET NoCount ON

		--TODO Update Room.TargetTemperature

    END