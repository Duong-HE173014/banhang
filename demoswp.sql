
/****** Object:  Database [SWP_Online_Shop]    Script Date: 1/16/2024 3:55:04 PM ******/
CREATE DATABASE [SWP_Online_Shop]
GO
ALTER DATABASE [SWP_Online_Shop] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP_Online_Shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP_Online_Shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP_Online_Shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP_Online_Shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP_Online_Shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP_Online_Shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP_Online_Shop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SWP_Online_Shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP_Online_Shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP_Online_Shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP_Online_Shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP_Online_Shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP_Online_Shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP_Online_Shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP_Online_Shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP_Online_Shop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP_Online_Shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP_Online_Shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP_Online_Shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP_Online_Shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP_Online_Shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP_Online_Shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP_Online_Shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP_Online_Shop] SET RECOVERY FULL 
GO
ALTER DATABASE [SWP_Online_Shop] SET  MULTI_USER 
GO
ALTER DATABASE [SWP_Online_Shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP_Online_Shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP_Online_Shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP_Online_Shop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP_Online_Shop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP_Online_Shop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SWP_Online_Shop', N'ON'
GO
ALTER DATABASE [SWP_Online_Shop] SET QUERY_STORE = ON
GO
ALTER DATABASE [SWP_Online_Shop] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SWP_Online_Shop]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 1/16/2024 3:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CartID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 1/16/2024 3:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 1/16/2024 3:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ProductID] [int] NULL,
	[RatedStar] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[Feedback] [nvarchar](max) NULL,
	[Images] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 1/16/2024 3:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Thumbnail] [nvarchar](255) NULL,
	[ProductName] [nvarchar](255) NULL,
	[UnitPrice] [decimal](10, 2) NULL,
	[Quantity] [int] NULL,
	[TotalCost] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 1/16/2024 3:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[TotalCost] [decimal](10, 2) NULL,
	[Status] [nvarchar](50) NULL,
	[ReceiverFullName] [nvarchar](255) NULL,
	[ReceiverEmail] [nvarchar](255) NULL,
	[ReceiverMobile] [nvarchar](20) NULL,
	[ReceiverAddress] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 1/16/2024 3:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Author] [nvarchar](255) NULL,
	[UpdatedDate] [datetime] NULL,
	[CategoryID] [int] NULL,
	[Thumbnail] [nvarchar](255) NULL,
	[BriefInfo] [nvarchar](max) NULL,
	[Details] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostCategories]    Script Date: 1/16/2024 3:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostCategories](
	[PostCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[PostCategoryName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[PostCategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 1/16/2024 3:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[CategoryID] [int] NULL,
	[UpdatedDate] [datetime] NULL,
	[Image] [nvarchar](255) NULL,
	[BriefInfo] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[AttachedImages] NVARCHAR(MAX) NULL,
	[Price] [decimal](10, 2) NULL,
	[SalePrice] [decimal](10, 2) NULL,
	[Quantity][int] NULL,
	[Featured] BIT NULL,
    [Status] NVARCHAR(50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Settings]    Script Date: 1/16/2024 3:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Settings](
	[SettingID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Value] [nvarchar](255) NULL,
	[Order] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SettingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sliders]    Script Date: 1/16/2024 3:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[SliderID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[Image] [nvarchar](255) NULL,
	[Backlink] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[SliderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE Status (
    StatusID INT PRIMARY KEY,
    StatusName NVARCHAR(50) NULL
);

-- Thêm dữ liệu vào bảng Status
INSERT INTO Status (StatusID, StatusName) VALUES (1, 'Vip'), (2, 'normal');


/****** Object:  Table [dbo].[Users]    Script Date: 1/23/2024 8:13:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
    [UserID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
    [Image] [nvarchar](255) NULL,
    [FullName] [nvarchar](255) NULL,
    [Email] [nvarchar](255) NULL,
    [Password] [nvarchar](255) NULL,
    [UpdatedDate] [datetime] NULL,
    [Role] [nvarchar](50) NULL,
    [Gender] [bit] NULL,
    [Address] [nvarchar](255) NULL,
    [Phone] [nvarchar](20) NULL,
    [Note] [nvarchar](255) NULL,
    [StatusID] [int] NULL,
    CONSTRAINT [FK_Users_Status] FOREIGN KEY ([StatusID]) REFERENCES [dbo].[Status]([StatusID])
);
GO
CREATE TABLE CustomerStatusHistory (
    HistoryID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT,
    OldStatusID INT,
    NewStatusID INT,
    ChangedDate DATETIME,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (OldStatusID) REFERENCES Status(StatusID),
    FOREIGN KEY (NewStatusID) REFERENCES Status(StatusID)
);
GO

SET IDENTITY_INSERT [dbo].[Cart] ON 
GO
INSERT [dbo].[Cart] ([CartID], [UserID], [ProductID], [Quantity]) VALUES (1, 1, 1, 2)
GO
INSERT [dbo].[Cart] ([CartID], [UserID], [ProductID], [Quantity]) VALUES (2, 2, 2, 1)
GO
INSERT [dbo].[Cart] ([CartID], [UserID], [ProductID], [Quantity]) VALUES (3, 3, 3, 3)
GO
SET IDENTITY_INSERT [dbo].[Cart] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1, N'Sách Kinh Tế & Kỹ Năng')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (2, N'Sách Tâm Lý Học')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (3, N'Sách Văn Học')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (4, N'Sách Thiếu Nhi')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (5, N'Sách Giáo Dục & Gia Đình')
GO
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (6, N'Sách Lịch Sử')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedbacks] ON 
GO
INSERT [dbo].[Feedbacks] ([FeedbackID], [UserID], [ProductID], [RatedStar], [Feedback], [Images]) VALUES (1, 1, 1, 5, N'Great laptop! Very fast and reliable.', N'laptop_feedback.jpg')
GO
INSERT [dbo].[Feedbacks] ([FeedbackID], [UserID], [ProductID], [RatedStar], [Feedback], [Images]) VALUES (2, 2, 2, 4, N'Love the dress, but the color is a bit different from the picture.', N'dress_feedback.jpg')
GO
INSERT [dbo].[Feedbacks] ([FeedbackID], [UserID], [ProductID], [RatedStar], [Feedback], [Images]) VALUES (3, 3, 3, 4, N'The smart thermostat works well, but installation was a bit tricky.', N'thermostat_feedback.jpg')
GO
SET IDENTITY_INSERT [dbo].[Feedbacks] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Thumbnail], [ProductName], [UnitPrice], [Quantity], [TotalCost]) VALUES (1, 1, 1, N'laptop_thumbnail.jpg', N'Laptop', CAST(999.99 AS Decimal(10, 2)), 2, CAST(1999.98 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Thumbnail], [ProductName], [UnitPrice], [Quantity], [TotalCost]) VALUES (2, 2, 2, N'dress_thumbnail.jpg', N'Summer Dress', CAST(59.99 AS Decimal(10, 2)), 1, CAST(59.99 AS Decimal(10, 2)))
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Thumbnail], [ProductName], [UnitPrice], [Quantity], [TotalCost]) VALUES (3, 3, 3, N'thermostat_thumbnail.jpg', N'Smart Thermostat', CAST(79.99 AS Decimal(10, 2)), 3, CAST(239.97 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalCost], [Status], [ReceiverFullName], [ReceiverEmail], [ReceiverMobile], [ReceiverAddress]) VALUES (1, 1, CAST(N'2024-01-16T15:48:40.500' AS DateTime), CAST(1999.97 AS Decimal(10, 2)), N'Pending', N'John Doe', N'john.doe@example.com', N'1234567890', N'123 Main St')
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalCost], [Status], [ReceiverFullName], [ReceiverEmail], [ReceiverMobile], [ReceiverAddress]) VALUES (2, 2, CAST(N'2024-01-16T15:48:40.500' AS DateTime), CAST(59.99 AS Decimal(10, 2)), N'Shipped', N'Jane Smith', N'jane.smith@example.com', N'9876543210', N'456 Oak St')
GO
INSERT [dbo].[Orders] ([OrderID], [UserID], [OrderDate], [TotalCost], [Status], [ReceiverFullName], [ReceiverEmail], [ReceiverMobile], [ReceiverAddress]) VALUES (3, 3, CAST(N'2024-01-16T15:48:40.500' AS DateTime), CAST(239.97 AS Decimal(10, 2)), N'Delivered', N'Bob Johnson', N'bob.johnson@example.com', N'5555555555', N'789 Pine St')
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT INTO [dbo].[Products] ([ProductID], [Title], [CategoryID], [UpdatedDate], [Image], [BriefInfo], [Description], [Price], [SalePrice]) VALUES 
(1, N'Chính Sách Tiền Tệ Thế Kỷ 21', 1, CAST(N'2024-01-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70821/chinh-sach-tien-te-the-ky-21.jpg', N'Ben S. Bernake', N'Tác giả: Ben S. Bernake
Kích thước: 16 x 24 cm
Cuốn sách "Chính Sách Tiền Tệ Thế Kỷ 21: Chiến lược ứng phó của Cục Dự trữ Liên bang Mỹ từ đại lạm phát đến nay" là tác phẩm của Ben S. Bernanke, người từng giữ chức Chủ tịch Cục Dự trữ Liên bang Hoa Kỳ (FED) từ 2006 đến 2014. Cuốn sách mang đến cái nhìn tổng quan về chính sách tiền tệ của FED và những thách thức kinh tế như lạm phát, rủi ro tài chính, và cách vượt qua để duy trì vị thế hàng đầu của Mỹ trên thị trường thế giới.
Bố cục của cuốn sách được chia thành 4 phần, phản ánh các giai đoạn quan trọng trong lịch sử 70 năm qua. Nói về sự tăng giảm của lạm phát, chiến lược ứng phó của FED trước Đại lạm phát, khủng hoảng tài chính toàn cầu và Đại suy thoái, từ nâng lãi suất đến đại dịch Covid-19, và nhìn nhận về tương lai.
Cuốn sách không chỉ dành cho những người chuyên sâu về kinh tế mà còn phù hợp cho độc giả phổ thông muốn hiểu về chính sách tiền tệ và vai trò của FED. Nó cũng hấp dẫn cho sinh viên ngành kinh tế tài chính và những người quản lý chính sách tài chính muốn học hỏi từ một trong những ngân hàng trung ương hàng đầu thế giới. 
Cuốn sách đặt ra câu hỏi về vai trò của FED trong việc ổn định nền kinh tế và hệ thống tài chính, đồng thời nêu bật những thách thức cấp bách như biến đổi khí hậu, bất bình đẳng xã hội, và khả năng giải quyết những vấn đề này.', 325000, 260000),
(2, N'Marketing Hướng Nội', 1, CAST(N'2023-12-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70587/marketing-huong-noi.jpg', N'Mark W. Schaefer', N'Tác giả: Mark W. Schaefer
Kích thước: 13.5 x 20 cm
Cuốn sách "Marketing Hướng Nội" khám phá xu hướng hiện đại trong lĩnh vực tiếp thị, tập trung vào sự thay đổi quan trọng trong hành vi người tiêu dùng và những nhu cầu cơ bản như tình yêu, ý nghĩa và sự tôn trọng. Trong bối cảnh tiếp thị truyền thống giảm sức mạnh, sách đề cập đến sự gia tăng quyền lực của khách hàng và những người sáng tạo, đồng thời tập trung vào tiếp thị cộng đồng như một cách tiếp cận mới và chưa được khai phá.
Tác phẩm nhấn mạnh sự thay đổi từ quan điểm trước đây, khi thương hiệu được định nghĩa bởi công ty, đến hiện nay, khi thương hiệu được xác định bởi tương tác giữa cộng đồng. "Marketing Hướng Nội" mang lại cái nhìn tổng quan về chiến lược marketing dựa trên cộng đồng và khuyến khích độc giả tìm hiểu và áp dụng nó vào chiến lược tiếp thị của họ.', 129000, 103000),
(3, N'Đi Làm Đừng Đi Lầm', 1, CAST(N'2023-12-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70586/di-lam-dung-di-lam.jpg', N'Ron Friedman', N'Tác giả: Ron Friedman
Kích thước: 14.5 x 20.5 cm
Tại sao chúng ta phải ĐI LÀM?
Vì tiền bạc, vì đam mê hay đơn giản chỉ là hít “drama”, đủ thứ chuyện trên giời dưới biển.
Làm sao để ĐI LÀM ĐÚNG?
Bí quyết là không phải ngủ nhờ trên lưng tự ái, hay lưng tự do. Tất cả nằm trong cách bạn bài trí nơi làm việc, chọn đồng đội đúng và ứng xử chín chắn, có duyên.
Có những lúc bạn phải ĐỪNG ĐI LÀM?
Ở nhà nghỉ dưỡng, tận hưởng khoảnh khắc tự do. Nhưng có lẽ cái quan trọng nhất, đừng nên ĐI LÀM MÀ BỎ QUA NIỀM VUI, trong khi những phút chờ đợi và những lúc thất bại cũng chính là điều bạn cần để sáng tạo và phát triển bản thân. Điều quan trọng là hãy hiểu rõ nguyên tắc này và áp dụng để thay đổi công việc thành cuộc sống và ngược lại.', 99000, 79000),
(4, N'NFT - Đáp Án Mới Cho Sự Thịnh Vượng', 1, CAST(N'2023-11-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/69855/nft-dap-an-moi-cho-su-thinh-vuong.jpg', N'Jared T. Ross', N'Tác giả: Jared T. Ross
Kích thước: 13.5 x 20.5 cm
Cuốn sách "NFT - Đáp Án Mới Cho Sự Thịnh Vượng" là một hướng dẫn chi tiết về thế giới NFT, 
 giải thích đơn giản về giá trị của chúng và vai trò quan trọng của NFT trong khái niệm Metaverse. 
Tác giả Jared T.Ross chia sẻ chiến thuật đầu tư vào dự án NFT, cách tạo/đúc NFT mà không cần mã hóa, và nhiều chiến lược khác để tận dụng cơ hội trong không gian NFT.
 Cuốn sách phù hợp với mọi lứa tuổi và trình độ kỹ năng, từ người mới sử dụng NFT đến những nhà đầu tư và nghệ sĩ sáng tạo. Tác giả, sau khi tự học về NFT, trở thành chuyên gia và đã được mời trở lại giảng dạy về NFT tại Đại học.
 Cuốn sách hứa hẹn là một bản đồ chi tiết cho những người muốn khám phá và tìm kiếm lợi nhuận trong thế giới NFT.', 88000, 70500),
(5, N'Không Bao Giờ Là Thất Bại! Tất Cả Là Thử Thách', 1, CAST(N'2021-12-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/44363/khong-bao-gio-la-that-bai-tat-ca-la-thu-thach-bia-cung-3.jpg', N'Chung Ju Yung', N'Tác giả: Chung Ju Yung
Kích thước: 16 x 24 cm
Cuốn ""Không Bao Giờ Là Thất Bại! Tất Cả Là Thử Thách"" của Chung Ju-yung là một hành trình sâu sắc vào tâm hồn doanh nhân, chứa đựng bài học vô cùng quý giá về sự kiên trì, lòng can đảm và tầm nhìn rộng lớn. Tác giả không chỉ chia sẻ về hành trình xây dựng đế chế Hyundai, mà còn truyền đạt tinh thần không bao giờ chấp nhận thất bại, mà thay vào đó, nhìn nhận mọi khó khăn như những thử thách cần vượt qua. Cuốn sách là nguồn động viên mạnh mẽ, giúp độc giả đối mặt tích cực với những khó khăn trong cuộc sống và sự nghiệp.', 268000, 228000),
(6, N'Đến Thượng Đế Cũng Phải Hài Lòng', 1, CAST(N'2021-06-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/44298/den-thuong-de-cung-phai-hai-long.jpg', N'Renee Evenson', N'Tác giả: Renee Evenson
Kích thước: 13 x 20.5 cm
Cuốn sách "Đến Thượng Đế Cũng Phải Hài Lòng" tập trung vào việc chia sẻ những chiến lược và kỹ thuật hiệu quả trong lĩnh vực chăm sóc khách hàng. Tác giả giới thiệu những nguyên tắc cơ bản và hữu ích, kết hợp với ví dụ thực tế và tình huống thách thức, giúp độc giả nắm bắt kiến thức một cách dễ dàng. Cuốn sách này là nguồn thông tin hữu ích cho những ai muốn cải thiện kỹ năng chăm sóc khách hàng và tạo ra trải nghiệm tích cực cho khách hàng.', 158000, 128000),
(7, N'Nói Sao Cho Khách Hàng Thích - Bán Sao Cho Khách Hàng Mua', 1, CAST(N'2023-07-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/67876/noi-sao-cho-khach-hang-thich-ban-sao-cho-khach-hang-mua.jpg', N'Jeb Blount', N'Tác giả: Jeb Blount
Kích thước: 13 x 19 cm
Cuốn sách "Nói Sao Cho Khách Hàng Thích - Bán Sao Cho Khách Hàng Mua" của Jeb Blount là một hướng dẫn chi tiết về cách duy trì và phát triển kỹ năng bán hàng trong thị trường đầy biến động. Tác giả cung cấp 55 lời khuyên và chiến thuật đã được kiểm chứng để giúp động viên, duy trì danh sách khách hàng, và vượt qua những thách thức trong quá trình bán hàng. Cuốn sách này là nguồn cảm hứng và kiến thức hữu ích cho những người muốn nâng cao hiệu suất bán hàng của mình, đặc biệt là trong thời kỳ khó khăn.', 149000, 129000),
(8, N'Kỹ Năng Lập Kế Hoạch Và Quản Lý Tài Chính Cá Nhân Trong 30 Ngày', 1, CAST(N'2023-07-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/67890/ky-nang-lap-ke-hoach-va-quan-ly-tai-chinh-ca-nhan-trong-30-ngay.jpg', N'Ashley Feinstein Gertsley', N'Tác giả: Ashley Feinstein Gertsley
Kích thước: 13 x 19 cm
Cuốn sách "Kỹ Năng Lập Kế Hoạch Và Quản Lý Tài Chính Cá Nhân Trong 30 Ngày" của tác giả Ashley Feinstein Gertsley là hướng dẫn chi tiết giúp bạn tái thiết lập mối quan hệ với tiền bạc, tìm hiểu cách lập kế hoạch chi tiêu, quản lý thu chi, và thay đổi tư duy về tiền bạc. Đồng thời, sách cung cấp các phương pháp giảm thiểu áp lực tài chính và đạt được các mục tiêu cá nhân. Tác giả, với kinh nghiệm làm việc trong ngành tài chính, chia sẻ kiến thức của mình để hỗ trợ độc giả xây dựng một lối sống tài chính tích cực và ổn định.', 159000, 128000),
(9, N'Siêu Kinh Tế Học Hài Hước', 1, CAST(N'2023-06-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/1215/sieu-kinh-te-hoc-hai-huoc.jpg', N'Steven D. Levitt, Stephen J. Dubner', N'Tác giả: Steven D. Levitt, Stephen J. Dubner
Kích thước: 14 x 20.5 cm
"Siêu Kinh Tế Học Hài Hước" là cuốn sách thú vị của các tác giả Steven D. Levitt và Stephen J. Dubner, tiết lộ những khía cạnh kinh tế ít người biết đến thông qua góc nhìn hài hước và đầy sáng tạo. Từ những câu chuyện về những người buôn ma túy thông minh đến việc giải mã bí ẩn sau những hiện tượng kinh tế đời thường, cuốn sách mở ra một thế giới kinh tế mới lạ và hấp dẫn, phù hợp cho cả người mới bắt đầu và những người muốn khám phá sâu hơn về lĩnh vực này.', 179000, 149000),
(10, N'Sáng Suốt Về Tiền bạc', 1, CAST(N'2022-07-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/49744/sang-suot-ve-tien-bac.jpg', N'Alice Brandy', N'Tác giả: Alice Bandy
Kích thước: 13.5 x 21 cm
Từ xưa đến nay, tiền bạc luôn là vấn đề đối với nhiều người, nhất là làm thế nào để tự do tài chính và biết cách giữ tiền, xài tiền đúng cách. Làm được điều đó, bạn hoàn toàn có thể giành lại sức mạnh, bắt đầu sử dụng tiền như một công cụ hữu ích để hướng đến cuộc sống hạnh phúc.
SÁNG SUỐT VỀ TIỀN BẠC sẽ dẫn dắt bạn từng bước trong quá trình tạo ra sự thịnh vượng và an lạc mới cho cuộc sống của bản thân, giúp bạn có cái nhìn sâu sắc hơn về tiền bạc. Bằng cách đặt ra mục đích rõ ràng, tìm ra những trở ngại ngăn cản bạn đến với cuộc sống mình mong muốn, dành thời gian loại bỏ chúng, bạn sẽ trở nên thành thật với bản thân hơn.', 85000, 69000),
(11, N'Chúc Bạn Một Ngày Ấm Áp', 2, CAST(N'2024-01-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70910/chuc-ban-mot-ngay-am-ap-3.jpg', N'Go Eun Ji', N'Tác giả: Go Eun Ji
Kích thước: 14 x 22 cm
GỬI BẠN CÁI ÔM DỊU DÀNG TỪ GẤU CHỮA LÀNH GGONGDAL
Bạn mệt rồi đúng không?
Hãy đến đây, mình sạc pin cho nè!
Bạn cảm thấy lòng mình lạnh lẽo, u ám đúng không?
Hãy đến đây để mình sưởi ấm cho bạn nhé!
Xin tự giới thiệu, mình là Ggongdal! Mình dễ thương lắm nên bạn hãy yên tâm là mình có thể mang đến niềm vui, tiếng cười cho bạn.
Khi bạn buồn, khi bạn gặp rắc rối, khi bạn yếu lòng, mình không an ủi bạn bằng những nói sáo rỗng, mình cũng không khuyên nhủ bạn với những triết lý xa vời. Mình chỉ ở bên cạnh bạn, lắng nghe bạn bằng những cảm xúc chân thành nhất!', 169000, 135000),
(12, N'Muối - Sự Hồi Sinh Nơi Sâu Thẳm Vụn Vỡ - Ngoại Truyện', 2, CAST(N'2024-01-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70898/muoi-su-hoi-sinh-noi-sau-tham-vun-v-ngoai-truyen.jpg', N'Tôn Tần', N'Tác giả: Tôn Tần
Kích thước: 10 x 15 cm
“MUỐI - SỰ HỒI SINH NƠI SÂU THẲM VỤN VỠ” PHIÊN BẢN NGOẠI TRUYỆN - Điều tăm tối gì ẩn sau chương truyện từng bị cắt bỏ?
Đó là nỗi sợ của một đứa trẻ thiếu thốn tình thương, là thế giới quan đảo lộn đầy sai trái, là sự bù đắp và hy sinh muộn màng của người cha khắc khổ.
Vẫn là câu chuyện khai thác đề tài nặng tâm lý gây á.m ả.nh người đọc từ những dòng đầu tiên, “Muối - Sự hồi sinh nơi sâu thẳm vụn vỡ” bản Ngoại truyện sẽ một lần nữa dẫn dắt bạn đọc trải qua đủ loại cung bậc cảm xúc hỉ, nộ, ái, ố khi chứng kiến sự nghiệt ngã của những kiếp người. Họ là vô số mảnh ghép nứt vỡ và chắp vá, nhưng không thể thiếu để tạo nên thế giới méo mó hoàn chỉnh này.', 30000, NULL),
(13, N'Hiểu Về Bản Chất Con Người - Lý Luận Của Bậc Thầy Tâm Thần Học', 2, CAST(N'2023-12-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70809/hieu-ve-ban-chat-con-nguoi-ly-luan-cua-bac-thay-tam-than-hoc.jpg', N'Alfred Adler', N'Tác giả: Alfred Adler
Kích thước: 15.7 x 24 cm
Cuốn sách "Hiểu về Bản Chất Con Người - Lý Luận của Bậc Thầy Tâm Thần Học" tập trung vào quan điểm của Alfred Adler, một chuyên gia tâm lý người Áo, người sáng lập ra trường phái tâm lý học cá nhân. Adler tập trung vào những khía cạnh tích cực của con người, đặc biệt là ý thức về mục tiêu cá nhân và sự quan trọng của cộng đồng trong việc định hình tâm lý của chúng ta.
Cuốn sách này giúp độc giả hiểu rõ hơn về lý thuyết của Alfred Adler, qua đó có cái nhìn sâu sắc hơn về bản chất con người, đồng thời khám phá sức mạnh tích cực có thể hình thành từ ý thức về mục tiêu và sự kết nối xã hội.', 98000, 78000),
(14, N'Để Nói Lời Từ Biệt Với Cha', 2, CAST(N'2023-12-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70519/de-noi-loi-tu-biet-voi-cha.jpg', N'Rachel Clarke', N'Tác giả: Rachel Clarke
Kích thước: 14.5 x 20.5 cm
Cuốn sách "Để Nói Lời Từ Biệt Với Cha" là một tác phẩm bán chạy của The Sunday Times và đã đoạt giải thưởng Sách Costa năm 2020. Tác giả chia sẻ về những suy nghĩ và trải nghiệm của mình trước khi nói lời từ biệt với cha. Qua những suy tư này, tác giả nhận ra rằng ý nghĩa thực sự nằm trong những điều nhỏ bé, trong những hành động tình thương hàng ngày. Cuốn sách là một hành trình tìm kiếm ý nghĩa cuộc sống và tình thương gia đình. Trích dẫn từ sách thể hiện lòng tự hào về một cuộc sống trọn vẹn và ý nghĩa, cũng như ý chí sống mạnh mẽ và đầy niềm tin vào cuộc sống.', 123000, 98500),
(15, N'Phá Bẫy Tích Cực Độc Hại - Trung Thực Với Cảm Xúc Trong Một Thế Giới Ám Ảnh Với Hạnh Phúc', 2, CAST(N'2023-12-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70520/pha-bay-tich-cuc-doc-hai-trung-thuc-voi-cam-xuc-trong-mot-the-gioi-am-anh-voi-hanh-phuc.jpg', N'Whitney Goodman', N'Tác giả: Whitney Goodman
Kích thước: 14.5 x 20 cm
Cuốn sách "Phá Bẫy Tích Cực Độc Hại" của tác giả Whitney Goodman đưa ra quan điểm mới về việc chúng ta đang theo đuổi một phiên bản "tốt nhất" và "hạnh phúc nhất" ngoài tầm với. Tác giả không chối bỏ tích cực, mà thay vào đó, khuyến khích đối mặt với những thách thức và trưởng thành từ chúng. Sách cung cấp giải pháp và chiến lược để chấp nhận cảm xúc tự nhiên, xây dựng tư duy linh hoạt và giải thoát khỏi sự tích cực độc hại. Whitney Goodman chia sẻ nghiên cứu mới và ví dụ hàng ngày, bật mí về tổn hại của sự tích cực độc hại trong cuộc sống cá nhân và mối quan hệ. Cuốn sách tôn trọng sự thật và khám phá cách sống một cuộc đời đích thực thông qua việc đối mặt với khó khăn.', 119000, 95000),
(16, N'Lớp Học Tâm Lý Cho Người Hướng Nội', 2, CAST(N'2023-12-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70476/lop-hoc-tam-ly-cho-nguoi-huong-noi.jpg', N'Jaehoon Choi', N'Tác giả: Jaehoon Choi
Kích thước: 14.5 x 20.5 cm
"Lớp Học Tâm Lý Cho Người Hướng Nội" của tác giả Jaehoon Choi là một cuốn sách tâm lý thú vị và hữu ích dành cho những người có xu hướng hướng nội. Tác giả, một chuyên gia tâm lý xã hội, chia sẻ kiến thức và kinh nghiệm cá nhân của mình để giúp người hướng nội hiểu rõ về bản thân và thoải mái sống mà không cần phải thay đổi tính cách. Cuốn sách cung cấp lời khuyên thực tế và mẹo áp dụng vào cuộc sống hàng ngày, giúp người hướng nội thích ứng và hòa nhập một cách nhẹ nhàng hơn. Đồng thời, nó hướng dẫn cách linh hoạt trong mối quan hệ, tận dụng ưu điểm tự nhiên và giữ vững tâm thế tích cực trong thế giới đang hướng ngoại. Cuốn sách là một lời hướng dẫn toàn diện, giúp người đọc trở thành "người hướng nội hạnh phúc".', 119000, 95000),
(17, N'Tâm Lý Học Về Khắc Chế Cơn Giận - Đừng Để Cơn Giận Thay Đổi Con Người Bạn', 2, CAST(N'2023-11-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/69941/tam-ly-hoc-ve-khac-che-con-gian-dung-de-con-gian-thay-doi-con-nguoi-ban.jpg', N'Tằng Kiệt', N'Tác giả: Tằng Kiệt
Kích thước: 14 x 20.5 cm
Cuốn sách "Tâm Lý Học Về Khắc Chế Cơn Giận - Đừng Để Cơn Giận Thay Đổi Con Người Bạn" của tác giả không xác định chi tiết được nêu ra để giúp độc giả hiểu rõ về sự tức giận và cách kiểm soát nó. Tác giả bắt đầu với việc phân tích ý nghĩa, nguyên nhân, và hậu quả của sự tức giận. Cuốn sách tiếp tục thảo luận về 7 loại tức giận phổ biến và cách đối phó với chúng. Cuối cùng, nó tập trung vào việc thay đổi tư duy, xây dựng phương thức quản lý nội tâm, và biến cơn tức giận thành vô hình. Cuốn sách hứa hẹn giúp độc giả hiểu rõ hơn về cảm xúc của mình, kiểm soát tức giận hiệu quả, và sống một cuộc sống hạnh phúc và bình yên.', 168000, 143000),
(18, N'Là Gia Đình Nhưng Cũng Là Người Lạ', 2, CAST(N'2023-11-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/69854/la-gia-dinh-nhung-cung-la-nguoi-la.jpg', N'Won Jung Mee', N'Tác giả: Won Jung Mee
Kích thước: 13 x 19 cm
Cuốn sách "Là Gia Đình Nhưng Cũng Là Người Lạ" là một hành trình tìm kiếm sự tự chữa lành, mang đến những giây phút gửi gắm yêu thương đến đứa trẻ nội tâm từng trải qua tổn thương. Tác giả chia sẻ về hành trình của mình, với mong muốn tìm hiểu về mối quan hệ gia đình, nơi chứa đựng cả yêu thương và những "người lạ" ngay trong bản thân gia đình. Cuốn sách đặt ra câu hỏi về tình cảm, tự chữa lành, và niềm khát khao của đứa trẻ nội tâm về một gia đình hạnh phúc.', 96000, 77000),
(19, N'Tôi Ghét Thứ Gọi Là Lo Lắng', 2, CAST(N'2023-09-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/69165/toi-ghet-thu-goi-la-lo-lang-3.jpg', N'Sarah Knight', N'Tác giả: Sarah Knight
Cuốn sách "Tôi Ghét Thứ Gọi Là Lo Lắng" là một hướng dẫn thực tế giúp bạn giải quyết triệt để những vấn đề khi gặp khó khăn và rơi vào trạng thái lo lắng. Tác giả không chỉ nhấn mạnh tầm quan trọng của việc giữ bình tĩnh, mà còn cung cấp bộ công cụ hiệu quả để vượt qua hội chứng lo âu. Cuốn sách chứa đựng những lời khuyên vượt qua nỗi sợ, mẹo nhỏ để rũ bỏ rắc rối, và phương pháp xử lý tiêu cực để giúp bạn sống mỗi ngày với niềm vui và tích cực. Thay vì tự hào mình "Bình tĩnh lại," đây là một hướng dẫn giúp bạn đối mặt với lo lắng một cách chủ động và tích cực.', 89000, 71000),
(20, N'Thiên Đường Và Địa Ngục - Tâm Lý Học Về 26 Loại Cảm Xúc', 2, CAST(N'2023-09-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/69081/thien-duong-va-dia-nguc-tam-ly-hoc-ve-26-loai-cam-xuc.jpg', N'Neel Burton', N'Tác giả: Neel Burton
Kích thước: 12.5 x 20 cm
"Thiên Đường Và Địa Ngục - Tâm Lý Học Về 26 Loại Cảm Xúc" là hướng dẫn chi tiết về 26 loại cảm xúc, từ cơ bản đến phức tạp, giúp độc giả nhận biết, hiểu rõ, và kiểm soát cảm xúc để sống một cuộc sống có ý nghĩa và hạnh phúc.', 109000, 87000),
(21, N'Khoa Học Tâm Thức - Khám Phá Nơi Ẩn Giấu Linh Hồn Người Hiện Đại', 2, CAST(N'2023-09-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/68640/khoa-hoc-tam-thuc-kham-pha-noi-an-giau-linh-hon-nguoi-hien-dai.jpg', N'Carl Gustav Jung', N'Tác giả: Carl Gustav Jung
Kích thước: 13.5 x 20 cm
Khoa học tâm thức là một tác phẩm quan trọng của lĩnh vực tâm lý học. Cuốn sách cung cấp cái nhìn đầy khai sáng về vô thức và sự góp mặt của nó trong nền văn minh hiện đại. Cuốn sách còn là phần giới thiệu toàn diện về tư tưởng của Carl Jung – một trong những người sáng lập ngành tâm thần học hiện đại.
Trong cuốn sách, Carl Jung mổ xẻ một số lĩnh vực quan trọng và gây tranh cãi nhất trong tâm lý học phân tích: Phân tích giấc mơ, vô thức nguyên thủy và mối quan hệ giữa tâm lý học và tôn giáo. Ông cũng xem xét những khác biệt giữa lý thuyết của mình và của Freud, cung cấp kiến thức về các nguyên tắc cơ bản của phân tâm học.', 145000, 116000),
(22, N'Cô Gái À, Đừng Để Muộn Phiền Mãi Theo Em!', 2, CAST(N'2023-07-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/67927/co-gai-a-dung-de-muon-phien-mai-theo-em.jpg', N'Yoon Geul', N'Tác giả: Yoon Geul
Kích thước: 13 x 19 cm
Cuốn sách "Cô Gái À, Đừng Để Muộn Phiền Mãi Theo Em!" của Yoon Geul là một lời động viên và an ủi cho những cô gái trải qua những khó khăn sau chia tay. Tác giả chia sẻ những suy nghĩ tận cùng lòng mình, hy vọng mang lại nguồn động viên và sức mạnh cho độc giả để vượt qua những thời kỳ khó khăn, tìm lại bình an và hạnh phúc trong cuộc sống.', 96000, 77000),
(23, N'Phân Tích Tâm Lý Tội Phạm - Thế Giới Bên Trong Cái Ác', 2, CAST(N'2023-07-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/67935/phan-tich-tam-ly-toi-pham-the-gioi-ben-trong-cai-ac.jpg', N'Trương Uý', N'Tác giả: Trương Uý
Cuốn sách "Phân Tích Tâm Lý Tội Phạm - Thế Giới Bên Trong Cái Ác" của tác giả Trương Úy khám phá sâu sắc tâm lý của những kẻ phạm tội, giúp độc giả hiểu rõ về nguyên nhân và tâm lý đằng sau những hành vi tội ác khủng khiếp như hiếp dâm, giết người. Tác phẩm này được viết bởi một cố vấn tâm lý cấp quốc gia, hứa hẹn mang đến cái nhìn sâu sắc và chi tiết về thế giới tâm lý của những người phạm tội.', 135000, 108000),
(24, N'Tại Sao Lời Bạn Nói Lại Khiến Tôi Không Vui', 2, CAST(N'2023-07-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/67788/tai-sao-loi-ban-noi-lai-khien-toi-khong-vui-3.jpg', N'Park Jae Yeon', N'Tác giả: Park Jae Yeon
Kích thước: 14 x 20.5 cm
Cuốn sách "Tại Sao Lời Bạn Nói Lại Khiến Tôi Không Vui" giúp độc giả hiểu rõ về tác động của cách chúng ta đối thoại đến mối quan hệ và phẩm cách bản thân. Sách cung cấp phương pháp đối thoại thực tế để kết nối và giải quyết xung đột trong giao tiếp hàng ngày.', 179000, 143000),
(25, N'Sống Tốt Hơn “Tôi” Ngày Hôm Qua', 2, CAST(N'2023-06-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/67271/song-tot-hon-toi-ngay-hom-qua.jpg', N'Sohn Heem-Chan', N'Tác giả: Sohn Heem-Chan
Kích thước: 14.5 x 20.5 cm
Cuốn sách "Sống Tốt Hơn "Tôi" Ngày Hôm Qua" của tác giả Sohn Heem-chan giúp độc giả đánh thức khỏi quá khứ, tập trung sống hết mình ở hiện tại thông qua việc chữa lành tâm hồn bằng phương pháp viết lách, thiền định, và dọn dẹp nhà cửa. Tác giả chia sẻ chiếc chìa khóa vạn năng để giúp độc giả thoát khỏi vòng lãng quên quá khứ và sống hạnh phúc với hiện tại.', 79000, 63000),
(26, N'Trước Bình Minh Luôn Là Đêm Tối', 2, CAST(N'2023-06-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/671/truoc-binh-minh-luon-la-dem-toi.jpg', N'Tạ Minh Tuấn', N'Tác giả: Tạ Minh Tuấn
Kích thước: 15 x 23 cm
"Trước Bình Minh Luôn Là Đêm Tối" là hành trình khởi nghiệp của một chàng trai sắp 30 tuổi, chia sẻ về thành công, nỗ lực và những bài học từ cuộc sống. Tác giả nhấn mạnh về việc phát triển "văn hóa khởi nghiệp" và sự quan trọng của khởi nghiệp có trách nhiệm. Cuốn sách cũng kể về tình yêu thương gia đình và chứa đựng nhiều chia sẻ sâu sắc về thành công và thất bại trong cuộc sống.', 199000, 159000),
(27, N'Góc Sân Và Khoảng Trời', 3, CAST(N'2024-01-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70880/goc-san-va-khoang-troi-3.jpg', N'Trần Đăng Khoa', N'Tác giả: Trần Đăng Khoa
Kích thước: 13 x 20 cm
"Góc Sân và Khoảng Trời" là tập thơ đầu tay của nhà thơ Trần Đăng Khoa, viết khi mới 8 tuổi. Xuất bản năm 1968 và đã nhận được nhiều giải thưởng, tập thơ này thể hiện tình yêu của tác giả đối với lãnh thổ, con người, thiên nhiên, và gia đình. Mặc dù được viết bởi một cậu bé, nhưng thơ Trần Đăng Khoa có ý tưởng, cấu trúc rõ ràng và thể hiện sâu sắc về nhiều khía cạnh của cuộc sống.', 75000, 64000),
(28, N'Đảo Chìm - Tiểu Thuyết Mini', 3, CAST(N'2024-01-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70881/dao-chim-tieu-thuyet-mini-3.jpg', N'Trần Đăng Khoa', N'Tác giả: Trần Đăng Khoa
Kích thước: 13 x 20 cm
"Đảo Chìm - Tiểu Thuyết Mini" của tác giả Trần Đăng Khoa là một tác phẩm kể về cuộc sống của những người lính đang làm nhiệm vụ canh gác trên Đảo Chìm ở Trường Sa. Những nhân vật trong tác phẩm được mô tả thân thiện, gần gũi, và táo bạo, đồng thời họ đã hi sinh anh dũng vì Tổ quốc và đồng đội.
Tác phẩm chứa đựng cái tài của tác giả thông qua giọng văn hóm hỉnh, câu chữ chắt lọc, và khả năng lựa chọn tình tiết đắt giá. Mặc dù lượng từ viết không nhiều, nhưng không gian truyện vẫn phong phú và phức tạp, tạo nên một thế giới nghiêm ngặt nhưng tự do, tự tại.
Tác giả đã chọn lựa chất hoạt kê và bi tráng để tạo nên không gian độc đáo cho Đảo Chìm. Những đánh giá từ nhà văn Lê Lựu và nhà văn Chu Nhạc đã ca ngợi tác phẩm là "thần bút" và "kiệt tác nghệ thuật".', 100000, 80000),
(29, N'Lá Thư Dưới Gối', 3, CAST(N'2024-01-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70848/la-thu-duoi-goi.jpg', N'Nguyễn Thị Vân Trang', N'Tác giả: Nguyễn Thị Vân Trang
Kích thước: 13 x 19 cm
Lá thư dưới gối là một thế giới tràn đầy cảm xúc; và hơn thế, là một tác phẩm được viết nên bằng tình yêu của người mẹ, đang cùng con mình bước ra thế giới bao la, muôn màu...
Lá thư dưới gối được viết cho các bà mẹ và những đứa con trong độ tuổi thanh thiếu niên, với những bài học để chuẩn bị cho con sau này bước ra đời trở thành một người tử tế và sống hạnh phúc. Một cuốn sách có thể đọc song hành. Mẹ đọc để hiểu con hơn, con đọc để biết trăn trở của mẹ những tháng ngày dài nuôi dạy con lớn khôn. Con có thể học hỏi từ mẹ vốn kinh nghiệm xây dựng tổ ấm thông qua những chia sẻ về việc chọn bạn đời, chọn nghề nghiệp, cách quản lý tài chính cá nhân... Cuốn sách cũng mở ra một diễn đàn để các bà mẹ có thể trải lòng, chia sẻ về những niềm vui, nỗi buồn cũng như kinh nghiệm trong hành trình làm mẹ.', 69000, 59000),
(30, N'Có Con Mèo Đi Tìm Ngàn Năm', 3, CAST(N'2024-01-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70732/co-con-meo-di-tim-ngan-nam.jpg', N'Chanh30', N'Tác giả: Chanh30
Kích thước: 14.5 x 20.5 cm
"Có Con Mèo Đi Tìm Ngàn Năm" là câu chuyện về con mèo nhị thể Cửu và cuộc hành trình kéo dài ngàn năm tìm kiếm điều "vĩnh cửu thuần túy". Mèo bị mắc kẹt trong ván cược với lão Quang Âm, trải qua những biến động và thay đổi của thời gian. Hành trình giúp Cửu gặp những người, khám phá giá trị cuộc sống và tình cảm con người.', 139000, 113000), 
(31, N'Gió Lạnh Đầu Mùa - Tập Truyện Ngắn', 3, CAST(N'2023-12-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/19816/1gio-lanh-dau-mua-tap-truyen-ngan.jpg', N'Thạch Lam', N'Tác giả: Thạch Lam
Kích thước: 13.5 x 20.5 cm
"Gió Lạnh Đầu Mùa" là tập truyện ngắn của nhà văn Thạch Lam, tập hợp những câu chuyện về những khía cạnh khó khăn, đau buồn của cuộc sống người nghèo. Tác giả thể hiện sự chấp nhận hiện thực mà không kịch tính hóa tình cảm, tạo nên những câu chuyện chân thực về tình người và cuộc sống.', 68000, 55000),
(32, N'Lật Những Mảnh Ghép Văn Chương', 3, CAST(N'2023-10-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/69850/lat-nhung-manh-ghep-van-chuong.jpg', N'Phạm Khánh Duy', N'Tác giả: Phạm Khánh Duy
Kích thước: 13 x 21 cm
Cuốn sách này tập hợp các bài nghiên cứu, phê bình văn học của tác về một số bài thơ, truyện ngắn, tiểu thuyết, văn xuôi của các tác giả của nền văn học Việt Nam: nhận diện cổ mẫu trong thơ Xuân Quỳnh; Môi trường nông thôn trong truyện ngắn của Nguyễn Thị Việt Hà; Tiểu thuyết Mình và họ…', 96000, 82000),
(33, N'Mùa Dã Quỳ Nở Rộ', 3, CAST(N'2023-10-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/69450/mua-da-quy-no-ro.jpg', N'Nguyễn Hoàng Diệu Na', N'Tác giả: Nguyễn Hoàng Diệu Na
Kích thước: 14.5 x 20.5 cm
"Mùa Dã Quỳ Nở Rộ" là câu chuyện xoay quanh Hoàng Anh, một phụ nữ trở về Sài Gòn sau nhiều năm ở Mỹ. Trong quá trình tái ngộ với bạn thân Thanh và đối mặt với gia đình kém quan tâm, Hoàng Anh phải đối diện với những ký ức đau buồn và mối quan hệ phức tạp. Điều quan trọng là cuộc gặp gỡ này có thể làm lành những vết thương tâm hồn của Hoàng Anh.', 139000, 113000),
(34, N'Tiệm Tạp Hóa Tuổi Thơ Đang Lớn', 3, CAST(N'2023-10-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/69356/tiem-tap-hoa-tuoi-tho-dang-lon.jpg', N'Mochi Ở Đây', N'Tác giả: Mochi Ở Đây
Kích thước: 13 x 20.5 cm
"Tiệm Tạp Hóa Tuổi Thơ Đang Lớn" là cuốn sách đưa độc giả trở lại những ký ức ngọt ngào và đầy màu sắc của thời thơ ấu, khi tiệm tạp hóa gần nhà là niềm mơ ước của mọi đứa trẻ. Tác phẩm là hành trình hoài niệm về những ngày thơ dại, những khoảnh khắc đáng yêu và giản đơn, nhưng cũng chứa đựng nỗi buồn và sự thay đổi của thời gian.', 120000, 96000),
(35, N'Mùa Hè Không Tên', 3, CAST(N'2023-09-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/68666/mua-he-khong-ten-3.jpg', N'Nguyễn Nhật Ánh', N'Tác giả: Nguyễn Nhật Ánh
Kích thước: 13 x 20 cm
“Mùa hè không tên” là truyện dài mới của nhà văn Nguyễn Nhật Ánh, với những câu chuyện tuổi thơ với vô số trò tinh nghịch, những thoáng thinh thích hồi hộp cùng vô vàn kỷ niệm. Để rồi khi những tháng ngày trong sáng của tình bạn dần qua, bọn nhỏ trong mỗi gia đình bình dị lớn lên cùng chứng kiến những giây phút cảm động của câu chuyện tình thân, nỗi khát khao hạnh phúc êm đềm, cùng bỡ ngỡ bước vào tuổi lớn nhiều yêu thương mang cả màu va vấp.
Mùa hè năm ấy của cậu bé Khang không chỉ toàn chuyện leo cây hái trái và qua lại với con Nhàn hồn hậu đáng yêu ưa nuôi bọn cá dị tật, mà có Tí, có Chỉnh, rồi Tức, Đính... phải đối mặt với những thử thách của số phận. Nhưng vì sao là “mùa hè không tên”? mãi mãi.', 130000, 104000),
(36, N'Have A Good Day', 3, CAST(N'2023-08-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/68337/have-a-good-day.jpg', N'Nguyễn Nhật Ánh', N'Tác giả: Nguyễn Nhật Ánh
Kích thước: 13 x 20 cm
Đây là bản dịch tiếng Anh của cuốn Chúc một ngày tốt lành của Nhà văn Nguyễn Nhật Ánh. Câu chuyện xoay quanh các con vật xung quanh vườn nhà như heo con, chó, gà... Tất cả làm nên một câu chuyện vô cùng thú vị.', 190000, 152000),
(37, N'Vì Sao Không Thể Giết?', 3, CAST(N'2024-01-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70878/vi-sao-khong-the-giet.jpg', N'Ippongi Toru', N'Tác giả: Ippongi Toru
Kích thước: 14.5 x 20.5 cm
"Vì Sao Không Thể Giết?" là câu chuyện căng thẳng và hấp dẫn xoay quanh cuộc đối thoại giữa nhà báo Ippongi Toru và kẻ sát nhân tự xưng là Vaccine. Khi những vụ án mạng bí ẩn xảy ra, Ippongi nhận được thư từ Vaccine, đưa ra một cuộc trao đổi nguy hiểm. Trong quá trình này, bí mật về động cơ của Vaccine và những khám phá đen tối được hé lộ. Cuốn sách không chỉ là một câu chuyện về tội ác, mà còn là một tác phẩm nghệ thuật về số phận của tội phạm truyền thông và những bí mật góp phần làm nên sự căng trải của câu chuyện.', 119000, 95000),
(38, N'Trở Lại Hiện Trường Vụ Án', 3, CAST(N'2024-01-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70869/tro-lai-hien-truong-vu-an.jpg', N'Mã Đinh Hàn Trang', N'Tác giả: Mã Đinh Hàn Trang
Kích thước: 16 x 24 cm
"Trở Lại Hiện Trường Vụ Án" của tác giả Mã Đinh Hàn Trang là một tập hợp 14 câu chuyện về các vụ án tội phạm điển hình trên thế giới. Mỗi câu chuyện không chỉ kể về sự kiện mà còn đưa ra những suy ngẫm về nhân tính, công lý, và chính nghĩa. Tác phẩm nêu câu hỏi về hoàn thiện của pháp luật, sự dựa dẫm và tin tưởng vào nó, cũng như cách nhìn nhận vấn đề trong cuộc sống để duy trì sự công chính và sáng suốt. Đọc sách giúp người đọc hiểu rõ hơn về ý nghĩa của những vấn đề này và đồng thời thấy nhẹ lòng hơn trong cuộc sống.', 165000, 132000),
(39, N'Những Cô Gái Cuối Cùng', 3, CAST(N'2024-01-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70868/nhung-co-gai-cuoi-cung.jpg', N'Riley Sager', N'Tác giả: Riley Sager
Kích thước: 14.5 x 20.5 cm
"Những Cô Gái Cuối Cùng" kể về Quincy, người sống sót sau vụ thảm sát 10 năm trước. Cô phải đối mặt với sự trỗi dậy của quá khứ và những bí mật đen tối khi một thành viên khác của nhóm "Sống Sót" bí ẩn chết.', 185000, 149000),
(40, N'Quả Ngọt Năm Tháng (Bộ 2 Tập)', 3, CAST(N'2023-12-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/40448/qua-ngot-nam-thang-bo-2-tap.jpg', N'Mạch Ngôn Xuyên', N'Tác giả: Mạch Ngôn Xuyên
Kích thước: 14.5 x 20.5 cm
"Quả Ngọt Năm Tháng" là câu chuyện về Đinh Mật và Lục Thời Miễn, hai người bạn thanh xuân ngây ngô, nhưng biến cố đưa họ vào những thử thách đau lòng. Tình yêu của họ có thể vượt qua mọi khó khăn và nở hoa hay không là điều được đặt ra.', 295000, 236000),
(41, N'Bí Ẩn Sau Cánh Cửa Nhà Xác - Ghi Chép Của Người Giải Phẫu Tử Thi', 3, CAST(N'2023-12-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70360/bi-an-sau-canh-cua-nha-xac-ghi-chep-cua-nguoi-giai-phau-tu-thi.jpg', N'Carla Valentine', N'Tác giả: Carla Valentine
Kích thước: 15.7 x 24 cm
“Bí ẩn sau cánh cửa nhà xác - Ghi chép của người giải phẫu tử thi” là cuốn sách của Carla Valentine, nhà công nghệ bệnh lý giải độc, kể về những câu chuyện và kiến thức chuyên môn của người làm việc trong lĩnh vực giải phẫu tử thi. Tác giả chia sẻ những trải nghiệm đầy ám ảnh và ghê rợn về xử lý các trường hợp từ những cái chết đau lòng đến những vụ tai nạn giao thông kinh hoàng.', 120000, 96000),
(42, N'Ông Già Và Biển Cả', 3, CAST(N'2023-11-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/41897/ong-gia-va-bien-ca.jpg', N'Ernest Hemingway', N'Tác giả: Ernest Hemingway
Kích thước: 13 x 20.5 cm
"Ông Già Và Biển Cả" của Ernest Hemingway là câu chuyện về Santiago, một ông lão đánh cá người Cuba, đã trải qua tám mươi tư ngày không bắt được con cá nào. Cuối cùng, ông câu được một con cá kiếm khổng lồ sau một cuộc chiến đấu khốc liệt kéo dài ba ngày ba đêm. Tuy nhiên, trên đường về, con cá kiếm bị đàn cá mập tấn công, và sau cuộc chiến đấu với chúng, ông chỉ còn lại bộ xương trơ trọi của con cá mà mình đã đánh bại.', 45000, 38000),
(43, N'Coraline', 3, CAST(N'2023-10-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/69464/coraline.jpg', N'Neil Gaiman', N'Tác giả: Neil Gaiman
Kích thước: 14 x 20.5 cm
"Coraline" là câu chuyện về cô bé Coraline, khi bước qua cánh cửa, cô phát hiện ra một thế giới song song giống như nhà mình, nhưng mọi thứ ở đó trở nên quá tốt đẹp và hấp dẫn. Tuy nhiên, cô sớm nhận ra rằng thế giới này ẩn chứa những nguy hiểm và đe dọa, và cô phải sử dụng trí thông minh và lòng dũng cảm để đối mặt và trở về cuộc sống thực tại của mình.', 68000, 55000),
(44, N'Harry Potter - Kỳ Thư Phù Thủy', 3, CAST(N'2023-09-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/69085/harry-potter-ky-thu-phu-thuy-bia-cung.jpg', N'J. K. Rowling', N'Tác giả: J. K. Rowling
Kích thước: 22 x 26 cm
"Harry Potter - Kỳ Thư Phù Thủy" là một cuốn sách toàn diện, đầy màu sắc với những trang minh họa rực rỡ, đưa độc giả khám phá thế giới phù thủy của Harry Potter. Cuốn sách bao gồm bảy chương với thông tin đa dạng về địa điểm pháp thuật, các phương tiện và cách giải trí, bùa chú, phép thuật, sinh vật huyền bí, và sự giới thiệu về nhiều nhân vật phù thủy nổi tiếng. Đây là một bách khoa toàn thư hấp dẫn đối với người hâm mộ series Harry Potter.', 555000, 444000),
(45, N'Trái Tim Người Lớn Là Con Hàu Mang Vỏ', 3, CAST(N'2023-09-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/68702/trai-tim-nguoi-lon-la-con-hau-mang-vo-3.jpg', N'Nini', N'Tác giả: Nini
Kích thước: 15 x 21 cm
"Trái Tim Người Lớn Là Con Hàu Mang Vỏ" là tác phẩm của họa sĩ tranh minh họa Vương Mạn Nghê (Nini), tốt nghiệp Học viện Mỹ thuật Trung Quốc. Sách bao gồm 17 truyện tranh đa dạng về nội dung, kể về tình bạn, sự chán chường, và mang đến những thông điệp chữa lành. Được đánh giá tích cực trên diễn đàn Douban, cuốn sách này đưa độc giả vào thế giới xúc động và tưởng tượng của tác giả, với sự kết hợp độc đáo giữa nét hồn nhiên của sắc màu kẹo ngọt và vị chua cay của thế giới người trưởng thành.', 190000, 152000),
(46, N'Tớ Sẽ Mãi Mãi Không Quên Cậu, Người Từng Sống Trong Khoảnh Khắc', 3, CAST(N'2023-09-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/68662/to-se-mai-mai-khong-quen-cau-nguoi-tung-song-trong-khoanh-khac.jpg', N'Yozora Fuyuno', N'Tác giả: Yozora Fuyuno
Kích thước: 13 x 18 cm
"Tớ Sẽ Mãi Mãi Không Quên Cậu, Người Từng Sống Trong Khoảnh Khắc" kể về câu chuyện của Teruhiko, người đã trải qua những thay đổi đột ngột khi Kaori, cô nàng nổi tiếng của lớp, chọn cậu làm nhiếp ảnh gia độc quyền. Tuy nhiên, Teruhiko nhanh chóng phát hiện ra bí mật đằng sau nụ cười rạng rỡ của Kaori, là cuộc chiến với căn bệnh hiểm nghèo. Hai tháng ở bên Kaori đã đánh đổi cho Teruhiko những khoảnh khắc rực rỡ nhất và đầy ý nghĩa trong cuộc sống.', 106000, 85000),
(47, N'Chú Rùa Bay', 4, CAST(N'2024-01-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70887/chu-rua-bay.jpg', N'Nguyễn Hiệp', N'Tác giả: Nguyễn Hiệp
Kích thước: 13 x 20.5 cm
"Chú Rùa Bay" kể về cậu con trai nuôi của người gác hải đăng, người tình cờ nhận trọng trách bảo vệ năm chú rùa mất mẹ. Trong vùng biển nắng gió và sóng bạc, cậu bé và năm chú rùa trải qua những ngày tháng hạnh phúc. Tuy nhiên, biến cố đến, và cuộc chia li bắt đầu. Mỗi cuộc gặp gỡ mang theo ý nghĩa riêng, và kí ức với những chú rùa thân thương giúp cậu bé động viên và thực hiện ước mơ của mình, học được rằng "Khi không có ai cổ vũ, càng phải tự mình bay lên!"', 70000, 59500),
(48, N'Chú Già Nuôi Mèo Ú - Tập 1', 4, CAST(N'2024-01-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/34078/chu-gia-nuoi-meo-u-tap-1.jpg', N'Umi Sakurai', N'Tác giả: Umi Sakurai
Kích thước: 14.5 x 20.5 cm
"Chú Già Nuôi Mèo Ú - Tập 1" là câu chuyện về một chú mèo lớn trong một tiệm thú kiểng không ai muốn mua. Giá trị của chú mèo giảm dần mỗi ngày, và chú cảm thấy thất vọng vì không có ai chúc chú. Cho đến một ngày, một người đàn ông xuất hiện và muốn mua chú mèo. Cuộc gặp gỡ này đánh dấu sự bắt đầu của những ngày hạnh phúc giữa chú mèo và ông chủ già của nó.', 50000, 47500),
(49, N'Chú Già Nuôi Mèo Ú - Tập 2', 4, CAST(N'2024-01-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/34449/chu-gia-nuoi-meo-u-tap-2.jpg', N'Umi Sakurai', N'Tác giả: Umi Sakurai
Kích thước: 14.5 x 20.5 cm
"Chú Già Nuôi Mèo Ú - Tập 2" là câu chuyện tiếp theo về cuộc sống hằng ngày của một người đàn ông và chú mèo mang tên "Fukumaru". Dù ông chủ chưa từng nuôi bất kỳ loài động vật nào trước đó, nhưng mỗi ngày sống cùng chú mèo đều mang đến vô vàn điều ngạc nhiên và hạnh phúc. Cuộc sống hằng ngày này không chỉ làm thay đổi cuộc sống của chú mèo mà còn tạo nên những khoảnh khắc đáng nhớ và thú vị cho người đàn ông.', 50000, 47500),
(50, N'Chú Già Nuôi Mèo Ú - Tập 3', 4, CAST(N'2024-01-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/34908/chu-gia-nuoi-meo-u-tap-3.jpg', N'Umi Sakurai', N'Tác giả: Umi Sakurai
Kích thước: 14.5 x 20.5 cm
"Chú Già Nuôi Mèo Ú - Tập 3" tiếp tục chia sẻ về cuộc sống đầy hạnh phúc và ý nghĩa giữa chú mèo Fukumaru và ông chú già. Trong tập này, chú mèo Fukumaru gặp phải tình huống khẩn cấp khi đưa đến bệnh viện, tạo ra những thời điểm căng thẳng. Tâm trạng của ông chú già cũng ngày một căng thẳng hơn, và bí mật về những lý do khiến ông ấy thỉnh thoảng rơi lệ dần được hé lộ qua sự xuất hiện của đồng nghiệp và bạn thân.', 50000, 47500),
(51, N'Chú Già Nuôi Mèo Ú - Tập 4', 4, CAST(N'2024-01-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/36192/chu-gia-nuoi-meo-u-tap-4.jpg', N'Umi Sakurai', N'Tác giả: Umi Sakurai
Kích thước: 20.5 x 14.5 cm
"Chú Già Nuôi Mèo Ú - Tập 4" tiếp tục làm sáng tỏ tình cảm ấm áp và ý nghĩa giữa chú mèo Fukumaru và ông chú già Fuyuki Kanda. Trong tập này, mối duyên giữa mèo và mèo bắt đầu khi Kanda, nghệ sĩ dương cầm thiên tài, chạm trán với một người đàn ông mới nuôi mèo. Mời người đó đến nhà và chơi, chúng ta sẽ được tận hưởng những khoảnh khắc dễ thương và yêu thương của chú mèo trong môi trường gia đình mới.', 50000, 47500),
(52, N'Chú Già Nuôi Mèo Ú - Tập 5', 4, CAST(N'2024-01-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/44629/chu-gia-nuoi-meo-u-tap-5.jpg', N'Umi Sakurai', N'Tác giả: Umi Sakurai
Kích thước: 14.5 x 20.5 cm
"Chú Già Nuôi Mèo Ú - Tập 5" đưa độc giả vào một giai đoạn đầy xúc cảm và thử thách trong cuộc sống của chú mèo Fukumaru và ông chú già Fuyuki Kanda. Mối quan hệ giữa Fukumaru và mèo đen "đàn anh" tại tiệm thú cưng mở ra những khía cạnh mới và làm nổi bật tính nhân văn và tình cảm trong câu chuyện. Sự mất mát và tìm kiếm của Fukumaru cũng đặt ra những thách thức và dấu hiệu về sự chấp nhận và đồng cảm.', 50000, 47500),
(53, N'Chú Già Nuôi Mèo Ú - Tập 6', 4, CAST(N'2024-01-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/44630/chu-gia-nuoi-meo-u-tap-6.jpg', N'Umi Sakurai', N'Tác giả: Umi Sakurai
Kích thước: 14.5 x 20.5 cm
"Chú Già Nuôi Mèo Ú - Tập 6" tiếp tục chia sẻ về cuộc sống của ông chú già Fuyuki Kanda và chú mèo Fukumaru. Cuộc sống êm đềm của họ không ngừng đối mặt với những thách thức và quyết định khó khăn. Tình bạn và sự chấp nhận tiếp tục là chủ đề chính, khi chú già Kanda phải đối mặt với tình huống khó khăn liên quan đến người bạn Moriyama. Tình cảm và lòng dũng cảm là những yếu tố quan trọng, làm nổi bật tác phẩm và mang đến những bài học ý nghĩa về cuộc sống.', 50000, 47500),
(54, N'Chú Già Nuôi Mèo Ú - Tập 7', 4, CAST(N'2024-01-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/44723/chu-gia-nuoi-meo-u-tap-7.jpg', N'Umi Sakurai', N'Tác giả: Umi Sakurai
Kích thước: 14.5 x 20.5 cm
"Chú Già Nuôi Mèo Ú - Tập 7" tiếp tục kể về cuộc sống đầy sáng tạo và đầy ý nghĩa của ông chú già Fuyuki Kanda và chú mèo Fukumaru. Nghệ sĩ dương cầm Geoffroy Lambert, với tham vọng trở thành Fuyuki Kanda, đến từ Pháp và mang theo những cảm xúc đặc biệt. Cuộc gặp gỡ này hứa hẹn mang lại nhiều điều mới mẻ và ý nghĩa cho cả ông chú già và chú mèo Fukumaru.', 50000, 47500),
(55, N'Nhật Kí Rất Nhột Của Nhóc Cấp Một', 4, CAST(N'2023-12-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70785/nhat-ki-rat-nhot-cua-nhoc-cap-mot.jpg', N'Thủy Nguyên, Tũn Cá', N'Tác giả: Thủy Nguyên, Tũn Cá
Kích thước: 14.5 x 25.5 cm
Nhật Kí Rất Nhột Của Nhóc Cấp Một là cuốn sách nhật ký vui nhộn của cô nhóc có biệt danh "Tũn Cá". Với lối viết hài hước và thú vị, Tũn Cá chia sẻ về cuộc sống học đường, những trò quậy phá và những tình huống dở khóc dở cười mà cô nhóc trải qua trong những năm đầu tiên của bậc tiểu học. Từ việc ghét làm bài tập, lười ăn, đến những mối quan hệ khó chịu với bạn học và "kẻ thù truyền kiếp", Tũn Cá ghi lại tất cả trong cuốn nhật ký này. Cuốn sách mang lại những tràng cười sảng khoái và đồng thời giúp độc giả nhìn nhận về những trải nghiệm học đường một cách hài hước và lạc quan.', 70000, 59500),
(56, N'Gia Đình Bên Sông', 4, CAST(N'2024-01-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70735/gia-dinh-ben-song.jpg', N'Hồng Vĩnh Tranh', N'Tác giả: Hồng Vĩnh Tranh
Kích thước: 13 x 19 cm
"Gia Đình Bên Sông" kể về cuộc sống đơn sơ và trữ tình của một gia đình hàng chài nghèo, sống trên chiếc ghe mộc trên sông. Tác phẩm tận dụng văn phong mộc mạc, chân thực để làm nổi bật những giá trị tinh thần, tình yêu thương và sự đoàn kết trong gia đình.', 105000, 89000),
(57, N'Tiểu Học Vui - Tự Tin Lớp 1 - 101 Câu Đố Rèn Trí Não Luyện Kỹ Năng', 4, CAST(N'2024-01-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70871/tieu-hoc-vui-tu-tin-lop-1-101-cau-do-ren-tri-nao-luyen-ky-nang-3.jpg', N'Einstein Books', N'Tác giả: Einstein Books
Kích thước: 14.5 x 20 cm
"Bộ sách Tiểu học vui" gồm 5 cuốn từ lớp 1 đến lớp 5, biên soạn theo Chương trình Giáo dục Phổ thông. Cuốn "Tự tin lớp 1" chứa 101 câu hỏi đa dạng từ nhiều môn học, kết hợp trò chơi giáo dục để giúp trẻ phát triển toàn diện kiến thức và tư duy tổng hợp. Đây là nguồn kiến thức thú vị và hữu ích cho trẻ, phụ huynh, và giáo viên.', 79000, 67000),
(58, N'Tiểu Học Vui - Vững Vàng Lớp 2 - 101 Câu Đố Rèn Trí Não Luyện Kỹ Năng', 4, CAST(N'2024-01-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70872/tieu-hoc-vui-vung-vang-lop-2-101-cau-do-ren-tri-nao-luyen-ky-nang-3.jpg', N'Einstein Books', N'Tác giả: Einstein Books
Kích thước: 14.5 x 20 cm
"Bộ sách Tiểu học vui - Vững vàng lớp 2" là phần tiếp theo của loạt sách biên soạn theo Chương trình Giáo dục Phổ thông. Cuốn sách này chứa 101 câu hỏi đa dạng từ nhiều môn học lớp 2, kết hợp các trò chơi trí tuệ như dò mìn, nối số, xây tháp. Với thiết kế sáng tạo, sách giúp trẻ phát triển toàn diện kiến thức và tư duy tổng hợp. Là nguồn kiến thức thú vị và hữu ích cho trẻ, phụ huynh, và giáo viên.', 79000, 67000),
(59, N'Bật Mí Bí Mật Về… Động Vật', 4, CAST(N'2023-12-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70367/bat-mi-bi-mat-ve-dong-vat-3.jpg', N'Sarah Hull, Susanna Rumiz', N'Tác giả: Sarah Hull, Susanna Rumiz
Kích thước: 18 x 23 cm
BỘ SÁCH HẤP DẪN MANG ĐẾN CHO CÁC BẠN NHỎ KIẾN THỨC THÚ VỊ VỀ NHỮNG THỨ XUNG QUANH MÌNH!!!
Thế giới động vật với biết bao điều kỳ diệu đang chờ bạn khám phá. Bạn sẽ phải bất ngờ về những bí mật được bất mí trong cuốn sách này...', 75000, 64000),
(60, N'Bật Mí Bí Mật Về… Vũ Trụ', 4, CAST(N'2023-12-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70368/bat-mi-bi-mat-ve-vu-tru-3.jpg', N'Laura Cowan, Alyssa Gonzalez', N'Tác giả: Laura Cowan, Alyssa Gonzalez
Kích thước: 18 x 23 cm
BỘ SÁCH HẤP DẪN MANG ĐẾN CHO CÁC BẠN NHỎ KIẾN THỨC THÚ VỊ VỀ NHỮNG THỨ XUNG QUANH MÌNH!!!
Vũ trụ bao la với vô vàn ngôi sao lấp lánh đang chờ bạn khám phá. Bạn sẽ phải bất ngờ về những bí mật được bật mí trong cuốn sách này...', 75000, 64000),
(61, N'Hồ Sơ Về UFO Bằng Tranh', 4, CAST(N'2024-01-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70839/ho-so-ve-ufo-bang-tranh.jpg', N'Adam Allsuch Boardman', N'Tác giả: Adam Allsuch Boardman
Kích thước: 18 x 24 cm
"Hồ Sơ Về UFO Bằng Tranh" là một cuốn sách khám phá về UFO, từ những ánh sáng kỳ lạ trên bầu trời đến Khu vực 51 ở Nevada (Hoa Kỳ). Sách đưa độc giả qua những trường hợp nổi tiếng nhất liên quan đến UFO, đi sâu vào những tuyên bố và lời khẳng định của những người cho rằng họ đã chứng kiến UFO hoặc bị bắt cóc bởi người ngoài hành tinh. Được minh họa bằng những hình ảnh độc đáo, cuốn sách này giúp độc giả hiểu rõ hơn về lịch sử và những thông tin xoay quanh các vật thể bay không xác định.', 95000, 81000),
(62, N'Siêu Khủng Long - Những Bí Mật Bật Ngửa Trong Thế Giới Khủng Long', 4, CAST(N'2022-12-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70584/sieu-khung-long-nhung-bi-mat-bat-ngua-trong-the-gioi-khung-long-bia-cung.jpg', N'HalfBob', N'Tác giả: HalfBob
Kích thước: 17 x 17 cm
"Siêu Khủng Long - Những Bí Mật Bật Ngửa Trong Thế Giới Khủng Long" là một cuốn sách hài hước và thú vị về thế giới khủng long. Tác giả, chú Halfbob, không chỉ mang đến thông tin khoa học về những loài khủng long nổi tiếng mà còn kết hợp với sự hài hước trong cách trình bày. Từ mối quan hệ giữa khủng long T.rex và họ nhà gà, đến sự thú vị của việc nuốt chửng cá voi bởi Carcharocles Megalodon, cuốn sách này sẽ làm cho việc khám phá thế giới khủng long trở nên hấp dẫn cho độc giả nhỏ tuổi.', 125000, 100000), 
(63, N'Siêu Động Vật - Những Bí Mật Bật Ngửa Trong Vương Quốc Động Vật', 4, CAST(N'2023-12-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70582/sieu-dong-vat-nhung-bi-mat-bat-ngua-trong-vuong-quoc-dong-vat-bia-cung.jpg', N'HalfBob', N'Tác giả: HalfBob
Kích thước: 17 x 17 cm
"Siêu Động Vật - Những Bí Mật Bật Ngửa Trong Vương Quốc Động Vật" là một cuốn sách hài hước và thú vị về thế giới động vật. Tác giả, chú Halfbob, mang đến những thông tin khoa học về các loài động vật một cách sáng tạo và hài hước. Từ những chi tiết thú vị như cá voi soạn nhạc, cá trích "thả bom," đến chó hoang châu Phi hắt hơi để bỏ phiếu, cuốn sách kết hợp giữa học thuật và giải trí. Với những hình vẽ sinh động và câu chuyện hóm hỉnh, cuốn sách này là một cuộc phiêu lưu đầy thú vị trong vương quốc động vật.', 125000, 100000),
(64, N'Siêu Phát Minh - Những Bí Mật Bật Ngửa Trong Lĩnh Vực Khoa Học', 4, CAST(N'2023-12-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70583/sieu-phat-minh-nhung-bi-mat-bat-ngua-trong-linh-vuc-khoa-hoc-bia-cung.jpg', N'HalfBob', N'Tác giả: HalfBob
Kích thước: 17 x 17 cm
"Siêu Phát Minh - Những Bí Mật Bật Ngửa Trong Lĩnh Vực Khoa Học" là cuốn sách thú vị của tác giả Halfbob, nơi giới thiệu 66 siêu phát minh độc đáo trong lịch sử khoa học. Từ những phát minh quen thuộc như giấy, điện, bút bi cho đến những sáng tạo hiện đại như máy bay không người lái, dép đi trong nhà gắn đèn pin, cuốn sách mang đến những thông tin khoa học nghiêm túc nhưng với sự hài hước đặc trưng của tác giả. Với nét vẽ sinh động và câu chuyện thú vị, đây là cuốn sách hấp dẫn cho những người yêu thích sự sáng tạo và muốn khám phá thế giới xung quanh.', 125000, 100000), 
(65, N'Truyện Cổ Giáng Sinh', 4, CAST(N'2023-12-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70616/truyen-co-giang-sinh-2.jpg', N'Thiên Thanh, Sỹ Hiếu, Văn Huyền Thu', N'Tác giả: Thiên Thanh, Sỹ Hiếu, Văn Huyền Thu
Kích thước: 20 x 23 cm
Lễ Giáng Sinh gắn liền với nhiều huyền thoại và truyền thuyết được lưu truyền trong dân gian từ nhiều đời nay. Những huyền thoại Giáng Sinh luôn chứa đựng ý nghĩa nhân văn sâu sắc về lòng yêu thương, về niềm tin vào bản thân và điều thiện. Truyện cổ Giáng Sinh xin giới thiệu tới các em nhỏ những truyền thuyết ấy, giúp các em hiểu rõ hơn về những phép nhiệm màu của ngày lễ Noel…', 70000, 59500),
(66, N'Những Ngày Tết Ta', 4, CAST(N'2023-12-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/44550/nhung-ngay-tet-ta.jpg', N'Tô Hồng Vân', N'Tác giả: Tô Hồng Vân
Kích thước: 19 x 26 cm
"Những Ngày Tết Ta" là cuốn sách thiếu nhi với những bí kíp và câu đố độc đáo, giúp trẻ em hiểu rõ hơn về các ngày Tết truyền thống Việt Nam. Cuốn sách này không chỉ giúp trẻ rèn kỹ năng giải đố mà còn mang đến những kiến thức thú vị về văn hóa và lịch sử dân tộc. Các câu hỏi độc đáo sẽ khiến các bạn nhỏ hứng thú và nâng cao kiến thức của mình về những ngày lễ quan trọng trong nền văn hóa Việt Nam.', 90000, 76500),
(67, N'Vun Đắp Tâm Hồn - Mơ Đi Sợ Chi - Nàng Công Chúa Mơ Bay', 4, CAST(N'2023-12-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70516/vun-dap-tam-hon-mo-di-so-chi-nang-cong-chua-mo-bay.jpg', N'May, Pea', N'Tác giả: May, Pea
Kích thước: 19 x 26 cm
Nàng công chúa ước mơ bay lên như những chú chim. Trải qua nhiều thử thách, nàng đã bay lên trên đôi cánh phượng hoàng dũng mãnh. Bí mật bên trong giấc mơ bay của công chúa là gì? Cùng khám phá nào, bạn ơi!', 50000, 42500),
(68, N'Khi Cha Mẹ Cũng Hỏi Tại Sao?', 5, CAST(N'2024-01-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70889/khi-cha-me-cung-hoi-tai-sao-3.jpg', N'Clifford Dale James III', N'Tác giả: Clifford Dale James III
Kích thước: 14.5 x 20.5 cm
"Khi Cha Mẹ Cũng Hỏi Tại Sao?" là cuốn sách của Bác sĩ Nhi khoa Clifford Dale Jame III, giải đáp 75 câu hỏi phổ biến nhất mà bậc cha mẹ thường đặt ra khi nuôi dạy con nhỏ. Từ vấn đề trước khi sinh, qua giai đoạn sơ sinh, đến những thách thức khi bé tròn 1 tuổi, cuốn sách mang đến kiến thức y khoa, lời khuyên và giải đáp một cách dễ hiểu. Được chia thành 5 phần, mỗi phần tập trung vào một giai đoạn cụ thể trong sự phát triển của trẻ, giúp cha mẹ tự tin và hiểu biết hơn trong việc chăm sóc con cái.', 138000, 110000),
(69, N'100 Chiêu Trò Của Trẻ Lên 2 - Cha Mẹ Bình Tĩnh Đón Nhận', 5, CAST(N'2023-12-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70585/100-chieu-tro-cua-tre-len-2-cha-me-binh-tinh-don-nhan-2.jpg', N'Chen Weng', N'Tác giả: Chen Weng
Kích thước: 16.5 x 20.5 cm
Cuốn sách "100 Chiêu Trò Của Trẻ Lên 2 - Cha Mẹ Bình Tĩnh Đón Nhận" của Chen Weng là một tác phẩm tranh hài hước về cuộc sống của cha mẹ đối diện với những thay đổi, khó khăn, và niềm vui khi có trẻ nhỏ. Dưới bút vẽ của Chen Weng, cuộc sống gia đình trở nên vui nhộn và hấp dẫn, đồng thời truyền đạt thông điệp về việc bình tĩnh đón nhận những thách thức từ đứa trẻ lên 2, cùng những khoảnh khắc đáng yêu và ngộ nghĩnh của gia đình. Cuốn sách là một món quà tuyệt vời dành cho các bậc cha mẹ, đặc biệt là những người chuẩn bị trở thành cha mẹ lần đầu.', 110000, 88000),
(70, N'Nghệ Thuật Trò Chuyện Cùng Trẻ', 5, CAST(N'2023-11-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70359/nghe-thuat-tro-chuyen-cung-tre.jpg', N'Rebecca Rolland', N'Tác giả: Rebecca Rolland
Kích thước: 14.5 x 20.5 cm
Cuốn sách "Nghệ Thuật Trò Chuyện Cùng Trẻ" mang đến hướng dẫn về cách cha mẹ có thể thay đổi cách trò chuyện với con cái, tạo điều kiện khuyến khích sự sáng tạo và củng cố mối quan hệ gia đình. Sách này giới thiệu những cách tiếp cận mới về việc nuôi dạy con thông qua việc thực hiện chuỗi cuộc đối thoại, giúp cha mẹ hiểu rõ hơn về nghệ thuật trò chuyện để xây dựng một môi trường giao tiếp tích cực và hỗ trợ phát triển của con cái.', 180000, 144000),
(71, N'7 Lá Thư Gửi Con Gái: Bài Học Về Tình Yêu Thương, Tinh Thần Lãnh Đạo Và Gia Tài Để Lại', 5, CAST(N'2023-11-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70129/7-la-thu-gui-con-gai-bai-hoc-ve-tinh-yeu-thuong-tinh-than-lanh-dao-va-gia-tai-de-lai.jpg', N'Rani Puranik', N'Tác giả: Rani Puranik
Kích thước: 14 x 20.5 cm
Cuốn sách "7 Lá Thư Gửi Con Gái: Bài Học Về Tình Yêu Thương, Tinh Thần Lãnh Đạo Và Gia Tài Để Lại" của Rani Puranik là bộ sưu tập gồm 7 lá thư chứa đựng những bài học quý giá về cuộc sống, tình yêu, tinh thần lãnh đạo và gia tài để lại. Tác giả chia sẻ về những trải nghiệm và nhận thức của mình qua từng giai đoạn 7 năm trong cuộc đời, mang đến những câu chuyện lắng đọng với ngôn từ sáng tạo và cảm động. Sách này hứa hẹn là nguồn động viên và sự giáo dục tuyệt vời cho độc giả, đặc biệt là các cô gái trẻ.', 168000, 143000),
(72, N'IELTS Writing Journey From Basics To Band 6.0', 5, CAST(N'2023-09-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/69075/ielts-writing-journey-from-basics-to-band-6-0.jpg', N'Bùi Thành Việt, Đoàn Phương Anh, Nguyễn Thị Thu Trang, Đoàn Nguyễn Hạ Đan', N'Tác giả: Bùi Thành Việt, Đoàn Phương Anh, Nguyễn Thị Thu Trang, Đoàn Nguyễn Hạ Đan
Kích thước: 19.3 x 27.1 cm
"IELTS Writing Journey From Basics To Band 6.0" là cuốn sách hướng dẫn tự học viết IELTS trong 3 tháng, giúp nâng cao kỹ năng từ cơ bản lên mức 6.0. Tác giả, Bùi Thành Việt, chia sẻ chiến lược ôn thi dựa trên kinh nghiệm tự học của mình, kèm theo bảng chấm điểm và video hướng dẫn. Sách tập trung vào cả hai phần Writing Task 1 và Task 2, cung cấp bài tập thực hành và kỹ năng viết chi tiết.', 198000, 158000), 
(73, N'Thực Đơn Ăn Dặm Theo Tuần Cho Bé', 5, CAST(N'2023-09-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/69087/thuc-don-an-dam-theo-tuan-cho-be.jpg', N'Lưu Trường Vỹ', N'Tác giả: Lưu Trường Vỹ
Kích thước: 14 x 20.5 cm
Cuốn sách "Thực Đơn Ăn Dặm Theo Tuần Cho Bé" của bác sĩ dinh dưỡng Lưu Trường Vỹ cung cấp thực đơn ăn dặm chi tiết theo từng tuần, đảm bảo đa dạng và phù hợp với độ tuổi của trẻ. Sách giúp giải đáp các thắc mắc về đường tiêu hóa ở trẻ và chia sẻ những nguyên tắc cơ bản, cũng như sai lầm phổ biến trong quá trình chuẩn bị bữa ăn dặm cho bé.', 219000, 175000),
(74, N'24 Gương Hiếu Thảo', 5, CAST(N'2023-10-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/34444/24-guong-hieu-thao.jpg', N'Huy Tiến', N'Tác giả: Huy Tiến
Kích thước: 13.5 x 21 cm
24 tấm gương đều toát lên tấm lòng tận hiếu của bậc làm con nhưng cách thể hiện lòng hiếu thảo thì mỗi người mỗi vẻ. Có một số câu chuyện có phần cực đoan, không thuyết phục, nhất là đối với xã hội hiện nay. Tuy nhiên, tác phẩm vẫn là những bài học đạo đức đáng quý về lòng hiếu thảo.', 88000, 70000),
(75, N'Khởi Sự Ăn Chay - Dinh Dưỡng Dành Cho Người Ăn Chay Và 14 Ngày Để Bạn Bắt Đầu', 5, CAST(N'2023-06-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/30933/khoi-su-an-chay-dinh-dung-danh-cho-nguoi-an-chay-va-14-ngay-de-ban-bat-dau.jpg', N'Đức Nguyễn', N'Tác giả: Đức Nguyễn
Kích thước: 17 x 24 cm
Cuốn sách "Khởi Sự Ăn Chay - Dinh Dưỡng Dành Cho Người Ăn Chay Và 14 Ngày Để Bạn Bắt Đầu" của Đức Nguyễn không chỉ là hướng dẫn nấu ăn chay mà còn là nguồn cảm hứng, sáng tạo và kiến thức dinh dưỡng đầy đủ. Tác giả chia sẻ những lời giải đáp cho những thắc mắc cơ bản khi bắt đầu ăn chay và giới thiệu 14 ngày để bạn bắt đầu thói quen ăn chay. Cuốn sách tập trung vào các món chay đơn giản, dễ nấu, và mang đến cái nhìn khoa học về dinh dưỡng ăn chay. Đồng thời, sách cũng tập trung vào việc xây dựng một lối sống cân bằng và bình yên thông qua việc ăn chay.', 218000, 174000),
(76, N'Một Chút Đáng Yêu Nhiều Chút Ngọt Ngào', 5, CAST(N'2023-10-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/69474/mot-chut-dang-yeu-nhieu-chut-ngot-ngao-3.jpg', N'Tara Nguyễn', N'Tác giả: Tara Nguyễn
Kích thước: 17 x 24 cm
Cuốn sách "Một Chút Đáng Yêu Nhiều Chút Ngọt Ngào" của Tara Nguyễn là hành trình thú vị vào thế giới làm bánh, mang đến hơn 40 công thức bánh ngọt dễ làm, đơn giản nhưng ngon miệng. Tác giả chia sẻ sự đam mê và niều thích ẩm thực qua từng trang sách, với hy vọng khơi dậy niềm đam mê làm bánh trong độc giả. Cuốn sách không chỉ cung cấp kiến thức làm bánh cơ bản mà còn là nguồn cảm hứng từ sự dễ thương và ngọt ngào của tác giả. Tara Nguyễn tạo ra một hướng dẫn chi tiết, giúp mọi người tự tin làm những chiếc bánh tuyệt vời ngay tại nhà.', 219000, 175000),
(77, N'Việt Nam Miền Ngon', 5, CAST(N'2022-05-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/4774/viet-nam-mien-ngon.jpg', N'LêRin', N'Tác giả: LêRin
Kích thước: 20 x 20 cm
Là cuốn sách song ngữ Việt Anh về các món ăn Việt với minh họa màu sống động.
Tác giả đã khéo léo lồng ghép cách chế biến (đơn giản) vào mỗi phần giới thiệu món ăn, người đọc dễ dàng nhận ra văn hóa vùng miền và cảm nhận hết cái tinh tế, đậm đà của món ăn Việt.
Ẩm thực Việt Nam, dù là những món ăn gia đình hay những món ăn đặc trưng của ẩm thực đường phố thì vẫn mang những giá trị to lớn trong đời sống của người Việt. Ẩm thực Việt ngày nay đã vượt qua khỏi những biên giới và được chào đón ở nhiều nơi trên thế giới. Chúng ta có quyền tự hào về điều đó. Thưởng thức ẩm thực cũng giống như dấn thân vào một cuộc hành trình mà mỗi người đều có cảm nhận riêng.', 155000, 124000),
(78, N'Cook Korean! Nấu Như Người Hàn', 5, CAST(N'2020-09-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/38319/cook-korean-nau-nhu-nguoi-han.jpg', N'Robin Ha', N'Tác giả: Robin Ha
Kích thước: 24 x 17 cm
Nấu như người Hàn với hơn 60 món ăn cả truyền thống và hiện đại, đã được Robin Ha truyền tải tới người đọc dưới dạng truyện tranh đầy sinh động, vui nhộn.
Toàn bộ công thức trong cuốn sách đều có hướng dẫn cực chi tiết, dễ mua nguyên liệu và dễ thực hiện. Giờ đây bạn hoàn toàn có thể tự làm những món ăn ngon lành phổ biến như kimchi, gimbab hay các món canh nóng sốt ngon lành, hương vị đặc trưng không thua gì ngoài hàng.
Mỗi chương bao gồm những câu chuyện cá nhân và những hiểu biết văn hóa của Robin Ha với món ăn, đem lại cảm hứng tuyệt vời cho những ai muốn thử sức mình với các món Hàn. Nấu như người Hàn là cuốn cẩm nang hoàn hảo cho cả đầu bếp thành thạo và người mới bắt đầu.', 145000, 116000),
(79, N'Món ngon quê nhà', 5, CAST(N'2020-08-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/37734/mon-ngon-que-nha.jpg', N'Dương Hoàng Lộc', N'Tác giả: Dương Hoàng Lộc
Kích thước: 12.5 x 20.5 cm
Cuốn sách "Món Ngon Quê Nhà" của Tiến sĩ Dương Hoàng Lộc là một hành trình đầy phấn khích vào thế giới ẩm thực Việt Nam. Tác phẩm không chỉ chứa đựng sự phong phú về nội dung, mà còn thu hút độc giả bởi cách trình bày nhẹ nhàng, hấp dẫn và tận hưởng sự trong sáng, ý nhị của tác giả. Tấm lòng chân thành của ông dành cho từng món ăn, hương vị quê nhà được truyền đạt một cách tận tâm, làm cho độc giả cảm nhận được sự khoáng đãng và chân thực. Cuốn sách này không chỉ là một hướng dẫn về ẩm thực, mà còn là một hành trình khám phá văn hóa và tình cảm đối với đồ ăn ngon.', 65000, 52000), 
(80, N'Lịch Sử Thế Giới - The Penguin History Of The World (Bộ 5 Tập)', 6, CAST(N'2023-12-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70392/ich-su-the-gioi-the-penguin-history-of-the-world-bo-5-tap-1.jpg', N'J. M. Roberts, Odd Arne Westad', N'Tác giả: J. M. Roberts, Odd Arne Westad
Kích thước: 14 x 22 cm
Cuốn "Lịch Sử Thế Giới - The Penguin History Of The World" là một tác phẩm toàn diện về lịch sử, từ tiền sử đến đầu thế kỷ XXI. Tác giả J.M. Roberts và Odd Arne Westad đưa độc giả qua những thăng trầm lịch sử, nhấn mạnh vai trò thống trị của văn minh Tây Âu và tầm ảnh hưởng toàn cầu của nó. Cuốn sách là một nguồn thông tin quý báu cho những ai quan tâm đến lịch sử loài người.', 1350000, 1080000),
(81, N'Miền Bắc - Một Thời Chiến Tranh, Một Thời Hòa Bình', 6, CAST(N'2024-01-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70896/mien-bac-mot-thoi-chien-tranh-mot-thoi-hoa-binh-6.jpg', N'Folke Isaksson', N'Tác giả: Folke Isaksson
Kích thước: 21 x 28.5 cm
Cuốn sách "Miền Bắc - Một Thời Chiến Tranh, Một Thời Hòa Bình" của tác giả Folke Isaksson và hình ảnh của Jean Hermanson/Saftra là một hành trình chân thực qua cuộc sống ở miền Bắc Việt Nam, từ thời chiến tranh đến hiện đại. Qua hình ảnh và câu chuyện, sách kể về sức mạnh, lòng đoàn kết và hy vọng tương lai hòa bình, tạo nên một bức tranh đẹp và ý nghĩa về quê hương.', 285000, 228000),
(82, N'Chìm Nổi Ở Sài Gòn - Những Cảnh Đời Bần Cùng Ở Một Thành Phố Thuộc Địa', 6, CAST(N'2023-12-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/70815/chim-noi-o-sai-gon-nhung-canh-doi-ban-cung-o-mot-thanh-pho-thuoc-dia.jpg', N'Haydon Cherry', N'Tác giả: Haydon Cherry
Kích thước: 16 x 24 cm
"Chìm Nổi Ở Sài Gòn" là cuốn sách độc đáo khám phá thân phận người nghèo ở Sài Gòn thời thuộc địa. Tác giả Haydon Cherry đi sâu vào cuộc sống của sáu nhân vật, từ gái mại dâm đến thợ người Hoa, tạo nên bức tranh đa dạng về sự nghèo đói và thực tế xã hội ở Sài Gòn trong những năm đầu thế kỷ XX. Cuốn sách mô tả chi tiết và chân thực, làm sáng tỏ cảnh đời khó khăn và những biến động lịch sử của thành phố này.', 259000, 207000),
(83, N'Di Sản Hồ Chí Minh - 52 Câu Chuyện Dưới Cờ Về Chủ Tịch Hồ Chí Minh', 6, CAST(N'2023-11-01' AS DateTime), N'https://www.netabooks.vn/Data/Sites/1/Product/69911/di-san-ho-chi-minh-52-cau-chuyen-duoi-co-ve-chu-tich-ho-chi-minh.jpg', N'Trần Văn Phương', N'Tác giả: Trần Văn Phương
Kích thước: 13 x 20.5 cm
Cuốn sách "Di Sản Hồ Chí Minh - 52 Câu Chuyện Dưới Cờ Về Chủ Tịch Hồ Chí Minh" của tác giả Trần Văn Phương là bộ sưu tập 52 câu chuyện ngắn về cuộc đời, sự nghiệp và tư tưởng của Chủ tịch Hồ Chí Minh. Những câu chuyện này được sắp xếp theo các chủ đề như thời niên thiếu, hành trình cứu nước, nghị lực, đạo đức, đoàn kết, dân vận, và mối liên kết của Bác Hồ với thanh thiếu nhi. Sách nhấn mạnh việc kể chuyện để hỗ trợ nghi thức chào cờ và tăng cường giáo dục đạo đức, lối sống cho học sinh, góp phần xây dựng không gian văn hóa Hồ Chí Minh trong các cơ sở giáo dục.', 75000, 60000);
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Settings] ON 
GO
INSERT [dbo].[Settings] ([SettingID], [Type], [Value], [Order]) VALUES (1, N'SiteTitle', N'My Online Store', 1)
GO
INSERT [dbo].[Settings] ([SettingID], [Type], [Value], [Order]) VALUES (2, N'Currency', N'USD', 2)
GO
INSERT [dbo].[Settings] ([SettingID], [Type], [Value], [Order]) VALUES (3, N'TaxRate', N'0.08', 3)
GO
SET IDENTITY_INSERT [dbo].[Settings] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserID], [FullName],UpdatedDate, [Email], [Password], [Role]) VALUES (1, N'John Doe',GETDATE(), N'john.doe@example.com', N'password123', N'User')
GO
INSERT [dbo].[Users] ([UserID], [FullName],UpdatedDate, [Email], [Password], [Role]) VALUES (2, N'Jane Smith',GETDATE(), N'jane.smith@example.com', N'pass456', N'Admin')
GO
INSERT [dbo].[Users] ([UserID], [FullName],UpdatedDate, [Email], [Password], [Role]) VALUES (3, N'Bob Johnson',GETDATE(), N'bob.johnson@example.com', N'securepass', N'User')
GO
INSERT [dbo].[Users] ([UserID], [FullName],UpdatedDate, [Email], [Password], [Role]) VALUES (4, N'Vuong Dai Duong',GETDATE(), N'duong@gmail.com', N'duong123456', N'Marketing')
GO
INSERT [dbo].[Users] ([UserID], [FullName],UpdatedDate, [Email], [Password], [Role]) VALUES (5, N'Vuong Dai Duong',GETDATE(), N'duongsale@gmail.com', N'duong123456', N'SaleManager')
GO
INSERT INTO [dbo].[Users] ([UserID], [FullName], [UpdatedDate], [Email], [Password], [Role], [Gender], [Address], [Phone], [Note], [StatusID])
VALUES (6, N'Vuong Dai Duong', GETDATE(), N'duongtata@gmail.com', N'duong123456', N'User', 1, N'123 Marketing Street', N'0123456789', N'Note for Vuong Dai Duong', 1);
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[PostCategories] ([PostCategoryID])
GO
ALTER TABLE dbo.Products
ADD CONSTRAINT DF_UpdatedDate DEFAULT GETDATE() FOR UpdatedDate;
GO
ALTER DATABASE [SWP_Online_Shop] SET  READ_WRITE 
GO
SET IDENTITY_INSERT [dbo].[PostCategories] ON 
GO
INSERT [dbo].[PostCategories] ([PostCategoryID], [PostCategoryName]) VALUES (1, N'Sách Hay')
GO
INSERT [dbo].[PostCategories] ([PostCategoryID], [PostCategoryName]) VALUES (2, N'Hướng Dẫn')
GO
INSERT [dbo].[PostCategories] ([PostCategoryID], [PostCategoryName]) VALUES (3, N'Giới thiệu sách')
GO
SET IDENTITY_INSERT [dbo].[PostCategories] OFF
GO
INSERT INTO [dbo].[Posts] ([Title], [Author], [UpdatedDate], [CategoryID], [Thumbnail], [BriefInfo], [Details])
VALUES
(N'Giới thiệu sách:Đường Mây Qua Sống', 'John Doe', GETDATE(), 3, N'https://product.hstatic.net/200000408481/product/ae1de58e13484228b75a62bbc1fbe666_2e665c2f9666450898e2f94acf568bb8_1024x1024.jpg', 
N'Đường Mây Qua Sống là một cuốn sách tâm lý tinh thần đầy cảm động, đã chinh phục hàng triệu độc giả trên khắp thế giới. Tác phẩm này của Mitch Albom là một hành trình sâu sắc vào tâm hồn con người, đưa ra những triết lý về tình yêu, sự đau khổ và ý nghĩa của cuộc sống.',
N'Cuốn sách bắt đầu với câu chuyện của Morrie Schwartz, một giáo sư già sắp qua đời vì mắc bệnh ALS, và Mitch Albom, cựu học trò của ông. Mitch, sau khi tình cờ nghe tin về sự suy giảm sức khỏe của giáo sư, quyết định thăm ông và tìm hiểu thêm về những bài học cuộc đời mà ông đã trải qua. Trong suốt quá trình gặp gỡ hàng tuần giữa Mitch và Morrie, cuốn sách khám phá sâu hơn về những giá trị cốt lõi của cuộc sống, như tình bạn, gia đình, lòng nhân từ, và ý nghĩa thực sự của thành công. Mitch ghi lại những lời khuyên và sự sáng tỏ của Morrie, tạo nên một cuốn sách đầy cảm xúc và ý nghĩa. Đường Mây Qua Sống không chỉ là một cuốn sách, mà là một bài học về cách sống hạnh phúc và ý nghĩa, và làm thế nào để đối mặt với sự chết một cách ý nghĩa và tự tin. Cuốn sách này sẽ khiến bạn cười, khóc, và suy ngẫm về những giá trị đích thực trong cuộc sống.'),

(N'Bảo Quản Sách: Bí Quyết Giữ Gìn Kho Tàng Tri Thức', 'John Doe', GETDATE(), 3, N'https://cdnnews.mogi.vn/news/wp-content/uploads/2023/08/29162131/cach-bao-quan-sach.jpg', 
N'Trong thời đại số hóa ngày nay, sách vẫn là một phần quan trọng trong cuộc sống của chúng ta. Tuy nhiên, việc bảo quản sách đôi khi trở thành một thách thức, đặc biệt đối với những người yêu sách có sở thích sưu tầm và sở hữu một tập hồ sơ đa dạng.',
N'1. Chọn Đúng Vị Trí:
Sách nên được đặt trong một môi trường có độ ẩm và nhiệt độ ổn định để tránh ảnh hưởng của hơi nước và nhiệt độ cao.
Tránh đặt sách ở những nơi tiếp xúc trực tiếp với ánh nắng mặt trời để tránh bị phai màu và hư hỏng.
2. Sử Dụng Phụ Kiện Bảo Quản:
Bìa sách, túi nilon, hoặc hộp sách có thể giúp bảo vệ sách khỏi bụi, ẩm, và hư hỏng từ va chạm.
Sử dụng giá đỡ sách hoặc kệ sách để tránh sách bị cong và biến dạng.
3. Vệ Sinh Định Kỳ:
Làm sạch sách định kỳ để loại bỏ bụi và cặn bẩn.
Sử dụng cọ mềm và khăn mềm để vệ sinh bề mặt của sách mà không làm hỏng trang bìa hoặc trang sách.
4. Sử Dụng Chất Liệu Bảo Quản:
Sử dụng túi hoặc hộp bảo quản có chất liệu pH cân bằng để giữ cho sách không bị ẩm và hữu ích trong việc bảo vệ sách khỏi sự tác động của vi khuẩn và nấm mốc.
5. Sửa Chữa Kịp Thời:
Khi phát hiện ra sách bị hỏng, hãy sửa chữa ngay lập tức để tránh tình trạng hỏng nặng hơn.
Sử dụng keo dán sách và băng dính mà không gây hại cho sách.
Kết Luận:
Bảo quản sách không chỉ giúp bảo vệ và kéo dài tuổi thọ của chúng mà còn giữ cho kho tàng tri thức của bạn luôn được bảo toàn và trở nên đẹp mắt hơn. Bằng cách tuân thủ những bí quyết và chiến lược bảo quản sách trên, bạn có thể tự tin sở hữu một thư viện sách ấn tượng và đảm bảo rằng mỗi cuốn sách trong tay bạn đều được trân trọng và giữ gìn tốt nhất.
'),

(N'Những Cuốn Sách Tâm Lý Hay Nhất để Hiểu Về Bản Thân', 'Jane Smith', GETDATE(), 3, N'https://vuilen11.com/wp-content/uploads/2021/09/thumnail-bai-viet-blog-6.png', 
N'Trong cuộc hành trình khám phá bản thân, sách có thể là người bạn đồng hành đáng tin cậy nhất. Có rất nhiều cuốn sách tâm lý mang lại sự thấu hiểu sâu sắc về tâm trí và tâm hồn con người. ',
N'Trong cuộc hành trình khám phá bản thân, sách có thể là người bạn đồng hành đáng tin cậy nhất. Có rất nhiều cuốn sách tâm lý mang lại sự thấu hiểu sâu sắc về tâm trí và tâm hồn con người. Dưới đây là một số cuốn sách tâm lý phổ biến nhất và đáng đọc nhất để bạn có thể hiểu rõ hơn về chính mình và xây dựng một cuộc sống ý nghĩa hơn.
1. "Đừng Sợ Mất Mát: Làm Thế Nào Để Sống Sau Một Sự Thay Đổi" của Susan Jeffers:
Cuốn sách này giúp bạn hiểu rõ hơn về cảm xúc của mình khi đối mặt với sự thay đổi và mất mát trong cuộc sống.
Susan Jeffers cung cấp những kỹ thuật và chiến lược để vượt qua nỗi sợ hãi và lo lắng, giúp bạn tự tin hơn và đối mặt với cuộc sống một cách mạnh mẽ hơn.
2. "Sức Mạnh của Ngôn Từ Tốt" của Dale Carnegie:
Cuốn sách này không chỉ là một hướng dẫn về cách giao tiếp hiệu quả mà còn là một cuộc hành trình để khám phá sức mạnh của từ ngữ và ý thức về bản thân.
Dale Carnegie chia sẻ những nguyên tắc và kỹ thuật để xây dựng mối quan hệ tốt hơn, tự tin hơn và thành công hơn trong cuộc sống.
3. "Bí Mật Tư Duy Triệu Phú" của T. Harv Eker:
Cuốn sách này đưa ra cái nhìn mới mẻ về mối liên kết giữa tư duy và thành công tài chính.
T. Harv Eker giới thiệu các nguyên tắc và chiến lược để thay đổi tư duy và tạo ra một cuộc sống giàu có và thành công.
4. "Sức Mạnh của Thói Quen" của Charles Duhigg:
Cuốn sách này khám phá sâu sắc về cơ chế hoạt động của thói quen và cách chúng có thể ảnh hưởng đến cuộc sống của chúng ta.
Charles Duhigg cung cấp những chiến lược và kỹ thuật để thay đổi thói quen và tạo ra một cuộc sống đầy ý nghĩa và thành công.
Conclusion:
Những cuốn sách này không chỉ là nguồn kiến thức mà còn là hướng dẫn và nguồn cảm hứng để bạn có thể hiểu rõ hơn về bản thân và xây dựng một cuộc sống ý nghĩa hơn. Hãy dành thời gian để đọc và suy ngẫm về những thông điệp sâu sắc mà chúng mang lại, và bạn sẽ khám phá ra nhiều điều mới mẻ về chính mình.'),

(N'Chính Sách Tiền Tệ Thế Kỷ 21: Hiểu Biết và Thách Thức', 'Bob Johnson', GETDATE(), 3, N'https://www.netabooks.vn/Data/Sites/1/Product/70821/chinh-sach-tien-te-the-ky-21.jpg', 
N'Sách Chính Sách Tiền Tệ Thế Kỷ 21 là một tác phẩm quan trọng, khám phá sâu sắc về thế giới của tiền tệ và chính sách kinh tế trong thế kỷ mới.',
N'Sách Chính Sách Tiền Tệ Thế Kỷ 21 là một tác phẩm quan trọng, khám phá sâu sắc về thế giới của tiền tệ và chính sách kinh tế trong thế kỷ mới. Tác giả của cuốn sách không chỉ phân tích mà còn đưa ra những nhận định đầy cảm quan về tình hình kinh tế thế giới và những thách thức mà chúng ta phải đối mặt. Dưới đây là một số điểm nổi bật được đề cập trong cuốn sách này.

1. Phân Tích Chi Tiết về Hệ Thống Tài Chính Toàn Cầu:

Cuốn sách phân tích một cách tổng thể về cấu trúc và hoạt động của hệ thống tài chính toàn cầu, bao gồm vai trò của các tổ chức tài chính quốc tế như IMF và Ngân hàng Thế giới.
2. Đánh Giá Tác Động của Chính Sách Tiền Tệ:

Tác giả đi sâu vào tác động của các quyết định chính sách tiền tệ đối với nền kinh tế và thị trường tài chính toàn cầu. Những biến động và thách thức mà chính sách tiền tệ gây ra đối với các quốc gia được phân tích một cách kỹ lưỡng.
3. Nhấn Mạnh Về Sự Đa Dạng và Thay Đổi:

Cuốn sách nhấn mạnh về sự đa dạng của các chính sách tiền tệ trên toàn cầu và cách mà chúng thay đổi theo thời gian và tình hình kinh tế.
4. Phân Biệt giữa Chính Sách Tiền Tệ và Chính Sách Tài Chính:

Tác giả giúp độc giả hiểu rõ hơn về sự khác biệt giữa chính sách tiền tệ và chính sách tài chính, và tầm quan trọng của việc cân nhắc cả hai trong quản lý kinh tế hiện đại.
5. Đề Xuất Giải Pháp và Phát Triển Kịch Bản Tương Lai:

Cuối cùng, cuốn sách không chỉ phân tích mà còn đề xuất các giải pháp và kịch bản tương lai để giải quyết những thách thức đang đối mặt với chính sách tiền tệ thế kỷ 21.
Conclusion:
Chính Sách Tiền Tệ Thế Kỷ 21 là một cuốn sách không thể thiếu đối với những ai quan tâm đến tài chính và kinh tế toàn cầu. Với những phân tích sâu sắc và những ý kiến đầy cảm quan, cuốn sách này là một nguồn tài liệu quý giá cho những người muốn hiểu sâu hơn về thế giới của tiền tệ và chính sách kinh tế.'),

(N'10 Mẹo Hay Hỗ Trợ Việc Đọc Sách của Trẻ', 'Bob Johnson', GETDATE(), 2, N'https://monkeymedia.vcdn.com.vn/upload/web/storage_web/26-09-2023_16:35:55_ren-luyen-thoi-quen-doc-sach-cho-tre-0.jpg', 
N'Việc khuyến khích trẻ em đọc sách từ nhỏ không chỉ giúp phát triển kỹ năng ngôn ngữ mà còn tạo ra thói quen học tập tích cực.',
N'Việc khuyến khích trẻ em đọc sách từ nhỏ không chỉ giúp phát triển kỹ năng ngôn ngữ mà còn tạo ra thói quen học tập tích cực. Dưới đây là 10 mẹo hay để hỗ trợ việc đọc sách của trẻ một cách hiệu quả và thú vị.

1. Tạo Một Góc Đọc Riêng:

Dành một góc nhỏ trong nhà cho việc đọc sách của trẻ, với các đồ chơi và sách được sắp xếp gọn gàng và thu hút.
2. Lập Lịch Trình Đọc Sách Hàng Ngày:

Thiết lập một lịch trình đọc sách hàng ngày cho trẻ, tạo thói quen đọc vào các thời điểm cố định trong ngày.
3. Chọn Sách Phù Hợp với Sở Thích và Sở Trường:

Chọn những cuốn sách phù hợp với sở thích và sở trường của trẻ để tạo động lực và hứng thú cho việc đọc.
4. Đọc Cùng Trẻ:

Thể hiện tình yêu thương và sự quan tâm bằng cách đọc sách cùng trẻ, tạo ra một trải nghiệm học tập và gắn kết gia đình.
5. Sử Dụng Hình Ảnh và Màu Sắc Sống Động:

Chọn sách có hình ảnh và màu sắc sáng tạo và sống động để thu hút sự chú ý của trẻ.
6. Tạo Trò Chơi và Hoạt Động Kết Hợp với Sách:

Tạo ra các trò chơi và hoạt động liên quan đến nội dung của sách để tăng cường hiểu biết và tạo ra trải nghiệm học tập thú vị.
7. Khuyến Khích Tư Duy Sáng Tạo và Tưởng Tượng:

Khuyến khích trẻ phát triển tư duy sáng tạo và tưởng tượng thông qua việc đọc sách và suy nghĩ về câu chuyện.
8. Sử Dụng Đèn Pin Đọc Ban Đêm:

Cung cấp đèn pin cho trẻ để đọc sách vào ban đêm, tạo điều kiện thuận lợi và tạo ra thói quen đọc trước khi đi ngủ.
9. Tạo Phần Thưởng Khi Đọc Sách:

Tạo ra hệ thống phần thưởng nhỏ khi trẻ hoàn thành việc đọc sách, khuyến khích sự cố gắng và đam mê trong việc học tập.
10. Mở Rộng Trải Nghiệm Đọc Sách Bằng Tham Gia Các Hoạt Động Xã Hội:

Khuyến khích trẻ tham gia các hoạt động xã hội liên quan đến việc đọc sách, như tham gia câu lạc bộ đọc sách của trường hoặc thư viện địa phương.'
),

(N'15 Mẹo Đơn Giản Giúp Bạn Tìm Động Lực để Đọc Sách Hiệu Quả', 'John Doe', GETDATE(), 2, N'https://chamdocsach.com/wp-content/uploads/2022/08/dong-luc-de-doc-sach-1.png', 
N'Việc tìm động lực để đọc sách có thể trở thành một thách thức đối với nhiều người, nhưng với những mẹo đơn giản dưới đây, bạn có thể kích thích sự ham muốn và hiệu suất đọc sách của mình một cách hiệu quả.',
N'Việc tìm động lực để đọc sách có thể trở thành một thách thức đối với nhiều người, nhưng với những mẹo đơn giản dưới đây, bạn có thể kích thích sự ham muốn và hiệu suất đọc sách của mình một cách hiệu quả.

1. Thiết Lập Mục Tiêu Đọc Sách:

Đặt ra mục tiêu cụ thể về việc đọc sách, chẳng hạn như số lượng sách bạn muốn đọc trong một tháng hoặc một năm.
2. Tìm Sách Về Chủ Đề Bạn Quan Tâm:

Chọn những cuốn sách liên quan đến chủ đề hoặc lĩnh vực mà bạn quan tâm, điều này giúp tăng sự hứng thú và động lực khi đọc.
3. Đọc Ở Môi Trường Thuận Lợi:

Tìm một môi trường đọc sách yên tĩnh và thoải mái để tập trung, như trong phòng riêng của bạn hoặc trong một quán cà phê yên bình.
4. Thiết Lập Lịch Trình Đọc Sách Cố Định:

Xác định các khoảng thời gian cố định trong ngày để dành cho việc đọc sách, giúp bạn duy trì thói quen và tạo ra một lịch trình hợp lý.
5. Sử Dụng Công Nghệ:

Sử dụng các ứng dụng đọc sách trên điện thoại hoặc máy tính để tiện lợi hóa quá trình đọc và tạo sự linh hoạt trong việc tiếp cận sách.
6. Thực Hiện Ghi Chú và Tóm Tắt:

Ghi chú và tóm tắt những ý chính trong cuốn sách để giúp bạn tóm tắt kiến thức và nhớ lâu hơn.
7. Tham Gia Nhóm Đọc Sách:

Tham gia các nhóm đọc sách trực tuyến hoặc offline để chia sẻ ý kiến, trao đổi và tạo động lực với những người đam mê đọc sách khác.
8. Tạo Phần Thưởng Cho Bản Thân:

Đặt ra các phần thưởng nhỏ cho bản thân sau khi hoàn thành việc đọc một cuốn sách, như đi ăn ngoại ô hoặc xem một bộ phim yêu thích.
9. Đọc Theo Nhóm Chủ Đề:

Chọn một chủ đề cụ thể và đọc nhiều cuốn sách liên quan đến chủ đề đó để tạo ra sự liên kết và sự đồng nhất trong việc học hỏi.
10. Xem Xét Lợi Ích Từ Việc Đọc Sách:

Tìm hiểu và nhận biết lợi ích mà việc đọc sách mang lại cho cuộc sống của bạn, từ việc mở rộng kiến thức đến việc giảm căng thẳng và cải thiện tư duy.
11. Tạo Danh Sách Sách Muốn Đọc:

Tạo danh sách các cuốn sách mà bạn muốn đọc và đặt ra mục tiêu hoàn thành danh sách đó trong một khoảng thời gian nhất định.
12. Đọc Một Lúc Nhỏ, Nhưng Thường Xuyên:

Thay vì cố gắng đọc một cuốn sách toàn bộ trong một lần, hãy chia nhỏ việc đọc thành các phần nhỏ và đọc thường xuyên để duy trì sự hứng thú và động lực.
13. Tạo Khoảng Thời Gian Riêng Cho Việc Đọc Sách:

Đặt ra quy tắc không sử dụng điện thoại hoặc máy tính trong một khoảng thời gian nhất định mỗi ngày để tập trung vào việc đọc sách.
14. Kết Nối với Cộng Đồng Đọc Sách:

Theo dõi các tác giả, nhà xuất bản, và cộng đồng đọc sách trên mạng xã hội để cập nhật thông tin mới nhất về sách và tạo sự động viên từ cộng đồng đam mê sách.
15. Tự Phát Triển và Thay Đổi:

Cuối cùng, hãy nhớ rằng việc tìm động lực để đọc sách là một quá trình phát triển và thay đổi. Hãy linh hoạt và sẵn lòng thay đổi cách tiếp cận và phương pháp đọc của bạn khi cần thiết để duy trì sự hứng thú và động lực.'
),

(N'Top Những Quyển Sách Hay Dành Cho Phái Nữ', 'Jane Smith', GETDATE(), 1, N'https://storage.googleapis.com/ops-shopee-files-live/live/shopee-blog/2022/08/3ccc16e1-16.08.2022-recovered-02-scaled.jpg', 
N'Đọc sách không chỉ là một sở thích tuyệt vời mà còn là một cách tuyệt diệu để mở rộng kiến thức, nâng cao sự thấu hiểu và tìm kiếm cảm hứng trong cuộc sống. Đối với phái nữ, có vô số cuốn sách thú vị và sâu sắc mà họ có thể khám phá.',
N'Đọc sách không chỉ là một sở thích tuyệt vời mà còn là một cách tuyệt diệu để mở rộng kiến thức, nâng cao sự thấu hiểu và tìm kiếm cảm hứng trong cuộc sống. Đối với phái nữ, có vô số cuốn sách thú vị và sâu sắc mà họ có thể khám phá. Dưới đây là danh sách "Top Những Quyển Sách Hay Dành Cho Phái Nữ" mà chắc chắn sẽ làm cho bạn say mê và suy ngẫm:

"Đừng Ngần Ngại Khéo Sắc" - Sheryl Sandberg và Adam Grant: Cuốn sách này cung cấp những lời khuyên quý báu và chiến lược thực tiễn để phụ nữ vượt qua những rào cản và tự tin bước lên con đường thành công.

"Người Phụ Nữ Nghĩ Gì Khi Chịu Áp Lực" - Lisa Damour: Tác giả Lisa Damour giúp phái nữ hiểu rõ hơn về cách quản lý cảm xúc, tâm trạng và áp lực trong cuộc sống hàng ngày.

"Giới Tính" - Gina Rippon: Cuốn sách này là một cuộc thách thức về các giới kiến thức truyền thống, khám phá sự linh hoạt của não bộ và tạo ra một cái nhìn mới mẻ về sự khác biệt giới tính.

"Đừng Nói Ta Hãy Yêu" - Emma McLaughlin và Nicola Kraus: Một cuốn tiểu thuyết hấp dẫn với câu chuyện về tình bạn, tình yêu và sự tự chủ, làm nổi bật những giá trị quan trọng mà mỗi phụ nữ cần biết.

"Hạnh Phúc Là Sự Lựa Chọn" - Paul Dolan: Tác giả Paul Dolan giúp phái nữ hiểu rõ hơn về những yếu tố thực sự làm cho cuộc sống trở nên hạnh phúc và đưa ra những gợi ý để tạo ra sự hài lòng và thành công trong cuộc sống.

"Nữ Lực - Dấu Ấn Màu Hồng" - Sheryl Sandberg: Sheryl Sandberg chia sẻ những câu chuyện cảm động và chiến lược tinh tế để nâng cao sự tự tin và khích lệ phụ nữ hiện đại.

"Chân Lý về Đàn Ông" - DeVon Franklin và Meagan Good: Cuốn sách này không chỉ là một lời khuyên về mối quan hệ, mà còn là một hướng dẫn thú vị và chiêm nghiệm về sự hiểu biết về đàn ông và tình yêu.

"Cách Mạng Châu  u" - Slavenka Drakulić: Một cuốn sách đầy tranh cãi về vấn đề nữ quyền, chứng minh sức mạnh và sự kiên định của phụ nữ trong cuộc sống và xã hội.

"Thiết Kế Cuộc Sống của Bạn" - Rachel Hollis: Rachel Hollis truyền cảm hứng và động viên phụ nữ để đặt mục tiêu và theo đuổi đam mê của mình trong cuốn sách này.

"Người Đàn Bà Mất Gia Đình" - Lisa Wingate: Một câu chuyện đầy cảm xúc và ý nghĩa về tình yêu, sự hy sinh và sức mạnh của gia đình, mang lại sự ngẫm nghĩ và cảm xúc sâu sắc cho độc giả.'
);
GO


INSERT INTO [SWP_Online_Shop].[dbo].[Sliders] ([Title], [Image], [Backlink])
VALUES
('Slider 1', 'https://bookbuy.vn/Res/Images/Album/ffd62e0e-02fb-4e7a-96fe-42ed8966c89b.png?w=920&h=420&mode=crop', 'https://bookbuy.vn/Res/Images/Album/ffd62e0e-02fb-4e7a-96fe-42ed8966c89b.png?w=920&h=420&mode=crop'),
('Slider 2', 'https://bookbuy.vn/Res/Images/Album/efefae23-5cb2-42e9-8d4f-59ca99d500af.png?w=920&h=420&mode=crop', 'https://bookbuy.vn/Res/Images/Album/efefae23-5cb2-42e9-8d4f-59ca99d500af.png?w=920&h=420&mode=crop');

Use SWP_Online_Shop

SELECT 
    o.OrderID,
    o.OrderDate,
    o.TotalCost,
    o.Status,
    o.ReceiverFullName,
    o.ReceiverEmail,
    o.ReceiverMobile,
    o.ReceiverAddress,
    od.ProductID,
    p.Title AS ProductTitle,
    od.Quantity
FROM 
    Orders o
INNER JOIN 
    OrderDetails od ON o.OrderID = od.OrderID
INNER JOIN 
    Products p ON od.ProductID = p.ProductID
WHERE 

    od.OrderID = '1';
	UPDATE Users SET StatusID = ? WHERE UserID = ?"

