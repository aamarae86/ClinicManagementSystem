USE [ClinicManagementSystem]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 5/27/2021 4:45:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 5/27/2021 4:45:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 5/27/2021 4:45:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 5/27/2021 4:45:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 5/27/2021 4:45:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NULL,
	[TwoFactorEnabled] [bit] NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NULL,
	[AccessFailedCount] [int] NULL,
	[UserName] [nvarchar](256) NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Address] [nvarchar](500) NULL,
	[IsActive] [bit] NOT NULL,
	[Photo] [nvarchar](500) NULL,
	[DeleteFlag] [int] NULL,
	[CreatedTime] [datetime] NULL,
	[UpdatedTime] [datetime] NULL,
	[DateOfBirth] [datetime] NULL,
	[Gender] [nvarchar](10) NULL,
	[Qualification] [nvarchar](500) NULL,
	[ClinicStartTime] [time](7) NULL,
	[ClinicEndTime] [time](7) NULL,
	[Experience] [nvarchar](500) NULL,
	[SpecializationId] [int] NULL,
	[ProofOfResidence] [nvarchar](500) NULL,
	[Disability] [bit] NOT NULL,
	[DisabilityDescription] [nvarchar](1000) NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Booking]    Script Date: 5/27/2021 4:45:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NULL,
	[DiseaseId] [int] NULL,
	[BookingDate] [datetime] NULL,
	[BookingTime] [time](7) NULL,
	[DoctorId] [int] NULL,
	[NurseId] [int] NULL,
	[BookingStatus] [nvarchar](25) NULL,
	[UpdatedBy] [int] NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Disease]    Script Date: 5/27/2021 4:45:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disease](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Disease] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailTemplate]    Script Date: 5/27/2021 4:45:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailTemplate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[From] [nvarchar](150) NOT NULL,
	[To] [nvarchar](150) NOT NULL,
	[CC] [nvarchar](150) NOT NULL,
	[BCC] [nvarchar](150) NOT NULL,
	[Subject] [nvarchar](max) NOT NULL,
	[MessageBody] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateBy] [int] NOT NULL,
	[UpdateBy] [int] NULL,
	[UpdateDate] [datetime] NULL,
	[TemplateUrl] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_EmailTemplate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalReports]    Script Date: 5/27/2021 4:45:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalReports](
	[ReportId] [int] IDENTITY(1,1) NOT NULL,
	[HistoryId] [int] NULL,
	[DoctorId] [int] NULL,
	[PatientId] [int] NULL,
	[TestReportName] [nvarchar](500) NULL,
	[OriginalReportName] [nvarchar](500) NULL,
	[ReportDescription] [nvarchar](1500) NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_MedicalReports] PRIMARY KEY CLUSTERED 
(
	[ReportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientDisease]    Script Date: 5/27/2021 4:45:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientDisease](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NULL,
	[DiseaseId] [nchar](10) NULL,
 CONSTRAINT [PK_PatientDisease] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PatientMedicalHistory]    Script Date: 5/27/2021 4:45:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientMedicalHistory](
	[DetailID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NULL,
	[Height] [float] NULL,
	[Weight] [float] NULL,
	[Temperature] [float] NULL,
	[BloodPressureMin] [float] NULL,
	[BloodPressureMax] [float] NULL,
	[Symptoms] [nvarchar](500) NULL,
	[MedicalHistory] [bit] NOT NULL,
	[MedicalHistoryDetail] [nvarchar](500) NULL,
	[Medicine] [nvarchar](250) NULL,
	[DoctorComments] [nvarchar](250) NULL,
	[RecommendedTests] [nvarchar](250) NULL,
 CONSTRAINT [PK_BookingDetail] PRIMARY KEY CLUSTERED 
(
	[DetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specializations]    Script Date: 5/27/2021 4:45:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specializations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Specialization] [nvarchar](150) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Specializations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AspNetRoles] ON 

INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (2, N'Doctor Assistance/Nurse')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (3, N'Receptionist')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (4, N'Doctor')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (5, N'Patient')
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (6, N'Pharmacist')
SET IDENTITY_INSERT [dbo].[AspNetRoles] OFF
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (3, 1)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (29, 3)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (30, 4)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (31, 5)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (32, 2)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (33, 5)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (34, 5)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (35, 5)
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (36, 4)
GO
SET IDENTITY_INSERT [dbo].[AspNetUsers] ON 

INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Address], [IsActive], [Photo], [DeleteFlag], [CreatedTime], [UpdatedTime], [DateOfBirth], [Gender], [Qualification], [ClinicStartTime], [ClinicEndTime], [Experience], [SpecializationId], [ProofOfResidence], [Disability], [DisabilityDescription]) VALUES (3, N'test@admin.com', 0, N'AIIgFqTd4oBLVM8IPf10BTpLqX2L0fsh3xLVNY2Dy5J4+LQEGaC/HEG6UB8q3kWB0w==', N'e95b7333-db7e-4523-bbf4-373230747c5f', N'87987987', 0, 0, NULL, 1, 0, N'Admin', N'Admin', N'Admin', N'Admin address', 1, N'3_6373463132537398710.png', 0, CAST(N'2020-02-15T14:20:52.563' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Address], [IsActive], [Photo], [DeleteFlag], [CreatedTime], [UpdatedTime], [DateOfBirth], [Gender], [Qualification], [ClinicStartTime], [ClinicEndTime], [Experience], [SpecializationId], [ProofOfResidence], [Disability], [DisabilityDescription]) VALUES (29, N'ndlovunsindiso@gmail.com', 0, N'AOPODrQyAFT7qe5xl0xw8kVJAjmg63uYIlOzMMOziG6W3RvAk7gvrRjhX5xVjlZNow==', N'647472e6-40a7-4ae5-a882-161a65d08085', N'0835063684', 0, 0, NULL, 1, 0, N'NsindisoN', N'Nsindiso', N'Ndlovu', N'74 williamson street ', 1, N'36f29c16c774f63725f4f6a790c16a5d20580034.jpg', 0, CAST(N'2020-08-11T16:58:00.340' AS DateTime), CAST(N'2020-08-11T16:58:00.340' AS DateTime), CAST(N'1988-11-19T00:00:00.000' AS DateTime), N'Male', N'administrator ', CAST(N'07:30:00' AS Time), CAST(N'16:00:00' AS Time), N'Umdoni', NULL, NULL, 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Address], [IsActive], [Photo], [DeleteFlag], [CreatedTime], [UpdatedTime], [DateOfBirth], [Gender], [Qualification], [ClinicStartTime], [ClinicEndTime], [Experience], [SpecializationId], [ProofOfResidence], [Disability], [DisabilityDescription]) VALUES (30, N'clement@gmail.com', 0, N'AP+plTI/6GQA0MdLEfhRu2AmTVMyrg4xPYTjT8RAT5LrixCetwt1e+xy9hOeKdZI3A==', N'8f6510b8-76bb-4beb-bba5-92f14ba714c5', N'0835063684', 0, 0, NULL, 1, 0, N'Doctor', N'Clement', N'Ntuli', N'Margate ', 1, N'download20030055.jpg', 0, CAST(N'2020-08-11T17:03:00.553' AS DateTime), CAST(N'2020-08-11T17:03:00.553' AS DateTime), CAST(N'1988-11-19T00:00:00.000' AS DateTime), N'Male', N'medicine ', CAST(N'01:30:00' AS Time), CAST(N'16:00:00' AS Time), NULL, 4, NULL, 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Address], [IsActive], [Photo], [DeleteFlag], [CreatedTime], [UpdatedTime], [DateOfBirth], [Gender], [Qualification], [ClinicStartTime], [ClinicEndTime], [Experience], [SpecializationId], [ProofOfResidence], [Disability], [DisabilityDescription]) VALUES (31, N'clint@gmail.com', 0, N'ABzgVzUQPu+e2ABRjJusUMm7POM03gjyC0yNRdaRc2fLSfdR4jP+CiTHXaTrKgYwMg==', N'7fbdc27e-66cc-46b5-b707-a31ea9be6ddb', N'0835063684', 0, 0, NULL, 1, 0, N'Clint', N'Clint', N'Smoker', N'mandawe ', 1, NULL, 0, CAST(N'2020-08-11T17:16:41.537' AS DateTime), CAST(N'2020-08-11T17:16:41.537' AS DateTime), CAST(N'1988-11-19T00:00:00.000' AS DateTime), N'Male', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Address], [IsActive], [Photo], [DeleteFlag], [CreatedTime], [UpdatedTime], [DateOfBirth], [Gender], [Qualification], [ClinicStartTime], [ClinicEndTime], [Experience], [SpecializationId], [ProofOfResidence], [Disability], [DisabilityDescription]) VALUES (32, N'nurse@gmail.com', 0, N'AO/T4jdXkCBFYTVDtJm6pznAqgqT7Ff0P1U8L1gjs5SXiTyxW5uW8i7QJNCx4Qs5dQ==', N'acb35044-d40a-435b-bfc8-62170d8d0dc8', N'0835063684', 0, 0, NULL, 1, 0, N'Nurse', N'Nurse', N'Ndlovu', N'8 scottburgh 4480', 1, NULL, 0, CAST(N'2020-08-11T17:23:00.760' AS DateTime), CAST(N'2020-08-11T17:23:00.760' AS DateTime), CAST(N'1988-11-19T00:00:00.000' AS DateTime), N'Female', N'nurse ', CAST(N'12:05:00' AS Time), CAST(N'16:00:00' AS Time), N'umdoni', NULL, NULL, 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Address], [IsActive], [Photo], [DeleteFlag], [CreatedTime], [UpdatedTime], [DateOfBirth], [Gender], [Qualification], [ClinicStartTime], [ClinicEndTime], [Experience], [SpecializationId], [ProofOfResidence], [Disability], [DisabilityDescription]) VALUES (33, N'nsindison@umdoni.gov.za', 0, N'AIcw5WSqYJucLN2cmErKs6aJ1R+o+rwYYHyFwk0BDyRkvfgqQPfVik8fVquxLedbng==', N'f35aeec7-8aa3-44b1-899f-311a9602a93f', N'0835063684', 0, 0, NULL, 1, 0, N'Patient1', N'Patient 1 ', N'PatientFlu', N'mandeni', 1, N'downloads20274894.jpg', 0, CAST(N'2020-08-12T14:27:48.943' AS DateTime), CAST(N'2020-08-12T14:27:48.943' AS DateTime), CAST(N'1988-11-19T00:00:00.000' AS DateTime), N'Female', NULL, NULL, NULL, NULL, NULL, NULL, 1, N'wheel chair ')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Address], [IsActive], [Photo], [DeleteFlag], [CreatedTime], [UpdatedTime], [DateOfBirth], [Gender], [Qualification], [ClinicStartTime], [ClinicEndTime], [Experience], [SpecializationId], [ProofOfResidence], [Disability], [DisabilityDescription]) VALUES (34, N'ndlovunsindisos@gmail.com', 0, N'ACbY5wloOMhEYXpWxr49xElDKK10zEocCCZ+EuJJKE8Or/QTM9ea+WdH23Q2C1FRGQ==', N'39303629-d01c-41a7-b9c9-a2eb79e952fb', NULL, 0, 0, NULL, 1, 0, N'Patient2', N'Patient 2', N'PatientBrokenLeg', N'scottburgh ', 1, NULL, 0, CAST(N'2020-08-12T14:31:16.157' AS DateTime), CAST(N'2020-08-12T14:31:16.157' AS DateTime), NULL, N'Male', NULL, NULL, NULL, NULL, NULL, NULL, 1, N'back up ')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Address], [IsActive], [Photo], [DeleteFlag], [CreatedTime], [UpdatedTime], [DateOfBirth], [Gender], [Qualification], [ClinicStartTime], [ClinicEndTime], [Experience], [SpecializationId], [ProofOfResidence], [Disability], [DisabilityDescription]) VALUES (35, N'samc@umdoni.gov.za', 0, N'AM5T8aof/TTcwer1p5CNLoRpZdjmmSBnfpRwI4BRET0cEaQRAcpU0No7CXP4yONdYQ==', N'b18017a5-1d7d-49ad-8d50-6cf16f61480f', N'0399761202', 0, 0, NULL, 1, 0, N'Samc', N'Sam', N'Cele', N'Stanger ', 1, NULL, 0, CAST(N'2020-08-17T18:30:21.983' AS DateTime), CAST(N'2020-08-17T18:30:21.983' AS DateTime), CAST(N'1990-01-01T00:00:00.000' AS DateTime), N'Female', NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FirstName], [LastName], [Address], [IsActive], [Photo], [DeleteFlag], [CreatedTime], [UpdatedTime], [DateOfBirth], [Gender], [Qualification], [ClinicStartTime], [ClinicEndTime], [Experience], [SpecializationId], [ProofOfResidence], [Disability], [DisabilityDescription]) VALUES (36, N'jamesm@umdoni.gov.za', 0, N'AMpW2u4YdFjihlphsxrT8MOLyeW4/G4gdNXetoWpy4yW9vearcTmp2fGkiyrwha3BA==', N'30b82dea-3b1e-4909-9664-adb0a5d802a9', N'0835063684', 0, 0, NULL, 1, 0, N'jamesM', N'James ', N'Mbhele ', N'Durban umhlnanga ', 1, NULL, 0, CAST(N'2020-08-17T19:06:56.370' AS DateTime), CAST(N'2020-08-17T19:06:56.370' AS DateTime), CAST(N'1988-11-19T00:00:00.000' AS DateTime), N'Male', N'GP', CAST(N'00:05:00' AS Time), NULL, N'Government Hospital  ', 4, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[AspNetUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[Booking] ON 

INSERT [dbo].[Booking] ([Id], [PatientId], [DiseaseId], [BookingDate], [BookingTime], [DoctorId], [NurseId], [BookingStatus], [UpdatedBy]) VALUES (14, 31, 4, CAST(N'2020-08-12T00:00:00.000' AS DateTime), CAST(N'10:50:00' AS Time), 30, 32, N'Approved', 29)
INSERT [dbo].[Booking] ([Id], [PatientId], [DiseaseId], [BookingDate], [BookingTime], [DoctorId], [NurseId], [BookingStatus], [UpdatedBy]) VALUES (15, 35, 4, CAST(N'2020-08-17T00:00:00.000' AS DateTime), CAST(N'17:50:00' AS Time), 30, 32, N'Approved', 29)
INSERT [dbo].[Booking] ([Id], [PatientId], [DiseaseId], [BookingDate], [BookingTime], [DoctorId], [NurseId], [BookingStatus], [UpdatedBy]) VALUES (16, 35, 6, CAST(N'2020-08-17T00:00:00.000' AS DateTime), CAST(N'17:50:00' AS Time), 36, 32, N'Approved', 29)
INSERT [dbo].[Booking] ([Id], [PatientId], [DiseaseId], [BookingDate], [BookingTime], [DoctorId], [NurseId], [BookingStatus], [UpdatedBy]) VALUES (17, 35, 5, CAST(N'2020-08-18T00:00:00.000' AS DateTime), CAST(N'10:50:00' AS Time), 36, 32, N'Approved', 29)
SET IDENTITY_INSERT [dbo].[Booking] OFF
GO
SET IDENTITY_INSERT [dbo].[Disease] ON 

INSERT [dbo].[Disease] ([Id], [Name], [IsActive]) VALUES (4, N'Flu running nose ', 1)
INSERT [dbo].[Disease] ([Id], [Name], [IsActive]) VALUES (5, N'head ach ', 1)
INSERT [dbo].[Disease] ([Id], [Name], [IsActive]) VALUES (6, N'weak knees ', 1)
SET IDENTITY_INSERT [dbo].[Disease] OFF
GO
SET IDENTITY_INSERT [dbo].[EmailTemplate] ON 

INSERT [dbo].[EmailTemplate] ([Id], [Type], [Name], [From], [To], [CC], [BCC], [Subject], [MessageBody], [IsActive], [CreateDate], [CreateBy], [UpdateBy], [UpdateDate], [TemplateUrl]) VALUES (1, N'Email', N'Forgot Paasword', N'', N' ', N' ', N' ', N'Forgot Password', N'<!DOCTYPE html>  <html>  <head>  <title>Page Title</title>  </head>  <body>  <div style="padding: 40px 40px 20px 40px; background: #fff;">                                      <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">                                          <tbody><tr>                                              <td>                                                  <h2 style="margin-bottom: 20px; color: #24222f; font-weight: 600">Password Reset</h2>                                                  <b>Hi {#!Name!#}</b>                                                  <p>Seems like you forgot your password for "Travel Permit Application". If this is true, click below to reset your password.</p>                                                  <div style="text-align: center">                                                      <a href="{#!RequestLink!#}" style="display: inline-block; padding: 11px 30px; margin: 20px 0px 30px; font-size: 15px; color: #fff; background: #01a8fe; border-radius: 5px">                                                          Reset Password                                                      </a>                                                  </div>                                                  <p>If you did not forgot your password you can safely ignore his email.</p>                                                  <p>Regards,<br />Travel Permit Application </p>                                              </td>                                          </tr>                                          </tbody>                                      </table>                                  </div>    </body>  </html>', 1, CAST(N'2018-02-23T00:00:00.000' AS DateTime), 1, NULL, NULL, N' ')
INSERT [dbo].[EmailTemplate] ([Id], [Type], [Name], [From], [To], [CC], [BCC], [Subject], [MessageBody], [IsActive], [CreateDate], [CreateBy], [UpdateBy], [UpdateDate], [TemplateUrl]) VALUES (2, N'Email', N'Permit Email', N'', N',kljh@jhsa.sadjh', N'', N'', N'Permit Email', N'<!DOCTYPE html>  <html>  <head>  <title>Page Title</title>  </head>  <body>  <div style="padding: 40px 40px 20px 40px; background: #fff;">                                      <table border="0" cellpadding="0" cellspacing="0" style="width: 100%;">                                          <tbody><tr>                                              <td>                                                  <h2 style="margin-bottom: 20px; color: #24222f; font-weight: 600">Travel Permit Details</h2>                                                  <b>Hi {#!Name!#}</b>                                                  <p>Your traveling permit status is: {#!PermitStatus!#}. You can check you your travel permit at following link by using permit id: {#!PermitID!#}.</p>                                                  <div style="text-align: center">                                                      <a href="{#!RequestLink!#}" style="display: inline-block; padding: 11px 30px; margin: 20px 0px 30px; font-size: 15px; color: #fff; background: #01a8fe; border-radius: 5px">                                                          Track Permit                                                      </a>                                                  </div>                                                                                                    <p>Regards,<br />Travel Permit Application </p>                                              </td>                                          </tr>                                          </tbody>                                      </table>                                  </div>    </body>  </html>', 1, CAST(N'2018-02-23T00:00:00.000' AS DateTime), 1, NULL, NULL, N' ')
SET IDENTITY_INSERT [dbo].[EmailTemplate] OFF
GO
SET IDENTITY_INSERT [dbo].[PatientMedicalHistory] ON 

INSERT [dbo].[PatientMedicalHistory] ([DetailID], [BookingID], [Height], [Weight], [Temperature], [BloodPressureMin], [BloodPressureMax], [Symptoms], [MedicalHistory], [MedicalHistoryDetail], [Medicine], [DoctorComments], [RecommendedTests]) VALUES (8, 14, 1.68, 100, 38, 120, 120, N'head ach ', 1, N'corona ', NULL, NULL, NULL)
INSERT [dbo].[PatientMedicalHistory] ([DetailID], [BookingID], [Height], [Weight], [Temperature], [BloodPressureMin], [BloodPressureMax], [Symptoms], [MedicalHistory], [MedicalHistoryDetail], [Medicine], [DoctorComments], [RecommendedTests]) VALUES (9, 15, 1.68, 100, 38, 120, 120, N'weak 
cant sleep 
cant eat ', 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[PatientMedicalHistory] ([DetailID], [BookingID], [Height], [Weight], [Temperature], [BloodPressureMin], [BloodPressureMax], [Symptoms], [MedicalHistory], [MedicalHistoryDetail], [Medicine], [DoctorComments], [RecommendedTests]) VALUES (10, 16, 1.68, 100, 38, 120, 120, N'weak ', 1, NULL, N'med1 
med2
med3', N'user is stressed and needs to rest ', N'test 1 
test 2 
test 3 
')
INSERT [dbo].[PatientMedicalHistory] ([DetailID], [BookingID], [Height], [Weight], [Temperature], [BloodPressureMin], [BloodPressureMax], [Symptoms], [MedicalHistory], [MedicalHistoryDetail], [Medicine], [DoctorComments], [RecommendedTests]) VALUES (11, 17, 1.87, 100, 39, 120, 120, N'cant breath ', 0, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[PatientMedicalHistory] OFF
GO
SET IDENTITY_INSERT [dbo].[Specializations] ON 

INSERT [dbo].[Specializations] ([Id], [Specialization], [IsActive]) VALUES (4, N'GP ', 1)
SET IDENTITY_INSERT [dbo].[Specializations] OFF
GO
ALTER TABLE [dbo].[PatientMedicalHistory] ADD  CONSTRAINT [DF_BookingDetail_MedicalHistory]  DEFAULT ((0)) FOR [MedicalHistory]
GO
ALTER TABLE [dbo].[Specializations] ADD  CONSTRAINT [DF_Specializations_IsActive]  DEFAULT ((0)) FOR [IsActive]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Booking]  WITH CHECK ADD  CONSTRAINT [FK_Booking_AspNetUsers] FOREIGN KEY([PatientId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Booking] CHECK CONSTRAINT [FK_Booking_AspNetUsers]
GO
ALTER TABLE [dbo].[MedicalReports]  WITH CHECK ADD  CONSTRAINT [FK_MedicalReports_AspNetUsers] FOREIGN KEY([DoctorId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[MedicalReports] CHECK CONSTRAINT [FK_MedicalReports_AspNetUsers]
GO
ALTER TABLE [dbo].[MedicalReports]  WITH CHECK ADD  CONSTRAINT [FK_MedicalReports_PatientMedicalHistory] FOREIGN KEY([HistoryId])
REFERENCES [dbo].[PatientMedicalHistory] ([DetailID])
GO
ALTER TABLE [dbo].[MedicalReports] CHECK CONSTRAINT [FK_MedicalReports_PatientMedicalHistory]
GO
ALTER TABLE [dbo].[PatientMedicalHistory]  WITH CHECK ADD  CONSTRAINT [FK_BookingDetail_Booking] FOREIGN KEY([BookingID])
REFERENCES [dbo].[Booking] ([Id])
GO
ALTER TABLE [dbo].[PatientMedicalHistory] CHECK CONSTRAINT [FK_BookingDetail_Booking]
GO
/****** Object:  StoredProcedure [dbo].[FetchBookings]    Script Date: 5/27/2021 4:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchBookings]
@DisplayLength int,
@DisplayStart int,
@SortCol int,
@SortOrder nvarchar(5),
@search nvarchar(100),
@Status nvarchar(15),
@role nvarchar(150),
@fromDate nvarchar(20) = '',
@toDate nvarchar(20) = '',
@userId int
AS
BEGIN

	if(@role = 'Admin')
	begin
		;With Results as 
	(
		select ROW_NUMBER() over(order by 
		case when NULLIF(@SortOrder,'') IS NULL then bk.Id end desc,
		case when (@SortCol = 1 and @SortOrder = 'asc') then anu.FirstName end asc,	case when (@SortCol = 1 and @SortOrder = 'desc') then anu.FirstName end desc,
		case when (@SortCol = 2 and @SortOrder = 'asc') then ds.[Name] end asc,	case when (@SortCol = 2 and @SortOrder = 'desc') then ds.[Name] end desc,
		case when (@SortCol = 3 and @SortOrder = 'asc') then bk.BookingDate end asc,	case when (@SortCol = 3 and @SortOrder = 'desc') then bk.BookingDate end desc,
		case when (@SortCol = 4 and @SortOrder = 'asc') then bk.BookingTime end asc,	case when (@SortCol = 4 and @SortOrder = 'desc') then bk.BookingTime end desc,
		case when (@SortCol = 5 and @SortOrder = 'asc') then bk.BookingStatus end asc,	case when (@SortCol = 5 and @SortOrder = 'desc') then bk.BookingStatus end desc
		) as RowNo, Count(*) over() Total, bk.Id,(IsnUll(anu.FirstName,'') +' '+IsNull(anu.LastName,'')) as PatientName,bk.PatientId,
		IsNull(Format(CAST(bk.BookingTime AS DATETIME), 'hh:mm tt'),'') as BookingTime,bk.BookingStatus,ds.[Name] as DiseaseName,
		CONVERT(VARCHAR(10), bk.BookingDate, 101) as BookingDate,anu.Photo
	from Booking bk
	inner join AspNetUsers anu on anu.Id=bk.PatientId
	left join Disease ds on bk.DiseaseId =ds.Id 
		where 
		 
		(NullIF(@Status,'')) IS NULL or bk.BookingStatus = @Status and
		(bk.BookingDate > DATEADD(day,1,CONVERT(DATETIME,@fromDate)) OR @fromDate = '')
		AND (bk.BookingDate < DATEADD(day,1,CONVERT(DATETIME,@toDate)) OR @toDate = '')AND 
		(NULLIF(@search, '') IS NULL or (anu.FirstName like '%'+@search+'%') or (anu.LastName like '%'+@search+'%') or (ds.[Name] like '%'+@search+'%'))
	)
	select * from Results where RowNo > @DisplayStart
	end
	else if(@role = 'Receptionist')
	begin
		;With Results as 
	(
		select ROW_NUMBER() over(order by 
		case when NULLIF(@SortOrder,'') IS NULL then bk.Id end desc,
		case when (@SortCol = 1 and @SortOrder = 'asc') then anu.FirstName end asc,	case when (@SortCol = 1 and @SortOrder = 'desc') then anu.FirstName end desc,
		case when (@SortCol = 2 and @SortOrder = 'asc') then ds.[Name] end asc,	case when (@SortCol = 2 and @SortOrder = 'desc') then ds.[Name] end desc,
		case when (@SortCol = 3 and @SortOrder = 'asc') then bk.BookingDate end asc,	case when (@SortCol = 3 and @SortOrder = 'desc') then bk.BookingDate end desc,
		case when (@SortCol = 4 and @SortOrder = 'asc') then bk.BookingTime end asc,	case when (@SortCol = 4 and @SortOrder = 'desc') then bk.BookingTime end desc,
		case when (@SortCol = 5 and @SortOrder = 'asc') then bk.BookingStatus end asc,	case when (@SortCol = 5 and @SortOrder = 'desc') then bk.BookingStatus end desc
		) as RowNo, Count(*) over() Total, bk.Id,(IsnUll(anu.FirstName,'') +' '+IsNull(anu.LastName,'')) as PatientName,bk.PatientId,
		IsNull(Format(CAST(bk.BookingTime AS DATETIME), 'hh:mm tt'),'') as BookingTime,bk.BookingStatus,ds.[Name] as DiseaseName,
		CONVERT(VARCHAR(10), bk.BookingDate, 101) as BookingDate,anu.Photo
	from Booking bk
	inner join AspNetUsers anu on anu.Id=bk.PatientId
	left join Disease ds on bk.DiseaseId =ds.Id 
		
		where 
		(NullIF(@Status,'')) IS NULL or bk.BookingStatus = @Status and
		(bk.BookingDate > DATEADD(day,1,CONVERT(DATETIME,@fromDate)) OR @fromDate = '')
		AND (bk.BookingDate < DATEADD(day,1,CONVERT(DATETIME,@toDate)) OR @toDate = '')
		AND 
		(NULLIF(@search, '') IS NULL or (anu.FirstName like '%'+@search+'%') or (anu.LastName like '%'+@search+'%') or (ds.[Name] like '%'+@search+'%'))
	)
	select * from Results where RowNo > @DisplayStart
	end
	
	else if(@role = 'Doctor')
	begin
		;With Results as 
	(
		select ROW_NUMBER() over(order by 
		case when NULLIF(@SortOrder,'') IS NULL then bk.Id end desc,
		case when (@SortCol = 1 and @SortOrder = 'asc') then anu.FirstName end asc,	case when (@SortCol = 1 and @SortOrder = 'desc') then anu.FirstName end desc,
		case when (@SortCol = 2 and @SortOrder = 'asc') then ds.[Name] end asc,	case when (@SortCol = 2 and @SortOrder = 'desc') then ds.[Name] end desc,
		case when (@SortCol = 3 and @SortOrder = 'asc') then bk.BookingDate end asc,	case when (@SortCol = 3 and @SortOrder = 'desc') then bk.BookingDate end desc,
		case when (@SortCol = 4 and @SortOrder = 'asc') then bk.BookingTime end asc,	case when (@SortCol = 4 and @SortOrder = 'desc') then bk.BookingTime end desc,
		case when (@SortCol = 5 and @SortOrder = 'asc') then bk.BookingStatus end asc,	case when (@SortCol = 5 and @SortOrder = 'desc') then bk.BookingStatus end desc
		) as RowNo, Count(*) over() Total, bk.Id,(IsnUll(anu.FirstName,'') +' '+IsNull(anu.LastName,'')) as PatientName,bk.PatientId,
		IsNull(Format(CAST(bk.BookingTime AS DATETIME), 'hh:mm tt'),'') as BookingTime,bk.BookingStatus,ds.[Name] as DiseaseName,
		CONVERT(VARCHAR(10), bk.BookingDate, 101) as BookingDate,anu.Photo
	from Booking bk
	inner join AspNetUsers anu on anu.Id=bk.PatientId
	left join Disease ds on bk.DiseaseId =ds.Id 
		
		where 
		bk.BookingStatus = 'Approved' and
		bk.DoctorId = @userId and
		(bk.BookingDate > DATEADD(day,1,CONVERT(DATETIME,@fromDate)) OR @fromDate = '')
		AND (bk.BookingDate < DATEADD(day,1,CONVERT(DATETIME,@toDate)) OR @toDate = '') and
		(NULLIF(@search, '') IS NULL or (anu.FirstName like '%'+@search+'%') or (anu.LastName like '%'+@search+'%') or (ds.[Name] like '%'+@search+'%'))
	)
	select * from Results where RowNo > @DisplayStart
	end

	else if(@role = 'Doctor Assistance/Nurse')
	begin
		;With Results as 
	(
		select ROW_NUMBER() over(order by 
		case when NULLIF(@SortOrder,'') IS NULL then bk.Id end desc,
		case when (@SortCol = 1 and @SortOrder = 'asc') then anu.FirstName end asc,	case when (@SortCol = 1 and @SortOrder = 'desc') then anu.FirstName end desc,
		case when (@SortCol = 2 and @SortOrder = 'asc') then ds.[Name] end asc,	case when (@SortCol = 2 and @SortOrder = 'desc') then ds.[Name] end desc,
		case when (@SortCol = 3 and @SortOrder = 'asc') then bk.BookingDate end asc,	case when (@SortCol = 3 and @SortOrder = 'desc') then bk.BookingDate end desc,
		case when (@SortCol = 4 and @SortOrder = 'asc') then bk.BookingTime end asc,	case when (@SortCol = 4 and @SortOrder = 'desc') then bk.BookingTime end desc,
		case when (@SortCol = 5 and @SortOrder = 'asc') then bk.BookingStatus end asc,	case when (@SortCol = 5 and @SortOrder = 'desc') then bk.BookingStatus end desc
		) as RowNo, Count(*) over() Total, bk.Id,(IsnUll(anu.FirstName,'') +' '+IsNull(anu.LastName,'')) as PatientName,bk.PatientId,
		IsNull(Format(CAST(bk.BookingTime AS DATETIME), 'hh:mm tt'),'') as BookingTime,bk.BookingStatus,ds.[Name] as DiseaseName,
		CONVERT(VARCHAR(10), bk.BookingDate, 101) as BookingDate,anu.Photo
	from Booking bk
	inner join AspNetUsers anu on anu.Id=bk.PatientId
	left join Disease ds on bk.DiseaseId =ds.Id 
		
		where 
		bk.BookingStatus = 'Approved' and
		bk.NurseId = @userId and
		(bk.BookingDate > DATEADD(day,1,CONVERT(DATETIME,@fromDate)) OR @fromDate = '')
		AND (bk.BookingDate < DATEADD(day,1,CONVERT(DATETIME,@toDate)) OR @toDate = '')AND 
		(NULLIF(@search, '') IS NULL or (anu.FirstName like '%'+@search+'%') or (anu.LastName like '%'+@search+'%') or (ds.[Name] like '%'+@search+'%'))
	)
	select * from Results where RowNo > @DisplayStart
	end

	else if(@role = 'Patient')
	begin
		;With Results as 
	(
		select ROW_NUMBER() over(order by 
		case when NULLIF(@SortOrder,'') IS NULL then bk.Id end desc,
		case when (@SortCol = 1 and @SortOrder = 'asc') then anu.FirstName end asc,	case when (@SortCol = 1 and @SortOrder = 'desc') then anu.FirstName end desc,
		case when (@SortCol = 2 and @SortOrder = 'asc') then ds.[Name] end asc,	case when (@SortCol = 2 and @SortOrder = 'desc') then ds.[Name] end desc,
		case when (@SortCol = 3 and @SortOrder = 'asc') then bk.BookingDate end asc,	case when (@SortCol = 3 and @SortOrder = 'desc') then bk.BookingDate end desc,
		case when (@SortCol = 4 and @SortOrder = 'asc') then bk.BookingTime end asc,	case when (@SortCol = 4 and @SortOrder = 'desc') then bk.BookingTime end desc,
		case when (@SortCol = 5 and @SortOrder = 'asc') then bk.BookingStatus end asc,	case when (@SortCol = 5 and @SortOrder = 'desc') then bk.BookingStatus end desc
		) as RowNo, Count(*) over() Total, bk.Id,(IsnUll(anu.FirstName,'') +' '+IsNull(anu.LastName,'')) as PatientName,bk.PatientId,
		IsNull(Format(CAST(bk.BookingTime AS DATETIME), 'hh:mm tt'),'') as BookingTime,bk.BookingStatus,ds.[Name] as DiseaseName,
		CONVERT(VARCHAR(10), bk.BookingDate, 101) as BookingDate,anu.Photo
	from Booking bk
	inner join AspNetUsers anu on anu.Id=bk.PatientId
	left join Disease ds on bk.DiseaseId =ds.Id 
		
		where 
		bk.PatientId = @userId and
		(bk.BookingDate > DATEADD(day,1,CONVERT(DATETIME,@fromDate)) OR @fromDate = '')
		AND (bk.BookingDate < DATEADD(day,1,CONVERT(DATETIME,@toDate)) OR @toDate = '')AND 
		(NULLIF(@search, '') IS NULL or (anu.FirstName like '%'+@search+'%') or (anu.LastName like '%'+@search+'%') or (ds.[Name] like '%'+@search+'%'))
	)
	select * from Results where RowNo > @DisplayStart
	end
END
GO
/****** Object:  StoredProcedure [dbo].[FetchDashboardData]    Script Date: 5/27/2021 4:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchDashboardData] --12,'Receptionist','05/17/2020'
	@userId int,@role nvarchar(150),@date datetime
AS
BEGIN
	declare @doctors int=0,@patients int=0,@receptionists int=0,@bookings int=0
	if(@role = 'Admin')
	begin
		--doctor count
		set @doctors = (select Isnull(count(*),0) from AspNetUsers anu
		inner join AspNetUserRoles anur on anu.Id = anur.UserId
		where anur.RoleId = 4)

		--patient count
		set @patients = (select Isnull(count(*),0) from AspNetUsers anu
		inner join AspNetUserRoles anur on anu.Id = anur.UserId
		where anur.RoleId = 5)

		--receptionist count
		set @receptionists = (select Isnull(count(*),0) from AspNetUsers anu
		inner join AspNetUserRoles anur on anu.Id = anur.UserId
		where anur.RoleId = 3)

		--booking count
		set @bookings = (select Isnull(count(*),0) from Booking where CAST(BookingDate as date) = CAST(@date as date))
		
	end

	else if(@role = 'Doctor Assistance/Nurse')
	begin
		--booking count
		set @bookings = (select Isnull(count(*),0) from Booking where NurseId = @userId and CAST(BookingDate as date) = CAST(@date as date))

		--patient count
		set @patients = (select Isnull(count(*),0) from Booking where NurseId = @userId group by PatientId)
	end

	else if(@role = 'Receptionist')
	begin
		--booking count
		set @bookings = (select Isnull(count(*),0) from Booking where CAST(BookingDate as date) = CAST(@date as date))

		--patient count
		set @patients = (select Isnull(count(*),0) from AspNetUsers anu
		inner join AspNetUserRoles anur on anu.Id = anur.UserId
		where anur.RoleId = 5)
	end

	else if(@role = 'Doctor')
	begin
		--booking count
		set @bookings = (select Isnull(count(*),0) from Booking where DoctorId = @userId and CAST(BookingDate as date) = CAST(@date as date))

		--patient count
		set @patients = (select count(t.PatientId) from (select PatientId from Booking where DoctorId=@userId group by PatientId) as t)
	end

	else if(@role = 'Patient')
	begin
		--booking count
		set @bookings = (select Isnull(count(*),0) from Booking where PatientId = @userId)
	end

	else if(@role = 'Pharmacist')
	begin
		--booking count
		set @bookings = (select Isnull(count(*),0) from Booking where DoctorId = @userId and CAST(BookingDate as date) = CAST(@date as date))

		--patient count
		set @patients = (select count(t.PatientId) from (select PatientId from Booking where DoctorId=@userId group by PatientId) as t)
	end
	select IsNull(@doctors,0) as Doctor,IsNull(@patients,0) as Patients,IsNull(@receptionists,0) as Receptionists,IsNull(@bookings,0) as Bookings
	
END
GO
/****** Object:  StoredProcedure [dbo].[FetchDiseases]    Script Date: 5/27/2021 4:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[FetchDiseases]
@DisplayLength int,
@DisplayStart int,
@SortCol int,
@SortOrder nvarchar(5),
@Status nvarchar(15)
AS
BEGIN
	;With Results as 
	(
		select ROW_NUMBER() over(order by 
		case when NULLIF(@SortOrder,'') IS NULL then d.Id end desc,
		case when (@SortCol = 0 and @SortOrder = 'asc') then d.[Name] end asc,	case when (@SortCol = 0 and @SortOrder = 'desc') then d.[Name] end desc,
		case when (@SortCol = 1 and @SortOrder = 'asc') then d.IsActive end asc,	case when (@SortCol = 1 and @SortOrder = 'desc') then d.IsActive end desc
		) as RowNo, Count(*) over() Total,d.Id,d.[Name],d.IsActive

		from Disease d
		where 
		(NULLIF(@Status, '') IS NULL or d.IsActive = @Status)
	)
	select * from Results where RowNo > @DisplayStart
	
END
GO
/****** Object:  StoredProcedure [dbo].[FetchDoctorList]    Script Date: 5/27/2021 4:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchDoctorList]
	
AS
BEGIN
	select anu.Id,(IsNull(anu.FirstName,'')+' '+IsNull(anu.LastName,'')) as [Name],anu.UserName from AspNetUsers anu
	inner join AspNetUserRoles anr on anu.Id = anr.UserId
	where anu.IsActive=1 and anr.RoleId in (select Id from AspNetRoles where [Name] = 'Doctor')
	
END
GO
/****** Object:  StoredProcedure [dbo].[FetchDoctors]    Script Date: 5/27/2021 4:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FetchDoctors]
@DisplayLength int,
@DisplayStart int,
@SortCol int,
@SortOrder nvarchar(5),
@search nvarchar(100),
@Status nvarchar(15),
@role nvarchar(150)
AS
BEGIN
	;With Results as 
	(
		select ROW_NUMBER() over(order by 
		case when NULLIF(@SortOrder,'') IS NULL then anu.Id end desc,
		case when (@SortCol = 1 and @SortOrder = 'asc') then anu.FirstName end asc,	case when (@SortCol = 1 and @SortOrder = 'desc') then anu.FirstName end desc,
		case when (@SortCol = 2 and @SortOrder = 'asc') then anu.LastName end asc,	case when (@SortCol = 2 and @SortOrder = 'desc') then anu.LastName end desc,
		case when (@SortCol = 3 and @SortOrder = 'asc') then sp.Specialization end asc,	case when (@SortCol = 3 and @SortOrder = 'desc') then sp.Specialization end desc,
		case when (@SortCol = 4 and @SortOrder = 'asc') then anu.Email end asc,	case when (@SortCol = 4 and @SortOrder = 'desc') then anu.Email end desc,
		case when (@SortCol = 5 and @SortOrder = 'asc') then anu.ClinicStartTime end asc,	case when (@SortCol = 5 and @SortOrder = 'desc') then anu.ClinicStartTime end desc,
		case when (@SortCol = 6 and @SortOrder = 'asc') then anu.IsActive end asc,	case when (@SortCol = 6 and @SortOrder = 'desc') then anu.IsActive end desc
		) as RowNo, Count(*) over() Total,anu.Id,IsNull(anu.FirstName,'') as FirstName,IsNull(anu.LastName,'') as LastName,anu.Email,
		sp.Specialization,anu.IsActive,(IsNull(Format(CAST(anu.ClinicStartTime AS DATETIME), 'hh:mm tt'),'') +' - '+IsNull(Format(CAST(anu.ClinicEndTime AS DATETIME), 'hh:mm tt'),'')) as Timing,
		anu.Photo
		from AspNetUsers anu
		left join Specializations sp on sp.Id = anu.SpecializationId
		inner join AspNetUserRoles anr on anr.UserId = anu.Id
		inner join AspNetRoles ar on anr.RoleId = ar.Id
		where 
		ar.[Name] = @role and
		(NULLIF(@Status, '') IS NULL or anu.IsActive = @Status)
		And
		(NULLIF(@search, '') IS NULL or (anu.FirstName like '%'+@search+'%') or (anu.LastName like '%'+@search+'%') or (sp.Specialization like '%'+@search+'%') or (anu.Email like '%'+@search+'%'))
	)
	select * from Results where RowNo > @DisplayStart
	
END
GO
/****** Object:  StoredProcedure [dbo].[FetchMedicines]    Script Date: 5/27/2021 4:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[FetchMedicines]
@DisplayLength int,
@DisplayStart int,
@SortCol int,
@SortOrder nvarchar(5),
@Status nvarchar(200)
AS
BEGIN
	;With Results as 
	(
		select ROW_NUMBER() over(order by 
		case when NULLIF(@SortOrder,'') IS NULL then pth.DetailID end desc,
		case when (@SortCol = 0 and @SortOrder = 'asc') then anu.[FirstName] end asc,	case when (@SortCol = 0 and @SortOrder = 'desc') then anu.[FirstName] end desc,
		case when (@SortCol = 1 and @SortOrder = 'asc') then ds.[Name] end asc,	case when (@SortCol = 1 and @SortOrder = 'desc') then ds.[Name] end desc,
		case when (@SortCol = 2 and @SortOrder = 'asc') then pth.Medicine end asc,	case when (@SortCol = 2 and @SortOrder = 'desc') then pth.Medicine end desc,
		case when (@SortCol = 3 and @SortOrder = 'asc') then bk.BookingDate end asc,	case when (@SortCol = 3 and @SortOrder = 'desc') then bk.BookingDate end desc
		) as RowNo, Count(*) over() Total,DetailID,bk.PatientId,bk.Id as BookingId, Medicine,IsNull(anu.FirstName,'')+' '+IsNull(anu.LastName,'') as PatientName,
ds.[Name] as Disease,
CONVERT(VARCHAR(10), bk.BookingDate, 101) as [Date]
from PatientMedicalHistory pth
inner join Booking bk on bk.Id = pth.BookingID
inner join Disease ds on ds.Id = bk.DiseaseId
inner join AspNetUsers anu on anu.Id = bk.PatientId

where pth.BookingID in (select top(1)Id from Booking where PatientId=bk.PatientId order by BookingDate desc)
		and (NULLIF(@Status, '') IS NULL or anu.FirstName like '%'+@Status+'%' or anu.LastName like '%'+@Status+'%' 
		or ds.[Name] like '%'+@Status+'%' or pth.Medicine like '%'+@Status+'%')
	)
	select * from Results where RowNo > @DisplayStart
	
END
GO
/****** Object:  StoredProcedure [dbo].[FetchNurseList]    Script Date: 5/27/2021 4:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchNurseList]
	
AS
BEGIN
	select anu.Id,(IsNull(anu.FirstName,'')+' '+IsNull(anu.LastName,'')) as [Name],anu.UserName from AspNetUsers anu
	inner join AspNetUserRoles anr on anu.Id = anr.UserId
	where anu.IsActive=1 and anr.RoleId in (select Id from AspNetRoles where [Name] = 'Doctor Assistance/Nurse')
	
END
GO
/****** Object:  StoredProcedure [dbo].[FetchPatientMedicalHistory]    Script Date: 5/27/2021 4:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchPatientMedicalHistory]
	@patientId int
AS
BEGIN
	Select MedicalHistoryDetail,BookingDate from PatientMedicalHistory bd
inner join Booking bk on bk.Id = bd.BookingID
where bk.PatientId = @patientId
END
GO
/****** Object:  StoredProcedure [dbo].[FetchSpecializations]    Script Date: 5/27/2021 4:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[FetchSpecializations]
@DisplayLength int,
@DisplayStart int,
@SortCol int,
@SortOrder nvarchar(5),
@Status nvarchar(15)
AS
BEGIN
	;With Results as 
	(
		select ROW_NUMBER() over(order by 
		case when NULLIF(@SortOrder,'') IS NULL then p.Id end desc,
		case when (@SortCol = 0 and @SortOrder = 'asc') then p.Specialization end asc,	case when (@SortCol = 0 and @SortOrder = 'desc') then p.Specialization end desc,
		case when (@SortCol = 1 and @SortOrder = 'asc') then p.IsActive end asc,	case when (@SortCol = 1 and @SortOrder = 'desc') then p.IsActive end desc
		) as RowNo, Count(*) over() Total,p.Id,p.Specialization,p.IsActive

		from Specializations p
		where 
		(NULLIF(@Status, '') IS NULL or p.IsActive = @Status)
	)
	select * from Results where RowNo > @DisplayStart
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetPatientByName]    Script Date: 5/27/2021 4:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPatientByName]
@userName nvarchar(150)
AS
BEGIN
	select anu.Id,(IsNull(anu.FirstName,'')+' '+IsNull(anu.LastName,'')) as [Name],anu.UserName from AspNetUsers anu
	inner join AspNetUserRoles anr on anu.Id = anr.UserId
	where anu.IsActive = 1 and anr.RoleId in (select Id from AspNetRoles where [Name] = 'Patient')
	and (anu.FirstName like '%'+@userName+'%' or anu.LastName like '%'+@userName+'%')
END
GO
/****** Object:  StoredProcedure [dbo].[GetPatientByUserName]    Script Date: 5/27/2021 4:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPatientByUserName]
@userName nvarchar(150)
AS
BEGIN
	select anu.Id,(IsNull(anu.FirstName,'')+' '+IsNull(anu.LastName,'')) as [Name],anu.UserName from AspNetUsers anu
	inner join AspNetUserRoles anr on anu.Id = anr.UserId
	where anu.IsActive=1 and anr.RoleId in (select Id from AspNetRoles where [Name] = 'Patient')
	and anu.UserName like '%'+@userName+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[GetPatientMedicineHistory]    Script Date: 5/27/2021 4:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPatientMedicineHistory] 
	@patientId int
AS
BEGIN
	select Medicine,IsNull(anu.FirstName,'')+' '+IsNull(anu.LastName,'') as PatientName,
ds.[Name] as Disease,
CONVERT(VARCHAR(10), bk.BookingDate, 101) as [Date]
from PatientMedicalHistory pth
inner join Booking bk on bk.Id = pth.BookingID
inner join Disease ds on ds.Id = bk.DiseaseId
inner join AspNetUsers anu on anu.Id = bk.PatientId
where bk.PatientId=@patientId
END
GO
/****** Object:  StoredProcedure [dbo].[GetPatients]    Script Date: 5/27/2021 4:45:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetPatients]
	
AS
BEGIN
	select anu.Id,(IsNull(anu.FirstName,'')+' '+IsNull(anu.LastName,'')) as [Name] from AspNetUsers anu
	inner join AspNetUserRoles anr on anu.Id = anr.UserId
	where anr.RoleId in (select Id from AspNetRoles where [Name] = 'Patient')
	and anu.IsActive=1
END
GO
