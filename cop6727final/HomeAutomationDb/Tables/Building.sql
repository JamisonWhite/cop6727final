CREATE TABLE [dbo].[Building]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Name] NVARCHAR(50) NOT NULL,
	[DefaultPolicyId] int NOT NULL, 
    CONSTRAINT [FK_Building_Policy] FOREIGN KEY ([DefaultPolicyId]) REFERENCES [Policy]([Id])
)
