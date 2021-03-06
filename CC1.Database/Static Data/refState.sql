USE [CCAttendance]
GO
truncate table [dbo].[refState]
go
SET IDENTITY_INSERT [dbo].[refState] ON 

INSERT [dbo].[refState] ([StateId], [StateCode], [Description], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (1, N'NSW', N'New South Wales', 1, CAST(N'2016-09-13T00:00:00.000' AS DateTime), 1, CAST(N'2016-09-13T00:00:00.000' AS DateTime))
INSERT [dbo].[refState] ([StateId], [StateCode], [Description], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (2, N'ACT', N'Australian Capital Territory', 1, CAST(N'2016-09-13T00:00:00.000' AS DateTime), 1, CAST(N'2016-09-13T00:00:00.000' AS DateTime))
INSERT [dbo].[refState] ([StateId], [StateCode], [Description], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (3, N'Vic', N'Victoria', 1, CAST(N'2016-09-13T00:00:00.000' AS DateTime), 1, CAST(N'2016-09-13T00:00:00.000' AS DateTime))
INSERT [dbo].[refState] ([StateId], [StateCode], [Description], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (4, N'Qld', N'Queensland', 1, CAST(N'2016-09-13T00:00:00.000' AS DateTime), 1, CAST(N'2016-09-13T00:00:00.000' AS DateTime))
INSERT [dbo].[refState] ([StateId], [StateCode], [Description], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (5, N'SA', N'South Australia', 1, CAST(N'2016-09-13T00:00:00.000' AS DateTime), 1, CAST(N'2016-09-13T00:00:00.000' AS DateTime))
INSERT [dbo].[refState] ([StateId], [StateCode], [Description], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (6, N'NT', N'Northern Territory', 1, CAST(N'2016-09-13T00:00:00.000' AS DateTime), 1, CAST(N'2016-09-13T00:00:00.000' AS DateTime))
INSERT [dbo].[refState] ([StateId], [StateCode], [Description], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (7, N'WA', N'Western Australia', 1, CAST(N'2016-09-13T00:00:00.000' AS DateTime), 1, CAST(N'2016-09-13T00:00:00.000' AS DateTime))
INSERT [dbo].[refState] ([StateId], [StateCode], [Description], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (8, N'Tas', N'Tasmania', 1, CAST(N'2016-09-13T00:00:00.000' AS DateTime), 1, CAST(N'2016-09-13T00:00:00.000' AS DateTime))


SET IDENTITY_INSERT [dbo].[refState] OFF
