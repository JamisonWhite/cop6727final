﻿/*
Deployment script for HomeAutomationDb

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "HomeAutomationDb"
:setvar DefaultFilePrefix "HomeAutomationDb"
:setvar DefaultDataPath "C:\data\MSSQL11.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\data\MSSQL11.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
PRINT N'Creating [User]...';


GO
ALTER DATABASE [$(DatabaseName)]
    ADD FILEGROUP [User];


GO
ALTER DATABASE [$(DatabaseName)]
    ADD FILE (NAME = [User_6F3C1A3A], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_User_6F3C1A3A.mdf') TO FILEGROUP [User];


GO
ALTER DATABASE [$(DatabaseName)]
    MODIFY FILEGROUP [User] DEFAULT;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
USE [$(DatabaseName)];


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating [dbo].[Building]...';


GO
CREATE TABLE [dbo].[Building] (
    [Id]              INT           NOT NULL,
    [Name]            NVARCHAR (50) NOT NULL,
    [DefaultPolicyId] INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Policy]...';


GO
CREATE TABLE [dbo].[Policy] (
    [Id]   INT           NOT NULL,
    [Name] NVARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[PolicySchedule]...';


GO
CREATE TABLE [dbo].[PolicySchedule] (
    [PolicyId]              INT          NOT NULL,
    [DayOfWeek]             SMALLINT     NOT NULL,
    [StartTime]             TIME (7)     NOT NULL,
    [EndTime]               TIME (7)     NOT NULL,
    [OccupiedTemperature]   DECIMAL (18) NOT NULL,
    [UnoccupiedTemperature] DECIMAL (18) NOT NULL,
    PRIMARY KEY CLUSTERED ([PolicyId] ASC, [StartTime] ASC, [DayOfWeek] ASC)
);


GO
PRINT N'Creating [dbo].[Room]...';


GO
CREATE TABLE [dbo].[Room] (
    [Id]                 INT           NOT NULL,
    [Name]               NVARCHAR (50) NOT NULL,
    [BuildingId]         INT           NOT NULL,
    [PolicyId]           INT           NULL,
    [DefaultTemperature] DECIMAL (18)  NOT NULL,
    [Occupied]           BIT           NOT NULL,
    [Temperature]        DECIMAL (18)  NULL,
    [TargetTemperature]  DECIMAL (18)  NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[RoomSensor]...';


GO
CREATE TABLE [dbo].[RoomSensor] (
    [RoomId]      INT          NOT NULL,
    [SensorDate]  DATETIME     NOT NULL,
    [Occupied]    BIT          NOT NULL,
    [Temperature] DECIMAL (18) NOT NULL,
    PRIMARY KEY CLUSTERED ([SensorDate] ASC, [RoomId] ASC)
);


GO
PRINT N'Creating DF_Room_Occupied...';


GO
ALTER TABLE [dbo].[Room]
    ADD CONSTRAINT [DF_Room_Occupied] DEFAULT 0 FOR [Occupied];


GO
PRINT N'Creating FK_Building_Policy...';


GO
ALTER TABLE [dbo].[Building]
    ADD CONSTRAINT [FK_Building_Policy] FOREIGN KEY ([DefaultPolicyId]) REFERENCES [dbo].[Policy] ([Id]);


GO
PRINT N'Creating FK_PolicySchedule_Room...';


GO
ALTER TABLE [dbo].[PolicySchedule]
    ADD CONSTRAINT [FK_PolicySchedule_Room] FOREIGN KEY ([PolicyId]) REFERENCES [dbo].[Policy] ([Id]);


GO
PRINT N'Creating FK_Room_Building...';


GO
ALTER TABLE [dbo].[Room]
    ADD CONSTRAINT [FK_Room_Building] FOREIGN KEY ([BuildingId]) REFERENCES [dbo].[Building] ([Id]);


GO
PRINT N'Creating FK_Room_Policy...';


GO
ALTER TABLE [dbo].[Room]
    ADD CONSTRAINT [FK_Room_Policy] FOREIGN KEY ([PolicyId]) REFERENCES [dbo].[Policy] ([Id]);


GO
PRINT N'Creating FK_RoomSensor_Room...';


GO
ALTER TABLE [dbo].[RoomSensor]
    ADD CONSTRAINT [FK_RoomSensor_Room] FOREIGN KEY ([RoomId]) REFERENCES [dbo].[Room] ([Id]);


GO
PRINT N'Creating CK_PolicySchedule_EndTime...';


GO
ALTER TABLE [dbo].[PolicySchedule]
    ADD CONSTRAINT [CK_PolicySchedule_EndTime] CHECK (EndTime > StartTime);


GO
PRINT N'Creating [dbo].[Trigger_Room]...';


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
GO
PRINT N'Creating [dbo].[Trigger_RoomSensor]...';


GO

CREATE TRIGGER [dbo].[Trigger_RoomSensor]
    ON [dbo].[RoomSensor]
    FOR INSERT
    AS
    BEGIN
        SET NoCount ON
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
PRINT N'Creating [dbo].[GenerateRandomRoomSensor]...';


GO
/****************************************************************
GenerateRandomSensorData
 Generates random room sensor data for the last X number
 of days.
****************************************************************/
CREATE PROCEDURE [dbo].[GenerateRandomRoomSensor]
	@days int = 7
AS

/*

select * from RoomSensor order by roomid, sensordate
delete from RoomSensor
go

*/
declare @temperature decimal
declare @occupied bit

set @temperature = 60
set @occupied = 0



declare @roomid int
declare @dt datetime

--iterate rooms
select @roomid = max(Room.Id) from Room
while (@roomid > 0)
begin

	--iterate hours
	set @dt = dateadd(hour, datediff(hour, 0, dateadd(dd, -@days, getdate())), 0)
	while @dt < getdate()
	begin

		--increment 1 hour
		set @dt = dateadd(HH, 1, @dt)

		-- adjust temp +/- 2 degrees
		set @temperature = @temperature + (RAND() * 4 - 2)
		-- random occupied
		set @occupied = CAST(ROUND(RAND(),0) AS BIT)
		-- insert sensor
		INSERT INTO [dbo].[RoomSensor]
				   ([RoomId]
				   ,[SensorDate]
				   ,[Occupied]
				   ,[Temperature])
			 VALUES
				   (@roomid
				   ,@dt
				   ,@occupied
				   ,@temperature);

	end


	-- increment room
	select @roomid = isnull(
	(select max(Room.Id)
		from Room
		where Id < @roomid
	), 0);


end




RETURN 0
GO
PRINT N'Creating Permission...';


GO
DENY UPDATE
    ON OBJECT::[dbo].[RoomSensor] TO PUBLIC CASCADE;


GO
PRINT N'Creating Permission...';


GO
DENY DELETE
    ON OBJECT::[dbo].[RoomSensor] TO PUBLIC CASCADE;


GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '5df9760e-3c06-4629-a325-b649d347f6b0')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('5df9760e-3c06-4629-a325-b649d347f6b0')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'aa970b1c-e9f1-4658-b6bd-179c5b95c05d')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('aa970b1c-e9f1-4658-b6bd-179c5b95c05d')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'c5532f89-1ff3-4dc6-904f-4585895cf23b')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('c5532f89-1ff3-4dc6-904f-4585895cf23b')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '2c96ce27-f019-4ee0-8314-151a42ce9778')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('2c96ce27-f019-4ee0-8314-151a42ce9778')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'dac032fe-e47e-4577-878b-01f44a1b90e8')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('dac032fe-e47e-4577-878b-01f44a1b90e8')

GO

GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

INSERT INTO Policy(Id, Name) VALUES (1, 'Summer Policy')
INSERT INTO Policy(Id, Name) VALUES (2, 'Winter Policy')

INSERT INTO PolicySchedule(PolicyId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (1, 1, '8:00', '18:00', 70, 75)
INSERT INTO PolicySchedule(PolicyId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (1, 2, '8:00', '18:00', 70, 75)
INSERT INTO PolicySchedule(PolicyId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (1, 3, '8:00', '18:00', 70, 75)
INSERT INTO PolicySchedule(PolicyId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (1, 4, '8:00', '18:00', 70, 75)
INSERT INTO PolicySchedule(PolicyId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (1, 5, '8:00', '18:00', 70, 75)
INSERT INTO PolicySchedule(PolicyId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (1, 6, '8:00', '18:00', 70, 75)
INSERT INTO PolicySchedule(PolicyId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (1, 7, '8:00', '18:00', 70, 75)

INSERT INTO PolicySchedule(PolicyId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (2, 1, '8:00', '18:00', 65, 60)
INSERT INTO PolicySchedule(PolicyId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (2, 2, '8:00', '18:00', 65, 60)
INSERT INTO PolicySchedule(PolicyId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (2, 3, '8:00', '18:00', 65, 60)
INSERT INTO PolicySchedule(PolicyId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (2, 4, '8:00', '18:00', 65, 60)
INSERT INTO PolicySchedule(PolicyId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (2, 5, '8:00', '18:00', 65, 60)
INSERT INTO PolicySchedule(PolicyId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (2, 6, '8:00', '18:00', 65, 60)
INSERT INTO PolicySchedule(PolicyId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (2, 7, '8:00', '18:00', 65, 60)


INSERT INTO Building(Id, Name, DefaultPolicyId) VALUES (1, 'Home', 1);

INSERT INTO Room(Id, Name, BuildingId, DefaultTemperature) VALUES (1, 'Living Room', 1, 80);
INSERT INTO Room(Id, Name, BuildingId, DefaultTemperature) VALUES (2, 'Kitchen', 1, 80);
INSERT INTO Room(Id, Name, BuildingId, DefaultTemperature) VALUES (3, 'Bedroom', 1, 80);
INSERT INTO Room(Id, Name, BuildingId, DefaultTemperature) VALUES (4, 'Bathroom', 1, 80);

exec GenerateRandomRoomSensor 7

GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO