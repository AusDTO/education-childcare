CREATE TABLE [dbo].[providerUser] (
    [ProviderUserId] INT        IDENTITY (1, 1) NOT NULL,
    [ProviderId]     INT        NULL,
    [UserId]         INT        NULL,
    [TrTimestamp]    ROWVERSION NOT NULL,
    [CreateUserId]   INT        NOT NULL,
    [CreateDate]     DATETIME   NOT NULL,
    [UpdateUserId]   INT        NOT NULL,
    [UpdateDate]     DATETIME   NOT NULL,
    CONSTRAINT [PK_providerUser] PRIMARY KEY CLUSTERED ([ProviderUserId] ASC),
    CONSTRAINT [FK_providerUser_provider] FOREIGN KEY ([ProviderId]) REFERENCES [dbo].[provider] ([ProviderId]),
    CONSTRAINT [FK_providerUser_user] FOREIGN KEY ([UserId]) REFERENCES [dbo].[user] ([UserId]),
    CONSTRAINT [FK_providerUser_user_CreateUserId] FOREIGN KEY ([CreateUserId]) REFERENCES [dbo].[user] ([UserId]),
    CONSTRAINT [FK_providerUser_user_UpdateUserId] FOREIGN KEY ([UpdateUserId]) REFERENCES [dbo].[user] ([UserId]),
    CONSTRAINT [FK_providerUser_user_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[user] ([UserId])
);

