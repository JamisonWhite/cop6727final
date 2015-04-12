
INSERT INTO Building(Id, Name) VALUES (1, 'Home');

INSERT INTO Room(Id, Name, BuildingId, DefaultTemperature) VALUES (1, 'Living Room', 1, 70);
INSERT INTO Room(Id, Name, BuildingId, DefaultTemperature) VALUES (2, 'Kitchen', 1, 70);
INSERT INTO Room(Id, Name, BuildingId, DefaultTemperature) VALUES (3, 'Bedroom', 1, 70);
INSERT INTO Room(Id, Name, BuildingId, DefaultTemperature) VALUES (4, 'Bathroom', 1, 70);

INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (1, 1, '8:00', '18:00', 70, 74)
INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (1, 2, '8:00', '18:00', 70, 74)
INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (1, 3, '8:00', '18:00', 70, 74)
INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (1, 4, '8:00', '18:00', 70, 74)
INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (1, 5, '8:00', '18:00', 70, 74)
INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (1, 6, '8:00', '18:00', 70, 74)
INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (1, 7, '8:00', '18:00', 70, 74)

INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (2, 1, '8:00', '18:00', 70, 74)
INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (2, 2, '8:00', '18:00', 70, 74)
INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (2, 3, '8:00', '18:00', 70, 74)
INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (2, 4, '8:00', '18:00', 70, 74)
INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (2, 5, '8:00', '18:00', 70, 74)
INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (2, 6, '8:00', '18:00', 70, 74)
INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (2, 7, '8:00', '18:00', 70, 74)

INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (3, 1, '8:00', '18:00', 70, 74)
INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (3, 2, '8:00', '18:00', 70, 74)
INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (3, 3, '8:00', '18:00', 70, 74)
INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (3, 4, '8:00', '18:00', 70, 74)
INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (3, 5, '8:00', '18:00', 70, 74)
INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (3, 6, '8:00', '18:00', 70, 74)
INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (3, 7, '8:00', '18:00', 70, 74)

INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (4, 1, '8:00', '18:00', 70, 74)
INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (4, 2, '8:00', '18:00', 70, 74)
INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (4, 3, '8:00', '18:00', 70, 74)
INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (4, 4, '8:00', '18:00', 70, 74)
INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (4, 5, '8:00', '18:00', 70, 74)
INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (4, 6, '8:00', '18:00', 70, 74)
INSERT INTO RoomSchedule(RoomId, DayOfWeek, StartTime, EndTime, OccupiedTemperature, UnoccupiedTemperature) VALUES (4, 7, '8:00', '18:00', 70, 74)


INSERT INTO RoomSensor(RoomId, SensorDate, Occupied, Temperature) VALUES (1, getdate(), 1, 75);
INSERT INTO RoomSensor(RoomId, SensorDate, Occupied, Temperature) VALUES (2, getdate(), 0, 75);
INSERT INTO RoomSensor(RoomId, SensorDate, Occupied, Temperature) VALUES (3, getdate(), 0, 75);
INSERT INTO RoomSensor(RoomId, SensorDate, Occupied, Temperature) VALUES (4, getdate(), 0, 75);

