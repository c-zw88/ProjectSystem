USE [master]
GO
/****** Object:  Database [Worry-freemanagement]    Script Date: 2020/7/2 11:55:24 ******/
CREATE DATABASE [Worry-freemanagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Worry-freemanagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Worry-freemanagement.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Worry-freemanagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Worry-freemanagement_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Worry-freemanagement] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Worry-freemanagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Worry-freemanagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Worry-freemanagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Worry-freemanagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Worry-freemanagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Worry-freemanagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [Worry-freemanagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Worry-freemanagement] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Worry-freemanagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Worry-freemanagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Worry-freemanagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Worry-freemanagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Worry-freemanagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Worry-freemanagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Worry-freemanagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Worry-freemanagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Worry-freemanagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Worry-freemanagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Worry-freemanagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Worry-freemanagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Worry-freemanagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Worry-freemanagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Worry-freemanagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Worry-freemanagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Worry-freemanagement] SET RECOVERY FULL 
GO
ALTER DATABASE [Worry-freemanagement] SET  MULTI_USER 
GO
ALTER DATABASE [Worry-freemanagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Worry-freemanagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Worry-freemanagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Worry-freemanagement] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Worry-freemanagement]
GO
/****** Object:  Table [dbo].[Admini]    Script Date: 2020/7/2 11:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admini](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](10) NOT NULL,
	[Password] [nchar](13) NOT NULL,
 CONSTRAINT [PK_Admini] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departmental]    Script Date: 2020/7/2 11:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departmental](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](10) NOT NULL,
	[DepartmentNun] [nvarchar](50) NOT NULL,
	[Introduction] [nvarchar](50) NOT NULL,
	[Basic] [numeric](18, 2) NULL,
 CONSTRAINT [PK_Table_1] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[notice]    Script Date: 2020/7/2 11:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[datatime] [datetime] NOT NULL,
 CONSTRAINT [PK_notice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[punishments]    Script Date: 2020/7/2 11:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[punishments](
	[EventsID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Name] [nvarchar](10) NULL,
	[Reason] [nvarchar](50) NULL,
	[Datatime] [datetime] NULL,
	[Amount] [nvarchar](50) NULL,
 CONSTRAINT [PK_punishments] PRIMARY KEY CLUSTERED 
(
	[EventsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Recruitment]    Script Date: 2020/7/2 11:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recruitment](
	[RecruitmentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[Phone] [nchar](11) NOT NULL,
	[Age] [nchar](10) NOT NULL,
	[Sex] [nchar](2) NULL,
	[Nativeplace] [nvarchar](10) NULL,
	[Education] [nvarchar](5) NULL,
	[Position] [nvarchar](10) NULL,
	[Photos] [nchar](13) NULL,
	[DepartmentID] [int] NOT NULL,
	[Introduction] [nvarchar](max) NULL,
 CONSTRAINT [PK_Recruitment] PRIMARY KEY CLUSTERED 
(
	[RecruitmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stafftable]    Script Date: 2020/7/2 11:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Stafftable](
	[EmployeeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[Sex] [nchar](2) NOT NULL,
	[Age] [int] NOT NULL,
	[Telephone] [nchar](13) NOT NULL,
	[DepartmentID] [int] NULL,
	[EntryTime] [datetime] NOT NULL,
	[Photos] [nvarchar](10) NOT NULL,
	[Position] [nvarchar](10) NULL,
	[Education] [nvarchar](5) NULL,
	[UserName] [nchar](18) NULL,
	[Password] [varchar](20) NULL,
	[Nativeplace] [nvarchar](10) NULL,
 CONSTRAINT [PK_Stafftable] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Trainingform]    Script Date: 2020/7/2 11:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trainingform](
	[TrainingID] [int] IDENTITY(1,1) NOT NULL,
	[Nametraining] [nvarchar](50) NULL,
	[Personnel] [nchar](10) NULL,
	[Location] [nvarchar](50) NULL,
	[Reason] [nvarchar](50) NULL,
	[Datatime] [datetime] NULL,
	[Datatimes] [datetime] NULL,
 CONSTRAINT [PK_Trainingform] PRIMARY KEY CLUSTERED 
(
	[TrainingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Wage]    Script Date: 2020/7/2 11:55:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[Month] [datetime] NOT NULL,
	[Basicwage] [nchar](10) NOT NULL,
	[Overtime] [nchar](10) NULL,
	[Gongz] [nchar](10) NULL,
	[Insurance] [nchar](10) NULL,
	[Real] [nchar](10) NULL,
 CONSTRAINT [PK_Wage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admini] ON 

INSERT [dbo].[Admini] ([Id], [Name], [Password]) VALUES (1, N'zw        ', N'888888       ')
SET IDENTITY_INSERT [dbo].[Admini] OFF
SET IDENTITY_INSERT [dbo].[Departmental] ON 

INSERT [dbo].[Departmental] ([DepartmentID], [DepartmentName], [DepartmentNun], [Introduction], [Basic]) VALUES (1, N'研发部', N'产品的研发', N'3', CAST(4000.00 AS Numeric(18, 2)))
INSERT [dbo].[Departmental] ([DepartmentID], [DepartmentName], [DepartmentNun], [Introduction], [Basic]) VALUES (2, N'销售部门', N'负责产品的销售', N'1', CAST(3600.00 AS Numeric(18, 2)))
INSERT [dbo].[Departmental] ([DepartmentID], [DepartmentName], [DepartmentNun], [Introduction], [Basic]) VALUES (3, N'实施部门', N'产品的对接，与产品后期的维护', N'1', CAST(3500.00 AS Numeric(18, 2)))
INSERT [dbo].[Departmental] ([DepartmentID], [DepartmentName], [DepartmentNun], [Introduction], [Basic]) VALUES (4, N'测试部门', N'测试产品和提出问题所在', N'5', CAST(3500.00 AS Numeric(18, 2)))
INSERT [dbo].[Departmental] ([DepartmentID], [DepartmentName], [DepartmentNun], [Introduction], [Basic]) VALUES (5, N'策划部门', N'产品的策划与后期的发展方向', N'6', CAST(4200.00 AS Numeric(18, 2)))
SET IDENTITY_INSERT [dbo].[Departmental] OFF
SET IDENTITY_INSERT [dbo].[punishments] ON 

INSERT [dbo].[punishments] ([EventsID], [EmployeeID], [Name], [Reason], [Datatime], [Amount]) VALUES (1, 1, N'紫薇', N'先进员工', NULL, N'200')
INSERT [dbo].[punishments] ([EventsID], [EmployeeID], [Name], [Reason], [Datatime], [Amount]) VALUES (2, 1, N'紫薇', N'劳动先锋', CAST(0x0000ABEA017E7977 AS DateTime), N'200')
INSERT [dbo].[punishments] ([EventsID], [EmployeeID], [Name], [Reason], [Datatime], [Amount]) VALUES (3, 3, N'小旋', N'公司榜样', CAST(0x0000ABEB009BC987 AS DateTime), N'奖励现金100')
INSERT [dbo].[punishments] ([EventsID], [EmployeeID], [Name], [Reason], [Datatime], [Amount]) VALUES (4, 6, N'冬冬', N'三好员工', CAST(0x0000ABEC009CF134 AS DateTime), N'奖励现金100')
SET IDENTITY_INSERT [dbo].[punishments] OFF
SET IDENTITY_INSERT [dbo].[Recruitment] ON 

INSERT [dbo].[Recruitment] ([RecruitmentID], [Name], [Phone], [Age], [Sex], [Nativeplace], [Education], [Position], [Photos], [DepartmentID], [Introduction]) VALUES (2, N'盲僧僧', N'12345678911', N'21        ', N'男 ', N'湖南永州', N'大专', N'员工', N'5.jpg        ', 1, N'无')
INSERT [dbo].[Recruitment] ([RecruitmentID], [Name], [Phone], [Age], [Sex], [Nativeplace], [Education], [Position], [Photos], [DepartmentID], [Introduction]) VALUES (3, N'小沈', N'12345678911', N'24        ', N'男 ', N'湖南长沙', N'本科', N'部门经理', N'3.jpg        ', 5, N'11111')
SET IDENTITY_INSERT [dbo].[Recruitment] OFF
SET IDENTITY_INSERT [dbo].[Stafftable] ON 

INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (1, N'紫薇', N'女 ', 21, N'18573028898  ', 1, CAST(0x0000ABDA0175FCAD AS DateTime), N'1.jpg', N'经理', N'本科', N'zw                ', N'123456', N'湖南岳阳')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (2, N'嘻嘻嘻', N'男 ', 21, N'14785236987  ', 1, CAST(0x0000ABDF00AF7271 AS DateTime), N'1.jpg', N'员工', N'本科', N'aa                ', N'1233456', N'湖南永州')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (3, N'小旋', N'男 ', 21, N'123456778900 ', 1, CAST(0x0000ABDF00B43AF0 AS DateTime), N'1.jpg     ', N'员工', N'本科', N'aa                ', N'123456', N'湖南永州')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (4, N'小洋', N'男 ', 22, N'12345678911  ', 2, CAST(0x0000ABE3010A3250 AS DateTime), N'2.jpg', N'员工', N'专科', N'xy                ', N'123456', N'湖南郴州')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (5, N'小微', N'女 ', 24, N'11111111111  ', 3, CAST(0x0000ABE3010A7D21 AS DateTime), N'3.jpg', N'经理', N'博士', N'xw                ', N'123456', N'湖南岳阳')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (6, N'冬冬', N'男 ', 22, N'15467895241  ', 2, CAST(0x0000ABE3010AB639 AS DateTime), N'4.jpg', N'员工', N'专科', N'aa                ', N'1233456', N'湖南岳阳')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (7, N'铁子', N'女 ', 22, N'12547854784  ', 3, CAST(0x0000ABE3010B2339 AS DateTime), N'4.jpg', N'员工', N'本科', N'aa                ', N'1233456', N'湖南常德')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (9, N'盲僧僧', N'男 ', 21, N'12345679811  ', 2, CAST(0x0000ABE301130D3B AS DateTime), N'3.jpg', N'部门总管', N'本科', N'aa                ', N'123456', N'湖南永州')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (10, N'小旋', N'男 ', 21, N'12345677890  ', 1, CAST(0x0000ABE700B9C8C1 AS DateTime), N'1.jpg     ', N'员工', N'本科', N'aa                ', N'123456', N'湖南永州')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (11, N'盲僧僧2', N'女 ', 21, N'12345679811  ', 3, CAST(0x0000ABE7012693F5 AS DateTime), N'5.jpg', N'部门经理', N'本科', N'aa                ', N'123456', N'湖南永州')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (12, N'小苏打', N'女 ', 21, N'12345678900  ', 2, CAST(0x0000ABE7012829E4 AS DateTime), N'1.jpg', N'部门总管', N'本科', N'xsd               ', N'123456', N'湖南永州')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (13, N'小菜', N'女 ', 21, N'12345679811  ', 2, CAST(0x0000ABE70128CFFA AS DateTime), N'4.jpg', N'部门经理', N'本科', N'xiaoxuan          ', N'123456', N'湖南永州')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (14, N'昆昆', N'女 ', 21, N'12345679811  ', 1, CAST(0x0000ABEC00A17ED8 AS DateTime), N'1.jpg', N'部门总管', N'硕士', N'kk                ', N'1123456', N'湖南岳阳')
SET IDENTITY_INSERT [dbo].[Stafftable] OFF
SET IDENTITY_INSERT [dbo].[Trainingform] ON 

INSERT [dbo].[Trainingform] ([TrainingID], [Nametraining], [Personnel], [Location], [Reason], [Datatime], [Datatimes]) VALUES (1, N'员工技能培训', N'公司大厅      ', N'1 2 3', N'提高员工的技能', CAST(0x0000ABE30109AEF4 AS DateTime), CAST(0x0000ABEB00C5C100 AS DateTime))
INSERT [dbo].[Trainingform] ([TrainingID], [Nametraining], [Personnel], [Location], [Reason], [Datatime], [Datatimes]) VALUES (4, N'广播体超', N'公司前广场     ', N'1 3 4 5', N'锻炼身体', CAST(0x0000ABEC00735B40 AS DateTime), CAST(0x0000ABEC007B98A0 AS DateTime))
SET IDENTITY_INSERT [dbo].[Trainingform] OFF
ALTER TABLE [dbo].[notice] ADD  CONSTRAINT [DF_notice_datatime]  DEFAULT (getdate()) FOR [datatime]
GO
ALTER TABLE [dbo].[punishments] ADD  CONSTRAINT [DF_punishments_Datatime]  DEFAULT (getdate()) FOR [Datatime]
GO
ALTER TABLE [dbo].[Stafftable] ADD  CONSTRAINT [DF_Stafftable_EntryTime]  DEFAULT (getdate()) FOR [EntryTime]
GO
ALTER TABLE [dbo].[Stafftable] ADD  CONSTRAINT [DF_Stafftable_UserName]  DEFAULT (N'aa') FOR [UserName]
GO
ALTER TABLE [dbo].[Stafftable] ADD  CONSTRAINT [DF_Stafftable_Password]  DEFAULT ((1233456)) FOR [Password]
GO
ALTER TABLE [dbo].[Trainingform] ADD  CONSTRAINT [DF_Trainingform_Datatime]  DEFAULT (getdate()) FOR [Datatime]
GO
ALTER TABLE [dbo].[punishments]  WITH CHECK ADD  CONSTRAINT [FK_punishments_Stafftable] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Stafftable] ([EmployeeID])
GO
ALTER TABLE [dbo].[punishments] CHECK CONSTRAINT [FK_punishments_Stafftable]
GO
ALTER TABLE [dbo].[Trainingform]  WITH CHECK ADD  CONSTRAINT [FK_Trainingform_Trainingform] FOREIGN KEY([TrainingID])
REFERENCES [dbo].[Trainingform] ([TrainingID])
GO
ALTER TABLE [dbo].[Trainingform] CHECK CONSTRAINT [FK_Trainingform_Trainingform]
GO
ALTER TABLE [dbo].[Wage]  WITH CHECK ADD  CONSTRAINT [FK_Wage_Stafftable] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Stafftable] ([EmployeeID])
GO
ALTER TABLE [dbo].[Wage] CHECK CONSTRAINT [FK_Wage_Stafftable]
GO
USE [master]
GO
ALTER DATABASE [Worry-freemanagement] SET  READ_WRITE 
GO
