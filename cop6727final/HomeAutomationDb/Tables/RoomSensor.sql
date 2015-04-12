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

		UPDATE Room SET 
		Occupied = inserted.Occupied,
		Temperature = inserted.Temperature,
		TargetTemperature = 
		ISNULL((
				SELECT  case when inserted.Occupied = 1 then PolicySchedule.OccupiedTemperature else PolicySchedule.UnoccupiedTemperature end
				FROM   PolicySchedule
				WHERE  Room.PolicyId = PolicySchedule.PolicyId
				AND CAST(inserted.SensorDate as Time) BETWEEN PolicySchedule.StartTime AND PolicySchedule.EndTime
				AND DATEPART(DW, inserted.SensorDate) = PolicySchedule.DayOfWeek
			)
			, Room.DefaultTemperature)

		FROM inserted
		JOIN Room on inserted.RoomId = Room.Id

    END
GO


DENY UPDATE, DELETE ON RoomSensor TO public
GO

