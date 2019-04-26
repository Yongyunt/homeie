USE [master]
GO
/****** Object:  Database [Suckreed]    Script Date: 4/26/2019 10:33:00 AM ******/
CREATE DATABASE [Suckreed]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Suckreed', FILENAME = N'D:\sql\MSSQL14.SQLEXPRESS\MSSQL\DATA\Suckreed.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Suckreed_log', FILENAME = N'D:\sql\MSSQL14.SQLEXPRESS\MSSQL\DATA\Suckreed_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Suckreed] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Suckreed].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Suckreed] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Suckreed] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Suckreed] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Suckreed] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Suckreed] SET ARITHABORT OFF 
GO
ALTER DATABASE [Suckreed] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Suckreed] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Suckreed] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Suckreed] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Suckreed] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Suckreed] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Suckreed] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Suckreed] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Suckreed] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Suckreed] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Suckreed] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Suckreed] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Suckreed] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Suckreed] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Suckreed] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Suckreed] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Suckreed] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Suckreed] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Suckreed] SET  MULTI_USER 
GO
ALTER DATABASE [Suckreed] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Suckreed] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Suckreed] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Suckreed] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Suckreed] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Suckreed] SET QUERY_STORE = OFF
GO
USE [Suckreed]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 4/26/2019 10:33:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[C_ID] [int] IDENTITY(1,1) NOT NULL,
	[C_Firstname] [nvarchar](50) NULL,
	[C_Lastname] [nvarchar](50) NULL,
	[C_Phone] [nvarchar](15) NULL,
	[C_Address] [nvarchar](max) NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[C_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 4/26/2019 10:33:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[E_ID] [int] IDENTITY(1,1) NOT NULL,
	[E_Firstname] [nvarchar](50) NULL,
	[E_Lastname] [nvarchar](50) NULL,
	[E_Phone] [nvarchar](15) NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[E_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 4/26/2019 10:33:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[O_ID] [int] IDENTITY(1,1) NOT NULL,
	[O_Date] [nvarchar](50) NULL,
	[O_Picture] [nvarchar](max) NULL,
	[O_Status] [nvarchar](50) NULL,
	[C_ID] [int] NULL,
	[E_ID] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[O_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Product]    Script Date: 4/26/2019 10:33:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Product](
	[O_ID] [int] NOT NULL,
	[P_ID] [int] NOT NULL,
	[Amount] [int] NOT NULL,
 CONSTRAINT [PK_OP] PRIMARY KEY CLUSTERED 
(
	[O_ID] ASC,
	[P_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 4/26/2019 10:33:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[P_ID] [int] IDENTITY(1,1) NOT NULL,
	[P_Name] [nvarchar](50) NULL,
	[P_Type] [nvarchar](max) NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[P_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([C_ID], [C_Firstname], [C_Lastname], [C_Phone], [C_Address], [Username], [Password]) VALUES (2, N'Prawit', N'Janoka', N'0123456789', N'48/1 อ.เมือง', N'jj', N'1234567')
INSERT [dbo].[Customers] ([C_ID], [C_Firstname], [C_Lastname], [C_Phone], [C_Address], [Username], [Password]) VALUES (1002, N'Prayuth ', N'Janocha', N'0999999999', N'49/2 อ.เมิง', N'Prayuth ', N'123444')
INSERT [dbo].[Customers] ([C_ID], [C_Firstname], [C_Lastname], [C_Phone], [C_Address], [Username], [Password]) VALUES (1003, N'haha', N'jaja', N'984546', N'48/1 laal', N'ta', N'123456')
SET IDENTITY_INSERT [dbo].[Customers] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([E_ID], [E_Firstname], [E_Lastname], [E_Phone], [Username], [Password]) VALUES (1, N'pawa', N'nana', N'09999', N'admin', N'123456')
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([O_ID], [O_Date], [O_Picture], [O_Status], [C_ID], [E_ID]) VALUES (2, N'04/01/2019', NULL, N'on going', NULL, NULL)
INSERT [dbo].[Order] ([O_ID], [O_Date], [O_Picture], [O_Status], [C_ID], [E_ID]) VALUES (3, N'03/02/2019', NULL, N'canceled', NULL, NULL)
INSERT [dbo].[Order] ([O_ID], [O_Date], [O_Picture], [O_Status], [C_ID], [E_ID]) VALUES (4, N'05/02/2019', NULL, N'completely', NULL, NULL)
INSERT [dbo].[Order] ([O_ID], [O_Date], [O_Picture], [O_Status], [C_ID], [E_ID]) VALUES (5, N'15/02/2019', NULL, N'receive sucessed', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([P_ID], [P_Name], [P_Type], [Price]) VALUES (1, N'เสื้อเชิ้ต,เสื่อนิสิต', N'ซัก', 10)
INSERT [dbo].[Product] ([P_ID], [P_Name], [P_Type], [Price]) VALUES (11, N'เสื่อยืด', N'ซัก', 8)
INSERT [dbo].[Product] ([P_ID], [P_Name], [P_Type], [Price]) VALUES (12, N'กางเกงขายาว', NULL, 10)
INSERT [dbo].[Product] ([P_ID], [P_Name], [P_Type], [Price]) VALUES (13, N'กางเกงขาสั้น', NULL, 8)
INSERT [dbo].[Product] ([P_ID], [P_Name], [P_Type], [Price]) VALUES (14, N'กางเกงขายีนส์', NULL, 15)
INSERT [dbo].[Product] ([P_ID], [P_Name], [P_Type], [Price]) VALUES (15, N'เสื้อกราว', NULL, 25)
INSERT [dbo].[Product] ([P_ID], [P_Name], [P_Type], [Price]) VALUES (16, N'เสื้อแจ็คเก็ตมเสื้อกันหนาว', NULL, 40)
INSERT [dbo].[Product] ([P_ID], [P_Name], [P_Type], [Price]) VALUES (17, N'กระโปรง', NULL, 10)
INSERT [dbo].[Product] ([P_ID], [P_Name], [P_Type], [Price]) VALUES (18, N'กระโปรงพีท', NULL, 15)
INSERT [dbo].[Product] ([P_ID], [P_Name], [P_Type], [Price]) VALUES (19, N'ผ้าห่ม 3.5ฟุต', NULL, 40)
INSERT [dbo].[Product] ([P_ID], [P_Name], [P_Type], [Price]) VALUES (20, N'ผ้าห่ม 6 ฟุต', NULL, 90)
INSERT [dbo].[Product] ([P_ID], [P_Name], [P_Type], [Price]) VALUES (21, N'ชุดเผ้าปูที่นอน', NULL, 30)
INSERT [dbo].[Product] ([P_ID], [P_Name], [P_Type], [Price]) VALUES (22, N'หมอน', NULL, 30)
INSERT [dbo].[Product] ([P_ID], [P_Name], [P_Type], [Price]) VALUES (23, N'ผ้าเช็คตัว', NULL, 10)
INSERT [dbo].[Product] ([P_ID], [P_Name], [P_Type], [Price]) VALUES (24, N'ตุ๊กตา', NULL, 20)
INSERT [dbo].[Product] ([P_ID], [P_Name], [P_Type], [Price]) VALUES (25, N'รองเท้า', NULL, 20)
SET IDENTITY_INSERT [dbo].[Product] OFF
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customers1] FOREIGN KEY([C_ID])
REFERENCES [dbo].[Customers] ([C_ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customers1]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Employee1] FOREIGN KEY([E_ID])
REFERENCES [dbo].[Employee] ([E_ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Employee1]
GO
ALTER TABLE [dbo].[Order_Product]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product_Order] FOREIGN KEY([O_ID])
REFERENCES [dbo].[Order] ([O_ID])
GO
ALTER TABLE [dbo].[Order_Product] CHECK CONSTRAINT [FK_Order_Product_Order]
GO
ALTER TABLE [dbo].[Order_Product]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product_Product] FOREIGN KEY([P_ID])
REFERENCES [dbo].[Product] ([P_ID])
GO
ALTER TABLE [dbo].[Order_Product] CHECK CONSTRAINT [FK_Order_Product_Product]
GO
/****** Object:  StoredProcedure [dbo].[sqlAdminlogin]    Script Date: 4/26/2019 10:33:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sqlAdminlogin]
	@Username nvarchar(50),
	@Password nvarchar(50)
AS
BEGIN
	
	SET NOCOUNT ON; 
	SELECT        Username, Password
	FROM            Employee
	WHERE        (Username = @Username) AND (Password = @Password)

    
END
GO
/****** Object:  StoredProcedure [dbo].[sqllogin]    Script Date: 4/26/2019 10:33:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sqllogin]
  @Username nvarchar(50),
  @Password nvarchar(50)
AS 
BEGIN
	
	SET NOCOUNT ON;
	SELECT        Username, Password
	FROM            Customers
	WHERE        (Username = @Username) AND (Password = @Password)
  
END
GO
/****** Object:  StoredProcedure [dbo].[sqlRegister]    Script Date: 4/26/2019 10:33:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sqlRegister]
	@C_Firstname nvarchar(50),
	@C_Lastname nvarchar(50),
	@C_Phone nvarchar(15),
	@C_Address nvarchar(MAX),
	@Username nvarchar(50),
	@Password nvarchar(50)

	  
AS 
BEGIN
INSERT INTO Customers
                         (C_Firstname, C_Lastname, C_Phone, C_Address, Username, Password)
VALUES        (@C_Firstname,@C_Lastname,@C_Phone,@C_Address,@Username,@Password)
	
	

END
GO
USE [master]
GO
ALTER DATABASE [Suckreed] SET  READ_WRITE 
GO
