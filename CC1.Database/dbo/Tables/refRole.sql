CREATE TABLE [dbo].[refRole] (
    [RoleId]       INT           IDENTITY (1, 1) NOT NULL,
    [Name]         VARCHAR (100) NOT NULL,
    [Description]  VARCHAR (150) NOT NULL,
    [TrTimestamp]  ROWVERSION    NOT NULL,
    [CreateUserId] INT           NOT NULL,
    [CreateDate]   DATETIME      CONSTRAINT [DF_secRole_CreateDate] DEFAULT (getdate()) NOT NULL,
    [UpdateUserId] INT           NOT NULL,
    [UpdateDate]   DATETIME      CONSTRAINT [DF_secRole_UpdateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_secRole] PRIMARY KEY CLUSTERED ([RoleId] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_refRole_user_CreateUserId] FOREIGN KEY ([CreateUserId]) REFERENCES [dbo].[user] ([UserId]),
    CONSTRAINT [FK_refRole_user_UpdateUserId] FOREIGN KEY ([UpdateUserId]) REFERENCES [dbo].[user] ([UserId])
);

