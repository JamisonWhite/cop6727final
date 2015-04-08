CREATE TABLE [dbo].[RoomSchedule]
(
	[RoomName] NVARCHAR(50) NOT NULL , 
    [DayOfWeek] SMALLINT NOT NULL, 
    [StartTime] TIME NOT NULL, 
    [EndTime] TIME NOT NULL, 
    [OccupiedTemperature] DECIMAL NOT NULL, 
    [UnoccupiedTemperature] DECIMAL NOT NULL, 
    PRIMARY KEY ([RoomName], [StartTime], [DayOfWeek])
)
