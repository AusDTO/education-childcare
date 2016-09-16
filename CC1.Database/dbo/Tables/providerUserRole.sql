CREATE TABLE [dbo].[providerUserRole] (
    [ProviderUserRoleId] INT        IDENTITY (1, 1) NOT NULL,
    [RoleId]             INT        NOT NULL,
    [ProviderUserId]     INT        NOT NULL,
    [TrTimestamp]        ROWVERSION NOT NULL,
    [CreateUserId]       INT        NOT NULL,
    [CreateDate]         DATETIME   NOT NULL,
    [UpdateUserId]       INT        NOT NULL,
    [UpdateDate]         DATETIME   NOT NULL,
    CONSTRAINT [PK_ProviderUserRole] PRIMARY KEY CLUSTERED ([ProviderUserRoleId] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_providerUserRole_user] FOREIGN KEY ([CreateUserId]) REFERENCES [dbo].[user] ([UserId]),
    CONSTRAINT [FK_providerUserRole_user_UpdateUserId] FOREIGN KEY ([UpdateUserId]) REFERENCES [dbo].[user] ([UserId]),
    CONSTRAINT [FK_providerUserRoles_providerUser] FOREIGN KEY ([ProviderUserId]) REFERENCES [dbo].[providerUser] ([ProviderUserId]),
    CONSTRAINT [FK_providerUserRoles_role] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[refRole] ([RoleId])
);

