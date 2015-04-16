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
