CREATE TABLE [dbo].[attendanceA] (
    [AttendanceId]  INT           NOT NULL,
    [ProviderId]    INT           NOT NULL,
    [ChildId]       INT           NOT NULL,
    [SignInTime]    DATETIME      NULL,
    [SignInUserId]  INT           NULL,
    [SignOutTime]   DATETIME      NULL,
    [SignOutUserId] INT           NULL,
    [Comment]       VARCHAR (300) NULL,
    [IsLocked]      BIT           NULL,
    [UserStatusId]  INT           NOT NULL,
    [Absent]        BIT           NULL,
    [CreatedUserId] INT           NOT NULL,
    [CreatedDate]   DATETIME      NOT NULL,
    [UpdateUserId]  INT           NOT NULL,
    [UpdateDate]    DATETIME      NOT NULL,
    [AuditDate]     DATETIME      NOT NULL,
    [TRTimestamp]   ROWVERSION    NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Attendance Audit', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'attendanceA';

