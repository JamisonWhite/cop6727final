CREATE TABLE [dbo].[PolicySchedule]
(
	[PolicyId] INT NOT NULL , 
    [DayOfWeek] SMALLINT NOT NULL, 
    [StartTime] TIME NOT NULL, 
    [EndTime] TIME NOT NULL, 
    [OccupiedTemperature] DECIMAL NOT NULL, 
    [UnoccupiedTemperature] DECIMAL NOT NULL, 
    PRIMARY KEY ([PolicyId], [StartTime], [DayOfWeek]), 
    CONSTRAINT [CK_PolicySchedule_EndTime] CHECK (EndTime > StartTime), 
    CONSTRAINT [FK_PolicySchedule_Room] FOREIGN KEY ([PolicyId]) REFERENCES [Policy]([Id])
)

GO
