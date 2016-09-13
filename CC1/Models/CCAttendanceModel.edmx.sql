
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/12/2016 16:42:07
-- Generated from EDMX file: C:\data\Web\CC1\CC1\Models\CCAttendanceModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [CCAttendance];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_attendance_ccChild]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[attendance] DROP CONSTRAINT [FK_attendance_ccChild];
GO
IF OBJECT_ID(N'[dbo].[FK_attendance_provider]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[attendance] DROP CONSTRAINT [FK_attendance_provider];
GO
IF OBJECT_ID(N'[dbo].[FK_attendance_user]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[attendance] DROP CONSTRAINT [FK_attendance_user];
GO
IF OBJECT_ID(N'[dbo].[FK_attendanceExpected_ccChild]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[attendanceExpected] DROP CONSTRAINT [FK_attendanceExpected_ccChild];
GO
IF OBJECT_ID(N'[dbo].[FK_attendanceExpected_provider]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[attendanceExpected] DROP CONSTRAINT [FK_attendanceExpected_provider];
GO
IF OBJECT_ID(N'[dbo].[FK_attendanceExpected_user]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[attendanceExpected] DROP CONSTRAINT [FK_attendanceExpected_user];
GO
IF OBJECT_ID(N'[dbo].[FK_attendanceStatus_attendance]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[attendanceStatus] DROP CONSTRAINT [FK_attendanceStatus_attendance];
GO
IF OBJECT_ID(N'[dbo].[FK_attendanceStatus_refStatus]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[attendanceStatus] DROP CONSTRAINT [FK_attendanceStatus_refStatus];
GO
IF OBJECT_ID(N'[dbo].[FK_ccChild_user]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ccChild] DROP CONSTRAINT [FK_ccChild_user];
GO
IF OBJECT_ID(N'[dbo].[FK_childGuardian_ccChild]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[childGuardian] DROP CONSTRAINT [FK_childGuardian_ccChild];
GO
IF OBJECT_ID(N'[dbo].[FK_childGuardian_user]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[childGuardian] DROP CONSTRAINT [FK_childGuardian_user];
GO
IF OBJECT_ID(N'[dbo].[FK_provider_provider]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[provider] DROP CONSTRAINT [FK_provider_provider];
GO
IF OBJECT_ID(N'[dbo].[FK_provider_user]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[provider] DROP CONSTRAINT [FK_provider_user];
GO
IF OBJECT_ID(N'[dbo].[FK_providerUser_provider]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[providerUser] DROP CONSTRAINT [FK_providerUser_provider];
GO
IF OBJECT_ID(N'[dbo].[FK_providerUser_user]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[providerUser] DROP CONSTRAINT [FK_providerUser_user];
GO
IF OBJECT_ID(N'[dbo].[FK_providerUser_user1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[providerUser] DROP CONSTRAINT [FK_providerUser_user1];
GO
IF OBJECT_ID(N'[dbo].[FK_providerUserRoles_providerUser]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[providerUserRole] DROP CONSTRAINT [FK_providerUserRoles_providerUser];
GO
IF OBJECT_ID(N'[dbo].[FK_providerUserRoles_role]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[providerUserRole] DROP CONSTRAINT [FK_providerUserRoles_role];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[attendance]', 'U') IS NOT NULL
    DROP TABLE [dbo].[attendance];
GO
IF OBJECT_ID(N'[dbo].[attendanceExpected]', 'U') IS NOT NULL
    DROP TABLE [dbo].[attendanceExpected];
GO
IF OBJECT_ID(N'[dbo].[attendanceStatus]', 'U') IS NOT NULL
    DROP TABLE [dbo].[attendanceStatus];
GO
IF OBJECT_ID(N'[dbo].[ccChild]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ccChild];
GO
IF OBJECT_ID(N'[dbo].[childGuardian]', 'U') IS NOT NULL
    DROP TABLE [dbo].[childGuardian];
GO
IF OBJECT_ID(N'[dbo].[provider]', 'U') IS NOT NULL
    DROP TABLE [dbo].[provider];
GO
IF OBJECT_ID(N'[dbo].[providerUser]', 'U') IS NOT NULL
    DROP TABLE [dbo].[providerUser];
GO
IF OBJECT_ID(N'[dbo].[providerUserRole]', 'U') IS NOT NULL
    DROP TABLE [dbo].[providerUserRole];
GO
IF OBJECT_ID(N'[dbo].[refRole]', 'U') IS NOT NULL
    DROP TABLE [dbo].[refRole];
GO
IF OBJECT_ID(N'[dbo].[refStatus]', 'U') IS NOT NULL
    DROP TABLE [dbo].[refStatus];
GO
IF OBJECT_ID(N'[dbo].[sysdiagrams]', 'U') IS NOT NULL
    DROP TABLE [dbo].[sysdiagrams];
GO
IF OBJECT_ID(N'[dbo].[user]', 'U') IS NOT NULL
    DROP TABLE [dbo].[user];
GO
IF OBJECT_ID(N'[CCAttendanceModelStoreContainer].[attendanceA]', 'U') IS NOT NULL
    DROP TABLE [CCAttendanceModelStoreContainer].[attendanceA];
GO
IF OBJECT_ID(N'[CCAttendanceModelStoreContainer].[vwAttendance]', 'U') IS NOT NULL
    DROP TABLE [CCAttendanceModelStoreContainer].[vwAttendance];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'attendances'
CREATE TABLE [dbo].[attendances] (
    [AttendanceId] int IDENTITY(1,1) NOT NULL,
    [ProviderId] int  NOT NULL,
    [ChildId] int  NOT NULL,
    [SignInTime] datetime  NULL,
    [SignInUserId] int  NULL,
    [SignOutTime] datetime  NULL,
    [SignOutUserId] int  NULL,
    [Comment] varchar(300)  NULL,
    [IsLocked] bit  NOT NULL,
    [CreatedUserId] int  NOT NULL,
    [CreatedDate] datetime  NOT NULL,
    [UpdateUserId] int  NOT NULL,
    [UpdateDate] datetime  NOT NULL,
    [TRTimestamp] binary(8)  NOT NULL,
    [UserStatusId] int  NULL,
    [Absent] bit  NULL
);
GO

-- Creating table 'ccChilds'
CREATE TABLE [dbo].[ccChilds] (
    [ChildId] int IDENTITY(1,1) NOT NULL,
    [PrimaryGuardianId] int  NOT NULL,
    [FirstName] varchar(300)  NULL,
    [Surname] varchar(300)  NULL,
    [OtherNames] varchar(40)  NULL,
    [BirthDate] datetime  NULL,
    [CreatedUserId] int  NULL,
    [CreatedDate] datetime  NULL,
    [UpdateUserId] int  NULL,
    [UpdateDate] datetime  NULL,
    [TRTimestamp] binary(8)  NULL,
    [Comment] varchar(100)  NULL
);
GO

-- Creating table 'providers'
CREATE TABLE [dbo].[providers] (
    [ProviderId] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(100)  NOT NULL,
    [Description] varchar(150)  NOT NULL,
    [PrimaryContactUserId] int  NULL,
    [HeadProviderId] int  NULL,
    [IsHub] bit  NOT NULL,
    [UpdateUserId] int  NOT NULL,
    [UpdateDate] datetime  NOT NULL,
    [TRTimestamp] binary(8)  NOT NULL,
    [AddressLine1] varchar(100)  NULL,
    [AddressLine2] varchar(100)  NULL,
    [Locality] varchar(100)  NULL,
    [StateCode] int  NULL,
    [Postcode] varchar(12)  NULL,
    [CountryCode] varchar(3)  NULL,
    [PhonePrefix] varchar(4)  NULL,
    [PhoneNumber] varchar(15)  NULL,
    [CreatedUserId] int  NOT NULL,
    [CreatedDate] datetime  NOT NULL
);
GO

-- Creating table 'providerUsers'
CREATE TABLE [dbo].[providerUsers] (
    [ProviderUserId] int IDENTITY(1,1) NOT NULL,
    [ProviderId] int  NULL,
    [UserId] int  NULL,
    [TrTimestamp] binary(8)  NOT NULL,
    [CreateUserId] int  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [UpdateUserId] int  NOT NULL,
    [UpdateDate] datetime  NOT NULL
);
GO

-- Creating table 'providerUserRoles'
CREATE TABLE [dbo].[providerUserRoles] (
    [ProviderUserRoleId] int IDENTITY(1,1) NOT NULL,
    [RoleId] int  NOT NULL,
    [UserId] int  NOT NULL,
    [ProviderId] int  NULL,
    [TrTimestamp] binary(8)  NOT NULL,
    [CreateUserId] int  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [UpdateUserId] int  NOT NULL,
    [UpdateDate] datetime  NOT NULL,
    [ProviderUserId] int  NOT NULL
);
GO

-- Creating table 'refRoles'
CREATE TABLE [dbo].[refRoles] (
    [RoleId] int IDENTITY(1,1) NOT NULL,
    [Name] varchar(100)  NOT NULL,
    [Description] varchar(150)  NOT NULL,
    [TrTimestamp] binary(8)  NOT NULL,
    [CreateUserId] int  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [UpdateUserId] int  NOT NULL,
    [UpdateDate] datetime  NOT NULL
);
GO

-- Creating table 'refStatus'
CREATE TABLE [dbo].[refStatus] (
    [StatusId] int IDENTITY(1,1) NOT NULL,
    [StatusCode] varchar(100)  NOT NULL,
    [Description] varchar(150)  NOT NULL,
    [TrTimestamp] binary(8)  NOT NULL,
    [CreateUserId] int  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [UpdateUserId] int  NOT NULL,
    [UpdateDate] datetime  NOT NULL
);
GO

-- Creating table 'sysdiagrams'
CREATE TABLE [dbo].[sysdiagrams] (
    [name] nvarchar(128)  NOT NULL,
    [principal_id] int  NOT NULL,
    [diagram_id] int IDENTITY(1,1) NOT NULL,
    [version] int  NULL,
    [definition] varbinary(max)  NULL
);
GO

-- Creating table 'users'
CREATE TABLE [dbo].[users] (
    [UserId] int IDENTITY(1,1) NOT NULL,
    [FirstName] varchar(50)  NOT NULL,
    [Surname] varchar(50)  NOT NULL,
    [TRTimestamp] binary(8)  NOT NULL,
    [EmailAddress] varchar(100)  NULL,
    [StatusCd] char(1)  NOT NULL,
    [LogonId] varchar(100)  NULL,
    [Password] varchar(255)  NULL,
    [Comments] varchar(200)  NULL,
    [CreateUserId] int  NOT NULL,
    [CreateDate] datetime  NOT NULL,
    [UpdateUserId] int  NOT NULL,
    [UpdateDate] datetime  NOT NULL,
    [Title] varchar(30)  NULL,
    [SecondName] varchar(40)  NULL,
    [OtherNames] varchar(40)  NULL,
    [BirthDate] datetime  NULL,
    [AddressLine1] varchar(50)  NULL,
    [AddressLine2] varchar(50)  NULL,
    [AddressLine3] varchar(50)  NULL,
    [Locality] varchar(50)  NULL,
    [Postcode] varchar(12)  NULL,
    [CountryCode] varchar(3)  NULL,
    [PhonePrefix] varchar(4)  NULL,
    [PhoneNumber] varchar(15)  NULL,
    [MobileNumber] varchar(15)  NULL,
    [ValidFromDate] datetime  NULL,
    [ValidToDate] datetime  NULL
);
GO

-- Creating table 'attendanceAs'
CREATE TABLE [dbo].[attendanceAs] (
    [AttendanceId] int  NOT NULL,
    [ProviderId] int  NOT NULL,
    [ChildId] int  NOT NULL,
    [SignInTime] datetime  NULL,
    [SignInUserId] int  NULL,
    [SignOutTime] datetime  NULL,
    [SignOutUserId] int  NULL,
    [Comment] varchar(300)  NULL,
    [IsLocked] bit  NOT NULL,
    [CreatedUserId] int  NOT NULL,
    [CreatedDate] datetime  NOT NULL,
    [UpdateUserId] int  NOT NULL,
    [UpdateDate] datetime  NOT NULL,
    [AuditDate] datetime  NOT NULL,
    [TRTimestamp] binary(8)  NOT NULL,
    [UserStatusId] int  NOT NULL,
    [Absent] bit  NULL
);
GO

-- Creating table 'attendanceStatus'
CREATE TABLE [dbo].[attendanceStatus] (
    [AttendanceStatusId] int IDENTITY(1,1) NOT NULL,
    [StatusId] int  NOT NULL,
    [AttendanceId] int  NOT NULL,
    [CreatedUserId] int  NOT NULL,
    [CreatedDate] datetime  NOT NULL,
    [UpdateUserId] int  NOT NULL,
    [UpdateDate] datetime  NOT NULL,
    [TRTimestamp] binary(8)  NOT NULL
);
GO

-- Creating table 'attendanceExpecteds'
CREATE TABLE [dbo].[attendanceExpecteds] (
    [AttendanceExpectedId] int IDENTITY(1,1) NOT NULL,
    [ProviderId] int  NOT NULL,
    [GuardianId] int  NOT NULL,
    [ChildId] int  NOT NULL,
    [Monday] bit  NULL,
    [Tuesday] bit  NULL,
    [Wednesday] bit  NULL,
    [Friday] bit  NULL,
    [Saturday] bit  NULL,
    [Sunday] bit  NULL,
    [EffectiveDate] datetime  NULL,
    [EndDate] datetime  NULL,
    [CreatedUserId] int  NOT NULL,
    [CreatedDate] datetime  NOT NULL,
    [UpdateUserId] int  NOT NULL,
    [UpdateDate] datetime  NOT NULL,
    [TRTimestamp] binary(8)  NOT NULL
);
GO

-- Creating table 'childGuardians'
CREATE TABLE [dbo].[childGuardians] (
    [ChildGuardianId] int IDENTITY(1,1) NOT NULL,
    [GuardianId] int  NOT NULL,
    [ChildId] int  NOT NULL,
    [Relationship] varchar(100)  NULL,
    [CreatedUserId] int  NULL,
    [CreatedDate] datetime  NULL,
    [UpdateUserId] int  NULL,
    [UpdateDate] datetime  NULL,
    [TRTimestamp] binary(8)  NOT NULL
);
GO

-- Creating table 'vwAttendances'
CREATE TABLE [dbo].[vwAttendances] (
    [AttendanceId] int  NOT NULL,
    [ProviderId] int  NOT NULL,
    [ChildId] int  NOT NULL,
    [SignInTime] datetime  NULL,
    [SignInUserId] int  NULL,
    [SignOutTime] datetime  NULL,
    [SignOutUserId] int  NULL,
    [Comment] varchar(300)  NULL,
    [IsLocked] bit  NOT NULL,
    [CreatedUserId] int  NOT NULL,
    [CreatedDate] datetime  NOT NULL,
    [UpdateUserId] int  NOT NULL,
    [UpdateDate] datetime  NOT NULL,
    [TRTimestamp] binary(8)  NOT NULL,
    [AttendanceStatusId] int  NOT NULL,
    [StatusId] int  NOT NULL,
    [Expr1] int  NOT NULL,
    [Expr2] int  NOT NULL,
    [Expr3] datetime  NOT NULL,
    [Expr4] int  NOT NULL,
    [Expr5] datetime  NOT NULL,
    [StatusCode] varchar(100)  NOT NULL,
    [Description] varchar(150)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [AttendanceId] in table 'attendances'
ALTER TABLE [dbo].[attendances]
ADD CONSTRAINT [PK_attendances]
    PRIMARY KEY CLUSTERED ([AttendanceId] ASC);
GO

-- Creating primary key on [ChildId] in table 'ccChilds'
ALTER TABLE [dbo].[ccChilds]
ADD CONSTRAINT [PK_ccChilds]
    PRIMARY KEY CLUSTERED ([ChildId] ASC);
GO

-- Creating primary key on [ProviderId] in table 'providers'
ALTER TABLE [dbo].[providers]
ADD CONSTRAINT [PK_providers]
    PRIMARY KEY CLUSTERED ([ProviderId] ASC);
GO

-- Creating primary key on [ProviderUserId] in table 'providerUsers'
ALTER TABLE [dbo].[providerUsers]
ADD CONSTRAINT [PK_providerUsers]
    PRIMARY KEY CLUSTERED ([ProviderUserId] ASC);
GO

-- Creating primary key on [ProviderUserRoleId] in table 'providerUserRoles'
ALTER TABLE [dbo].[providerUserRoles]
ADD CONSTRAINT [PK_providerUserRoles]
    PRIMARY KEY CLUSTERED ([ProviderUserRoleId] ASC);
GO

-- Creating primary key on [RoleId] in table 'refRoles'
ALTER TABLE [dbo].[refRoles]
ADD CONSTRAINT [PK_refRoles]
    PRIMARY KEY CLUSTERED ([RoleId] ASC);
GO

-- Creating primary key on [StatusId] in table 'refStatus'
ALTER TABLE [dbo].[refStatus]
ADD CONSTRAINT [PK_refStatus]
    PRIMARY KEY CLUSTERED ([StatusId] ASC);
GO

-- Creating primary key on [diagram_id] in table 'sysdiagrams'
ALTER TABLE [dbo].[sysdiagrams]
ADD CONSTRAINT [PK_sysdiagrams]
    PRIMARY KEY CLUSTERED ([diagram_id] ASC);
GO

-- Creating primary key on [UserId] in table 'users'
ALTER TABLE [dbo].[users]
ADD CONSTRAINT [PK_users]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [AttendanceId], [ProviderId], [ChildId], [IsLocked], [CreatedUserId], [CreatedDate], [UpdateUserId], [UpdateDate], [AuditDate], [TRTimestamp], [UserStatusId] in table 'attendanceAs'
ALTER TABLE [dbo].[attendanceAs]
ADD CONSTRAINT [PK_attendanceAs]
    PRIMARY KEY CLUSTERED ([AttendanceId], [ProviderId], [ChildId], [IsLocked], [CreatedUserId], [CreatedDate], [UpdateUserId], [UpdateDate], [AuditDate], [TRTimestamp], [UserStatusId] ASC);
GO

-- Creating primary key on [AttendanceStatusId] in table 'attendanceStatus'
ALTER TABLE [dbo].[attendanceStatus]
ADD CONSTRAINT [PK_attendanceStatus]
    PRIMARY KEY CLUSTERED ([AttendanceStatusId] ASC);
GO

-- Creating primary key on [AttendanceExpectedId] in table 'attendanceExpecteds'
ALTER TABLE [dbo].[attendanceExpecteds]
ADD CONSTRAINT [PK_attendanceExpecteds]
    PRIMARY KEY CLUSTERED ([AttendanceExpectedId] ASC);
GO

-- Creating primary key on [ChildGuardianId] in table 'childGuardians'
ALTER TABLE [dbo].[childGuardians]
ADD CONSTRAINT [PK_childGuardians]
    PRIMARY KEY CLUSTERED ([ChildGuardianId] ASC);
GO

-- Creating primary key on [AttendanceId], [ProviderId], [ChildId], [IsLocked], [CreatedUserId], [CreatedDate], [UpdateUserId], [UpdateDate], [TRTimestamp], [AttendanceStatusId], [StatusId], [Expr1], [Expr2], [Expr3], [Expr4], [Expr5], [StatusCode], [Description] in table 'vwAttendances'
ALTER TABLE [dbo].[vwAttendances]
ADD CONSTRAINT [PK_vwAttendances]
    PRIMARY KEY CLUSTERED ([AttendanceId], [ProviderId], [ChildId], [IsLocked], [CreatedUserId], [CreatedDate], [UpdateUserId], [UpdateDate], [TRTimestamp], [AttendanceStatusId], [StatusId], [Expr1], [Expr2], [Expr3], [Expr4], [Expr5], [StatusCode], [Description] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ChildId] in table 'attendances'
ALTER TABLE [dbo].[attendances]
ADD CONSTRAINT [FK_attendance_ccChild]
    FOREIGN KEY ([ChildId])
    REFERENCES [dbo].[ccChilds]
        ([ChildId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_attendance_ccChild'
CREATE INDEX [IX_FK_attendance_ccChild]
ON [dbo].[attendances]
    ([ChildId]);
GO

-- Creating foreign key on [ProviderId] in table 'attendances'
ALTER TABLE [dbo].[attendances]
ADD CONSTRAINT [FK_attendance_provider]
    FOREIGN KEY ([ProviderId])
    REFERENCES [dbo].[providers]
        ([ProviderId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_attendance_provider'
CREATE INDEX [IX_FK_attendance_provider]
ON [dbo].[attendances]
    ([ProviderId]);
GO

-- Creating foreign key on [CreatedUserId] in table 'attendances'
ALTER TABLE [dbo].[attendances]
ADD CONSTRAINT [FK_attendance_user]
    FOREIGN KEY ([CreatedUserId])
    REFERENCES [dbo].[users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_attendance_user'
CREATE INDEX [IX_FK_attendance_user]
ON [dbo].[attendances]
    ([CreatedUserId]);
GO

-- Creating foreign key on [PrimaryGuardianId] in table 'ccChilds'
ALTER TABLE [dbo].[ccChilds]
ADD CONSTRAINT [FK_ccChild_user]
    FOREIGN KEY ([PrimaryGuardianId])
    REFERENCES [dbo].[users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ccChild_user'
CREATE INDEX [IX_FK_ccChild_user]
ON [dbo].[ccChilds]
    ([PrimaryGuardianId]);
GO

-- Creating foreign key on [HeadProviderId] in table 'providers'
ALTER TABLE [dbo].[providers]
ADD CONSTRAINT [FK_provider_provider]
    FOREIGN KEY ([HeadProviderId])
    REFERENCES [dbo].[providers]
        ([ProviderId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_provider_provider'
CREATE INDEX [IX_FK_provider_provider]
ON [dbo].[providers]
    ([HeadProviderId]);
GO

-- Creating foreign key on [PrimaryContactUserId] in table 'providers'
ALTER TABLE [dbo].[providers]
ADD CONSTRAINT [FK_provider_user]
    FOREIGN KEY ([PrimaryContactUserId])
    REFERENCES [dbo].[users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_provider_user'
CREATE INDEX [IX_FK_provider_user]
ON [dbo].[providers]
    ([PrimaryContactUserId]);
GO

-- Creating foreign key on [ProviderId] in table 'providerUsers'
ALTER TABLE [dbo].[providerUsers]
ADD CONSTRAINT [FK_providerUser_provider]
    FOREIGN KEY ([ProviderId])
    REFERENCES [dbo].[providers]
        ([ProviderId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_providerUser_provider'
CREATE INDEX [IX_FK_providerUser_provider]
ON [dbo].[providerUsers]
    ([ProviderId]);
GO

-- Creating foreign key on [UserId] in table 'providerUsers'
ALTER TABLE [dbo].[providerUsers]
ADD CONSTRAINT [FK_providerUser_user]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_providerUser_user'
CREATE INDEX [IX_FK_providerUser_user]
ON [dbo].[providerUsers]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'providerUsers'
ALTER TABLE [dbo].[providerUsers]
ADD CONSTRAINT [FK_providerUser_user1]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_providerUser_user1'
CREATE INDEX [IX_FK_providerUser_user1]
ON [dbo].[providerUsers]
    ([UserId]);
GO

-- Creating foreign key on [RoleId] in table 'providerUserRoles'
ALTER TABLE [dbo].[providerUserRoles]
ADD CONSTRAINT [FK_providerUserRole_role]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[refRoles]
        ([RoleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_providerUserRole_role'
CREATE INDEX [IX_FK_providerUserRole_role]
ON [dbo].[providerUserRoles]
    ([RoleId]);
GO

-- Creating foreign key on [AttendanceId] in table 'attendanceStatus'
ALTER TABLE [dbo].[attendanceStatus]
ADD CONSTRAINT [FK_attendanceStatus_attendance]
    FOREIGN KEY ([AttendanceId])
    REFERENCES [dbo].[attendances]
        ([AttendanceId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_attendanceStatus_attendance'
CREATE INDEX [IX_FK_attendanceStatus_attendance]
ON [dbo].[attendanceStatus]
    ([AttendanceId]);
GO

-- Creating foreign key on [StatusId] in table 'attendanceStatus'
ALTER TABLE [dbo].[attendanceStatus]
ADD CONSTRAINT [FK_attendanceStatus_refStatus]
    FOREIGN KEY ([StatusId])
    REFERENCES [dbo].[refStatus]
        ([StatusId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_attendanceStatus_refStatus'
CREATE INDEX [IX_FK_attendanceStatus_refStatus]
ON [dbo].[attendanceStatus]
    ([StatusId]);
GO

-- Creating foreign key on [ChildId] in table 'attendanceExpecteds'
ALTER TABLE [dbo].[attendanceExpecteds]
ADD CONSTRAINT [FK_attendanceExpected_ccChild]
    FOREIGN KEY ([ChildId])
    REFERENCES [dbo].[ccChilds]
        ([ChildId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_attendanceExpected_ccChild'
CREATE INDEX [IX_FK_attendanceExpected_ccChild]
ON [dbo].[attendanceExpecteds]
    ([ChildId]);
GO

-- Creating foreign key on [ProviderId] in table 'attendanceExpecteds'
ALTER TABLE [dbo].[attendanceExpecteds]
ADD CONSTRAINT [FK_attendanceExpected_provider]
    FOREIGN KEY ([ProviderId])
    REFERENCES [dbo].[providers]
        ([ProviderId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_attendanceExpected_provider'
CREATE INDEX [IX_FK_attendanceExpected_provider]
ON [dbo].[attendanceExpecteds]
    ([ProviderId]);
GO

-- Creating foreign key on [GuardianId] in table 'attendanceExpecteds'
ALTER TABLE [dbo].[attendanceExpecteds]
ADD CONSTRAINT [FK_attendanceExpected_user]
    FOREIGN KEY ([GuardianId])
    REFERENCES [dbo].[users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_attendanceExpected_user'
CREATE INDEX [IX_FK_attendanceExpected_user]
ON [dbo].[attendanceExpecteds]
    ([GuardianId]);
GO

-- Creating foreign key on [ProviderUserId] in table 'providerUserRoles'
ALTER TABLE [dbo].[providerUserRoles]
ADD CONSTRAINT [FK_providerUserRoles_providerUser1]
    FOREIGN KEY ([ProviderUserId])
    REFERENCES [dbo].[providerUsers]
        ([ProviderUserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_providerUserRoles_providerUser1'
CREATE INDEX [IX_FK_providerUserRoles_providerUser1]
ON [dbo].[providerUserRoles]
    ([ProviderUserId]);
GO

-- Creating foreign key on [ChildId] in table 'childGuardians'
ALTER TABLE [dbo].[childGuardians]
ADD CONSTRAINT [FK_childGuardian_ccChild]
    FOREIGN KEY ([ChildId])
    REFERENCES [dbo].[ccChilds]
        ([ChildId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_childGuardian_ccChild'
CREATE INDEX [IX_FK_childGuardian_ccChild]
ON [dbo].[childGuardians]
    ([ChildId]);
GO

-- Creating foreign key on [GuardianId] in table 'childGuardians'
ALTER TABLE [dbo].[childGuardians]
ADD CONSTRAINT [FK_childGuardian_user]
    FOREIGN KEY ([GuardianId])
    REFERENCES [dbo].[users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_childGuardian_user'
CREATE INDEX [IX_FK_childGuardian_user]
ON [dbo].[childGuardians]
    ([GuardianId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------