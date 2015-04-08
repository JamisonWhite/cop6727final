CREATE TABLE [dbo].[RoomSchedule]
(
	[RoomName] NVARCHAR(50) NOT NULL , 
    [DayOfWeek] SMALLINT NOT NULL, 
    [StartTime] TIME NOT NULL, 
    [EndTime] TIME NOT NULL, 
    [OccupiedTemperature] DECIMAL NOT NULL, 
    [UnoccupiedTemperature] DECIMAL NOT NULL, 
    PRIMARY KEY ([RoomName], [StartTime], [DayOfWeek]), 
    CONSTRAINT [CK_RoomSchedule_EndTime] CHECK (EndTime > StartTime), 
    CONSTRAINT [FK_RoomSchedule_Room] FOREIGN KEY ([RoomName]) REFERENCES [Room]([Name])
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