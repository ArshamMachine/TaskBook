USE [master]
GO
/****** Object:  Database [TaskBook]    Script Date: 15/05/1403 12:26:32 ب.ظ ******/
CREATE DATABASE [TaskBook]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TaskBook', FILENAME = N'e:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Data\TaskBook.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TaskBook_log', FILENAME = N'f:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Data\TaskBook_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TaskBook] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TaskBook].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TaskBook] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TaskBook] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TaskBook] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TaskBook] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TaskBook] SET ARITHABORT OFF 
GO
ALTER DATABASE [TaskBook] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TaskBook] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TaskBook] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TaskBook] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TaskBook] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TaskBook] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TaskBook] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TaskBook] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TaskBook] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TaskBook] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TaskBook] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TaskBook] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TaskBook] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TaskBook] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TaskBook] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TaskBook] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TaskBook] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TaskBook] SET RECOVERY FULL 
GO
ALTER DATABASE [TaskBook] SET  MULTI_USER 
GO
ALTER DATABASE [TaskBook] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TaskBook] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TaskBook] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TaskBook] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TaskBook] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TaskBook] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TaskBook', N'ON'
GO
ALTER DATABASE [TaskBook] SET QUERY_STORE = OFF
GO
USE [TaskBook]
GO
/****** Object:  Table [dbo].[tblTask_details]    Script Date: 15/05/1403 12:26:32 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTask_details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[task_id] [int] NULL,
	[status] [nvarchar](50) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_task_details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblPersonel]    Script Date: 15/05/1403 12:26:32 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblPersonel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fname] [nvarchar](128) NULL,
	[lname] [nvarchar](128) NULL,
	[phone] [varchar](50) NULL,
	[department] [nvarchar](128) NULL,
	[job_title] [nvarchar](128) NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](128) NULL,
	[descriptions] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_tblPersonel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTasks]    Script Date: 15/05/1403 12:26:32 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTasks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[day_id] [int] NULL,
	[title] [nvarchar](128) NULL,
	[description] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[started_at] [datetime] NULL,
	[finished_at] [datetime] NULL,
	[due_date] [varchar](10) NULL,
	[is_active] [bit] NULL,
 CONSTRAINT [PK_tasks] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblDays]    Script Date: 15/05/1403 12:26:32 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDays](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[working_date] [datetime] NULL,
	[started_at] [datetime] NULL,
	[finished_at] [datetime] NULL,
	[descriptions] [nvarchar](max) NULL,
	[person_id] [int] NULL,
 CONSTRAINT [PK_tblDays] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwPersonelReport]    Script Date: 15/05/1403 12:26:32 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwPersonelReport]
AS
SELECT       dbo.tblPersonel.id AS person_id, dbo.tblDays.id AS day_id, dbo.tblPersonel.fname AS person_fname, dbo.tblPersonel.lname AS person_lname, dbo.tblPersonel.department AS person_department, 
                         dbo.tblPersonel.job_title AS person_job_title, format(dbo.tblDays.working_date, 'yyyy/MM/dd', 'fa') AS day_working_date, dbo.tblDays.started_at AS day_started_at, dbo.tblDays.finished_at AS day_finished_at, 
                         dbo.tblDays.descriptions AS day_description, dbo.tblTasks.title AS task_title, dbo.tblTasks.description AS task_description, FORMAT(dbo.tblTasks.created_at, 'yyy/MM/dd', 'fa') AS task_created_at, 
                         dbo.tblTasks.due_date AS task_due_date, dbo.tblTasks.is_active AS task_is_active, FORMAT(dbo.tblTask_details.created_at, 'yyyy/MM/dd', 'fa') AS task_detail_created_at, dbo.tblTask_details.status AS task_detail_status
FROM            dbo.tblPersonel INNER JOIN
                         dbo.tblDays ON dbo.tblPersonel.id = dbo.tblDays.person_id INNER JOIN
                         dbo.tblTasks ON dbo.tblDays.id = dbo.tblTasks.day_id INNER JOIN
                         dbo.tblTask_details ON dbo.tblTasks.id = dbo.tblTask_details.task_id
GO
/****** Object:  View [dbo].[vwTasks]    Script Date: 15/05/1403 12:26:32 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwTasks]
AS
SELECT       dbo.tblTasks.id AS task_id, dbo.tblTasks.day_id AS task_day_id, dbo.tblTasks.title AS task_title, dbo.tblTasks.description AS task_description, dbo.tblTasks.created_at AS task_created_at, dbo.tblTasks.updated_at AS task_updated_at, 
                         dbo.tblTasks.started_at AS task_started_at, dbo.tblTasks.finished_at AS task_finished_at, dbo.tblTasks.due_date AS task_due_date, dbo.tblTasks.is_active AS task_is_active, dbo.tblTask_details.task_id AS task_detail_id, 
                         dbo.tblTask_details.status AS task_detail_status, dbo.tblTask_details.created_at AS task_details_created_at, dbo.tblTask_details.updated_at AS task_detail_updated_at
FROM            dbo.tblTasks INNER JOIN
                         dbo.tblTask_details ON dbo.tblTasks.id = dbo.tblTask_details.task_id
GO
/****** Object:  Table [dbo].[tblTimeSheet]    Script Date: 15/05/1403 12:26:32 ب.ظ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTimeSheet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[day_id] [int] NULL,
	[in_time] [datetime] NULL,
	[out_time] [datetime] NULL,
	[descriptions] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblInOut] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblDays] ADD  CONSTRAINT [DF_tblDays_working_date]  DEFAULT (getdate()) FOR [working_date]
GO
ALTER TABLE [dbo].[tblTask_details] ADD  CONSTRAINT [DF_task_details_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tblTasks] ADD  CONSTRAINT [DF_tasks_created_at]  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[tblTasks] ADD  CONSTRAINT [DF_tasks_is_active]  DEFAULT ((1)) FOR [is_active]
GO
ALTER TABLE [dbo].[tblDays]  WITH CHECK ADD  CONSTRAINT [FK_tblDays_tblPersonel] FOREIGN KEY([person_id])
REFERENCES [dbo].[tblPersonel] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblDays] CHECK CONSTRAINT [FK_tblDays_tblPersonel]
GO
ALTER TABLE [dbo].[tblTask_details]  WITH CHECK ADD  CONSTRAINT [FK_task_details_task_details] FOREIGN KEY([task_id])
REFERENCES [dbo].[tblTasks] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tblTask_details] CHECK CONSTRAINT [FK_task_details_task_details]
GO
ALTER TABLE [dbo].[tblTasks]  WITH CHECK ADD  CONSTRAINT [FK_tblTasks_tblDays] FOREIGN KEY([day_id])
REFERENCES [dbo].[tblDays] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblTasks] CHECK CONSTRAINT [FK_tblTasks_tblDays]
GO
ALTER TABLE [dbo].[tblTimeSheet]  WITH CHECK ADD  CONSTRAINT [FK_tblTimeSheet_tblDays] FOREIGN KEY([day_id])
REFERENCES [dbo].[tblDays] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[tblTimeSheet] CHECK CONSTRAINT [FK_tblTimeSheet_tblDays]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[20] 4[41] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1[50] 2[25] 3) )"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 2
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblPersonel"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblDays"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblTasks"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "tblTask_details"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 18
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2115
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      PaneHidden = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         O' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPersonelReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'utput = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPersonelReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPersonelReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblTasks"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 216
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "tblTask_details"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 216
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 16
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwTasks'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwTasks'
GO
USE [master]
GO
ALTER DATABASE [TaskBook] SET  READ_WRITE 
GO
