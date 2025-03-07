USE [master]
GO
/****** Object:  Database [MememberShipDB]    Script Date: 4/15/2023 10:24:46 PM ******/
CREATE DATABASE [MememberShipDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MememberShipDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MememberShipDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MememberShipDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MememberShipDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MememberShipDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MememberShipDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MememberShipDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MememberShipDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MememberShipDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MememberShipDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MememberShipDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MememberShipDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MememberShipDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MememberShipDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MememberShipDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MememberShipDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MememberShipDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MememberShipDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MememberShipDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MememberShipDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MememberShipDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MememberShipDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MememberShipDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MememberShipDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MememberShipDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MememberShipDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MememberShipDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MememberShipDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MememberShipDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MememberShipDB] SET  MULTI_USER 
GO
ALTER DATABASE [MememberShipDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MememberShipDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MememberShipDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MememberShipDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MememberShipDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MememberShipDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MememberShipDB', N'ON'
GO
ALTER DATABASE [MememberShipDB] SET QUERY_STORE = OFF
GO
USE [MememberShipDB]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryId] [int] NULL,
	[Category] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailyLogs]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailyLogs](
	[DailyLogId] [int] IDENTITY(1,1) NOT NULL,
	[MemberId] [int] NULL,
	[LogDate] [datetime] NULL,
	[MoneyPaid] [decimal](18, 0) NULL,
	[OtherDetails] [nvarchar](max) NULL,
	[LogTime] [time](7) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_DailyLogs] PRIMARY KEY CLUSTERED 
(
	[DailyLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MembershipTypes]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MembershipTypes](
	[MemberShipTypeId] [int] IDENTITY(1,1) NOT NULL,
	[MembershipTypeName] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_MembershipTypes] PRIMARY KEY CLUSTERED 
(
	[MemberShipTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Memembers]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Memembers](
	[MemberId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[MoneyPaid] [decimal](18, 0) NULL,
	[MemembershipTypeId] [int] NULL,
	[MemembershipPaidDate] [date] NULL,
	[MemembershipExpiryDate] [date] NULL,
	[Locker] [nvarchar](50) NULL,
	[OtherDetails] [nvarchar](max) NULL,
	[Category] [nvarchar](50) NULL,
	[MembershipStatus] [nvarchar](50) NULL,
	[RFIDNumber] [nvarchar](50) NULL,
	[TuesdayLeagueNightMembership] [int] NULL,
	[ThursdayLeagueNightMembership] [int] NULL,
	[IsDailyPaying] [bit] NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_Memembers] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleTitle] [nvarchar](50) NULL,
	[Description] [nvarchar](200) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPrevileges]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPrevileges](
	[PrevilegeID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserPrevileges] PRIMARY KEY CLUSTERED 
(
	[PrevilegeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NULL,
	[RoleId] [int] NULL,
	[IsActive] [bit] NULL,
	[Description] [nvarchar](200) NULL,
	[CreatedBy] [nvarchar](50) NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserPrevileges]  WITH CHECK ADD  CONSTRAINT [FK_UserPrevileges_Users] FOREIGN KEY([UserName])
REFERENCES [dbo].[Users] ([UserName])
GO
ALTER TABLE [dbo].[UserPrevileges] CHECK CONSTRAINT [FK_UserPrevileges_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
/****** Object:  StoredProcedure [dbo].[DailyLogsAddDailyLog]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DailyLogsAddDailyLog]
(
			@MemberId			INT
           ,@LogDate			DATE
		   ,@LogTime			time
           ,@MoneyPaid			DECIMAL(18,0)
           ,@OtherDetails		NVARCHAR(MAX)
           ,@CreatedBy			NVARCHAR(50)
)
AS
INSERT INTO [dbo].[DailyLogs]
           ([MemberId]
           ,[LogDate]
		   ,[LogTime]
           ,[MoneyPaid]
           ,[OtherDetails]
           ,[CreatedBy]
           ,[CreatedDate])
     VALUES
           (@MemberId
           ,@LogDate
		   ,@LogTime
           ,@MoneyPaid
           ,@OtherDetails
           ,@CreatedBy
           ,GETDATE())

GO
/****** Object:  StoredProcedure [dbo].[SelectAllCustomers]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllCustomers]
AS
SELECT * FROM Customers
GO;
GO
/****** Object:  StoredProcedure [dbo].[usp_DailyLogs]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_DailyLogs]
(
		@LogDate		Date		
)
AS
SELECT [DailyLogId]
      ,[MemberId]
      ,[LogDate]
  FROM [dbo].[DailyLogs]

  WHERE LogDate = @LogDate

GO
/****** Object:  StoredProcedure [dbo].[usp_DailyLogsAddNewLog]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_DailyLogsAddNewLog]
(
			@MemberId			int
           ,@LogDate			date
		   ,@LogTime			time
           ,@CreatedBy			nvarchar(50)
)
as
INSERT INTO [dbo].[DailyLogs]
           ([MemberId]
           ,[LogDate]
		   ,[LogTime]
           ,[CreatedBy]
           ,[CreatedDate])
     VALUES
           (@MemberId
           ,@LogDate
		   ,@LogTime
           ,@CreatedBy
           ,GETDATE())

GO
/****** Object:  StoredProcedure [dbo].[usp_DailyLogsDeleteLogEntry]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_DailyLogsDeleteLogEntry]
(
	@LogId		int
)
AS
DELETE FROM [dbo].[DailyLogs]
      WHERE DailyLogId = @LogId

GO
/****** Object:  StoredProcedure [dbo].[usp_DailyLogsGetLogDetailsForUpdate]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[usp_DailyLogsGetLogDetailsForUpdate]
 (
	@LogId		INT
 )
 AS
SELECT [DailyLogId]
      ,[MemberId]
      ,[LogDate]
	  ,MoneyPaid
	  ,OtherDetails
  FROM [dbo].[DailyLogs]
	where DailyLogId = @LogId

GO
/****** Object:  StoredProcedure [dbo].[usp_DailyLogsLoadIntoGridView]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_DailyLogsLoadIntoGridView]
(
		@LogDate		Date		
)
AS
SELECT [DailyLogId]
      ,d.[MemberId]
	  ,m.FirstName
	  ,m.LastName
	  ,d.MoneyPaid
	  ,d.OtherDetails
	  ,m.Locker
	  ,m.MembershipStatus
	  ,m.MemembershipPaidDate
	  ,m.MemembershipExpiryDate
	  ,m.TuesdayLeagueNightMembership
	  ,m.ThursdayLeagueNightMembership
	  
      ,[LogDate] 
	  ,LogTime
  FROM [dbo].[DailyLogs] d left join Memembers m on d.MemberId = m.MemberId

  WHERE LogDate = @LogDate
    ORDER BY DailyLogId DESC

GO
/****** Object:  StoredProcedure [dbo].[usp_DailyLogsLoadIntoGridViewAllTime]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_DailyLogsLoadIntoGridViewAllTime]

AS
SELECT [DailyLogId]
      ,d.[MemberId]
	  ,m.FirstName
	  ,m.LastName
	  ,m.MoneyPaid
	  ,m.OtherDetails
	  ,m.Locker
	  ,m.MembershipStatus
	  ,m.MemembershipPaidDate
	  ,m.MemembershipExpiryDate
	  ,m.TuesdayLeagueNightMembership
	  ,m.ThursdayLeagueNightMembership
	  
      ,[LogDate]
	  ,LogTime
  FROM [dbo].[DailyLogs] d inner join Memembers m on d.MemberId = m.MemberId



GO
/****** Object:  StoredProcedure [dbo].[usp_DailyLogsReport]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_DailyLogsReport]
(
		@StartDate		Date
		,@EndDate		Date		
)
AS
SELECT [DailyLogId]
	  ,format([LogDate],'dd-MM-yyyy') AS 'LogDate'
      ,d.[MemberId]
	  ,m.FirstName
	  ,m.LastName
	  ,d.MoneyPaid
	  ,d.OtherDetails
	  ,m.Locker
	  ,m.MembershipStatus
	  ,m.MemembershipPaidDate
	  ,m.MemembershipExpiryDate
	  ,m.TuesdayLeagueNightMembership
	  ,m.ThursdayLeagueNightMembership
  FROM [dbo].[DailyLogs] d left join Memembers m on d.MemberId = m.MemberId
  
  WHERE LogDate >= @StartDate AND LogDate <= @EndDate
  ORDER BY LogDate, MemberId
GO
/****** Object:  StoredProcedure [dbo].[usp_DailyLogsUpdateLog]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		CREATE PROCEDURE [dbo].[usp_DailyLogsUpdateLog]
		(
				@LogId			INT		
				,@MemberId		INT
				,@LogDate		DATE
				,@MoneyPaid		NVARCHAR(50)
				,@OtherDetails	NVARCHAR(50)
				,@CreatedBy		NVARCHAR(50)
		
		)
AS
UPDATE [dbo].[DailyLogs]
   SET [MemberId] =			@MemberId
      ,[LogDate] =			@LogDate
	  ,[MoneyPaid] =        @MoneyPaid
	  ,[OtherDetails]  =    @OtherDetails
      ,[CreatedBy] =		@CreatedBy
      ,[CreatedDate] =		GETDATE()
 WHERE DailyLogId = @LogId

GO
/****** Object:  StoredProcedure [dbo].[usp_MembersAddNewMember]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_MembersAddNewMember]
(			@FirstName							NVARCHAR(50)
           ,@LastName							NVARCHAR(50)
           ,@MoneyPaid							DECIMAL(18,0)
           ,@MemembershipTypeId					INT
           ,@MemembershipPaidDate				DATE
           ,@MemembershipExpiryDate				DATE
           ,@Locker								NVARCHAR(50)
           ,@OtherDetails						NVARCHAR(MAX)
           ,@Category							NVARCHAR(50)
           ,@MembershipStatus					NVARCHAR(50)
           ,@RFIDNumber							NVARCHAR(50)
           ,@TuesdayLeagueNightMembership		INT
           ,@ThursdayLeagueNightMembership		INT
           ,@CreatedBy							NVARCHAR(50)
)
AS

INSERT INTO [dbo].[Memembers]
           (
		   [FirstName]
           ,[LastName]
           ,[MoneyPaid]
           ,[MemembershipTypeId]
           ,[MemembershipPaidDate]
           ,[MemembershipExpiryDate]
           ,[Locker]
           ,[OtherDetails]
           ,[Category]
           ,[MembershipStatus]
           ,[RFIDNumber]
           ,[TuesdayLeagueNightMembership]
           ,[ThursdayLeagueNightMembership]
           ,[CreatedBy]
           ,[CreatedDate])
     VALUES
           (
		   @FirstName
           ,@LastName
           ,@MoneyPaid
           ,@MemembershipTypeId
           ,@MemembershipPaidDate
           ,@MemembershipExpiryDate
           ,@Locker
           ,@OtherDetails
           ,@Category
           ,@MembershipStatus
           ,@RFIDNumber
           ,@TuesdayLeagueNightMembership
           ,@ThursdayLeagueNightMembership
           ,@CreatedBy
           ,GETDATE())

		
GO
/****** Object:  StoredProcedure [dbo].[usp_MembersDeleteMember]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_MembersDeleteMember]
(
			@MemberId							INT
		
         

)
AS
DELETE FROM [dbo].[Memembers]
      WHERE MemberId = @MemberId 

GO
/****** Object:  StoredProcedure [dbo].[usp_MembershipTypesLoadDataIntoComboBox]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [dbo].[usp_MembershipTypesLoadDataIntoComboBox]
 AS
 SELECT MemberShipTypeId, MembershipTypeName from MembershipTypes
 WHERE IsActive = 1
GO
/****** Object:  StoredProcedure [dbo].[usp_MembersLoadByMemberID]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_MembersLoadByMemberID]

(
		@MemberId		INT
)
AS

SELECT [MemberId]

  FROM [dbo].[Memembers]
  WHERE MemberId = @MemberId

GO
/****** Object:  StoredProcedure [dbo].[usp_MembersLoadByRFID]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_MembersLoadByRFID]

(
		@RFIDNumber		NVARCHAR(50)
)
AS

SELECT [MemberId]

  FROM [dbo].[Memembers]
  WHERE RFIDNumber = @RFIDNumber

GO
/****** Object:  StoredProcedure [dbo].[usp_MembersLoadByRFIDNO]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_MembersLoadByRFIDNO]

(
		@RFIDNumber		NVARCHAR(50)
)
AS

SELECT 
[MemberId]

  FROM [dbo].[Memembers]
  WHERE RFIDNumber = @RFIDNumber

GO
/****** Object:  StoredProcedure [dbo].[usp_MembersLoadDataIntoGridView]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_MembersLoadDataIntoGridView]
as
SELECT MemberId
      ,[FirstName]
      ,[LastName]
      ,[MoneyPaid]
      ,t.MembershipTypeName as 'MemberShipType'
      ,[MemembershipPaidDate]
      ,[MemembershipExpiryDate]
      ,[Locker]
      ,[OtherDetails]
      ,[Category]
      ,[MembershipStatus]
      ,[RFIDNumber]
      ,[TuesdayLeagueNightMembership]
      ,[ThursdayLeagueNightMembership]
  FROM [dbo].[Memembers] m left join MembershipTypes t on m.MemembershipTypeId = t.MemberShipTypeId

GO
/****** Object:  StoredProcedure [dbo].[usp_MembersLoadForUpdateById]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_MembersLoadForUpdateById]
(
	@MemberId		INT
)

AS
SELECT [MemberId]
      ,[FirstName]
      ,[LastName]
      ,[MoneyPaid]
      ,[MemembershipTypeId]
      ,[MemembershipPaidDate]
      ,[MemembershipExpiryDate]
      ,[Locker]
      ,[OtherDetails]
      ,[Category]
      ,[MembershipStatus]
      ,[RFIDNumber]
      ,[TuesdayLeagueNightMembership]
      ,[ThursdayLeagueNightMembership]
  FROM [dbo].[Memembers] Where [MemberId] = @MemberId

GO
/****** Object:  StoredProcedure [dbo].[usp_MembersLoadMembersIntoComboBox]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[usp_MembersLoadMembersIntoComboBox]
AS
SELECT MemberId,FirstName FROM Memembers
GO
/****** Object:  StoredProcedure [dbo].[usp_MembersSearchAndLoadData]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_MembersSearchAndLoadData]
(
	@Filter		nvarchar(50)
)
AS
SELECT MemberId
      ,[FirstName]
      ,[LastName]
      ,[MoneyPaid]
    ,[MemberId]
      ,[MemembershipPaidDate]
      ,[MemembershipExpiryDate]
      ,[Locker]
      ,[OtherDetails]
      ,[Category]
      ,[MembershipStatus]
      ,[RFIDNumber]
      ,[TuesdayLeagueNightMembership]
      ,[ThursdayLeagueNightMembership]
  FROM [dbo].[Memembers] 
  Where FirstName Like '%' + @Filter + '%'
  or  LastName Like '%' + @Filter + '%' 
  or  Locker Like '%' + @Filter + '%'
  or  Category Like '%' + @Filter + '%'
  or  MembershipStatus Like '%' + @Filter + '%'
  or OtherDetails Like '%' + @Filter + '%'
  OR  RFIDNumber Like '%' + @Filter + '%'
  OR FirstName  + ' ' + LastName Like '%' + @Filter + '%'
  OR MemberId  Like '%' + @Filter + '%'
GO
/****** Object:  StoredProcedure [dbo].[usp_MembersSearchAndLoadDataDateWise]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_MembersSearchAndLoadDataDateWise]
(
	@Filter		nvarchar(50),
	@PaidDate   Date
)
AS
SELECT MemberId
      ,[FirstName]
      ,[LastName]
      ,[MoneyPaid]
      ,t.MembershipTypeName as 'MemberShipType'
      ,[MemembershipPaidDate]
      ,[MemembershipExpiryDate]
      ,[Locker]
      ,[OtherDetails]
      ,[Category]
      ,[MembershipStatus]
      ,[RFIDNumber]
      ,[TuesdayLeagueNightMembership]
      ,[ThursdayLeagueNightMembership]
  FROM [dbo].[Memembers] m inner join MembershipTypes t on m.MemembershipTypeId = t.MemberShipTypeId
  Where  FirstName Like '%' + @Filter + '%'
  or  LastName Like '%' + @Filter + '%' 
  or  Locker Like '%' + @Filter + '%'
  or  Category Like '%' + @Filter + '%'
  or  MembershipStatus Like '%' + @Filter + '%'
  OR  RFIDNumber Like '%' + @Filter + '%'
  AND MemembershipPaidDate > @PaidDate
GO
/****** Object:  StoredProcedure [dbo].[usp_MembersUpdateMember]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[usp_MembersUpdateMember]
(
			@MemberId							INT
			,@FirstName							NVARCHAR(50)
           ,@LastName							NVARCHAR(50)
           ,@MoneyPaid							DECIMAL(18,0)
           ,@MemembershipTypeId					INT
           ,@MemembershipPaidDate				DATE
           ,@MemembershipExpiryDate				DATE
           ,@Locker								NVARCHAR(50)
           ,@OtherDetails						NVARCHAR(MAX)
           ,@Category							NVARCHAR(50)
           ,@MembershipStatus					NVARCHAR(50)
           ,@RFIDNumber							NVARCHAR(50)
           ,@TuesdayLeagueNightMembership		INT
           ,@ThursdayLeagueNightMembership		INT
           ,@CreatedBy							NVARCHAR(50)
)
AS
UPDATE [dbo].[Memembers]
   SET [FirstName] =						@FirstName					  
      ,[LastName] =							@LastName					
      ,[MoneyPaid] =						@MoneyPaid					
      ,[MemembershipTypeId] =				@MemembershipTypeId			
      ,[MemembershipPaidDate] =				@MemembershipPaidDate		
      ,[MemembershipExpiryDate] =			@MemembershipExpiryDate		
      ,[Locker] =							@Locker						
      ,[OtherDetails] =						@OtherDetails				
      ,[Category] =							@Category					
      ,[MembershipStatus] =					@MembershipStatus			
      ,[RFIDNumber] =						@RFIDNumber					
      ,[TuesdayLeagueNightMembership] =		@TuesdayLeagueNightMembership	
      ,[ThursdayLeagueNightMembership] =	@ThursdayLeagueNightMembership	
      ,[CreatedBy] =						@CreatedBy						
      ,[CreatedDate] =						GETDATE()					
 WHERE MemberId = @MemberId

GO
/****** Object:  StoredProcedure [dbo].[usp_Reports_GetAllActiveMembers]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Reports_GetAllActiveMembers]
AS
SELECT [MemberId]
      ,[FirstName]
      ,[LastName]
      ,[MoneyPaid]
      ,t.MembershipTypeName
      ,[MemembershipPaidDate]
      ,[MemembershipExpiryDate]
      ,[Locker]
      ,[OtherDetails]
      ,[Category]
      ,[MembershipStatus]
      ,[RFIDNumber]
      ,[TuesdayLeagueNightMembership]
      ,[ThursdayLeagueNightMembership]
  FROM [dbo].[Memembers] m inner join MembershipTypes t on m.MemembershipTypeId = t.MemberShipTypeId

GO
/****** Object:  StoredProcedure [dbo].[usp_RolesAddNewRole]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[usp_RolesAddNewRole]
(
			@RoleTitle			nvarchar(50)
           ,@Description		nvarchar(200)
           ,@CreatedBy			nvarchar(50)
)
as
INSERT INTO [dbo].[Roles]
           ([RoleTitle]
           ,[Description]
           ,[CreatedBy]
           ,[CreatedDate])
     VALUES
           (@RoleTitle
           ,@Description
           ,@CreatedBy 
           ,GETDATE() )



GO
/****** Object:  StoredProcedure [dbo].[usp_RolesDeleteRoleByRoleId]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_RolesDeleteRoleByRoleId]
(
			@RoleId				int

)
AS
DELETE FROM [dbo].[Roles]
      WHERE RoleId = @RoleId



GO
/****** Object:  StoredProcedure [dbo].[usp_RolesGetDataForUpdate]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_RolesGetDataForUpdate]
(
	@RoleId		int
)
AS
SELECT 
       [RoleTitle]
      ,[Description]

  FROM [dbo].[Roles]
  Where RoleId = @RoleId



GO
/****** Object:  StoredProcedure [dbo].[usp_RolesLoadDataIntoComboBox]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[usp_RolesLoadDataIntoComboBox]
AS
Select 
RoleId,RoleTitle
 From Roles


GO
/****** Object:  StoredProcedure [dbo].[usp_RolesLoadDataIntoGridView]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_RolesLoadDataIntoGridView]
AS
SELECT [RoleId]
      ,[RoleTitle]
      ,[Description]
      ,[CreatedBy]
      ,Convert(NVARCHAR(50),CreatedDate, 105) AS 'CreatedDate'
  FROM [dbo].[Roles]



GO
/****** Object:  StoredProcedure [dbo].[usp_RolesSearchByTitle]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[usp_RolesSearchByTitle]
(
	@RoleTitle	nvarchar(50)
)
AS
	BEGIN
	SELECT [RoleId]
      ,[RoleTitle]
      ,[Description]
      ,[CreatedBy]
      ,Convert(NVARCHAR(50),CreatedDate, 105) AS 'CreatedDate'
  FROM [dbo].[Roles]
  where RoleTitle = @RoleTitle
	END


GO
/****** Object:  StoredProcedure [dbo].[usp_RolesUpdateRoleByRoleId]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[usp_RolesUpdateRoleByRoleId]
(
			@RoleId				int
			,@RoleTitle			nvarchar(50)
           ,@Description		nvarchar(200)
           ,@CreatedBy			nvarchar(50)
)
as
UPDATE [dbo].[Roles]
   SET [RoleTitle] = @RoleTitle
      ,[Description] = @Description
      ,[CreatedBy] = @CreatedBy
      ,[CreatedDate] = GETDATE()
 WHERE RoleId = @RoleId



GO
/****** Object:  StoredProcedure [dbo].[usp_UserLoadDataIntoDataGridView]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_UserLoadDataIntoDataGridView]
AS
SELECT u.[UserName]
      ,r.RoleTitle
      ,[IsActive]
      ,u.[Description]
      ,u.[CreatedBy]
       ,Convert(NVARCHAR(50),u.CreatedDate, 105) AS 'CreatedDate'
  FROM [dbo].[Users] u inner join Roles r on r.RoleId = u.RoleId



GO
/****** Object:  StoredProcedure [dbo].[usp_UsersAddNewUser]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[usp_UsersAddNewUser]
(
			@UserName			nvarchar(50)
           ,@Password			nvarchar(50)
           ,@RoleId				int		
           ,@IsActive			bit		
           ,@Description		nvarchar(200)		
           ,@CreatedBy			nvarchar(50)

)
AS
INSERT INTO [dbo].[Users]
           ([UserName]
           ,[Password]
           ,[RoleId]
           ,[IsActive]
           ,[Description]
           ,[CreatedBy]
           ,[CreatedDate])
     VALUES
           (@UserName
           ,@Password
           ,@RoleId						
           ,@IsActive					
           ,@Description				
           ,@CreatedBy					
           ,GETDATE())			



GO
/****** Object:  StoredProcedure [dbo].[usp_UsersChangePassword]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_UsersChangePassword]
(
	 @UserName			nvarchar(50)
	,@NewPassword		nvarchar(50)
	,@CreatedBy			nvarchar(50)
)
AS
	begin
		UPDATE Users 
		set [Password] = @NewPassword
		,[CreatedBy] =	 @CreatedBy
		,[CreatedDate] =    GETDATE()

		WHERE UserName = @UserName
	end

GO
/****** Object:  StoredProcedure [dbo].[usp_UsersDeleteUserByUserName]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_UsersDeleteUserByUserName]
(
		   @UserName			nvarchar(50)

)
AS
DELETE FROM [dbo].[Users]
      WHERE UserName = @UserName


GO
/****** Object:  StoredProcedure [dbo].[usp_UserSearchByUserNameOrRole]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_UserSearchByUserNameOrRole]
(
	@Filter		nvarchar(50)
)
AS
SELECT u.[UserName]
      ,r.RoleTitle
      ,[IsActive]
      ,u.[Description]
      ,u.[CreatedBy]
       ,Convert(NVARCHAR(50),u.CreatedDate, 105) AS 'CreatedDate'
  FROM [dbo].[Users] u inner join Roles r on r.RoleId = u.RoleId
  where u.UserName Like '%' + @Filter + '%' Or +r.RoleTitle Like '%' + @Filter + '%'



GO
/****** Object:  StoredProcedure [dbo].[usp_UsersReloadDataForUpdate]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_UsersReloadDataForUpdate]
(
	@UserName		nvarchar(50)
)
AS
SELECT [UserName]
      ,[RoleId]
      ,[IsActive]
      ,[Description]
  FROM [dbo].[Users]
  where UserName = @UserName


GO
/****** Object:  StoredProcedure [dbo].[usp_UsersUpdateUser]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[usp_UsersUpdateUser]
(
			@OldUserName	   nvarchar(50)
		   ,@UserName			nvarchar(50)
           ,@Password			nvarchar(50)
           ,@RoleId				int		
           ,@IsActive			bit		
           ,@Description		nvarchar(200)		
           ,@CreatedBy			nvarchar(50)

)
AS
UPDATE [dbo].[Users]
   SET [UserName] =		@UserName
      ,[Password] =		@Password
      ,[RoleId] =		@RoleId
      ,[IsActive] =		@IsActive
      ,[Description] =	@Description
      ,[CreatedBy] =	@CreatedBy
      ,[CreatedDate] =	GETDATE()
 WHERE UserName = @OldUserName


GO
/****** Object:  StoredProcedure [dbo].[usp_UsersVerifyLoginDetails]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_UsersVerifyLoginDetails]
(
	@UserName		nvarchar(50)
	,@Password		nvarchar(50)
)
AS
	begin
		select * from users 
		where UserName = @UserName
		AND Password = @Password
		AND IsActive  = 1

	end

GO
/****** Object:  StoredProcedure [dbo].[usp_UsersVerifyLoginPassword]    Script Date: 4/15/2023 10:24:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[usp_UsersVerifyLoginPassword]
(
	 @UserName		nvarchar(50)
	,@Password		nvarchar(50)
)
AS
	begin
		select * from users 
		where UserName = @UserName
		AND Password = @Password

	end

GO
USE [master]
GO
ALTER DATABASE [MememberShipDB] SET  READ_WRITE 
GO
