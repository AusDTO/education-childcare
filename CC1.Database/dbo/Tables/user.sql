CREATE TABLE [dbo].[user] (
    [UserId]        INT           IDENTITY (1, 1) NOT NULL,
    [FirstName]     VARCHAR (50)  NOT NULL,
    [Surname]       VARCHAR (50)  NOT NULL,
    [TRTimestamp]   ROWVERSION    NOT NULL,
    [EmailAddress]  VARCHAR (100) NULL,
    [StatusCd]      CHAR (1)      NOT NULL,
    [LogonId]       VARCHAR (100) NULL,
    [Password]      VARCHAR (255) NULL,
    [Comments]      VARCHAR (200) NULL,
    [Title]         VARCHAR (30)  NULL,
    [SecondName]    VARCHAR (40)  NULL,
    [OtherNames]    VARCHAR (40)  NULL,
    [BirthDate]     DATETIME      NULL,
    [AddressLine1]  VARCHAR (50)  NULL,
    [AddressLine2]  VARCHAR (50)  NULL,
    [AddressLine3]  VARCHAR (50)  NULL,
    [Locality]      VARCHAR (50)  NULL,
    [StateId]       INT           NULL,
    [Postcode]      VARCHAR (12)  NULL,
    [CountryCode]   VARCHAR (3)   NULL,
    [PhonePrefix]   VARCHAR (4)   NULL,
    [PhoneNumber]   VARCHAR (15)  NULL,
    [MobileNumber]  VARCHAR (15)  NULL,
    [ValidFromDate] DATETIME      NULL,
    [ValidToDate]   DATETIME      NULL,
    [CreateUserId]  INT           NOT NULL,
    [CreateDate]    DATETIME      NOT NULL,
    [UpdateUserId]  INT           NOT NULL,
    [UpdateDate]    DATETIME      NOT NULL,
    CONSTRAINT [PK_secUser] PRIMARY KEY CLUSTERED ([UserId] ASC) WITH (FILLFACTOR = 80),
    CONSTRAINT [FK_user_refState] FOREIGN KEY ([StateId]) REFERENCES [dbo].[refState] ([StateId]),
    CONSTRAINT [uniqueFirstNameSurnameEmailAddress] UNIQUE NONCLUSTERED ([FirstName] ASC, [Surname] ASC, [EmailAddress] ASC) WITH (FILLFACTOR = 80)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Contains Guardians and Provider Users', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'user';

