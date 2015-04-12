CREATE TABLE [dbo].[RoomSchedule]
(
	[RoomId] INT NOT NULL , 
    [DayOfWeek] SMALLINT NOT NULL, 
    [StartTime] TIME NOT NULL, 
    [EndTime] TIME NOT NULL, 
    [OccupiedTemperature] DECIMAL NOT NULL, 
    [UnoccupiedTemperature] DECIMAL NOT NULL, 
    PRIMARY KEY ([RoomId], [StartTime], [DayOfWeek]), 
    CONSTRAINT [CK_RoomSchedule_EndTime] CHECK (EndTime > StartTime), 
    CONSTRAINT [FK_RoomSchedule_Room] FOREIGN KEY ([RoomId]) REFERENCES [Room]([Id])
)

GO

CREATE TRIGGER [dbo].[Trigger_RoomSchedule]
    ON [dbo].[RoomSchedule]
    FOR INSERT, UPDATE
    AS
    BEGIN
        SET NoCount ON

		-- TODO CONFIRM THERE ARE NO OVERLAPPING SCHEDULES

    END