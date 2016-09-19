CREATE TABLE [dbo].[attendanceExpected] (
    [AttendanceExpectedId] INT           IDENTITY (1, 1) NOT NULL,
    [ProviderId]           INT           NOT NULL,
    [GuardianId]           INT           NOT NULL,
    [ChildId]              INT           NOT NULL,
    [Monday]               BIT           NULL,
    [Tuesday]              BIT           NULL,
    [Wednesday]            BIT           NULL,
    [Thursday]             BIT           NULL,
    [Friday]               BIT           NULL,
    [Saturday]             BIT           NULL,
    [Sunday]               BIT           NULL,
    [Room]                 VARCHAR (100) NULL,
    [EffectiveDate]        DATETIME      NULL,
    [EndDate]              DATETIME      NULL,
    [CreatedUserId]        INT           NOT NULL,
    [CreatedDate]          DATETIME      NOT NULL,
    [UpdateUserId]         INT           NOT NULL,
    [UpdateDate]           DATETIME      NOT NULL,
    [TRTimestamp]          ROWVERSION    NOT NULL,
    CONSTRAINT [PK_attendanceExpected] PRIMARY KEY CLUSTERED ([AttendanceExpectedId] ASC),
    CONSTRAINT [FK_attendanceExpected_ccChild] FOREIGN KEY ([ChildId]) REFERENCES [dbo].[ccChild] ([ChildId]),
    CONSTRAINT [FK_attendanceExpected_provider] FOREIGN KEY ([ProviderId]) REFERENCES [dbo].[provider] ([ProviderId]),
    CONSTRAINT [FK_attendanceExpected_user_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [dbo].[user] ([UserId]),
    CONSTRAINT [FK_attendanceExpected_user_GuardianUserId] FOREIGN KEY ([GuardianId]) REFERENCES [dbo].[user] ([UserId]),
    CONSTRAINT [FK_attendanceExpected_user_UpdateUserId] FOREIGN KEY ([UpdateUserId]) REFERENCES [dbo].[user] ([UserId])
);



