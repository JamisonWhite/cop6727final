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
		Occupied = i.Occupied,
		Temperature = i.Temperature,
		TargetTemperature = ISNULL( case when i.Occupied = 1 then s.OccupiedTemperature else s.UnoccupiedTemperature end, Room.DefaultTemperature)
		FROM inserted as i
		JOIN Room as r on i.RoomId = r.Id
		LEFT JOIN PolicySchedule AS s ON 
				r.PolicyId = s.PolicyId 
			and cast(i.SensorDate as Time) between s.StartTime and s.EndTime
			and DATEPART(DW, i.SensorDate) = s.DayOfWeek
		WHERE Room.Id = i.RoomId





    END
GO


DENY UPDATE, DELETE ON RoomSensor TO public
GO

