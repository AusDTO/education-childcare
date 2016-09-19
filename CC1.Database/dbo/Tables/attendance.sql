CREATE TABLE [dbo].[attendance] (
    [AttendanceId]  INT           IDENTITY (1, 1) NOT NULL,
    [ProviderId]    INT           NOT NULL,
    [ChildId]       INT           NOT NULL,
    [SignInTime]    DATETIME      NULL,
    [SignInUserId]  INT           NULL,
    [SignOutTime]   DATETIME      NULL,
    [SignOutUserId] INT           NULL,
    [Comment]       VARCHAR (300) NULL,
    [IsLocked]      BIT           CONSTRAINT [DF_attendance_IsLocked] DEFAULT ((0)) NOT NULL,
    [UserStatusId]  INT           NULL,
    [Absent]        BIT           NULL,
    [CreatedUserId] INT           NOT NULL,
    [CreatedDate]   DATETIME      NOT NULL,
    [UpdateUserId]  INT           NOT NULL,
    [UpdateDate]    DATETIME      NOT NULL,
    [TRTimestamp]   ROWVERSION    NOT NULL,
    CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED ([AttendanceId] ASC),
    CONSTRAINT [FK_attendance_ccChild] FOREIGN KEY ([ChildId]) REFERENCES [dbo].[ccChild] ([ChildId]),
    CONSTRAINT [FK_attendance_provider] FOREIGN KEY ([ProviderId]) REFERENCES [dbo].[provider] ([ProviderId]),
    CONSTRAINT [FK_attendance_user] FOREIGN KEY ([CreatedUserId]) REFERENCES [dbo].[user] ([UserId]),
    CONSTRAINT [FK_attendance_user_UpdateUserId] FOREIGN KEY ([UpdateUserId]) REFERENCES [dbo].[user] ([UserId])
);




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Attendance', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'attendance';


GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[trAttendanceUpdate]
   ON  [dbo].[attendance]
   AFTER UPDATE
AS 
BEGIN
	insert into attendanceA
	(
	[AttendanceId]
	,[ProviderId] 
	,[ChildId]
	,[SignInTime]
	,[SignInUserId] 
	,[SignOutTime]
	,[SignOutUserId]
	,[Comment] 
	,[IsLocked]
	,[CreatedUserId]
	,[CreatedDate]
	,[UpdateUserId] 
	,[UpdateDate] 
	,[UserStatusId] 
	,[Absent]
	,[AuditDate]
	--,[TRTimestamp]
	
	)

	select
		[AttendanceId]
	,[ProviderId] 
	,[ChildId]
	,[SignInTime]
	,[SignInUserId] 
	,[SignOutTime]
	,[SignOutUserId]
	,[Comment] 
	,[IsLocked]
	,[CreatedUserId]
	,[CreatedDate]
	,[UpdateUserId] 
	,[UpdateDate] 
	,[UserStatusId] 
	,[Absent]
	,GETDATE()
	--,[TRTimestamp]

	from inserted

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here

END
GO
CREATE TRIGGER [dbo].[trAttendanceDelete]
   ON  [dbo].[attendance]
   AFTER  DELETE
AS 
BEGIN
	insert into attendanceA
	(
	[AttendanceId]
	,[ProviderId] 
	,[ChildId]
	,[SignInTime]
	,[SignInUserId] 
	,[SignOutTime]
	,[SignOutUserId]
	,[Comment] 
	,[IsLocked]
	,[CreatedUserId]
	,[CreatedDate]
	,[UpdateUserId] 
	,[UpdateDate] 
	,[UserStatusId] 
	,[Absent]
	,[AuditDate]
	--,[TRTimestamp]
	
	)

	select
		[AttendanceId]
	,[ProviderId] 
	,[ChildId]
	,[SignInTime]
	,[SignInUserId] 
	,[SignOutTime]
	,[SignOutUserId]
	,[Comment] 
	,[IsLocked]
	,[CreatedUserId]
	,[CreatedDate]
	,[UpdateUserId] 
	,[UpdateDate] 
	,[UserStatusId] 
	,[Absent]
	,GETDATE() -- set audit date to current date
	--,[TRTimestamp]

	from deleted

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here

END