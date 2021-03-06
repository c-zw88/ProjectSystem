USE [master]
GO
/****** Object:  Database [Worry-freemanagement]    Script Date: 2020/9/21 16:36:32 ******/
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
/****** Object:  Table [dbo].[Admini]    Script Date: 2020/9/21 16:36:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admini](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[Password] [nvarchar](12) NOT NULL,
	[UserNaem] [nvarchar](50) NULL,
 CONSTRAINT [PK_Admini] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Clockin]    Script Date: 2020/9/21 16:36:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clockin](
	[Clockinid] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[Name] [nvarchar](10) NULL,
	[Gotowork] [datetime] NULL,
	[Gooffwork] [datetime] NULL,
 CONSTRAINT [PK_Clockin] PRIMARY KEY CLUSTERED 
(
	[Clockinid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departmental]    Script Date: 2020/9/21 16:36:32 ******/
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
/****** Object:  Table [dbo].[notice]    Script Date: 2020/9/21 16:36:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[datatime] [datetime] NOT NULL,
	[photo] [nvarchar](50) NULL,
 CONSTRAINT [PK_notice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[punishments]    Script Date: 2020/9/21 16:36:32 ******/
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
/****** Object:  Table [dbo].[Recruitment]    Script Date: 2020/9/21 16:36:32 ******/
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
/****** Object:  Table [dbo].[Stafftable]    Script Date: 2020/9/21 16:36:32 ******/
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
/****** Object:  Table [dbo].[Trainingform]    Script Date: 2020/9/21 16:36:32 ******/
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
/****** Object:  Table [dbo].[Wage]    Script Date: 2020/9/21 16:36:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[Name] [nvarchar](10) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[Month] [datetime] NOT NULL,
	[Basicwage] [decimal](18, 2) NOT NULL,
	[Overtime] [decimal](18, 2) NULL,
	[Gongz] [decimal](18, 2) NULL,
	[Insurance] [decimal](18, 2) NULL,
	[Real] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Wage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admini] ON 

INSERT [dbo].[Admini] ([Id], [Name], [Password], [UserNaem]) VALUES (1, N'zw        ', N'88888888', N'小紫薇')
SET IDENTITY_INSERT [dbo].[Admini] OFF
SET IDENTITY_INSERT [dbo].[Clockin] ON 

INSERT [dbo].[Clockin] ([Clockinid], [EmployeeID], [Name], [Gotowork], [Gooffwork]) VALUES (8, 1, N'紫薇', CAST(0x0000AD230150EB60 AS DateTime), CAST(0x0000AD23011826C0 AS DateTime))
INSERT [dbo].[Clockin] ([Clockinid], [EmployeeID], [Name], [Gotowork], [Gooffwork]) VALUES (9, 1, N'紫薇', CAST(0x0000AD230154F0C9 AS DateTime), CAST(0x0000AD23011826C0 AS DateTime))
INSERT [dbo].[Clockin] ([Clockinid], [EmployeeID], [Name], [Gotowork], [Gooffwork]) VALUES (10, 1, N'紫薇', CAST(0x0000AD2301550381 AS DateTime), CAST(0x0000AD23011826C0 AS DateTime))
INSERT [dbo].[Clockin] ([Clockinid], [EmployeeID], [Name], [Gotowork], [Gooffwork]) VALUES (11, 4, N'小洋', CAST(0x0000AD230155CF43 AS DateTime), CAST(0x0000AD23011826C0 AS DateTime))
INSERT [dbo].[Clockin] ([Clockinid], [EmployeeID], [Name], [Gotowork], [Gooffwork]) VALUES (12, 1, N'紫薇', CAST(0x0000AD240133D970 AS DateTime), CAST(0x0000AD24011826C0 AS DateTime))
INSERT [dbo].[Clockin] ([Clockinid], [EmployeeID], [Name], [Gotowork], [Gooffwork]) VALUES (1002, 2016, N'小胖', CAST(0x0000AD2F0107981B AS DateTime), CAST(0x0000AD2F011826C0 AS DateTime))
INSERT [dbo].[Clockin] ([Clockinid], [EmployeeID], [Name], [Gotowork], [Gooffwork]) VALUES (1003, 2018, N'小六', CAST(0x0000AD2F010DCDEF AS DateTime), CAST(0x0000AD2F011826C0 AS DateTime))
INSERT [dbo].[Clockin] ([Clockinid], [EmployeeID], [Name], [Gotowork], [Gooffwork]) VALUES (1004, 2020, N'小唐', CAST(0x0000AD18016AD5BB AS DateTime), CAST(0x0000AD18011826C0 AS DateTime))
SET IDENTITY_INSERT [dbo].[Clockin] OFF
SET IDENTITY_INSERT [dbo].[Departmental] ON 

INSERT [dbo].[Departmental] ([DepartmentID], [DepartmentName], [DepartmentNun], [Introduction], [Basic]) VALUES (1, N'研发部', N'产品的研发', N'10', CAST(4000.00 AS Numeric(18, 2)))
INSERT [dbo].[Departmental] ([DepartmentID], [DepartmentName], [DepartmentNun], [Introduction], [Basic]) VALUES (2, N'销售部门', N'负责产品的销售', N'10', CAST(3600.00 AS Numeric(18, 2)))
INSERT [dbo].[Departmental] ([DepartmentID], [DepartmentName], [DepartmentNun], [Introduction], [Basic]) VALUES (3, N'实施部门', N'产品的对接，与产品后期的维护', N'10', CAST(3500.00 AS Numeric(18, 2)))
INSERT [dbo].[Departmental] ([DepartmentID], [DepartmentName], [DepartmentNun], [Introduction], [Basic]) VALUES (4, N'测试部门', N'测试产品和提出问题所在', N'5', CAST(3500.00 AS Numeric(18, 2)))
INSERT [dbo].[Departmental] ([DepartmentID], [DepartmentName], [DepartmentNun], [Introduction], [Basic]) VALUES (5, N'策划部门', N'产品的策划与后期的发展方向', N'6', CAST(4200.00 AS Numeric(18, 2)))
INSERT [dbo].[Departmental] ([DepartmentID], [DepartmentName], [DepartmentNun], [Introduction], [Basic]) VALUES (6, N'产品规划部门', N'对公司的相关产品的规划', N'5', CAST(3600.00 AS Numeric(18, 2)))
INSERT [dbo].[Departmental] ([DepartmentID], [DepartmentName], [DepartmentNun], [Introduction], [Basic]) VALUES (7, N'产品测试部门', N'测试产品和提出问题所在', N'5', CAST(3200.00 AS Numeric(18, 2)))
INSERT [dbo].[Departmental] ([DepartmentID], [DepartmentName], [DepartmentNun], [Introduction], [Basic]) VALUES (8, N'产品设计部门', N'进行产品的设计', N'5', CAST(4100.00 AS Numeric(18, 2)))
INSERT [dbo].[Departmental] ([DepartmentID], [DepartmentName], [DepartmentNun], [Introduction], [Basic]) VALUES (9, N'产品设计部', N'设计相关产品', N'5', CAST(3200.00 AS Numeric(18, 2)))
INSERT [dbo].[Departmental] ([DepartmentID], [DepartmentName], [DepartmentNun], [Introduction], [Basic]) VALUES (10, N'规划部门', N'产品的规划', N'5', CAST(3300.00 AS Numeric(18, 2)))
SET IDENTITY_INSERT [dbo].[Departmental] OFF
SET IDENTITY_INSERT [dbo].[notice] ON 

INSERT [dbo].[notice] ([id], [name], [Content], [datatime], [photo]) VALUES (1, N'人员调整', N'公司人员的调整', CAST(0x0000ACFF010D5E9F AS DateTime), N'1.jpg')
INSERT [dbo].[notice] ([id], [name], [Content], [datatime], [photo]) VALUES (2, N'端午放假通知', N'端午放假通知：<br />
&nbsp; &nbsp; &nbsp; &nbsp;端午响应国家号召，听从国家的安排，特此通知全员放假三天，<br />
特此通知！<br />
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 祝大家假日愉快！', CAST(0x0000ACFF011843E5 AS DateTime), N'2.jpg')
INSERT [dbo].[notice] ([id], [name], [Content], [datatime], [photo]) VALUES (3, N'企业文化', N'<p style="margin: 0px; padding: 0px; font-family: arial, &quot;pingfang sc&quot;, stheiti, simsun, sans-serif; text-indent: 2em; line-height: 25px; color: rgb(51, 51, 51); font-size: 14px;">
	&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 企业文化<br />
	&nbsp; &nbsp; &nbsp; &nbsp;企业文化，或称组织文化（Corporate Culture或Organizational Culture），是一个组织由其价值观、信念、仪式、符号、处事方式等组成的其特有的文化形象，简单而言，就是企业在日常运行中所表现出的各方各面。</p>
<p style="margin: 0px; padding: 0px; font-family: arial, &quot;pingfang sc&quot;, stheiti, simsun, sans-serif; text-indent: 2em; line-height: 25px; color: rgb(51, 51, 51); font-size: 14px;">
	职工文化，也称企业职员文化，是与企业文化相对应的文化形态，职工文化以职工为本，是一种素质文化，企业文化以企业为本，是一种管理文化。<sup style="margin-right: 2px; line-height: 0;"><a href="https://baike.sogou.com/v73053.htm?fromTitle=%E4%BC%81%E4%B8%9A%E6%96%87%E5%8C%96#quote1" style="color: rgb(51, 102, 204); text-decoration-line: none;">[1]</a><a name="ref_1"></a></sup></p>
<p style="margin: 0px; padding: 0px; font-family: arial, &quot;pingfang sc&quot;, stheiti, simsun, sans-serif; text-indent: 2em; line-height: 25px; color: rgb(51, 51, 51); font-size: 14px;">
	企业文化是在一定的条件下，企业生产经营和管理活动中所创造的具有该企业特色的精神财富和物质形态。它包括文化观念、价值观念、企业精神、道德规范、行为准则、历史传统、企业制度、文化环境、企业产品等。其中价值观是企业文化的核心。</p>
<p style="margin: 0px; padding: 0px; font-family: arial, &quot;pingfang sc&quot;, stheiti, simsun, sans-serif; text-indent: 2em; line-height: 25px; color: rgb(51, 51, 51); font-size: 14px;">
	企业文化是<a class="ed_inner_link" href="https://baike.sogou.com/lemma/ShowInnerLink.htm?lemmaId=82313799&amp;ss_c=ssc.citiao.link" style="color: rgb(51, 102, 204); text-decoration-line: none;" target="_blank">企业的灵魂</a>，是推动企业发展的不竭动力。它包含着非常丰富的内容，其核心是企业的精神和价值观。这里的价值观不是泛指企业管理中的各种文化现象，而是企业或企业中的员工在从事经营活动中所秉持的价值观念。</p>
', CAST(0x0000ACFF011C89CC AS DateTime), N'1.jpg')
INSERT [dbo].[notice] ([id], [name], [Content], [datatime], [photo]) VALUES (4, N'大家上午好', N'大家上午好，我的你们的部门总管，大家好好工作就有', CAST(0x0000AD050090B927 AS DateTime), N'4.jpg')
INSERT [dbo].[notice] ([id], [name], [Content], [datatime], [photo]) VALUES (1004, N'企业团建', N'全体员工进行添加，请大家务必参加', CAST(0x0000AD110106AAB9 AS DateTime), N'图片一.jpg')
INSERT [dbo].[notice] ([id], [name], [Content], [datatime], [photo]) VALUES (1005, N'企业团建', N'要求全体员工共同参加', CAST(0x0000AD11010D6D7D AS DateTime), N'图片一.jpg')
INSERT [dbo].[notice] ([id], [name], [Content], [datatime], [photo]) VALUES (1006, N'企业年会', N'全体员工表彰大会，及年度总结，全体员工一起参加', CAST(0x0000AD18016A8D69 AS DateTime), N'图片一.jpg')
SET IDENTITY_INSERT [dbo].[notice] OFF
SET IDENTITY_INSERT [dbo].[punishments] ON 

INSERT [dbo].[punishments] ([EventsID], [EmployeeID], [Name], [Reason], [Datatime], [Amount]) VALUES (1, 1, N'紫薇', N'先进员工', CAST(0x0000ACFB017E7977 AS DateTime), N'200')
INSERT [dbo].[punishments] ([EventsID], [EmployeeID], [Name], [Reason], [Datatime], [Amount]) VALUES (2, 1, N'紫薇', N'劳动先锋', CAST(0x0000ACFB017E7977 AS DateTime), N'200')
INSERT [dbo].[punishments] ([EventsID], [EmployeeID], [Name], [Reason], [Datatime], [Amount]) VALUES (3, 3, N'小旋', N'公司榜样', CAST(0x0000ACFD009BC987 AS DateTime), N'奖励现金100')
INSERT [dbo].[punishments] ([EventsID], [EmployeeID], [Name], [Reason], [Datatime], [Amount]) VALUES (4, 6, N'冬冬', N'三好员工', CAST(0x0000ACFE009CF134 AS DateTime), N'奖励现金100')
INSERT [dbo].[punishments] ([EventsID], [EmployeeID], [Name], [Reason], [Datatime], [Amount]) VALUES (1004, 2017, N'小张', N'三好员工', CAST(0x0000AD110105F4EA AS DateTime), N'奖励现金500')
INSERT [dbo].[punishments] ([EventsID], [EmployeeID], [Name], [Reason], [Datatime], [Amount]) VALUES (1005, 2018, N'小八', N'三好员工', CAST(0x0000AD11010D0F96 AS DateTime), N'奖励现金500')
INSERT [dbo].[punishments] ([EventsID], [EmployeeID], [Name], [Reason], [Datatime], [Amount]) VALUES (1006, 2020, N'小唐', N'三好员工', CAST(0x0000AD18016A223E AS DateTime), N'奖励现金200')
SET IDENTITY_INSERT [dbo].[punishments] OFF
SET IDENTITY_INSERT [dbo].[Recruitment] ON 

INSERT [dbo].[Recruitment] ([RecruitmentID], [Name], [Phone], [Age], [Sex], [Nativeplace], [Education], [Position], [Photos], [DepartmentID], [Introduction]) VALUES (2, N'盲僧僧', N'13787990858', N'21        ', N'男 ', N'湖南永州', N'大专', N'员工', N'5.jpg        ', 1, N'无')
SET IDENTITY_INSERT [dbo].[Recruitment] OFF
SET IDENTITY_INSERT [dbo].[Stafftable] ON 

INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (1, N'紫薇', N'男 ', 22, N'18573028898  ', 1, CAST(0x0000ACEB0175FBD8 AS DateTime), N'3.jpg', N'经理', N'本科', N'zw                ', N'123456', N'湖南岳阳')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (2, N'嘻嘻嘻', N'男 ', 21, N'14785236987  ', 1, CAST(0x0000ACF000AF7271 AS DateTime), N'1.jpg', N'员工', N'本科', N'aa1               ', N'1233456', N'湖南永州')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (3, N'小旋', N'男 ', 21, N'12345677890  ', 1, CAST(0x0000ACF000B43AF0 AS DateTime), N'1.jpg     ', N'员工', N'本科', N'aa2               ', N'123456', N'湖南永州')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (4, N'小洋', N'男 ', 22, N'12345678911  ', 2, CAST(0x0000ACF4010A3250 AS DateTime), N'2.jpg', N'员工', N'专科', N'xy                ', N'123456', N'湖南郴州')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (5, N'小微', N'女 ', 24, N'11111111111  ', 3, CAST(0x0000ACF4010A7D21 AS DateTime), N'3.jpg', N'经理', N'博士', N'xw                ', N'123456', N'湖南岳阳')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (6, N'冬冬', N'男 ', 22, N'15467895241  ', 2, CAST(0x0000ACF4010AB639 AS DateTime), N'4.jpg', N'员工', N'专科', N'aa                ', N'1233456', N'湖南岳阳')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (7, N'铁子', N'女 ', 22, N'12547854784  ', 3, CAST(0x0000ACF4010B2339 AS DateTime), N'4.jpg', N'员工', N'本科', N'aa3               ', N'1233456', N'湖南常德')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (9, N'盲僧僧', N'男 ', 21, N'12345679811  ', 2, CAST(0x0000ACF401130D3B AS DateTime), N'3.jpg', N'部门总管', N'本科', N'aa4               ', N'123456', N'湖南永州')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (10, N'小旋', N'男 ', 21, N'12345677890  ', 1, CAST(0x0000ACF800B9C8C1 AS DateTime), N'1.jpg     ', N'员工', N'本科', N'aa5               ', N'123456', N'湖南永州')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (11, N'盲僧僧2', N'女 ', 21, N'12345679811  ', 3, CAST(0x0000ACF8012693F5 AS DateTime), N'5.jpg', N'部门经理', N'本科', N'aa6               ', N'123456', N'湖南永州')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (12, N'小苏打', N'女 ', 21, N'12345678900  ', 2, CAST(0x0000ACF8012829E4 AS DateTime), N'1.jpg', N'部门总管', N'本科', N'xsd               ', N'123456', N'湖南永州')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (13, N'小菜', N'女 ', 21, N'12345679811  ', 2, CAST(0x0000ACF80128CFFA AS DateTime), N'4.jpg', N'部门经理', N'本科', N'xiaoxuan          ', N'123456', N'湖南永州')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (14, N'昆昆', N'女 ', 21, N'12345679811  ', 1, CAST(0x0000ACFE00A17ED8 AS DateTime), N'1.jpg', N'部门总管', N'硕士', N'kk                ', N'1123456', N'湖南岳阳')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (15, N'小沈', N'男 ', 24, N'12345678911  ', 5, CAST(0x0000ACFF0101A338 AS DateTime), N'3.jpg     ', N'部门经理', N'本科', N'aa7               ', N'123456', N'湖南长沙')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (16, N'晓东', N'女 ', 21, N'12345679811  ', 4, CAST(0x0000ACFF0101D159 AS DateTime), N'3.jpg', N'员工', N'硕士', N'xd                ', N'123456', N'湖南长沙')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (1014, N'阿三', N'男 ', 19, N'12345679811  ', 2, CAST(0x0000AD020101C07B AS DateTime), N'4.jpg', N'部门经理', N'博士', N'as8               ', N'123456', N'湖南永州')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (1015, N'小冬', N'女 ', 21, N'18573028898  ', 5, CAST(0x0000AD05008ED43B AS DateTime), N'2.jpg', N'部门总管', N'本科', N'xdd               ', N'213456', N'广东广州')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (1016, N'小七', N'女 ', 20, N'18573028898  ', 5, CAST(0x0000AD060132C2C8 AS DateTime), N'3.jpg', N'部门总管', N'本科', N'xq                ', N'123456', N'湖南岳阳')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (1017, N'下巴', N'男 ', 21, N'1234567890   ', 4, CAST(0x0000AD0601330637 AS DateTime), N'2.jpg     ', N'员工', N'硕士', N'aa                ', N'123456', N'湖南长沙')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (2015, N'小紫薇', N'女 ', 20, N'18573088898  ', 6, CAST(0x0000AD1101014CF5 AS DateTime), N'图片一.jpg', N'员工', N'本科', N'xzw               ', N'123456', N'湖南常德')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (2016, N'小胖', N'男 ', 21, N'18573088898  ', 1, CAST(0x0000AD1101046298 AS DateTime), N'图片一.jpg', N'员工', N'本科', N'xiaop             ', N'123456', N'湖南常德')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (2017, N'小张', N'男 ', 20, N'13574028898  ', 7, CAST(0x0000AD110104D706 AS DateTime), N'图片一.jpg   ', N'部门总管', N'硕士', N'aa                ', N'123456', N'湖南岳阳')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (2018, N'小六', N'男 ', 22, N'18573028898  ', 8, CAST(0x0000AD00010B34B0 AS DateTime), N'图片一.jpg', N'员工', N'本科', N'xiaob             ', N'123456', N'湖南岳阳')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (2019, N'小酒', N'女 ', 21, N'18573028898  ', 6, CAST(0x0000AD99010B95D9 AS DateTime), N'图片一.jpg   ', N'部门总管', N'硕士', N'aa                ', N'123456', N'湖南常德')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (2020, N'小唐', N'男 ', 20, N'18573028898  ', 10, CAST(0x0000AD180168BEC8 AS DateTime), N'图片一.jpg', N'员工', N'本科', N'xt                ', N'123456', N'湖南常德')
INSERT [dbo].[Stafftable] ([EmployeeID], [Name], [Sex], [Age], [Telephone], [DepartmentID], [EntryTime], [Photos], [Position], [Education], [UserName], [Password], [Nativeplace]) VALUES (2021, N'小冬冬', N'男 ', 20, N'13787990289  ', 1, CAST(0x0000AD1801691A6F AS DateTime), N'图片一.jpg   ', N'部门总管', N'硕士', N'aa                ', N'123456', N'湖南岳阳')
SET IDENTITY_INSERT [dbo].[Stafftable] OFF
SET IDENTITY_INSERT [dbo].[Trainingform] ON 

INSERT [dbo].[Trainingform] ([TrainingID], [Nametraining], [Personnel], [Location], [Reason], [Datatime], [Datatimes]) VALUES (1, N'员工技能培训', N'公司大厅      ', N'1 2 3', N'提高员工的技能', CAST(0x0000ACF40109AEF4 AS DateTime), CAST(0x0000ACFD00C5C100 AS DateTime))
INSERT [dbo].[Trainingform] ([TrainingID], [Nametraining], [Personnel], [Location], [Reason], [Datatime], [Datatimes]) VALUES (4, N'广播体超', N'公司前广场     ', N'1 3 4 5', N'锻炼身体', CAST(0x0000ACFE00735B40 AS DateTime), CAST(0x0000ACFE007B98A0 AS DateTime))
INSERT [dbo].[Trainingform] ([TrainingID], [Nametraining], [Personnel], [Location], [Reason], [Datatime], [Datatimes]) VALUES (5, N'企业团建', N'梅溪湖       ', N'全体', N'加强公司内部交流', CAST(0x0000ACF20107AC00 AS DateTime), CAST(0x0000ACF30083D600 AS DateTime))
INSERT [dbo].[Trainingform] ([TrainingID], [Nametraining], [Personnel], [Location], [Reason], [Datatime], [Datatimes]) VALUES (6, N'企业团建', N'梅溪湖       ', N'全体成员', N'加强企业内部交流', CAST(0x0000ACF20107AC00 AS DateTime), CAST(0x0000ACF3008C1360 AS DateTime))
INSERT [dbo].[Trainingform] ([TrainingID], [Nametraining], [Personnel], [Location], [Reason], [Datatime], [Datatimes]) VALUES (7, N'企业团建', N'梅溪湖       ', N'全体成员', N'加强企业内部交流', CAST(0x0000ACF20107AC00 AS DateTime), CAST(0x0000ACF20107AC00 AS DateTime))
INSERT [dbo].[Trainingform] ([TrainingID], [Nametraining], [Personnel], [Location], [Reason], [Datatime], [Datatimes]) VALUES (8, N'企业年会', N'酒店        ', N'全体人员', N'员工动员', CAST(0x0000AE10011826C0 AS DateTime), CAST(0x0000AE10016A8C80 AS DateTime))
SET IDENTITY_INSERT [dbo].[Trainingform] OFF
SET IDENTITY_INSERT [dbo].[Wage] ON 

INSERT [dbo].[Wage] ([ID], [EmployeeID], [Name], [DepartmentID], [Month], [Basicwage], [Overtime], [Gongz], [Insurance], [Real]) VALUES (2, 1, N'紫薇', 1, CAST(0x0000AD2200000000 AS DateTime), CAST(4500.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(7000.00 AS Decimal(18, 2)))
INSERT [dbo].[Wage] ([ID], [EmployeeID], [Name], [DepartmentID], [Month], [Basicwage], [Overtime], [Gongz], [Insurance], [Real]) VALUES (3, 1, N'紫薇', 1, CAST(0x0000AD4100000000 AS DateTime), CAST(4500.00 AS Decimal(18, 2)), CAST(3200.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(8300.00 AS Decimal(18, 2)))
INSERT [dbo].[Wage] ([ID], [EmployeeID], [Name], [DepartmentID], [Month], [Basicwage], [Overtime], [Gongz], [Insurance], [Real]) VALUES (11, 4, N'小洋', 2, CAST(0x0000AD5900000000 AS DateTime), CAST(3600.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(6100.00 AS Decimal(18, 2)))
INSERT [dbo].[Wage] ([ID], [EmployeeID], [Name], [DepartmentID], [Month], [Basicwage], [Overtime], [Gongz], [Insurance], [Real]) VALUES (12, 1014, N'阿三', 2, CAST(0x0000AD5800000000 AS DateTime), CAST(3600.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(800.00 AS Decimal(18, 2)), CAST(6600.00 AS Decimal(18, 2)))
INSERT [dbo].[Wage] ([ID], [EmployeeID], [Name], [DepartmentID], [Month], [Basicwage], [Overtime], [Gongz], [Insurance], [Real]) VALUES (16, 1, N'紫薇', 1, CAST(0x0000AD8000000000 AS DateTime), CAST(4000.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(6500.00 AS Decimal(18, 2)))
INSERT [dbo].[Wage] ([ID], [EmployeeID], [Name], [DepartmentID], [Month], [Basicwage], [Overtime], [Gongz], [Insurance], [Real]) VALUES (17, 1, N'紫薇', 1, CAST(0x0000AD5A00000000 AS DateTime), CAST(4000.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(6500.00 AS Decimal(18, 2)))
INSERT [dbo].[Wage] ([ID], [EmployeeID], [Name], [DepartmentID], [Month], [Basicwage], [Overtime], [Gongz], [Insurance], [Real]) VALUES (1007, 1, N'紫薇', 1, CAST(0x0000AD2F00000000 AS DateTime), CAST(4000.00 AS Decimal(18, 2)), CAST(2100.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(6600.00 AS Decimal(18, 2)))
INSERT [dbo].[Wage] ([ID], [EmployeeID], [Name], [DepartmentID], [Month], [Basicwage], [Overtime], [Gongz], [Insurance], [Real]) VALUES (1008, 6, N'冬冬', 2, CAST(0x0000AD2F00000000 AS DateTime), CAST(3600.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(600.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(6500.00 AS Decimal(18, 2)))
INSERT [dbo].[Wage] ([ID], [EmployeeID], [Name], [DepartmentID], [Month], [Basicwage], [Overtime], [Gongz], [Insurance], [Real]) VALUES (1009, 4, N'小洋', 2, CAST(0x0000AD2F00000000 AS DateTime), CAST(3600.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(6100.00 AS Decimal(18, 2)))
INSERT [dbo].[Wage] ([ID], [EmployeeID], [Name], [DepartmentID], [Month], [Basicwage], [Overtime], [Gongz], [Insurance], [Real]) VALUES (1011, 2016, N'小胖', 1, CAST(0x0000AD2700000000 AS DateTime), CAST(4000.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(6500.00 AS Decimal(18, 2)))
INSERT [dbo].[Wage] ([ID], [EmployeeID], [Name], [DepartmentID], [Month], [Basicwage], [Overtime], [Gongz], [Insurance], [Real]) VALUES (1012, 2018, N'小八', 8, CAST(0x0000AD2F00000000 AS DateTime), CAST(4100.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(6600.00 AS Decimal(18, 2)))
INSERT [dbo].[Wage] ([ID], [EmployeeID], [Name], [DepartmentID], [Month], [Basicwage], [Overtime], [Gongz], [Insurance], [Real]) VALUES (1013, 2020, N'小唐', 10, CAST(0x0000AD1800000000 AS DateTime), CAST(3300.00 AS Decimal(18, 2)), CAST(2000.00 AS Decimal(18, 2)), CAST(200.00 AS Decimal(18, 2)), CAST(300.00 AS Decimal(18, 2)), CAST(5800.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Wage] OFF
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
ALTER TABLE [dbo].[Clockin]  WITH CHECK ADD  CONSTRAINT [FK_Clockin_Stafftable] FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[Stafftable] ([EmployeeID])
GO
ALTER TABLE [dbo].[Clockin] CHECK CONSTRAINT [FK_Clockin_Stafftable]
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
