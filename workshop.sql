USE [LOGIN_TEST_DB]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 10/30/2023 11:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[order_id] [varchar](20) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[order_total] [int] NOT NULL,
	[order_date] [date] NOT NULL,
	[order_des] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/30/2023 11:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[username] [varchar](10) NULL,
	[password] [varchar](32) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Order] ([order_id], [username], [order_total], [order_date], [order_des]) VALUES (N'OR001', N'user1', 10, CAST(N'2023-10-28' AS Date), N'Đơn hàng tốt')
INSERT [dbo].[Order] ([order_id], [username], [order_total], [order_date], [order_des]) VALUES (N'OR5', N'thu', 2, CAST(N'2023-02-03' AS Date), N'hahaha')
INSERT [dbo].[Order] ([order_id], [username], [order_total], [order_date], [order_des]) VALUES (N'ORD001', N'thu', 2, CAST(N'2023-10-28' AS Date), N'haha')
INSERT [dbo].[Order] ([order_id], [username], [order_total], [order_date], [order_des]) VALUES (N'ORD002', N'user2', 250, CAST(N'2023-10-29' AS Date), N'Khách hàng thanh toán thẻ')
INSERT [dbo].[Order] ([order_id], [username], [order_total], [order_date], [order_des]) VALUES (N'ORD004', N'user3', 50, CAST(N'2023-10-30' AS Date), N'Ðon hàng m?u 3')
INSERT [dbo].[Order] ([order_id], [username], [order_total], [order_date], [order_des]) VALUES (N'ORD005', N'thu', 20, CAST(N'2017-12-07' AS Date), N'hahaha')
INSERT [dbo].[Order] ([order_id], [username], [order_total], [order_date], [order_des]) VALUES (N'ORD006', N'xuan', 250, CAST(N'2023-10-29' AS Date), N'Mua hom qua')
INSERT [dbo].[Order] ([order_id], [username], [order_total], [order_date], [order_des]) VALUES (N'ORD007', N'user3', 50, CAST(N'2023-10-30' AS Date), N'Ðon hàng m?u 3')
GO
INSERT [dbo].[Users] ([username], [password]) VALUES (N'thune', N'e10adc3949ba59abbe56e057f20f883e')
GO
/****** Object:  StoredProcedure [dbo].[CheckLogin]    Script Date: 10/30/2023 11:03:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckLogin]
@username varchar(10),
@password varchar(32)
AS
SELECT username
FROM Users
WHERE username = @username AND password = @password;
GO
