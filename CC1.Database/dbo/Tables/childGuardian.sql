CREATE TABLE [dbo].[childGuardian] (
    [ChildGuardianId] INT           IDENTITY (1, 1) NOT NULL,
    [GuardianId]      INT           NOT NULL,
    [ChildId]         INT           NOT NULL,
    [Relationship]    VARCHAR (100) NULL,
    [CreatedUserId]   INT           NULL,
    [CreatedDate]     DATETIME      NULL,
    [UpdateUserId]    INT           NULL,
    [UpdateDate]      DATETIME      NULL,
    [TRTimestamp]     ROWVERSION    NOT NULL,
    CONSTRAINT [PK_ccChildGuardian] PRIMARY KEY CLUSTERED ([ChildGuardianId] ASC),
    CONSTRAINT [FK_childGuardian_ccChild] FOREIGN KEY ([ChildId]) REFERENCES [dbo].[ccChild] ([ChildId]),
    CONSTRAINT [FK_childGuardian_user] FOREIGN KEY ([GuardianId]) REFERENCES [dbo].[user] ([UserId]),
    CONSTRAINT [FK_childGuardian_user1] FOREIGN KEY ([UpdateUserId]) REFERENCES [dbo].[user] ([UserId]),
    CONSTRAINT [FK_childGuardian_user2] FOREIGN KEY ([UpdateUserId]) REFERENCES [dbo].[user] ([UserId])
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Child Guardian', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'childGuardian';

