USE [CCAttendance]
GO
SET IDENTITY_INSERT [dbo].[refRole] ON 

INSERT [dbo].[refRole] ([RoleId], [Name], [Description], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (1, N'SysAdmin', N'System Admin', 1, CAST(N'2016-09-06T00:00:00.000' AS DateTime), 1, CAST(N'2016-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[refRole] ([RoleId], [Name], [Description], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (2, N'Provider', N'Provider', 1, CAST(N'2016-09-06T00:00:00.000' AS DateTime), 1, CAST(N'2016-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[refRole] ([RoleId], [Name], [Description], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (3, N'Guardian', N'Provider', 1, CAST(N'2016-09-06T00:00:00.000' AS DateTime), 1, CAST(N'2016-09-06T00:00:00.000' AS DateTime))
INSERT [dbo].[refRole] ([RoleId], [Name], [Description], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (4, N'HubProvider', N'Hub Provider', 1, CAST(N'2016-09-06T00:00:00.000' AS DateTime), 1, CAST(N'2016-09-06T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[refRole] OFF
