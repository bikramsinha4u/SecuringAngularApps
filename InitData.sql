SET NOCOUNT ON
GO

USE master
GO
if exists (select * from sysdatabases where name='securingangularappscourseapi')
		drop database securingangularappscourseapi
go

DECLARE @device_directory NVARCHAR(520)
SELECT @device_directory = SUBSTRING(filename, 1, CHARINDEX(N'master.mdf', LOWER(filename)) - 1)
FROM master.dbo.sysaltfiles WHERE dbid = 1 AND fileid = 1

EXECUTE (N'CREATE DATABASE securingangularappscourseapi
  ON PRIMARY (NAME = N''securingangularappscourseapi'', FILENAME = N''' + @device_directory + N'securingangularappscourseapi.mdf'')
  LOG ON (NAME = N''securingangularappscourseapi_log'',  FILENAME = N''' + @device_directory + N'securingangularappscourseapi.ldf'')')
go

if exists (select * from sysdatabases where name='securingangularappscoursests')
		drop database securingangularappscoursests
go

DECLARE @device_directory NVARCHAR(520)
SELECT @device_directory = SUBSTRING(filename, 1, CHARINDEX(N'master.mdf', LOWER(filename)) - 1)
FROM master.dbo.sysaltfiles WHERE dbid = 1 AND fileid = 1

EXECUTE (N'CREATE DATABASE securingangularappscoursests
  ON PRIMARY (NAME = N''securingangularappscoursests'', FILENAME = N''' + @device_directory + N'securingangularappscoursests.mdf'')
  LOG ON (NAME = N''securingangularappscoursests_log'',  FILENAME = N''' + @device_directory + N'securingangularappscoursests.ldf'')')
go

SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO

USE [securingangularappscoursests];


GO
PRINT N'Creating [dbo].[AspNetRoleClaims]...';


GO
CREATE TABLE [dbo].[AspNetRoleClaims] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [ClaimType]  NVARCHAR (MAX) NULL,
    [ClaimValue] NVARCHAR (MAX) NULL,
    [RoleId]     NVARCHAR (450) NOT NULL,
    CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[AspNetRoleClaims].[IX_AspNetRoleClaims_RoleId]...';


GO
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId]
    ON [dbo].[AspNetRoleClaims]([RoleId] ASC);


GO
PRINT N'Creating [dbo].[AspNetRoles]...';


GO
CREATE TABLE [dbo].[AspNetRoles] (
    [Id]               NVARCHAR (450) NOT NULL,
    [ConcurrencyStamp] NVARCHAR (MAX) NULL,
    [Name]             NVARCHAR (256) NULL,
    [NormalizedName]   NVARCHAR (256) NULL,
    CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[AspNetRoles].[RoleNameIndex]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex]
    ON [dbo].[AspNetRoles]([NormalizedName] ASC) WHERE ([NormalizedName] IS NOT NULL);


GO
PRINT N'Creating [dbo].[AspNetUserClaims]...';


GO
CREATE TABLE [dbo].[AspNetUserClaims] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [ClaimType]  NVARCHAR (MAX) NULL,
    [ClaimValue] NVARCHAR (MAX) NULL,
    [UserId]     NVARCHAR (450) NOT NULL,
    CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[AspNetUserClaims].[IX_AspNetUserClaims_UserId]...';


GO
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId]
    ON [dbo].[AspNetUserClaims]([UserId] ASC);


GO
PRINT N'Creating [dbo].[AspNetUserLogins]...';


GO
CREATE TABLE [dbo].[AspNetUserLogins] (
    [LoginProvider]       NVARCHAR (450) NOT NULL,
    [ProviderKey]         NVARCHAR (450) NOT NULL,
    [ProviderDisplayName] NVARCHAR (MAX) NULL,
    [UserId]              NVARCHAR (450) NOT NULL,
    CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED ([LoginProvider] ASC, [ProviderKey] ASC)
);


GO
PRINT N'Creating [dbo].[AspNetUserLogins].[IX_AspNetUserLogins_UserId]...';


GO
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId]
    ON [dbo].[AspNetUserLogins]([UserId] ASC);


GO
PRINT N'Creating [dbo].[AspNetUserRoles]...';


GO
CREATE TABLE [dbo].[AspNetUserRoles] (
    [UserId] NVARCHAR (450) NOT NULL,
    [RoleId] NVARCHAR (450) NOT NULL,
    CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED ([UserId] ASC, [RoleId] ASC)
);


GO
PRINT N'Creating [dbo].[AspNetUserRoles].[IX_AspNetUserRoles_RoleId]...';


GO
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId]
    ON [dbo].[AspNetUserRoles]([RoleId] ASC);


GO
PRINT N'Creating [dbo].[AspNetUsers]...';


GO
CREATE TABLE [dbo].[AspNetUsers] (
    [Id]                   NVARCHAR (450)     NOT NULL,
    [AccessFailedCount]    INT                NOT NULL,
    [ConcurrencyStamp]     NVARCHAR (MAX)     NULL,
    [Email]                NVARCHAR (256)     NULL,
    [EmailConfirmed]       BIT                NOT NULL,
    [LockoutEnabled]       BIT                NOT NULL,
    [LockoutEnd]           DATETIMEOFFSET (7) NULL,
    [NormalizedEmail]      NVARCHAR (256)     NULL,
    [NormalizedUserName]   NVARCHAR (256)     NULL,
    [PasswordHash]         NVARCHAR (MAX)     NULL,
    [PhoneNumber]          NVARCHAR (MAX)     NULL,
    [PhoneNumberConfirmed] BIT                NOT NULL,
    [SecurityStamp]        NVARCHAR (MAX)     NULL,
    [TwoFactorEnabled]     BIT                NOT NULL,
    [UserName]             NVARCHAR (256)     NULL,
    CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[AspNetUsers].[EmailIndex]...';


GO
CREATE NONCLUSTERED INDEX [EmailIndex]
    ON [dbo].[AspNetUsers]([NormalizedEmail] ASC);


GO
PRINT N'Creating [dbo].[AspNetUsers].[UserNameIndex]...';


GO
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex]
    ON [dbo].[AspNetUsers]([NormalizedUserName] ASC) WHERE ([NormalizedUserName] IS NOT NULL);


GO
PRINT N'Creating [dbo].[AspNetUserTokens]...';


GO
CREATE TABLE [dbo].[AspNetUserTokens] (
    [UserId]        NVARCHAR (450) NOT NULL,
    [LoginProvider] NVARCHAR (450) NOT NULL,
    [Name]          NVARCHAR (450) NOT NULL,
    [Value]         NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED ([UserId] ASC, [LoginProvider] ASC, [Name] ASC)
);


GO
PRINT N'Creating [dbo].[FK_AspNetRoleClaims_AspNetRoles_RoleId]...';


GO
ALTER TABLE [dbo].[AspNetRoleClaims] WITH NOCHECK
    ADD CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_AspNetUserClaims_AspNetUsers_UserId]...';


GO
ALTER TABLE [dbo].[AspNetUserClaims] WITH NOCHECK
    ADD CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_AspNetUserLogins_AspNetUsers_UserId]...';


GO
ALTER TABLE [dbo].[AspNetUserLogins] WITH NOCHECK
    ADD CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_AspNetUserRoles_AspNetRoles_RoleId]...';


GO
ALTER TABLE [dbo].[AspNetUserRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_AspNetUserRoles_AspNetUsers_UserId]...';


GO
ALTER TABLE [dbo].[AspNetUserRoles] WITH NOCHECK
    ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_AspNetUserTokens_AspNetUsers_UserId]...';


GO
ALTER TABLE [dbo].[AspNetUserTokens] WITH NOCHECK
    ADD CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Checking existing data against newly created constraints';


GO

ALTER TABLE [dbo].[AspNetRoleClaims] WITH CHECK CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId];

ALTER TABLE [dbo].[AspNetUserClaims] WITH CHECK CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId];

ALTER TABLE [dbo].[AspNetUserLogins] WITH CHECK CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId];

ALTER TABLE [dbo].[AspNetUserRoles] WITH CHECK CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId];

ALTER TABLE [dbo].[AspNetUserRoles] WITH CHECK CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId];

ALTER TABLE [dbo].[AspNetUserTokens] WITH CHECK CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId];


GO
PRINT N'Update complete.';


GO

USE [securingangularappscourseapi];


GO
PRINT N'Creating [dbo].[Milestones]...';


GO
CREATE TABLE [dbo].[Milestones] (
    [Id]                INT            IDENTITY (1, 1) NOT NULL,
    [MilestoneStatusId] INT            NOT NULL,
    [Name]              NVARCHAR (MAX) NULL,
    [ProjectId]         INT            NOT NULL,
    CONSTRAINT [PK_Milestones] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Milestones].[IX_Milestones_ProjectId]...';


GO
CREATE NONCLUSTERED INDEX [IX_Milestones_ProjectId]
    ON [dbo].[Milestones]([ProjectId] ASC);


GO
PRINT N'Creating [dbo].[MilestoneStatuses]...';


GO
CREATE TABLE [dbo].[MilestoneStatuses] (
    [Id]   INT            IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_MilestoneStatuses] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Projects]...';


GO
CREATE TABLE [dbo].[Projects] (
    [Id]   INT            IDENTITY (1, 1) NOT NULL,
    [Name] NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[UserPermissions]...';


GO
CREATE TABLE [dbo].[UserPermissions] (
    [Id]            INT            IDENTITY (1, 1) NOT NULL,
    [ProjectId]     INT            NULL,
    [UserProfileId] NVARCHAR (450) NULL,
    [Value]         NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_UserPermissions] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[UserPermissions].[IX_UserPermissions_ProjectId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserPermissions_ProjectId]
    ON [dbo].[UserPermissions]([ProjectId] ASC);


GO
PRINT N'Creating [dbo].[UserPermissions].[IX_UserPermissions_UserProfileId]...';


GO
CREATE NONCLUSTERED INDEX [IX_UserPermissions_UserProfileId]
    ON [dbo].[UserPermissions]([UserProfileId] ASC);


GO
PRINT N'Creating [dbo].[UserProfiles]...';


GO
CREATE TABLE [dbo].[UserProfiles] (
    [Id]          NVARCHAR (450) NOT NULL,
    [Email]       NVARCHAR (MAX) NULL,
    [FirstName]   NVARCHAR (MAX) NULL,
    [HasLoggedIn] BIT            NOT NULL,
    [LastName]    NVARCHAR (MAX) NULL,
    CONSTRAINT [PK_UserProfiles] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[FK_Milestones_Projects_ProjectId]...';


GO
ALTER TABLE [dbo].[Milestones] WITH NOCHECK
    ADD CONSTRAINT [FK_Milestones_Projects_ProjectId] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Projects] ([Id]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_UserPermissions_Projects_ProjectId]...';


GO
ALTER TABLE [dbo].[UserPermissions] WITH NOCHECK
    ADD CONSTRAINT [FK_UserPermissions_Projects_ProjectId] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Projects] ([Id]);


GO
PRINT N'Creating [dbo].[FK_UserPermissions_UserProfiles_UserProfileId]...';


GO
ALTER TABLE [dbo].[UserPermissions] WITH NOCHECK
    ADD CONSTRAINT [FK_UserPermissions_UserProfiles_UserProfileId] FOREIGN KEY ([UserProfileId]) REFERENCES [dbo].[UserProfiles] ([Id]);


GO
PRINT N'Checking existing data against newly created constraints';


GO

ALTER TABLE [dbo].[Milestones] WITH CHECK CHECK CONSTRAINT [FK_Milestones_Projects_ProjectId];

ALTER TABLE [dbo].[UserPermissions] WITH CHECK CHECK CONSTRAINT [FK_UserPermissions_Projects_ProjectId];

ALTER TABLE [dbo].[UserPermissions] WITH CHECK CHECK CONSTRAINT [FK_UserPermissions_UserProfiles_UserProfileId];


GO
PRINT N'Update complete.';


GO

/*
This script was created by Visual Studio on 4/19/2018 at 5:07 PM.
This script performs its actions in the following order:
1. Disable foreign-key constraints.
2. Perform DELETE commands. 
3. Perform UPDATE commands.
4. Perform INSERT commands.
5. Re-enable foreign-key constraints.
Please back up your target database before running this script.
*/
SET NUMERIC_ROUNDABORT OFF
GO
SET XACT_ABORT, ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
/*Pointer used for text / image updates. This might not be needed, but is declared here just in case*/
DECLARE @pv binary(16)
BEGIN TRANSACTION
ALTER TABLE [dbo].[Milestones] DROP CONSTRAINT [FK_Milestones_Projects_ProjectId]
ALTER TABLE [dbo].[UserPermissions] DROP CONSTRAINT [FK_UserPermissions_Projects_ProjectId]
ALTER TABLE [dbo].[UserPermissions] DROP CONSTRAINT [FK_UserPermissions_UserProfiles_UserProfileId]
SET IDENTITY_INSERT [dbo].[Projects] ON
INSERT INTO [dbo].[Projects] ([Id], [Name]) VALUES (4, N'Improve Ops Efficiency')
INSERT INTO [dbo].[Projects] ([Id], [Name]) VALUES (5, N'Grow Domestic Sales')
INSERT INTO [dbo].[Projects] ([Id], [Name]) VALUES (9, N'Test Project')
INSERT INTO [dbo].[Projects] ([Id], [Name]) VALUES (10, N'Consolidate Chicago Offices')
SET IDENTITY_INSERT [dbo].[Projects] OFF
SET IDENTITY_INSERT [dbo].[UserPermissions] ON
INSERT INTO [dbo].[UserPermissions] ([Id], [ProjectId], [UserProfileId], [Value]) VALUES (1, NULL, N'151dba72-2400-43d6-9e33-cadbb71b865b', N'Admin')
INSERT INTO [dbo].[UserPermissions] ([Id], [ProjectId], [UserProfileId], [Value]) VALUES (7, 9, N'510df9ac-baca-43b6-9e4a-cdda5f419428', N'Edit')
INSERT INTO [dbo].[UserPermissions] ([Id], [ProjectId], [UserProfileId], [Value]) VALUES (8, 4, N'510df9ac-baca-43b6-9e4a-cdda5f419428', N'View')
INSERT INTO [dbo].[UserPermissions] ([Id], [ProjectId], [UserProfileId], [Value]) VALUES (9, 10, N'510df9ac-baca-43b6-9e4a-cdda5f419428', N'Edit')
INSERT INTO [dbo].[UserPermissions] ([Id], [ProjectId], [UserProfileId], [Value]) VALUES (10, 10, N'34a2101b-3f25-4a2d-87d2-ca7adb3feb11', N'View')
SET IDENTITY_INSERT [dbo].[UserPermissions] OFF
INSERT INTO [dbo].[UserProfiles] ([Id], [Email], [FirstName], [HasLoggedIn], [LastName]) VALUES (N'151dba72-2400-43d6-9e33-cadbb71b865b', N'admin@globomantics.com', N'Brian', 0, N'Noyes')
INSERT INTO [dbo].[UserProfiles] ([Id], [Email], [FirstName], [HasLoggedIn], [LastName]) VALUES (N'34a2101b-3f25-4a2d-87d2-ca7adb3feb11', N'bob@globomantics.com', N'Bob', 0, N'Roberts')
INSERT INTO [dbo].[UserProfiles] ([Id], [Email], [FirstName], [HasLoggedIn], [LastName]) VALUES (N'510df9ac-baca-43b6-9e4a-cdda5f419428', N'alice@globomantics.com', N'Alice', 0, N'Allison')
INSERT INTO [dbo].[UserProfiles] ([Id], [Email], [FirstName], [HasLoggedIn], [LastName]) VALUES (N'91dd93b1-403c-4913-b7fe-917bb0c35996', N'mary@globomantics.com', N'Mary', 0, N'Marisette')
SET IDENTITY_INSERT [dbo].[Milestones] ON
INSERT INTO [dbo].[Milestones] ([Id], [MilestoneStatusId], [Name], [ProjectId]) VALUES (6, 3, N'Conduct Store Closings', 4)
INSERT INTO [dbo].[Milestones] ([Id], [MilestoneStatusId], [Name], [ProjectId]) VALUES (7, 4, N'Implement Lean Phase', 4)
INSERT INTO [dbo].[Milestones] ([Id], [MilestoneStatusId], [Name], [ProjectId]) VALUES (8, 1, N'Outsource Printing', 4)
INSERT INTO [dbo].[Milestones] ([Id], [MilestoneStatusId], [Name], [ProjectId]) VALUES (9, 1, N'Implement CRM', 5)
INSERT INTO [dbo].[Milestones] ([Id], [MilestoneStatusId], [Name], [ProjectId]) VALUES (10, 4, N'Create Tech Sales Role', 5)
INSERT INTO [dbo].[Milestones] ([Id], [MilestoneStatusId], [Name], [ProjectId]) VALUES (13, 4, N'Hire more staff!', 9)
SET IDENTITY_INSERT [dbo].[Milestones] OFF
SET IDENTITY_INSERT [dbo].[MilestoneStatuses] ON
INSERT INTO [dbo].[MilestoneStatuses] ([Id], [Name]) VALUES (1, N'Not Started')
INSERT INTO [dbo].[MilestoneStatuses] ([Id], [Name]) VALUES (2, N'Behind Schedule')
INSERT INTO [dbo].[MilestoneStatuses] ([Id], [Name]) VALUES (3, N'Completed')
INSERT INTO [dbo].[MilestoneStatuses] ([Id], [Name]) VALUES (4, N'On Track')
SET IDENTITY_INSERT [dbo].[MilestoneStatuses] OFF
ALTER TABLE [dbo].[Milestones]
    ADD CONSTRAINT [FK_Milestones_Projects_ProjectId] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Projects] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[UserPermissions]
    ADD CONSTRAINT [FK_UserPermissions_Projects_ProjectId] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Projects] ([Id])
ALTER TABLE [dbo].[UserPermissions]
    ADD CONSTRAINT [FK_UserPermissions_UserProfiles_UserProfileId] FOREIGN KEY ([UserProfileId]) REFERENCES [dbo].[UserProfiles] ([Id])
COMMIT TRANSACTION

USE [securingangularappscoursests]

BEGIN TRANSACTION
ALTER TABLE [dbo].[AspNetUserLogins] DROP CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
ALTER TABLE [dbo].[AspNetUserClaims] DROP CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
ALTER TABLE [dbo].[AspNetUserRoles] DROP CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
ALTER TABLE [dbo].[AspNetUserTokens] DROP CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
ALTER TABLE [dbo].[AspNetRoleClaims] DROP CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
INSERT INTO [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName]) VALUES (N'151dba72-2400-43d6-9e33-cadbb71b865b', 0, N'f1ea7244-12e2-4bf4-9d38-d774ec372d4b', N'admin@globomantics.com', 0, 1, NULL, N'ADMIN@GLOBOMANTICS.COM', N'ADMIN@GLOBOMANTICS.COM', N'AQAAAAEAACcQAAAAECi3ahkgYfuCpckglBbY8R8Ah52Jk/FAXgAg7QNkul4+VWx4eADyFQ0FyS4cS8tFcg==', NULL, 0, N'9ea80b23-9b95-4f25-b932-38cf1a713a1c', 0, N'admin@globomantics.com')
INSERT INTO [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName]) VALUES (N'34a2101b-3f25-4a2d-87d2-ca7adb3feb11', 0, N'6bc7ef72-085f-4b60-a3d8-1f45f1c7cee4', N'bob@globomantics.com', 0, 1, NULL, N'BOB@GLOBOMANTICS.COM', N'BOB@GLOBOMANTICS.COM', N'AQAAAAEAACcQAAAAEMUOON4JcDDL23xTLbpuR9HC2O9uie1jqcvyMN3SwOWrNudevSBnoFeUorNdIZEUkA==', NULL, 0, N'd6ec7b4a-ce49-4376-8721-989c97776e78', 0, N'bob@globomantics.com')
INSERT INTO [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName]) VALUES (N'510df9ac-baca-43b6-9e4a-cdda5f419428', 0, N'0270592c-5b93-4cbd-9050-722e3bc9250d', N'alice@globomantics.com', 0, 1, NULL, N'ALICE@GLOBOMANTICS.COM', N'ALICE@GLOBOMANTICS.COM', N'AQAAAAEAACcQAAAAEM90xgFIknZXv+QhkRbq/cmGkk5wwost6ScPVEPmrkQa8PrcqfOZHSzX+9aaGCQwSg==', NULL, 0, N'103eaa35-a3cb-41e9-9b70-bcea02691bc9', 0, N'alice@globomantics.com')
INSERT INTO [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName]) VALUES (N'91dd93b1-403c-4913-b7fe-917bb0c35996', 0, N'd7c42f8d-477d-49fe-ae4f-7b4301985acd', N'mary@globomantics.com', 0, 1, NULL, N'MARY@GLOBOMANTICS.COM', N'MARY@GLOBOMANTICS.COM', N'AQAAAAEAACcQAAAAEAo6Wp95tWLS9RAPHrv0CmqkYk3Nio/Dxl0hjyx+i1CRA2jByJ6uQbyrW8e1wFVcfA==', NULL, 0, N'a95f50c2-7c3b-499e-ac70-13b3849b0e8f', 0, N'mary@globomantics.com')

ALTER TABLE [dbo].[AspNetUserLogins]
    ADD CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[AspNetUserClaims]
    ADD CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[AspNetUserRoles]
    ADD CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[AspNetUserRoles]
    ADD CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[AspNetUserTokens]
    ADD CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [dbo].[AspNetUsers] ([Id]) ON DELETE CASCADE
ALTER TABLE [dbo].[AspNetRoleClaims]
    ADD CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[AspNetRoles] ([Id]) ON DELETE CASCADE
COMMIT TRANSACTION


