/****** Check to see if database already exists and if so delete ******/
IF EXISTS(SELECT 1 FROM master.dbo.sysdatabases WHERE name = 'AppRepairsv2') 
BEGIN
DROP DATABASE AppRepairsv2
END
GO

CREATE DATABASE AppRepairsv2
GO

USE [AppRepairsv2]
GO


/****** Table [dbo].[Products] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[Products](
	[ProductCode] [char](10) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[YearsWarranty] [int] NOT NULL,
	[ReleaseDate] [dateTime] NOT NULL,

 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Products] ([ProductCode], [Name], [YearsWarranty], [ReleaseDate]) VALUES (N'DV5600     ', N'Electric Front-Load Dryer (Onyx)', 5, CAST(0x00008EDE00000000 AS DateTime))
INSERT [dbo].[Products] ([ProductCode], [Name], [YearsWarranty], [ReleaseDate]) VALUES (N'DV8700     ', N'Electric Top-Load Dryer (Stainless Platinum)', 5, CAST(0x00008E9200000000 AS DateTime))
INSERT [dbo].[Products] ([ProductCode], [Name], [YearsWarranty], [ReleaseDate]) VALUES (N'DW80H9950  ', N'24 In. Dishwasher with Waterwall Technology', 3, CAST(0x00008E2F00000000 AS DateTime))
INSERT [dbo].[Products] ([ProductCode], [Name], [YearsWarranty], [ReleaseDate]) VALUES (N'DW80J32020 ', N'24 In. Built-In Dishwasher Stainless Steel Tub', 3, CAST(0x00008EE200000000 AS DateTime))
INSERT [dbo].[Products] ([ProductCode], [Name], [YearsWarranty], [ReleaseDate]) VALUES (N'FE710DRS   ', N'Free Standing Self Clean Electric Range', 2, CAST(0x00008EDC00000000 AS DateTime))
INSERT [dbo].[Products] ([ProductCode], [Name], [YearsWarranty], [ReleaseDate]) VALUES (N'RF220NCTAS ', N'3-Door French Refridgerator Black', 3, CAST(0x00008E9600000000 AS DateTime))
INSERT [dbo].[Products] ([ProductCode], [Name], [YearsWarranty], [ReleaseDate]) VALUES (N'RF260BEAEB ', N'French Door Refridgerator Stainless Steel', 3, CAST(0x00008ED000000000 AS DateTime))
INSERT [dbo].[Products] ([ProductCode], [Name], [YearsWarranty], [ReleaseDate]) VALUES (N'WA8700     ', N'Top-Load Washer (Stainless Platinum)', 5, CAST(0x00008E9200000000 AS DateTime))
INSERT [dbo].[Products] ([ProductCode], [Name], [YearsWarranty], [ReleaseDate]) VALUES (N'RWF9100    ', N'Front-Load Washer (Onyx)', 5, CAST(0x00008EDE00000000 AS DateTime))


/****** Table [dbo].[Technicians] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Technicians]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Technicians](
	[TechID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Phone] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Technicians] PRIMARY KEY CLUSTERED 
(
	[TechID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Technicians] ON
INSERT [dbo].[Technicians] ([TechID], [Name], [Email], [Phone]) VALUES (284, N'Jamie Briggs ', N'jbriggs@tntappliances.com', N'800-294-5873')
INSERT [dbo].[Technicians] ([TechID], [Name], [Email], [Phone]) VALUES (296, N'Todd Anderson', N'jtanderson@tntappliances.com', N'800-294-1112')
INSERT [dbo].[Technicians] ([TechID], [Name], [Email], [Phone]) VALUES (288, N'Tim Neilson', N'tneilson@tntappliances.com', N'800-294-2586')
INSERT [dbo].[Technicians] ([TechID], [Name], [Email], [Phone]) VALUES (289, N'Richard Kent', N'rkent@tntappliances.com', N'800-294-7788')
INSERT [dbo].[Technicians] ([TechID], [Name], [Email], [Phone]) VALUES (301, N'Johnathon Chung', N'jchung@tntappliances.com', N'800-294-1524')
SET IDENTITY_INSERT [dbo].[Technicians] OFF


/****** Table [dbo].[Customers] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customers]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1000,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[City] [varchar](20) NOT NULL,
	[State] [char](2) NOT NULL,
	[ZipCode] [varchar](9) NOT NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1002, N'Kenneth McDonald', N'Sacramento', N'CA', N'98564', N'(559) 865-1158', N'kmcdonald@gmail.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1004, N'Julia Reid', N'Los Angeles', N'CA', N'90025', N'(800) 475-7775', N'juliar@yahoo.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1006, N'Tina Streights', N'Sacramento', N'CA', N'95827', N'(916) 852-8540', N'ts756@gmail.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1008, N'Anton Murdoch', N'San Francisco', N'CA', N'94152', N'(800) 785-8651', N'antonmurdoch@gmail.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1010, N'Tim Nicks', N'Fresno', N'CA', N'937182069', N'(559) 654-2578', N'timnicks87@outlook.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1012, N'Jose Sanchez', N'Fresno', N'CA', N'937262328', N'(559) 541-1578', N'josesanchez@bros2smallengines.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1015, N'Guillermo Mura', N'Mission Viejo', N'CA', N'92691', N'(559) 534-8657', N'')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1016, N'Laura Morrison', N'Fresno', N'CA', N'937181024', N'(559) 754-3005', N'lmorrison@yahoo.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1017, N'Kim Green', N'Fresno', N'CA', N'98525', N'(559) 845-8855', N'kgreen@ace.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1018, N'Jan Arden', N'Anaheim', N'CA', N'97842', N'(559) 553-4535', N'jan@janarden.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1019, N'Alexander Jericho', N'Fresno', N'CA', N'937061039', N'(559) 665-2548', N'alex86453@gmail.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1023, N'June Irvin', N'Sacramento', N'CA', N'9682', N'(559) 557-9555', N'juneirvin@gmail.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1026, N'Kelsey Majors', N'Sacramento', N'CA', N'22101', N'(559) 455-9555', N'chasingstars847@hotmail.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1027, N'Trent Mansfeld', N'Fresno', N'CA', N'96245', N'(559) 220-8040', N'messence@mma.rrbowker.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1029, N'Cameron Law', N'San Francisco', N'CA', N'94161', N'(800) 558-4354', N'trent@ltbd.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1030, N'Lance Augustine', N'Selma', N'CA', N'93662', N'(559) 560-5485', N'lancea@hotmail.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1033, N'Julia Terrence', N'Fresno', N'CA', N'91285', N'(559) 354-4854', N'theterrences@gmail.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1034, N'Rita Khan', N'Sacramento', N'CA', N'90850', N'(559) 585-1484', N'ritajuly83@yahoo.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1037, N'Jeremy Morgan', N'Sacramento', N'CA', N'90038', N'(800) 785-4112', N'jmorgan@lasercardsinc.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1038, N'Mina Waldorf', N'Sacramento', N'CA', N'98639', N'(559) 285-0067', N'minastar55@hotmail.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1040, N'Gerald Skeitzer', N'Sacramento', N'CA', N'96351', N'(800) 550-6941', N'gskeitzer@outlook.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1045, N'Spencer Zillow', N'Sacramento', N'CA', N'90081', N'(800) 510-1879', N'spencez50@gmail.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1047, N'Robert Fields', N'Anaheim', N'CA', N'92807', N'(714) 892-8762', N'bobfields@gmail.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1048, N'Tasha Williams', N'Seattle', N'WA', N'98101', N'(856) 882-1119', N'tashwilliams@gmail.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1049, N'K''esha Teins', N'Seattle', N'WA', N'98113', N'(856) 792-5286', N'kteins89@yahoo.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1050, N'Gregory Watkins', N'Seattle', N'WA', N'98122', N'(856) 596-8425', N'gregwatkins78@gmail.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1051, N'Jen Benyard', N'Portland', N'OR', N'97201', N'(965) 285-1010', N'jenben@hotmail.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1052, N'Tina Mason', N'Portland', N'OR', N'97201', N'(965) 986-1078', N'tinamason@ltereporting.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1053, N'Jerry Wilde', N'Portland', N'OR', N'97218', N'(965) 882-7859', N'jjwilde84@hotmail.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1054, N'C.J. Banks', N'Portland', N'OR', N'97233', N'(983) 555-7512', N'cjb@petersontowing.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1055, N'Lois Kindleir', N'Portland', N'OR', N'97205', N'(965) 863-2253', N'loispkindleir@yahoo.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1056, N'Rudy Thompson', N'Reno', N'NV', N'89504', N'(791) 877-7792', N'rudyt@yahoo.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1057, N'Kent Baker', N'Reno', N'NV', N'89501', N'(791) 587-2999', N'kenty21@gmail.com')
INSERT [dbo].[Customers] ([CustomerID], [Name], [City], [State], [ZipCode], [Phone], [Email]) VALUES (1058, N'Julie Sanchez', N'Reno', N'NV', N'89504', N'(791) 852-1788', N'jsanchez@paulaflorals.com')

SET IDENTITY_INSERT [dbo].[Customers] OFF


/****** Table [dbo].[Registrations] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Registrations]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Registrations](
	[CustomerID] [int] NOT NULL,
	[ProductCode] [char](10) NOT NULL,
	[RegistrationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Registrations] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[ProductCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1002, N'DV5600     ', CAST(0x00009CF100000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1002, N'RWF9100    ', CAST(0x00009CF100000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1004, N'DV8700     ', CAST(0x00009BE800000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1004, N'WA8700     ', CAST(0x00009B5900000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1004, N'FE710DRS   ', CAST(0x00009BEA00000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1006, N'RF260BEAEB ', CAST(0x00009D2100000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1008, N'RF260BEAEB ', CAST(0x00009CB600000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1008, N'DV5600     ', CAST(0x00009B8100000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1008, N'RWF9100    ', CAST(0x00009E3F00000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1008, N'FE710DRS   ', CAST(0x00009ACD00000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1010, N'FE710DRS   ', CAST(0x00009BDB00000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1012, N'FE710DRS   ', CAST(0x00009C2D00000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1012, N'RF260BEAEB ', CAST(0x00009C2D00000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1015, N'F220NCTAS  ', CAST(0x00009AFD00000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1016, N'F220NCTAS  ', CAST(0x00009E2E00000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1017, N'F220NCTAS  ', CAST(0x00009C6000000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1018, N'RF260BEAEB ', CAST(0x00009E6000000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1018, N'DW80J32020 ', CAST(0x00009B0300000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1019, N'DW80J32020 ', CAST(0x00009E5200000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1023, N'DW80J32020 ', CAST(0x00009DD000000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1026, N'DW80H9950  ', CAST(0x00009BC000000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1027, N'DW80H9950  ', CAST(0x00009D9500000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1029, N'DV8700     ', CAST(0x00009D0200000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1029, N'WA8700     ', CAST(0x00009E5A00000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1030, N'RF220NCTAS ', CAST(0x00009BC200000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1033, N'RF260BEAEB ', CAST(0x00009B3B00000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1034, N'RF220NCTAS ', CAST(0x00009ADF00000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1034, N'RWF9100    ', CAST(0x00009D7D00000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1034, N'DV5600     ', CAST(0x00009E3600000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1037, N'DW80H9950  ', CAST(0x00009D9100000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1038, N'DW80J32020 ', CAST(0x00009BC100000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1038, N'RF260BEAEB ', CAST(0x00009ACE00000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1040, N'RF220NCTAS ', CAST(0x00009AD200000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1045, N'RF260BEAEB ', CAST(0x00009D5800000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1047, N'DW80H9950  ', CAST(0x00009D7600000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1047, N'DV5600     ', CAST(0x00009E3B00000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1047, N'RWF9100    ', CAST(0x00009DA000000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1058, N'FE710DRS   ', CAST(0x00009DA800000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1050, N'WA8700     ', CAST(0x00009DBA00000000 AS DateTime))
INSERT [dbo].[Registrations] ([CustomerID], [ProductCode], [RegistrationDate]) VALUES (1053, N'RWF9100    ', CAST(0x00009DCC00000000 AS DateTime))


/****** Table [dbo].[Repairs] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Repairs]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Repairs](
	[RepairID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ProductCode] [char](10) NOT NULL,
	[TechID] [int] NULL,
	[DateReported] [datetime] NOT NULL,
	[DateRepaired] [datetime] NULL,
	[Title] [varchar](50) NOT NULL,
	[Description] [varchar](2000) NOT NULL,
 CONSTRAINT [PK_Repairs] PRIMARY KEY CLUSTERED 
(
	[RepairID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Repairs] ON
INSERT [dbo].[Repairs] ([RepairID], [CustomerID], [ProductCode], [TechID], [DateReported], [DateRepaired], [Title], [Description]) VALUES (1,  1010, N'FE710DRS    ', 284,  CAST(0x00009E2500000000 AS DateTime), CAST(0x00009E2600000000 AS DateTime), N'Will not turn on', N'Randomly stopped working.')
INSERT [dbo].[Repairs] ([RepairID], [CustomerID], [ProductCode], [TechID], [DateReported], [DateRepaired], [Title], [Description]) VALUES (2,  1017, N'F220NCTAS   ', 284,  CAST(0x00009E3400000000 AS DateTime), NULL, N'Freezer light not working', N'Works intermittently with some flickering, possible faulty wiring.')
INSERT [dbo].[Repairs] ([RepairID], [CustomerID], [ProductCode], [TechID], [DateReported], [DateRepaired], [Title], [Description]) VALUES (3,  1016, N'F220NCTAS   ', 296,  CAST(0x00009E3400000000 AS DateTime), NULL, N'Third tray needs replacement', N'Cracked through center.')
INSERT [dbo].[Repairs] ([RepairID], [CustomerID], [ProductCode], [TechID], [DateReported], [DateRepaired], [Title], [Description]) VALUES (4,  1008, N'DV5600      ', 288,  CAST(0x00009E3500000000 AS DateTime), CAST(0x00009E3800000000 AS DateTime), N'Unit needs replacing', N'Caught on fire with normal use, please replace entire unit.')
INSERT [dbo].[Repairs] ([RepairID], [CustomerID], [ProductCode], [TechID], [DateReported], [DateRepaired], [Title], [Description]) VALUES (5,  1047, N'RWF9100     ', 289,  CAST(0x00009FC100000000 AS DateTime), NULL, N'Water leaking', N'Small amounts of water leak through the door while running.')
INSERT [dbo].[Repairs] ([RepairID], [CustomerID], [ProductCode], [TechID], [DateReported], [DateRepaired], [Title], [Description]) VALUES (6,  1004, N'WA8700      ', 301,  CAST(0x00009E5600000000 AS DateTime), CAST(0x00009E5A00000000 AS DateTime), N'Agitator needs replacing', N'Agitator quit working, not sure how long it''s been out of operation.')
INSERT [dbo].[Repairs] ([RepairID], [CustomerID], [ProductCode], [TechID], [DateReported], [DateRepaired], [Title], [Description]) VALUES (7,  1012, N'RF260BEAEB  ', 284,  CAST(0x00009E5900000000 AS DateTime), CAST(0x00009E5B00000000 AS DateTime), N'Freezer not getting cold enough', N'Ice/foods will not stay frozen.')
INSERT [dbo].[Repairs] ([RepairID], [CustomerID], [ProductCode], [TechID], [DateReported], [DateRepaired], [Title], [Description]) VALUES (8,  1015, N'F220NCTAS   ', 288,  CAST(0x00009E5A00000000 AS DateTime), NULL, N'Right inside drawer not working smoothly', N'Drawer has been getting difficult to pull out or push in.')
INSERT [dbo].[Repairs] ([RepairID], [CustomerID], [ProductCode], [TechID], [DateReported], [DateRepaired], [Title], [Description]) VALUES (9,  1038, N'DW80J32020  ', 288,  CAST(0x00009E6500000000 AS DateTime), NULL, N'Venting error', N'Improper venting causing adjacent cabinet to crack.')
INSERT [dbo].[Repairs] ([RepairID], [CustomerID], [ProductCode], [TechID], [DateReported], [DateRepaired], [Title], [Description]) VALUES (10, 1047, N'RWF9100     ', 301,  CAST(0x00009E6600000000 AS DateTime), NULL, N'Water will not get hot', N'Hot cycles not getting very hot.')
INSERT [dbo].[Repairs] ([RepairID], [CustomerID], [ProductCode], [TechID], [DateReported], [DateRepaired], [Title], [Description]) VALUES (11, 1018, N'DW80J32020  ', 289,  CAST(0x00009E6600000000 AS DateTime), NULL, N'Dishwasher too loud', N'Customer believes the dishwasher is making more noise than it should.')
INSERT [dbo].[Repairs] ([RepairID], [CustomerID], [ProductCode], [TechID], [DateReported], [DateRepaired], [Title], [Description]) VALUES (12, 1016, N'F220NCTAS   ', NULL, CAST(0x00009E7000000000 AS DateTime), NULL, N'Fridge stopped working', N'Does not get cold and lights won''t turn on.')
INSERT [dbo].[Repairs] ([RepairID], [CustomerID], [ProductCode], [TechID], [DateReported], [DateRepaired], [Title], [Description]) VALUES (13, 1034, N'RWF9100     ', NULL, CAST(0x00009E7800000000 AS DateTime), NULL, N'Leaking water', N'Water leaks out the front while running.')
INSERT [dbo].[Repairs] ([RepairID], [CustomerID], [ProductCode], [TechID], [DateReported], [DateRepaired], [Title], [Description]) VALUES (14, 1045, N'RF260BEAEB  ', NULL, CAST(0x00009E8700000000 AS DateTime), NULL, N'Operates loudly', N'Customer complains that fridge is running far too loud.')
INSERT [dbo].[Repairs] ([RepairID], [CustomerID], [ProductCode], [TechID], [DateReported], [DateRepaired], [Title], [Description]) VALUES (15, 1012, N'FE710DRS    ', NULL, CAST(0x00009E8A00000000 AS DateTime), NULL, N'Top left burner not working', N'All other burners appear to perform normally.')
INSERT [dbo].[Repairs] ([RepairID], [CustomerID], [ProductCode], [TechID], [DateReported], [DateRepaired], [Title], [Description]) VALUES (16, 1010, N'FE710DRS    ', NULL, CAST(0x00009E9A00000000 AS DateTime), NULL, N'Interior glass cracked', N'Interior glass pane has a large crack spanning the entire width of viewing window. ')
INSERT [dbo].[Repairs] ([RepairID], [CustomerID], [ProductCode], [TechID], [DateReported], [DateRepaired], [Title], [Description]) VALUES (17, 1029, N'DV8700      ', NULL, CAST(0x00009E9C00000000 AS DateTime), NULL, N'Clunking noise will running.', N'Customer has noticed a cluncking noise with the past several uses.')
INSERT [dbo].[Repairs] ([RepairID], [CustomerID], [ProductCode], [TechID], [DateReported], [DateRepaired], [Title], [Description]) VALUES (18, 1058, N'FE710DRS    ', NULL, CAST(0x00009EA200000000 AS DateTime), NULL, N'2 burners failed.', N'Customer reports both left side burners do no work.')
INSERT [dbo].[Repairs] ([RepairID], [CustomerID], [ProductCode], [TechID], [DateReported], [DateRepaired], [Title], [Description]) VALUES (19, 1053, N'RWF9100     ', NULL, CAST(0x00009EA500000000 AS DateTime), NULL, N'Will not turn on.', N'Possible overheating - washer was run on hot cycle several times consecutively prior to failing.')
INSERT [dbo].[Repairs] ([RepairID], [CustomerID], [ProductCode], [TechID], [DateReported], [DateRepaired], [Title], [Description]) VALUES (20, 1050, N'WA8700      ', NULL, CAST(0x00009EE000000000 AS DateTime), NULL, N'Mouldy smell.', N'Customer has reported washer smelling mouldy despite only owning it for 3 months.')
SET IDENTITY_INSERT [dbo].[Repairs] OFF


/****** ForeignKey [FK_Registrations_Customers] ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Registrations_Customers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Registrations]'))
ALTER TABLE [dbo].[Registrations]  WITH CHECK ADD  CONSTRAINT [FK_Registrations_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Registrations_Customers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Registrations]'))
ALTER TABLE [dbo].[Registrations] CHECK CONSTRAINT [FK_Registrations_Customers]
GO


/****** ForeignKey [FK_Registrations_Products] ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Registrations_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[Registrations]'))
ALTER TABLE [dbo].[Registrations]  WITH NOCHECK ADD  CONSTRAINT [FK_Registrations_Products] FOREIGN KEY([ProductCode])
REFERENCES [dbo].[Products] ([ProductCode])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Registrations_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[Registrations]'))
ALTER TABLE [dbo].[Registrations] CHECK CONSTRAINT [FK_Registrations_Products]
GO


/****** ForeignKey [FK_Repairs_Customers] ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Repairs_Customers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Repairs]'))
ALTER TABLE [dbo].[Repairs]  WITH CHECK ADD  CONSTRAINT [FK_Repairs_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Repairs_Customers]') AND parent_object_id = OBJECT_ID(N'[dbo].[Repairs]'))
ALTER TABLE [dbo].[Repairs] CHECK CONSTRAINT [FK_Repairs_Customers]
GO


/****** ForeignKey [FK_Repairs_Products] ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Repairs_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[Repairs]'))
ALTER TABLE [dbo].[Repairs]  WITH NOCHECK ADD  CONSTRAINT [FK_Repairs_Products] FOREIGN KEY([ProductCode])
REFERENCES [dbo].[Products] ([ProductCode])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Repairs_Products]') AND parent_object_id = OBJECT_ID(N'[dbo].[Repairs]'))
ALTER TABLE [dbo].[Repairs] CHECK CONSTRAINT [FK_Repairs_Products]
GO


/****** ForeignKey [FK_Repairs_Technicians] ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Repairs_Technicians]') AND parent_object_id = OBJECT_ID(N'[dbo].[Repairs]'))
ALTER TABLE [dbo].[Repairs]  WITH NOCHECK ADD  CONSTRAINT [FK_Repairs_Technicians] FOREIGN KEY([TechID])
REFERENCES [dbo].[Technicians] ([TechID])
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Repairs_Technicians]') AND parent_object_id = OBJECT_ID(N'[dbo].[Repairs]'))
ALTER TABLE [dbo].[Repairs] CHECK CONSTRAINT [FK_Repairs_Technicians]
GO
