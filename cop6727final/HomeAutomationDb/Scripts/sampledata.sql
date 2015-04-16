
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
