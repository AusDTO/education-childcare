﻿CREATE TABLE [dbo].[provider] (
    [ProviderId]           INT           IDENTITY (1, 1) NOT NULL,
    [Name]                 VARCHAR (100) NOT NULL,
    [Description]          VARCHAR (150) NOT NULL,
    [PrimaryContactUserId] INT           NULL,
    [HeadProviderId]       INT           NULL,
    [IsHub]                BIT           CONSTRAINT [DF_provider_isHub] DEFAULT ((0)) NOT NULL,
    [UpdateUserId]         INT           NOT NULL,
    [UpdateDate]           DATETIME      NOT NULL,
    [TRTimestamp]          ROWVERSION    NOT NULL,
    [AddressLine1]         VARCHAR (100) NULL,
    [AddressLine2]         VARCHAR (100) NULL,
    [Locality]             VARCHAR (100) NULL,
    [StateId]              INT           NULL,
    [Postcode]             VARCHAR (12)  NULL,
    [CountryCode]          VARCHAR (3)   NULL,
    [PhonePrefix]          VARCHAR (4)   NULL,
    [PhoneNumber]          VARCHAR (15)  NULL,
    [CreatedUserId]        INT           NOT NULL,
    [CreatedDate]          DATETIME      NOT NULL,
    CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED ([ProviderId] ASC),
    CONSTRAINT [FK_provider_provider] FOREIGN KEY ([HeadProviderId]) REFERENCES [dbo].[provider] ([ProviderId]),
    CONSTRAINT [FK_provider_refState] FOREIGN KEY ([StateId]) REFERENCES [dbo].[refState] ([StateId]),
    CONSTRAINT [FK_provider_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [dbo].[user] ([UserId]),
    CONSTRAINT [FK_provider_user_PrimaryContactUserId] FOREIGN KEY ([PrimaryContactUserId]) REFERENCES [dbo].[user] ([UserId]),
    CONSTRAINT [FK_provider_user_UpdateUserId] FOREIGN KEY ([UpdateUserId]) REFERENCES [dbo].[user] ([UserId])
);

