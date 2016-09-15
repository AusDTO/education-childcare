CREATE TABLE [dbo].[refStatus] (
    [StatusId]     INT           IDENTITY (1, 1) NOT NULL,
    [StatusCode]   VARCHAR (100) NOT NULL,
    [Description]  VARCHAR (150) NOT NULL,
    [TrTimestamp]  ROWVERSION    NOT NULL,
    [CreateUserId] INT           NOT NULL,
    [CreateDate]   DATETIME      CONSTRAINT [DF_refStatus_CreateDate] DEFAULT (getdate()) NOT NULL,
    [UpdateUserId] INT           NOT NULL,
    [UpdateDate]   DATETIME      CONSTRAINT [DF_refStatus_UpdateDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_refStatus] PRIMARY KEY CLUSTERED ([StatusId] ASC) WITH (FILLFACTOR = 80)
);

