USE [master]
GO
/****** Object:  Database [ProductDB]    Script Date: 3/7/2018 11:10:32 PM ******/
CREATE DATABASE [ProductDB]
GO

USE [ProductDB]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/7/2018 11:10:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/7/2018 11:10:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [uniqueidentifier] NOT NULL,
	[CategoryId] [uniqueidentifier] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[InStock] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/7/2018 11:10:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[Lastname] [nvarchar](50) NOT NULL,
	[Firstname] [nvarchar](50) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[EmailAddress] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Categories] ([Id], [Description], [Name]) VALUES (N'a5dbf00d-2e29-4993-a0ca-7e861272c6dc', N'Technical Videos', N'Videos')
GO
INSERT [dbo].[Categories] ([Id], [Description], [Name]) VALUES (N'5ccaa9d0-e436-4d1e-a463-b45696d73a9f', N'Technical Books', N'Books')
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Description], [Image], [Name], [Price], [InStock]) VALUES (N'02341321-c20b-48b1-a2be-47e67f548f0f', N'5ccaa9d0-e436-4d1e-a463-b45696d73a9f', N'Microservices for .NET Core', N'microservices.jpeg', N'Microservices for .NET', CAST(651.00 AS Decimal(18, 2)), 5)
GO
INSERT [dbo].[Products] ([Id], [CategoryId], [Description], [Image], [Name], [Price], [InStock]) VALUES (N'4d261e4a-a657-4add-a0f6-dde6e1464d55', N'5ccaa9d0-e436-4d1e-a463-b45696d73a9f', N'Leanr C# in 7 days', N'csharp.jpeg', N'Learn C#', CAST(520.00 AS Decimal(18, 2)), 15)
GO
INSERT [dbo].[Users] ([Id], [Lastname], [Firstname], [UserName], [Password], [EmailAddress]) VALUES (N'102729d6-be98-4c15-9dd4-2d709acfd3c8', N'Arora', N'Gaurav', N'aroraG', N'password', N'gaurav@gaurav-arora.com')
GO

/****** Object:  Index [IX_Products_CategoryId]    Script Date: 4/7/2018 11:10:33 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
USE [master]
GO
ALTER DATABASE [ProductDB] SET  READ_WRITE 
GO
