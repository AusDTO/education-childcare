CREATE TABLE [dbo].[refState] (
    [StateId]      INT           IDENTITY (1, 1) NOT NULL,
    [StateCode]    VARCHAR (100) NOT NULL,
    [Description]  VARCHAR (150) NOT NULL,
    [TrTimestamp]  ROWVERSION    NOT NULL,
    [CreateUserId] INT           NOT NULL,
    [CreateDate]   DATETIME      CONSTRAINT [DF_refState_CreateDate] DEFAULT (getdate()) NOT NULL,
    [UpdateUserId] INT           NOT NULL,
    [UpdateDate]   DATETIME      CONSTRAINT [DF_refState_UpdateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_refState] PRIMARY KEY CLUSTERED ([StateId] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_refState_user] FOREIGN KEY ([CreateUserId]) REFERENCES [dbo].[user] ([UserId]),
    CONSTRAINT [FK_refState_user1] FOREIGN KEY ([UpdateUserId]) REFERENCES [dbo].[user] ([UserId])
);

