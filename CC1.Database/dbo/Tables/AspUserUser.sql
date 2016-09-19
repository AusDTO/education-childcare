CREATE TABLE [dbo].[AspUserUser] (
    [AspUserUserId] INT           IDENTITY (1, 1) NOT NULL,
    [UserId]        INT           NULL,
    [AspUserId]     VARCHAR (128) NULL,
    [TrTimestamp]   ROWVERSION    NOT NULL,
    [CreateUserId]  INT           NOT NULL,
    [CreateDate]    DATETIME      NOT NULL,
    [UpdateUserId]  INT           NOT NULL,
    [UpdateDate]    DATETIME      NOT NULL,
    CONSTRAINT [PK_AspUserUser] PRIMARY KEY CLUSTERED ([AspUserUserId] ASC),
    CONSTRAINT [FK_AspUserUser_user] FOREIGN KEY ([UserId]) REFERENCES [dbo].[user] ([UserId])
);

