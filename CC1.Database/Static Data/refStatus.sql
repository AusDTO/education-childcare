USE [CCAttendance]
GO
SET IDENTITY_INSERT [dbo].[refStatus] ON 

INSERT [dbo].[refStatus] ([StatusId], [StatusCode], [Description], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (2, N'A', N'Active', 1, CAST(N'2016-09-05T00:00:00.000' AS DateTime), 1, CAST(N'2016-09-05T00:00:00.000' AS DateTime))
INSERT [dbo].[refStatus] ([StatusId], [StatusCode], [Description], [CreateUserId], [CreateDate], [UpdateUserId], [UpdateDate]) VALUES (3, N'S', N'Suspended', 1, CAST(N'2016-09-05T00:00:00.000' AS DateTime), 1, CAST(N'2016-09-05T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[refStatus] OFF
