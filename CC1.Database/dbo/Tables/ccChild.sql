CREATE TABLE [dbo].[ccChild] (
    [ChildId]           INT           IDENTITY (1, 1) NOT NULL,
    [PrimaryGuardianId] INT           NOT NULL,
    [FirstName]         VARCHAR (300) NULL,
    [Surname]           VARCHAR (300) NULL,
    [OtherNames]        VARCHAR (40)  NULL,
    [BirthDate]         DATETIME      NULL,
    [Comment]           VARCHAR (100) NULL,
    [CreatedUserId]     INT           NULL,
    [CreatedDate]       DATETIME      NULL,
    [UpdateUserId]      INT           NULL,
    [UpdateDate]        DATETIME      NULL,
    [TRTimestamp]       ROWVERSION    NULL,
    CONSTRAINT [PK_ccChild] PRIMARY KEY CLUSTERED ([ChildId] ASC),
    CONSTRAINT [FK_ccChild_user] FOREIGN KEY ([PrimaryGuardianId]) REFERENCES [dbo].[user] ([UserId]),
    CONSTRAINT [FK_ccChild_user1] FOREIGN KEY ([CreatedUserId]) REFERENCES [dbo].[user] ([UserId]),
    CONSTRAINT [FK_ccChild_user2] FOREIGN KEY ([UpdateUserId]) REFERENCES [dbo].[user] ([UserId])
);

