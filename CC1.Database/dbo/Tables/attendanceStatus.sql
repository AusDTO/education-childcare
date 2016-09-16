CREATE TABLE [dbo].[attendanceStatus] (
    [AttendanceStatusId] INT        IDENTITY (1, 1) NOT NULL,
    [StatusId]           INT        NOT NULL,
    [AttendanceId]       INT        NOT NULL,
    [CreatedUserId]      INT        NOT NULL,
    [CreatedDate]        DATETIME   NOT NULL,
    [UpdateUserId]       INT        NOT NULL,
    [UpdateDate]         DATETIME   NOT NULL,
    [TRTimestamp]        ROWVERSION NOT NULL,
    CONSTRAINT [PK_attendanceStatus] PRIMARY KEY CLUSTERED ([AttendanceStatusId] ASC),
    CONSTRAINT [FK_attendanceStatus_attendance] FOREIGN KEY ([AttendanceId]) REFERENCES [dbo].[attendance] ([AttendanceId]),
    CONSTRAINT [FK_attendanceStatus_refStatus] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[refStatus] ([StatusId]),
    CONSTRAINT [FK_attendanceStatus_user_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [dbo].[user] ([UserId]),
    CONSTRAINT [FK_attendanceStatus_user_UpdateUserId] FOREIGN KEY ([UpdateUserId]) REFERENCES [dbo].[user] ([UserId])
);

