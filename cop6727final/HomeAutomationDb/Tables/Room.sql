CREATE TABLE [dbo].[Room]
(
    [Id] INT NOT NULL, 
	[Name] NVARCHAR(50) NOT NULL ,
    [BuildingId] INT NOT NULL,  
    [PolicyId] INT NULL,  
    [DefaultTemperature] DECIMAL NOT NULL, 
    [Occupied] BIT NOT NULL CONSTRAINT DF_Room_Occupied DEFAULT 0, 
    [Temperature] DECIMAL NULL, 
    [TargetTemperature] DECIMAL NULL, 
    PRIMARY KEY ([Id]), 
    CONSTRAINT [FK_Room_Building] FOREIGN KEY ([BuildingId]) REFERENCES [Building]([Id]), 
    CONSTRAINT [FK_Room_Policy] FOREIGN KEY ([PolicyId]) REFERENCES [Policy]([Id])
)

GO

CREATE TRIGGER [dbo].[Trigger_Room]
    ON [dbo].[Room]
    FOR INSERT, UPDATE
    AS
    BEGIN

	UPDATE Room SET
	PolicyId = Building.DefaultPolicyId
	FROM inserted
	JOIN Building on inserted.BuildingId = Building.Id
	WHERE Room.Id = inserted.Id
	AND   inserted.PolicyId IS NULL 

    END