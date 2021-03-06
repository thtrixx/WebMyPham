USE [master]
GO
/****** Object:  Database [Cosmetics]    Script Date: 12/18/2021 9:48:42 PM ******/
CREATE DATABASE [Cosmetics]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'cosmetic', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\cosmetic.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'cosmetic_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\cosmetic_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Cosmetics] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cosmetics].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cosmetics] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cosmetics] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cosmetics] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cosmetics] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cosmetics] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cosmetics] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cosmetics] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cosmetics] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cosmetics] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cosmetics] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cosmetics] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cosmetics] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cosmetics] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cosmetics] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cosmetics] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cosmetics] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cosmetics] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cosmetics] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cosmetics] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cosmetics] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cosmetics] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cosmetics] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cosmetics] SET RECOVERY FULL 
GO
ALTER DATABASE [Cosmetics] SET  MULTI_USER 
GO
ALTER DATABASE [Cosmetics] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cosmetics] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cosmetics] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cosmetics] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cosmetics] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Cosmetics] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Cosmetics', N'ON'
GO
ALTER DATABASE [Cosmetics] SET QUERY_STORE = OFF
GO
USE [Cosmetics]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 12/18/2021 9:48:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[boardnew]    Script Date: 12/18/2021 9:48:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[boardnew](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](200) NOT NULL,
	[content] [nvarchar](4000) NOT NULL,
	[image_link] [nvarchar](4000) NOT NULL,
	[author] [nvarchar](50) NOT NULL,
	[created] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[catalog]    Script Date: 12/18/2021 9:48:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[catalog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[parent_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ordered]    Script Date: 12/18/2021 9:48:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordered](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[transaction_id] [int] NOT NULL,
	[qty] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 12/18/2021 9:48:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[catalog_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [nvarchar](20) NOT NULL,
	[status] [int] NOT NULL,
	[description] [nvarchar](4000) NOT NULL,
	[content] [nvarchar](4000) NOT NULL,
	[discount] [int] NULL,
	[image_link] [nvarchar](4000) NOT NULL,
	[created] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[review]    Script Date: 12/18/2021 9:48:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[review](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[content] [nvarchar](4000) NOT NULL,
	[created] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[transactions]    Script Date: 12/18/2021 9:48:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transactions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_session] [nvarchar](50) NOT NULL,
	[user_name] [nvarchar](50) NOT NULL,
	[user_mail] [nvarchar](50) NOT NULL,
	[user_phone] [nvarchar](20) NOT NULL,
	[address] [nvarchar](300) NOT NULL,
	[message] [nvarchar](4000) NOT NULL,
	[amount] [nvarchar](20) NOT NULL,
	[payment] [nvarchar](30) NOT NULL,
	[status] [nvarchar](30) NULL,
	[created] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 12/18/2021 9:48:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[phone] [nvarchar](20) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[created] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[admin] ON 

INSERT [dbo].[admin] ([id], [username], [password], [name]) VALUES (1, N'admin', N'123456', N'Nguyen Huy Trung')
INSERT [dbo].[admin] ([id], [username], [password], [name]) VALUES (2, N'admin1', N'123456', N'Diep Bao Tung')
INSERT [dbo].[admin] ([id], [username], [password], [name]) VALUES (3, N'admin2', N'123456', N'Phan Nguyen Thanh Truc')
SET IDENTITY_INSERT [dbo].[admin] OFF
GO
SET IDENTITY_INSERT [dbo].[boardnew] ON 

INSERT [dbo].[boardnew] ([id], [title], [content], [image_link], [author], [created]) VALUES (1, N'Review bộ 3 son M.A.C mới toanh', N'M.A.C là thương hiệu nổi tiếng với các dòng sản phẩm trang điểm mang đậm tính thẩm mỹ, được ưa chuộng bởi bảng màu phong phú, bao bì đặc trưng và khá ấn tượng với hội chị em. Nắm bắt được nhu cầu khoe ảnh "phù phiếm" của hội chị em mà hàng năm cứ dịp cuối năm hoặc Collab cùng nghệ sĩ nào đó, là M.A.C lại đổi mới về phần bao bì. <br><br>Tháng 11 này, nhằm xóa tan những dư âm buồn tẻ của chuỗi ngày giãn cách vừa qua, M·A·C đã cho ra đời bộ sưu tập “Hypnotizing Holiday” với mong muốn khích lệ tinh thần của tất cả mọi người, trả lại sự lạc quan và đón chào những tháng cuối năm vô cùng rực rỡ!<br><br>Bộ sưu tập mới bao gồm những sắc thái màu được yêu thích nhất, mang đến cho bạn một bữa tiệc màu sắc nổi bật chưa từng có. Như bước ra từ những bộ phim hoạt hình ma thuật, bộ sưu tập với bao bì đỏ cùng những họa tiết vòng xoáy sẽ “thôi miên” bạn vào thế giới của những phép màu kì lạ, nơi bạn được thỏa sức sáng tạo và đắm mình vào miên man của cái đẹp.<br><br>MAC đem đến mùa lễ hội với những dải màu không thể nào "nóng" và nổi bật hơn nữa. Có lẽ đối với các tín đồ của son thì đáng sắm nhất là bộ sản phẩm Tiny Tricks Mini Lipstick Trio. Set 3 thỏi son này có 2 loại với với cái tên: Starring Ruby Woo và Starring Russian Red.<br><br>Các màu son trong bộ Starring Russian Red: Bạn sẽ thấy không có màu nào trong bộ này là không dùng được. Ra mắt mùa lễ hội nên màu son cũng khá rực rỡ, giúp làm bừng sáng khuôn mặt.<br><br>- Màu Dare You: Gam màu đỏ rượu vang chát hơi có ánh nhũ nhẹ, dù có ánh nhũ nhưng đây không phải là màu khó đánh, hợp cả đi làm lẫn đi chơi. Chất son cũng hơi bóng nhẹ nên giúp cho đôi môi nhìn căng mượt hơn.<br><br>- Russian Red: Gam màu đỏ tươi đúng chuẩn gái Pháp, sẽ phù hợp khi bạn khoác lên nguời bộ đầm lụa đẹp mơ màng. Gam màu đỏ này hơi thiên về tone lạnh một chút, chất son chuẩn matte, mịn lì, lên môi cực đẹp. <br><br>- Chili: Đây là gam đỏ cam gạch rất tôn da, đặc biệt nó cũng phù hợp để sử dụng mùa đông. Chất son M.A.C sẽ không làm bạn thất vọng vì khả năng lên màu chuẩn, sắc nét.  ', N'https://afamilycdn.com/150157425591193600/2021/11/7/ngang-1-16362812378501647708683-0-0-500-800-crop-16362920214281001808193.png', N'Vô Danh', CAST(N'2021-12-22' AS Date))
INSERT [dbo].[boardnew] ([id], [title], [content], [image_link], [author], [created]) VALUES (2, N'Nước hoa: Vũ khí vô hình của (anh) chị em', N'Nay là nước thơm, xưa là khói thơm...<br>Tổ tiên của nó không phải là chất lỏng mà là khói - khói đốt các hương liệu thơm. Chữ nước hoa trong tiếng Anh là "perfume", có gốc từ tiếng Latin "per fumus" nghĩa là "bằng khói".<br><br>Người Ai Cập đã dùng nhựa thơm của cây để đốt trong các nghi lễ từ 3.000 năm trước Công nguyên. Nhưng trước đó 500 năm, người Trung Quốc cổ đã biết chiết xuất hương liệu.<br>Những hương liệu đắt đỏ được nhắc đến vài lần trong Kinh Thánh. Theo Kinh Cựu Ước, phần Nhã Ca Solomon (Songs of Solomon), trong bài hát ca ngợi vẻ đẹp của tân nương có câu: "Ta sẽ đi lên núi mộc dược, đi đến đồi nhũ hương" và "Em ngan ngát hương thơm, hơn muôn loài phương thảo".<br><br>Mộc dược (myrrh) và nhũ hương (frankincense) đều là hai hương liệu quý vẫn được sử dụng đến ngày nay.<br><br>Hai món hương liệu này còn xuất hiện lần nữa trong Kinh Tân Ước, khi Ba Vua mang đến ba món quà tặng cho Chúa Hài Đồng gồm: vàng, mộc dược, nhũ hương. Nhũ hương còn được dùng để cuốn thân thể của Chúa khi Chúa được hạ khỏi thập giá. Người xưa hay người nay đều hiểu: mùi thơm là một trong những yếu tố của sang trọng.<br><br>Thế kỷ 17 đánh dấu sự phát triển chưa từng có của ngành nước hoa, nhất là thời vua Louis XIV. Các ông bà quý tộc thời đó tin rằng việc tắm táp thường xuyên sẽ dễ khiến họ bị bệnh, thành ra họ cần sử dụng hương thơm để át đi mùi cơ thể ít tắm. "Hun khói thơm" thôi không tác dụng.<br><br>Nước hoa ngày nay có thành phần chính là hỗn hợp tinh dầu, absolute trong dung môi cồn. Tinh dầu nước hoa có thể được chiết xuất từ thiên nhiên hoặc được điều chế trong phòng thí nghiệm bằng nhiều phương pháp khác nhau như chưng cất, ép lạnh, dùng dung môi để chiết xuất hoặc ướp hoa. Thêm vào đó là một số hương liệu, tùy nhà.<br><br>Một số loại hương liệu tự nhiên quý hiếm đã bị cấm khai thác và được thay thế bằng hương liệu nhân tạo. Ví dụ điển hình là xạ hương. Xạ hương tự nhiên trong nước hoa được lấy từ… tuyến nội tiết của hươu đực.<br><br>Xạ hương trong tiếng Anh là "musk", dựa theo tiếng Phạn "muṣká", có nghĩa là "hòn dái". Việc khai thác quá mức đã đe dọa sự tồn tại của loài hươu xạ, hiện việc săn chúng đã bị cấm hoặc hạn chế tối đa tùy từng quốc gia.<br><br>Phòng thí nghiệm với các công thức bí mật và các chất nhân tạo đã làm nên thế giới nước hoa hiện đại: đa dạng, độc đáo, ai cũng có thể tiếp cận. Nhưng cuộc đua không chỉ ở "tốt gỗ" mà còn phải ở cả "tốt nước sơn" và thế giới của các chuyên gia thiết kế lọ nước hoa mở ra.<br><br>Một số lọ đựng nước hoa đắt tiền là do các nghệ nhân nổi danh chế tác; giá trị chai có khi còn lớn hơn cả giá trị nước hoa, ví dụ lọ Shumukh, ra mắt năm 2019, được các nghệ nhân Ý, Pháp, Thụy Sĩ chế tác suốt 3 năm, gắn hơn 3.000 viên đá quý, trị giá tới 30 tỉ đồng. Mùi gì thì chưa biết nhưng người mua có lẽ sẽ mua chỉ để ngắm lọ.', N'https://cdn.tuoitre.vn/thumb_w/586/2021/3/5/11111-16149408560031583782943.jpg', N'Bao Tung', CAST(N'2021-12-01' AS Date))
INSERT [dbo].[boardnew] ([id], [title], [content], [image_link], [author], [created]) VALUES (3, N'Hướng dẫn chăm sóc da mặt mùa hè', N'1. Rửa mặt bằng sữa rửa mặt thích hợp<br><br>Rửa mặt bằng nước không thể làm sạch hết các chất nhờn và bụi bẩn trên mặt. Do đó, sữa rửa mặt sẽ giúp loại bỏ mồ hôi, lớp dầu trên da, làm sạch sâu những bụi bẩn, cặn bã và những lớp tế bào da lão hóa từ sâu bên trong. Nhờ đó, giúp ngăn chặn các vấn đề về da đặc biệt là mụn.<br><br>Ngoài ra, sửa rửa mặt còn có tác dụng làm sáng da, tạo điều kiện thuận lợi để các dưỡng chất có trong kem dưỡng trắng, kem dưỡng ẩm,... có thể dễ dàng thấm sâu vào bên trong làn da.<br><br>Tuy nhiên việc chọn loại sữa rửa mặt phù hợp cũng vô cùng quan trọng. Các bạn gái có làn da nhạy cảm nên chọn các loại sữa rửa mặt dịu nhẹ. Còn nếu sở hữu làn da thiên dầu, dễ nổi mụn, hãy lựa chọn các loại sữa rửa chuyên biệt, với các thành phần có khả năng làm sạch sâu lớp dầu nhờn và những bẩn trên da.<br><br>2. Tẩy tế bào chết đều đặn<br><br>Các tế bào chết nằm trên trên bề mặt da, dễ khiến da bị xỉn màu, kém sức sống và ngăn chặn các dưỡng chất từ những sản phẩm chăm sóc da thấm sâu vào bên trong da. Các chuyên gia làm đẹp khuyên nên tẩy tế bào chết đều đặn, khoảng 2-3 lần/tuần để loại bỏ lớp tế bào đã lão hóa, tạo điều kiện cho các tế bào da mới sinh sôi.<br><br>3. Thoa kem chống nắng hằng ngày <br><br>Mùa hè là thời điểm tăng cường bảo vệ làn da khỏi tia UV. Các vật dụng che chắn thông thường như khẩu trang, váy chống nắng,...không thể bảo vệ làn da một cách toàn diện. Do đó, việc thoa kem chống nắng hằng ngày là vô cùng quan trọng, kể cả khi trời râm mát hay khi đang ở trong nhà vì tia UV vẫn luôn hiện diện.<br><br>4. Dưỡng ẩm cho da<br><br>Nhiều sở hữu làn da dầu, đặc biệt trong mùa hè dầu và bã nhờn càng tiết ra nhiều hơn khiến da “bóng lưỡng” nên nghĩ rằng việc dưỡng ẩm là không cần thiết. Đây là một quan niệm hoàn toàn sai. Nguyên nhân khiến da tiết ra nhiều bã nhờn là do bề mặt da thiếu nước và độ ẩm nên cơ thể mới bài tiết ra các chất nhờn nhằm giúp cân bằng độ ẩm cho da. Việc dùng kem dưỡng ẩm hay toner cấp ẩm cho da sẽ giúp hạn chế được lượng dầu nhờn tiết ra và cải thiện da tốt hơn.<br><br>5. Đắp mặt nạ đều đặn<br><br>Đắp mặt nạ dưỡng da nhằm cung cấp dưỡng chất cho làn da, tạo điều kiện cho làn da phục hồi khỏe mạnh và sáng đẹp. Không nhất thiết phải sử dụng đến các loại mặt nạ đắt tiền mà có thể tận dụng các loại trái cây và rau củ quen thuộc, có rất nhiều trong mùa hè như dưa leo, dưa hấu, bơ, cà chua, khoai tây... kết hợp cùng sữa tươi hoặc sữa chua không đường. Các loại mặt nạ dưỡng da từ thiên nhiên không chỉ đem lại hiệu quả trong việc ngăn ngừa mụn và cải thiện làn da cháy nắng trong mùa hè mà còn không gây kích ứng nào làn da, thích hợp cho cả da thường lẫn da dầu nhờn hoặc nhạy cảm.6. Uống nhiều nước<br><br>Thời tiết nắng nóng khiến cơ thể tiết nhiều mồ hôi và làn da cũng mất đi độ ẩm cần thiết. Do vậy, nên uống nhiều nước, khoảng 8-10 cốc nước mỗi ngày để bổ sung đủ nước cho cơ thể, duy trì làn da khỏe mạnh, căng mịn. Ngoài ra, nên uống thêm nhiều nước ép hoa quả, nước dừa, ăn các loại trái cây, rau củ nhiều nước.', N'https://vinmec-prod.s3.amazonaws.com/images/20190617_103733_219111_su_dung_kem_chong_n.max-1800x1800.jpg', N'Nhà báo DBT', CAST(N'2021-12-12' AS Date))
INSERT [dbo].[boardnew] ([id], [title], [content], [image_link], [author], [created]) VALUES (4, N'HƯỚNG DẪN CÁCH SỬ DỤNG SERUM ĐÚNG CHUẨN CHO LÀN DA KHỎE ĐẸP', N'Serum là sản phẩm dưỡng da có kết cấu lỏng nhẹ hoặc dạng gel, chứa nhiều dưỡng chất ở dạng phân tử siêu nhỏ, có khả năng thẩm thấu sâu vào da. Hiện nay, có rất nhiều loại serum khác nhau như serum hỗ trợ sáng da, hỗ trợ chống lão hóa, điều trị mụn, cấp ẩm, tái tạo da... Serum mang lại nhiều lợi ích chăm sóc da, tuy nhiên nếu sử dụng sai cách, sản phẩm này có thể khiến da dễ kích ứng hay bị khô, bong tróc, nổi mẩn đỏ… <br><br>1. Cách sử dụng serum hiệu quả cho làn da khỏe đẹp<br><br>Để serum phát huy tối đa hiệu quả chăm sóc da, bạn phải sử dụng sản phẩm này đúng cách. Dưới đây là các bước sử dụng serum đúng chuẩn mà bạn có thể tham khảo: <br><br>Bước 1: Làm sạch mặt (tẩy trang, sữa rửa mặt, toner) để giúp các dưỡng chất trong serum có thể thấm vào da nhanh chóng, ngăn ngừa tình trạng bít tắc lỗ chân lông, dẫn đến hình thành mụn viêm. Sau đó dùng khăn mềm lau khô da mặt. <br><br>Bước 2: Cho vài giọt serum lên mặt, thoa đều và massage nhẹ nhàng để giúp dưỡng chất thấm đều, thấm sâu hơn vào da. <br><br>Bước 3: Đợi khoảng 10 phút để serum thấm vào da thì bạn thoa kem hoặc gel dưỡng ẩm. <br><br>Bước 4: Thoa kem chống nắng (bước này chỉ thực hiện khi bạn chăm sóc da vào ban ngày) <br><br>2. Những lưu ý khi sử dụng serum dưỡng da<br><br>Bên cạnh tìm hiểu cách sử dụng serum đúng chuẩn, bạn cũng nên lưu ý một số điều sau khi dùng sản phẩm dưỡng da này: <br><br>Nên chọn serum phù hợp với làn da. Serum dành cho da khô nên có tác dụng cấp ẩm và chứa các thành phần như Axit Hyaluronic, vitamin E, tinh dầu dưỡng da. Với da nhạy cảm, serum nên có nồng độ dưỡng chất thấp. Serum cho da dầu nên có các thành phần như vitamin C, Axit Glycolic hoặc Retinol… Da mụn nên chọn serum vừa có tác dụng tẩy tế bào da chết vừa dưỡng da, chứa các thành phần như vitamin B3, vitamin C, vitamin B5, Glycolic, Axit Salicylic<br><br>Không thoa serum quá nhiều vì da không thể nào hấp thu hết các dưỡng chất, có thể gây lãng phí hoặc khiến da “bội thực”, dẫn đến nhiều tác dụng phụ không mong muốn. <br><br>Những vùng da riêng biệt nên dùng những loại serum khác nhau. Ví dụ, serum cho vùng da cổ, mặt sẽ khác so với serum dành cho vùng mắt. <br><br>Nên dùng serum càng nhanh càng tốt ngay sau khi mở nắp để tránh các dưỡng chất trong serum bị thất thoát theo thời gian, không còn phát huy tác dụng tốt nữa. ', N'https://ritana.com.vn/files/image/3908-cach-su-dung-serum-1.jpg', N'Reviewer PNTT', CAST(N'2021-12-31' AS Date))
SET IDENTITY_INSERT [dbo].[boardnew] OFF
GO
SET IDENTITY_INSERT [dbo].[catalog] ON 

INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (1, N'Chăm sóc da mặt', NULL)
INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (2, N'Trang điểm', NULL)
INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (3, N'Nước hoa', NULL)
INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (4, N'Chăm sóc cơ thể', NULL)
INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (5, N'Dụng cụ làm đẹp', NULL)
INSERT [dbo].[catalog] ([id], [name], [parent_id]) VALUES (6, N'Sản phẩm cho Nam', NULL)
SET IDENTITY_INSERT [dbo].[catalog] OFF
GO
SET IDENTITY_INSERT [dbo].[ordered] ON 

INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (1, 1, 1, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (2, 2, 1, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (3, 3, 1, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (4, 4, 1, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (5, 1, 2, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (6, 5, 2, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (7, 14, 3, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (8, 16, 3, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (9, 30, 3, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (10, 4, 4, 1)
INSERT [dbo].[ordered] ([id], [product_id], [transaction_id], [qty]) VALUES (11, 4, 5, 2)
SET IDENTITY_INSERT [dbo].[ordered] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (1, 1, N'Mặt nạ 7 Days Lô Hội', N'28.000', 1, N'Mặt nạ giúp làm dịu da tức thì, dưỡng ẩm, mang lại làn da mềm mịn, căng mướt', N'Thông tin mặt nạ Ariul 7Days (phiên bản mới):1. Chứa hợp chất N.M.F: Tăng cường hàng rào dưỡng ẩm cho da.2. Độ pH 5.5: Không gây kích ứng da. Đã được kiểm nghiệm da liễu.3. Thuần chay: Không thử nghiệm trên động vật & 0% dẫn xuất từ động vật.4. Mặt nạ giàu dưỡng chất: 40,000 mắt lưới chứa dưỡng chất trên mỗi miếng mặt nạ"', 0, N'https://images.soco.id/36870a29-ee25-44a1-a60e-d4123dfc438a-15484613709-1625036667261.png', CAST(N'2021-12-01' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (2, 1, N'Kem Dưỡng Da Innisfree', N'420.000', 1, N'Mặt nạ giúp làm dịu da tức thì, dưỡng ẩm, mang lại làn da mềm mịn, căng mướt', N'Dòng sản phẩm Green Tea Balancing với chiết xuất 100% từ lá trà xanh tươi từ đảo Jeju đem lại một làn da sạch và dưỡng ẩm mướt mịn. Đặc biệt với kết cấu dịu nhẹ phù hợp cấp ẩm cho các bạn có làn da hỗn hợp thiên dầu, da dầu. Kem dưỡng ẩm Green Tea Balacing Cream Ex với kết cấu mượt mà hình thành màng dưỡng ẩm bảo vệ da khoẻ mạnh.', 10, N'https://images.soco.id/12867560053-1600710963168.png', CAST(N'2021-12-01' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (3, 1, N'Kem Dưỡng Klairs Midnight', N'420.000', 1, N'Kem Dưỡng Klairs Midnight Blue Calming', N'Thành phần chính và công dụng:- Centella asiatica (chiết xuất rau má) : kích thích quá trình làm lành vùng da bị tổn thương, tránh tình trạng để lại sẹo sau khi bị tổn thương.- Guaiazulene (chiết xuất từ hoa cúc La Mã), làm dịu và mát da có tác dụng giúp hồi phục đến 89.7% vết thương do cháy nắng, 60.6% da kích ứng và 86.5% vết thương hở.- Ceramide 3: là một trong những chất có khả năng tăng cường sức chống lão hóa và sức đề kháng cho da.', 10, N'https://s3-ap-southeast-1.amazonaws.com/img-sociolla/img/p/1/9/0/3/6/19036-large_default.jpg', CAST(N'2021-12-01' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (4, 1, N'Tinh Chất Phục Hồi Da', N'300.000', 1, N'Tinh Chất Phục Hồi Da Và Dưỡng Ẩm Klairs Midnight 20 ml', N'Tinh Chất Phục Hồi Da Và Dưỡng Ẩm Klairs Midnight Blue Youth Activating Drop 20ml là sản phẩm được sử dụng trước khi đi ngủ, với thành phần chính là EGF (sh-Oligopeptide-1), bFGF (sh-Polypeptide-1). Đây là 2 hoạt chất do cơ thể tự sản sinh ra, giúp giữ cho da khỏe ở bên trong và đẹp từ bên ngoài.- Các hoạt chất này sẽ giúp da căng bóng và mịn màng, có độ đàn hồi cao, đồng thời còn giúp giảm thiểu nếp nhăn, làm căng mịn làn da và hỗ trợ đẩy lùi các dấu hiệu tuổi tác và lão hóa.', 0, N'https://s3-ap-southeast-1.amazonaws.com/img-sociolla/img/p/1/9/0/3/5/19035-large_default.jpg', CAST(N'2021-12-01' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (5, 1, N'Sữa rửa mặt Senka', N'99.000', 1, N'Làm sạch sâu - Sữa rửa mặt Senka', N'Sữa rửa mặt tạo bọt Senka Perfect Whip 120g giúp da sạch hoàn hảo với bọt tơ tằm trắng mịn.Thành phần:- Công nghệ Giữ ẩm độc quyền “Aqua in Pool”: Được sáng chế bởi tập đoàn Shiseido, công nghệ làm sạch chọn lọc giúp lấy đi bụi bẩn và bã nhờn nhưng vẫn giữ lại độ ẩm tự nhiên của da. Bên cạnh đó, tăng cường hiệu quả của các thành phần dưỡng ẩm khác, da sạch nhưng không hề khô căng, mà ẩm mịn tự nhiên', 0, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/24092805769-1584371631703.png', CAST(N'2021-12-01' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (6, 1, N'Nước Tẩy Trang Bioderma', N'200.000', 1, N'Nước Tẩy Trang Bioderma Sebium H2O', N'Dung dịch làm sạch và tẩy trang Micellar. Làm sạch dịu nhẹ, lấy đi lớp trang điểm và bịu bẩn nhưng không gây khô da. Hạn chế tiết dầu, mang lại cảm giác sảng khoái tức thì Phát minh và hoạt chất:- Công nghệ Micellar làm sạch nhẹ nhàng, loại bỏ hoàn toàn bụi bẩn và lớp trang điểm.- Bằng sáng chế D.A.F tăng ngưỡng dung nạp cho da- Kháng khuẩn: đồng sulfate, kẽm gluconate.- Chống oxy hóa, làm dịu, giảm đỏ: chiết xuất lá bạch quả.', 5, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://s3-ap-southeast-1.amazonaws.com/img-sociolla/img/p/1/4/7/1/1/14711-large_default.jpg', CAST(N'2021-12-01' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (7, 1, N'Tinh Chất Dear Klairs', N'323.000', 1, N'Tinh Chất Dear Klairs Dưỡng Sáng Và Làm Đều Màu Da Freshly Juiced Vitamin Drop 35ml', N'Tinh Chất Dear Klairs Dưỡng Sáng Và Làm Đều Màu Da Freshly Juiced Vitamin Drop 35ml có thành phần chiết xuất từ Ascorbic Acid - là một loại dẫn xuất từ Vitamin C tinh khiết với hàm lượng 5% có tác dụng làm mờ vết thâm, ức chế việc hình thành sắc tố melanin, chống oxy hóa mạnh mẽ đồng thời kích thích tăng sinh collagen nhằm phục hồi, tăng cường độ đàn hồi cho da.', 20, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/7924aca2-5102-45e4-b05f-afca3eae30ae-63429488167-1627638041455.png', CAST(N'2021-12-01' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (8, 1, N'Kem Chống Nắng INNISFREE', N'360.000', 1, N'Kem Chống Nắng Lâu Trôi Innisfree Intensive Long Lasting Sunscreen Spf50+ Pa++++', N'Chống nắng không phải là cách bạn chỉ dùng khẩu trang, mắt kính, bao tay, việc chống nắng không đúng hay tạm thời quên sẽ làm cho làn da chúng ta trở nên sạm hơn, lão hóa nhanh đi. Chính vì vậy, innisfree luôn quan tâm bảo vệ da bạn trước tác động của ánh nắng bất kể làn da của bạn có đang khó chiều thế nào.', 10, N'https://www.soco.id/cdn-cgi/image/w=150,format=auto,dpr=1.45/https://images.soco.id/3544a825-cdfe-4458-b85b-f87d1629c03d-93696283055-1607412604994.png', CAST(N'2021-12-12' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (9, 2, N'Son môi LOREAL PARIS', N'248.000', 1, N'Son lì mịn môi Color Riche Matte', N'ƯU ĐIỂM NỔI BẬT- Môi được khoác lên những màu son lì rạng rỡ, gợi cảm và kiêu kì hơn. - Công thức kết hợp tinh dầu quý giúp dưỡng ẩm và bảo vệ môi suốt cả ngày. - Với hơn 40 màu sắc khác nhau, bạn có thể dễ dàng lựa chọn màu son phù hợp cho mọi hoàn cảnh.- Hãy trải nghiệm sự sang trọng trong mỗi lần lướt son với son màu mịn môi Color Riche Matte ', 10, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/71933128231-1602750098065.png', CAST(N'2021-12-12' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (10, 2, N'Mascara MAYBELLINE', N'155.000', 1, N'Mascara Làm Dài Và Cong Mi New York Hyper Curl', N'Mascara làm dài và cong  mi màu đen huyền thoại của nhà Maybelline New York, Mascara Hyper Curl giúp làm dài mi và giúp hàng mi của bạn cong vút 100° bền đẹp suốt 18 giờ.Mascara Hyper Curl phù hợp với hàng mi mỏng, thưa và không được dài. Hyper Curl sở hữu công thức tối ưu kết hợp với đầu cọ được thiết kế dễ dàng chải tận gốc sợi mi, giúp mascara được bao phủ hiệu quả.', 0, N'https://images.soco.id/12867560053-1600710963168.png', CAST(N'2021-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (11, 2, N'Phấn Phủ Tự Nhiên MAYBELLINE', N'158.000', 1, N'Phấn Phủ Tự Nhiên Kiềm Dầu 12H Chống Nắng SPF28', N'Phấn Nền Kiềm Dầu Chống Nắng 12H Mịn Lì Lâu Trôi Fit Me chính là lựa chọn giúp bạn có được lớp trang điểm hoàn hảo, se khít lỗ chân lông với hạt phấn siêu nhỏ, mịn, và da tự nhiên. Đặc biệt, phấn nền Fit Me còn bảo vệ da với độ chống nắng SPF 28 PA+++, giúp bạn tự tin thoải mái dưới ánh nắng mặt trời. Với công nghệ Micro Powder độc quyền từ Maybelline, hạt phấn nền được thiết kế siêu nhỏ, phủ đều trên da và tạo hiệu ứng 3D mịn màng hoàn hảo.', 10, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/dd66a2aa-854d-4f4e-89d2-a8fc2202972b-53111506719-1607415683916.png', CAST(N'2021-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (12, 2, N'Son Dưỡng LOULOU', N'249.000', 1, N'Son Dưỡng Có Màu Loulou Seoul Glow Tint 3g', N'Son tint Loulou GLow Tint  là dòng son dưỡng có màu không thể thiếu của các cô nàng thời thượng!Bên cạnh đó, còn có rất nhiều màu sắc trẻ trung để lựa chọn chính là cộng thêm vài chục điểm độc đáo, đặc biệt cho gương mặt của bạn.', 20, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/8b848f28-2bf1-4979-9370-78e08f09c66a-image-1-1622989224339', CAST(N'2021-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (13, 2, N'Phấn Mịn Lì Tự Nhiên MAYBELLINE', N'188.000', 1, N'Phấn Mịn Lì Tự Nhiên Fit Me Matte Poreless Powder', N'Phấn Phủ Mịn Nhẹ Kiềm Dầu Fit Me Matte Poreless Powder Maybelline New York có kết cấu phấn mỏng nhẹ, phấn nền sẽ giúp làn da dù trang điểm nhưng vẫn luôn thông thoáng và không sợ bí da, bít lỗ chân lông. Cấu trúc hạt phấn mịn cho làn da hiệu ứng mịn màng đầy tự nhiên. Hiệu ứng lì cao mang lại lớp nền tươi tắn, rạng rỡ.', 0, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/37605d6f-c959-4b33-a89e-94fb00d4292f-7396817669-1608634119586.png', CAST(N'2021-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (14, 2, N'Kem Lót Mịn Da MAYBELLINE', N'158.000', 1, N'Kem Lót Mịn Da Che Khuyết Điểm New York Baby Skin Pore Eraser', N'Kem lót Baby Skin Pore Eraser giúp làm mịn da, che khuyết điểm, tạo hiệu ứng lỗ chân lông thu nhỏ, cho lớp nền mịn màng hoàn hảo. Cấu trúc gel trong suốt, mịn nhẹ dễ tán, hiệu quả trong việc che lỗ chân lông ngay tức thì. Hứa hẹn sẽ mang lại làn da láng mịn như da em bé trong tíc tắc.', 0, N'https://s3-ap-southeast-1.amazonaws.com/img-sociolla/img/p/1/4/3/4/2/14342-large_default.jpg', CAST(N'2021-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (15, 2, N'Son Kem LEMONADE', N'250.000', 1, N'Son Kem 2 Đầu Lemonade Perfect Couple Lip Fashionistar', N'Cảm hứng từ những chiếc mắt kính. Đối với Châu mắt kính là phụ kiện thời trang “must have” luôn mọi người ạ, giúp bạn trông cool hơn và cá tính hơn nữa. Màu son Beauty  Glasses có một đầu là màu Cam Nâu, đầu còn lại là màu Đỏ Đất đều rất cá tính và dễ dùng, khi mix lại sẽ cho ra một màu son Đỏ Nâu Đất độc đáo.', 5, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/81bad453-a51b-4fcf-bd43-c09394c4b03a-60539109461-1624522837379.png', CAST(N'2021-12-14' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (16, 2, N'Son môi Đỏ', N'420.000', 1, N'Son lì mịn môi đỏ hồng', N'ƯU ĐIỂM NỔI BẬT- Môi được khoác lên những màu son lì rạng rỡ, gợi cảm và kiêu kì hơn. - Công thức kết hợp tinh dầu quý giúp dưỡng ẩm và bảo vệ môi suốt cả ngày. - Với hơn 40 màu sắc khác nhau, bạn có thể dễ dàng lựa chọn màu son phù hợp cho mọi hoàn cảnh.- Hãy trải nghiệm sự sang trọng trong mỗi lần lướt son với son màu mịn môi Color Riche Matte ', 5, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/ad3f2983-ab9a-4207-8a38-711f0a587761-66848551759-1622197738778.png', CAST(N'2021-12-08' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (17, 3, N'Nước hoa MOSCHINO', N'990.000', 1, N'Nước hoa Toy Boy EDP Xuất xứ Ý', N'Toy Boy là dòng nước hoa nam của thương hiệu Moschino mới được ra mắt vào năm 2019 và được thiết kế bởi giám đốc sáng tạo Jeremy Scott. Toy Boy diễn giải về một người đàn ông tự tin, năng động, đầy hoài bão và đam mê, nhưng không ngại thể hiện khía cạnh hóm hỉnh và hài hước của bản thân. Được chuyên gia nước hoa hàng đầu Yann Vasnier sáng tạo ra', 10, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/ed01d1ef-959e-4218-a073-23996c4b7015-.jpg', CAST(N'2021-12-18' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (18, 3, N'Nước hoa Versace', N'120.000', 1, N'Nước hoa Versace Eros EDP', N'Nước hoa mang lại mùi hương cho cơ thể bạn thông qua việc tiếp xúc lên da và phản ứng với hơi ấm trên cơ thể của bạn. Việc được tiếp xúc với các bộ phận như cổ tay, khuỷu tay, sau tai, gáy, cổ trước là những vị trí được ưu tiên hàng đầu trong việc sử dụng nước hoa bởi sự kín đáo và thuận lợi trong việc tỏa mùi hương.', 10, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/18311e5a-c71c-42e7-b0f1-d34c5fd5f9ee-51026703834-1634786750156.png', CAST(N'2021-12-03' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (19, 3, N'Nước hoa Signorina', N'1.42000', 1, N'Nước hoa Signorina Ferragamo Ribelle EDP SALVATORE FERRAGAMO', N'Nước hoa Signorina Ribelle của thương hiệu Salvatore Ferragamo là một loại nước hoa phương Đông dành cho phụ nữ. Đây là một hương thơm mới của hãng vừa được ra mắt vào mùa thu năm 2019. Signorina Ribelle mở đầu khá tươi mát với hương cam và tiêu hồng, sau đó uyển chuyển và trở nên rực rỡ hơn với Ylang-Ylang và hoa sứ.', 10, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/3221438664-1601356084847.png', CAST(N'2021-12-03' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (20, 3, N'Nước Hoa CALVIN KLEIN Đen', N'957.000', 1, N'Nước Hoa Be Eau De Toilette Spray', N'Mùi hương dành cho tất cả mọi người, không phân biệt tuổi, giới tính, màu da, đẳng cấp.Hương thơm: Một mùi hương dành cho nam và nữ thể hiện sự lôi cuốn và cá tính đặc trưng của người sử dụng.Họ hương: Aromatic', 10, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/dbf61e6e-61e3-4710-aa71-15e63fd8064e-.jpg', CAST(N'2021-12-03' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (21, 3, N'Nước Hoa CALVIN KLEIN Trắng', N'900.000', 1, N'Nước Hoa One Eau De Toilette', N'Mùi hương dành cho tất cả mọi người, không phân biệt độ tuổi, giới tính, màu da, đẳng cấp.Hương thơm: tươi mát, dễ tiếp cận, phổ biến, kết nối mọi ngườiHọ hương: cam quýtKiểu dáng chai: đơn giản, tự nhiên với chữ CK giản dị, quyến rũ mọi đối tượngNăm ra đời: 1994', 10, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/fc433c88-3dd6-4936-95b1-bf05c48a278b-58151557601-1610613588215.png', CAST(N'2021-12-03' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (22, 3, N'Nước hoa SALVATORE FERRAGAMO', N'420.000', 1, N'Nước hoa Signorina Ferragamo Misteriosa EDP sp.', N'Misteriosa là một mùi hương táo bạo, lôi cuốn thích hợp cho những cô nàng muốn phá vỡ mọi quy tắc của cuộc sống. Signorina Misteriosa phù hợp khi sử dụng ban đêm, tiết trời se lạnh, để cảm giác ngọt ngào từ quả mâm xôi, vani đen, hoa cam sẽ mang đến sự ấm áp cho người dùng. Dòng sản phẩm mới không hổ danh là một tác phẩm hoàn hảo quyến rũ từ thiết kế nổi bật, sang trọng đến mùi hương thu hút, lôi cuốn. ', 10, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/c46e5520-1508-41d9-ad8e-cba6a17f6a2e-79748277998-1614685917284.png', CAST(N'2021-12-05' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (23, 3, N'Nước Hoa LANVIN', N'888.000', 1, N'Nước Hoa Lanvin A Girl In Capri Edt 90Ml', N'Lanvin - A Girl in Capri là một tinh chất rực rỡ đầy nắng của một chuyến du hành trên hòn đảo Capri xinh đẹp. Mùi hương là bức hoạ có màu xanh ngọc bích của biển Tyrrhenian dưới ánh nắng mặt trời, màu trắng của những mái nhà quý tộc thấp thoáng dưới tán lá xanh, màu vàng của nắng và những khu vườn cam bergamot màu mỡ. Bản chất của cam Bergamot mở ra hương thơm rạng rỡ, lạc quan mãnh liệt như những ngôi sao rơi xuống trần gian làm tung toé những đốm sáng lấp lánh trên những con đường vắng lặng giữa trưa hè.', 30, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/426ef79e-5e7c-44ca-b3d8-c95492d6c7e6-52619470355-1607315167836.png', CAST(N'2021-12-04' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (24, 3, N'KNước Hoa Calvin Klein Bạc', N'990.00', 1, N'Nước Hoa Calvin Klein Euphoria Eau De Parfum 50ml', N'Dành cho những người phụ nữ hiện đại, quyến rũ, gợi cảm, muốn thể hiện ước mơ tự do của chính mình.Hương thơm: lấy cảm hứng từ sự tìm thấy một tự do mới, một hành trình không giới hạn, một giấc mơ của Calvin Klein. Một trạng thái của tâm hồn và thể xác cùng vận chuyển và khiêu khích, thể hiện ham muốn thân mật không kiềm chế tạo nên sự hưng phấn thú vị.Họ hương: Hương phương đông', 10, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/e592e40d-8f78-46d4-b429-02493297d8d5-.jpg', CAST(N'2021-12-02' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (25, 4, N'Gel tắm bí đao COCOON', N'245.000', 1, N'Gel tắm bí đao Winter melon shower gel', N'Giúp da sạch mịn màng và giảm mụn lưng. Tinh dầu sả chanh giảm mùi cơ thể, tạo cảm giác sảng khoái, thư giãn. Sản phẩm dạng gel trong tạo bọt nhẹ nhàng và không gây khô da sau khi sử dụng. Sau khi rửa mặt, lấy một lượng nước cân bằng vào lòng bàn tay, thoa đều lên da và vỗ nhẹ nhàng để sản phẩm thẩm thấu vào da. Có thể dùng kèm bông tẩy trang, lau nhẹ trên da theo hướng từ trong ra ngoài và từ dưới lên trên.', 10, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/image-2-1601549757314', CAST(N'2021-12-12' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (26, 4, N'Tẩy tế bào chết C LAB & CO', N'369.000', 1, N'Tẩy tế bào chết chiết xuất Hạt Cà Phê Arabica & Dầu Dừa', N'Đánh thức sự tươi mới cho làn da với sự kết hợp tuyệt vời giữa bột cà phê rang Arabica xay nhuyễn hòa quyện cùng muối biển, tẩy tế bào da chết 100% thuần chay đến từ Úc loại bỏ da chết hiệu quả đồng thời làm giảm sự xuất hiện vết sần rạn trên da mà vẫn duy trì tối đa độ ẩm nhờ vào hàm lượng cao dầu Dừa, dầu Hạnh nhân Ngọt và Vitamin E.', 10, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/25843627650-1583913990167.png', CAST(N'2021-12-02' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (27, 4, N'Kem dưỡng da tay ARIUL', N'48.000', 1, N'Kem dưỡng da tay Tell Me Your Wish Hand Butter', N'Dòng sản phẩm chăm sóc da tay Tell Me Your Wish được làm từ các thành phần thực vật ở đảo Jeju và chiết xuất từ ​​mật ong giúp nuôi dưỡng làn da, làm chắc móng tay và dưỡng ẩm tức thì.Hương thơm: Có 2 lựa chọn: Gorgeous (Hương hoa ngọt ngào và thư thái), Glam (Hương thơm Xạ hương ngọt ngào, nồng ấm). Hương thơm lưu trên da cả ngày, cùng kết cấu kem bơ đậm đặc dưỡng ẩm tối ưu nhưng không gây bết dính. Phù hợp cho da khô.', 10, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/ce2729f4-4a9c-4fbc-abaa-829f82b78cea-53505656068-1621341116470.png', CAST(N'2021-12-02' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (28, 4, N'Kem Dưỡng Da Innisfree', N'420.000', 1, N'Mặt nạ giúp làm dịu da tức thì, dưỡng ẩm, mang lại làn da mềm mịn, căng mướt', N'Dòng sản phẩm Green Tea Balancing với chiết xuất 100% từ lá trà xanh tươi từ đảo Jeju đem lại một làn da sạch và dưỡng ẩm mướt mịn. Đặc biệt với kết cấu dịu nhẹ phù hợp cấp ẩm cho các bạn có làn da hỗn hợp thiên dầu, da dầu. Kem dưỡng ẩm Green Tea Balacing Cream Ex với kết cấu mượt mà hình thành màng dưỡng ẩm bảo vệ da khoẻ mạnh.', 10, N'https://images.soco.id/12867560053-1600710963168.png', CAST(N'2021-12-04' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (29, 4, N'Sữa tắm dưỡng ẩm THE GOAT SKINCARE', N'255.000', 1, N'Sữa tắm dưỡng ẩm chiết xuất từ Sữa Dê', N'Là bí quyết chăm sóc da lâu đời từ thiên nhiên với chiết xuất từ sữa dê nguyên chất, sữa tắm nhẹ nhàng lấy đi bụi bẩn tích tụ đồng thời duy trì độ ẩm cần thiết cho da, giúp làn da luôn sạch & sáng mịn thuần khiết.Mỗi sản phẩm của The Goat Skincare đều được sản xuất bằng nguyên liệu chính là sữa dê nguyên chất từ Victoria, tiểu bang ở đông nam nước Úc. The Goat Skincare cam kết không chứa Paraben, Sunfat, hương liệu và được cân bằng độ pH phù hợp sử dụng hàng ngày mà không gây kích ứng da.', 10, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/a28ccce4-da1d-4804-91d7-6b2c688faf7d-581939029-1617881691361.png', CAST(N'2021-12-03' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (30, 4, N'Dưỡng Thể YVES ROCHER', N'129.000', 1, N'Dưỡng Thể Olive Petitgrain Relaxing Body Lotion', N'Với hơn 50 năm kinh nghiệm. Yves Rocher là nhà tiên phong trong ngành công nghiệp mỹ phẩm thiên nhiên, phục vụ hơn 30 triệu phụ nữ trên thế giới với hơn 300 triệu sản phẩm mỗi năm. Yves Rocher là nhà sáng tạo Sắc Đẹp Thực Vật (Botanical Beauty) và giữ vị trí dẫn đầu về mỹ phẩm dưỡng da tại Pháp. Năm 2007, Yves Rocher chính thức gia nhập thị trường Việt Nam và là một trong những nhãn hiệu đi đầu về mỹ phẩm thiên nhiên. Tính đến năm 2017, Yves Rocher đã có hơn 65 cửa hàng tại Việt Nam.', 5, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/f0981ad6-f0e1-4295-94c2-42239eec8cb8-98098059334-1619146865822.png', CAST(N'2021-12-05' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (31, 4, N'Dưỡng Thể YVES ROCHER', N'111.000', 1, N'Dưỡng Thể Olive Petitgrain Relaxing Body Lotion', N'Với hơn 50 năm kinh nghiệm. Yves Rocher là nhà tiên phong trong ngành công nghiệp mỹ phẩm thiên nhiên, phục vụ hơn 30 triệu phụ nữ trên thế giới với hơn 300 triệu sản phẩm mỗi năm. Yves Rocher là nhà sáng tạo Sắc Đẹp Thực Vật (Botanical Beauty) và giữ vị trí dẫn đầu về mỹ phẩm dưỡng da tại Pháp. Năm 2007, Yves Rocher chính thức gia nhập thị trường Việt Nam và là một trong những nhãn hiệu đi đầu về mỹ phẩm thiên nhiên. Tính đến năm 2017, Yves Rocher đã có hơn 65 cửa hàng tại Việt Nam.', 5, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/f0981ad6-f0e1-4295-94c2-42239eec8cb8-98098059334-1619146865822.png', CAST(N'2021-12-05' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (32, 4, N'Dầu gội RATED GREEN', N'468.000', 1, N'Dầu gội chiết xuất Hương Thảo ủ lạnh tặng kèm Kem ủ tóc cho da đầu dầu', N'Hương thảo từ lâu đã được coi là thần dược không thể thiếu trong đời sống của người dân Địa Trung Hải vì những tính năng tuyệt vời của nó trong đông y cũng như trong y học hiện đại. Công thức đặc biệt từ Hương thảo hữu cơ áp dụng công nghệ ủ lạnh cân bằng độ ẩm cho da đầu, cân bằng lượng dầu thừa trên tóc đồng thời chiết xuất Gừng và Bạc hà nhẹ nhàng loại bỏ lớp da khô bong tróc và gàu tích tụ.', 20, N'https://images.soco.id/5e874799-ae59-4625-a0b8-2489e825960c-87385831369-1627637598191.png', CAST(N'2021-12-04' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (33, 5, N'Bông tẩy trang IPEK', N'26.000', 1, N'Bông tẩy trang IPEK_Thổ Nhĩ Kỳ', N'Bông tẩy trang IPEK_Thổ Nhĩ Kỳ là một vật dụng cần thiết đối với chị em phụ nữ. Miếng bông nhỏ xinh giúp loại bỏ bụi bẩn và lớp trang điểm bám trên bề mặt da. Ngoài ra bông tẩy trang còn có thể dùng làm: lotion mask hoặc lau mặt. Bông tẩy trang Ipek sẽ là một chọn lựa lý tưởng bởi chất lượng tốt và giá cả phải chăng vừa túi tiền.Với thành phần 100% bông cotton được sản xuất bằng công nghệ tiên tiến, lớp bông dạng tròn mềm mịn giúp nhẹ nhàng làm sạch bụi bẩn hoặc lớp trang điểm mà không gây tổn hại đến da. Ngoài ra, bạn còn có thể dùng bông tẩy trang như một loại mặt nạ để dưỡng da (đây là cách chăm sóc da do chuyên gia người Nhật', 10, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/b088e491-cc25-4f07-9792-9fde08c02a02-39794699241-1615805866066.png', CAST(N'2021-12-12' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (34, 5, N'Máy Rửa Mặt EMMIÉ', N'820.000', 1, N'Máy Rửa Mặt - Đạt Chứng Nhận Fda Premium Cleansing Brush', N'Phiên bản Silicone tiên tiến nhất - Food Grade Liquid Silicone đạt chứng nhận FDA Hoa Kỳ, cực kỳ thân thiện với môi trường cùng cấu trúc vi mô thoáng khí giúp ngăn ngừa vi khuẩnCấp độ chống nước IPX7, dễ dàng vệ sinh & sử dụng ngay cả khi tắt3677 sợi Food grade Liquid Silicone được sắp xếp dạng Ma Trận, giúp dễ dàng lấy đi bụi bẩn ở tận sâu lỗ chân lông. nhưng vẫn rất dịu nhẹ với da.Khu vực massage độc đáo ở lưng được thiết kế đặc biệt cho lưng, cổ và các bộ phận cơ thể khác. Máy có thiết kế 2 mặt có thể làm sạch và mát xa cơ thể một cách hiệu quả để giữ sự trẻ trung của làn da trên cơ thể.', 0, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/c6539ee1-06d6-4daa-88bc-378b04687efc-78751920899-1631626496145.png', CAST(N'2021-12-02' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (35, 5, N'Kéo Tỉa VACOSI', N'58.000', 1, N'Kéo Tỉa Mũi Tròn VACOSI', N'Kéo tỉa mũi tròn VACOSI giúp tỉa gọn và định hình đường lông mày thật tinh tế.Thiết kế chuyên biệt tránh gây tổn thương khi sử dụng.Kéo tỉa mũi tròn VACOSI được sản xuất theo công nghệ Hàn Quốc, sử dụng chất liệu inox không rỉ. Kéo được nghiên cứu và thiết kế nhỏ gọn vừa tầm tay với người châu Á, dễ điều khiển đường kéo cho lông mày gọn gàng, đẹp như ý.', 5, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/954375732-1602262423569.png', CAST(N'2021-12-02' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (36, 5, N'Bông Ướt Tròn Lớn VACOSI', N'22.000', 1, N'Bông Ướt Tròn Lớn VACOSI', N'VACOSI Large Disc Sponge với kết cấu đặc biệt giúp bạn dễ dàng tán đều lớp kem nền hoặc phấn cho lớp trang điểm mịn màng. Bông phấn ướt tròn lớn VACOSI được thiết kế dạng hình tròn lớn với đường kính 7.5cm, sản xuất theo tiêu chuẩn Hàn Quốc. Dùng cho phấn lót, kem nền dạng nước hoặc dạng kem.Bạn có thể thấm chút nước khi dặm kem lót và kem nền. Lớp nền sẽ bám chắc hơn, khuyết điểm được che phủ tinh tế hơn.', 20, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/77957620854-1602238974307.png', CAST(N'2021-12-02' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (37, 6, N'Dao cạo SCHICK', N'93.000', 1, N'Dao cạo Quattro Titan Ng 1s Razor', N'Bộ 1 Cán Và 1 Lưỡi Dao Cạo Schick Quattro Titan 1s có thiết kế nam tính, kiểu dáng nhỏ gọn, dao cao râu Schick là sự lựa chọn hoàn hảo cho các quý ông. Với sản phẩm dao cạo râu thiết kế lưỡi dao cạo thông minh và tiện dụng này, quý ông cạo râu một cách an toàn, nhanh chóng và dễ dàng nhất.Dao cạo thay lưỡi Schick Quattro Titanium 1S tạo góc cắt chính xác và một lưỡi ở cạnh viền.Đầu dao xoay giúp cạo thật sát và dễ dàng.Đầu dao có những sợi thép bảo vệ  tránh cắt da, đảm bảo an toàn tối đa khi sử dụng.Trên lưỡi dao có dải bôi trơn bổ sung Lô Hội và Jojola giúp làm mềm da và chống trầy xướt tối đa.Lưỡi dao là thép không rỉ, nắp đậy nhựa ABS,  khung chứa lưỡi dao nhựa BOM và nhựa APS, tay cầm nhựa PP và TPE.', 10, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/56673844853-1602825133916.png', CAST(N'2021-12-10' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (38, 6, N'Xịt ngăn mùi Nivea', N'108.000', 1, N'Xịt ngăn mùi Nivea Men than hoạt tính 150ml', N'Xịt Ngăn Mùi Cho Nam Nivea Men Than Đen Hoạt Tính Deep Dry & Clean Feel 48h sẽ là sự lựa chọn dành cho các quý ông với công thức chứa 2 lần sức mạnh than đen giúp "hút" và khóa mùi cơ thể tối đa. Sản phẩm không chỉ giảm tiết mồ hôi hiệu quả đến 48 giờ, mà còn mang lại cho bạn cảm giác khô thoáng, sạch sẽ như ngay sau khi tắm cùng hương gỗ nam tính quyến rũ. Đặc biệt, Xịt Ngăn Mùi Cho Nam Nivea Men Than Đen Hoạt Tính Deep Dry & Clean Feel 48h cho bạn cảm giác khô thoáng tức thì, không bổ sung cồn, không chất tạo màu hay chất bảo quản và tuyệt đối an toàn cho làn da giúp phái mạnh tự tin thể hiện mình.', 5, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/e3533609-67c3-4915-b64c-f2c25462639c-96340387337-1617098688564.png', CAST(N'2021-12-10' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (39, 6, N'Sữa Rửa Mặt Nivea Chai', N'82.000', 1, N'Sữa Rửa Mặt Sáng Da Kiểm Soát Nhờn Nivea Men Extra White 20x 100ml', N'Sử dụng thường xuyên mỗi buổi sáng và tối. Làm ướt mặt, lấy lượng sản phẩm vừa đủ ra tay, tạo bọt với nước rồi mát-xa nhẹ nhàng lên mặt theo chuyển động tròn để dưỡng chất trong sữa rửa mặt có thể thấm sâu vào trong.Sau đó rửa lại bằng nước sạch.', 20, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/66f897fd-e7d1-4d1c-9986-9b22f04fb05c-64957883382-1617097414844.png', CAST(N'2021-12-10' AS Date))
INSERT [dbo].[product] ([id], [catalog_id], [name], [price], [status], [description], [content], [discount], [image_link], [created]) VALUES (40, 6, N'Sữa Rửa Mặt Nivea Tuýp', N'72.000', 1, N'Sữa Rửa Mặt Nivea Men Detox Mud Giúp Làm Mờ Thâm 100g', N'Sữa Rửa Mặt Nivea Men Bùn Khoáng Sáng Da Và Mờ Vết Thâm Mụn (100g) chứa công thức Cooling Mud đột phá chứa khoáng chất và bạc hà mát lạnh cùng với 10 loại dưỡng chất + Whitinat cho hiệu quả làm sạch da tối đa. Đặc biệt không gây kích ứng hay bắt nắng do AHA và BHA < 0.5%.', 25, N'https://www.soco.id/cdn-cgi/image/w=325,format=auto,dpr=1.45/https://images.soco.id/422c330f-cf89-4b5f-9340-f8eb56753b1e-77646689806-1617096808773.png', CAST(N'2021-12-10' AS Date))
SET IDENTITY_INSERT [dbo].[product] OFF
GO
SET IDENTITY_INSERT [dbo].[review] ON 

INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created]) VALUES (1, 3, N'Mai Ngan', N'maingan@gmail.com', N'Hàng chính hãng, chất lượng tố', CAST(N'2021-12-10' AS Date))
INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created]) VALUES (2, 4, N'An Danh', N'andanh@gmail.com', N'Chăm sóc khách hàng chu đáo, đóng gói cẩn thận', CAST(N'2021-12-11' AS Date))
INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created]) VALUES (3, 5, N'Vo Danh', N'vodanh@gmail.com', N'Hàng chất lượng, dịch vụ tận tình, lần sau tôi sẽ mua tiếp', CAST(N'2021-11-11' AS Date))
INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created]) VALUES (4, 6, N'Kha Dieu', N'khadieu@gmail.com', N'Mặt hàng đa dạng, chất lượng đảm bảo, chính hãng đảm bảo', CAST(N'2021-11-11' AS Date))
INSERT [dbo].[review] ([id], [product_id], [name], [email], [content], [created]) VALUES (5, 1, N'Nguyễn Trúc', N'thanhtrucpn@hcmute.vn', N'A', CAST(N'2021-12-16' AS Date))
SET IDENTITY_INSERT [dbo].[review] OFF
GO
SET IDENTITY_INSERT [dbo].[transactions] ON 

INSERT [dbo].[transactions] ([id], [user_session], [user_name], [user_mail], [user_phone], [address], [message], [amount], [payment], [status], [created]) VALUES (1, N'truc', N'Phan Trúc', N'12@hcmute.edu.vn', N'0865824801', N'Bến Tre', N'', N'1084.000', N'0', NULL, CAST(N'2021-12-15' AS Date))
INSERT [dbo].[transactions] ([id], [user_session], [user_name], [user_mail], [user_phone], [address], [message], [amount], [payment], [status], [created]) VALUES (2, N'tung', N'Bảo Tùng', N'baotung182001@gmail.com', N'0865824809', N'Sóc Trăng
', N'', N'127.000', N'0', NULL, CAST(N'2021-12-15' AS Date))
INSERT [dbo].[transactions] ([id], [user_session], [user_name], [user_mail], [user_phone], [address], [message], [amount], [payment], [status], [created]) VALUES (3, N'tung', N'Bảo Tùng', N'baotung182001@gmail.com', N'0865824809', N'Sóc Trăng', N'', N'679.550', N'0', NULL, CAST(N'2021-12-15' AS Date))
INSERT [dbo].[transactions] ([id], [user_session], [user_name], [user_mail], [user_phone], [address], [message], [amount], [payment], [status], [created]) VALUES (4, N'truc', N'Phan Thanh Dân An', N'giakhuong2410@gmail.com', N'1', N'1', N'1', N'300.000', N'0', NULL, CAST(N'2021-12-16' AS Date))
INSERT [dbo].[transactions] ([id], [user_session], [user_name], [user_mail], [user_phone], [address], [message], [amount], [payment], [status], [created]) VALUES (5, N'truc', N'Phan Thanh Dân An', N'giakhuong2410@gmail.com', N'0392490945', N'111', N'', N'600.000', N'0', NULL, CAST(N'2021-12-16' AS Date))
SET IDENTITY_INSERT [dbo].[transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [name], [email], [phone], [username], [password], [created]) VALUES (1, N' Phan Nguyễn Thanh Trúc', N'thanhtrucpn837@gmail.com', N'0865824809', N'truc', N'123', CAST(N'2021-12-14' AS Date))
INSERT [dbo].[users] ([id], [name], [email], [phone], [username], [password], [created]) VALUES (3, N'Diệp Bảo Tùng', N'baotung182001@gmail.com', N'0865824809', N'tung', N'123', CAST(N'2021-12-14' AS Date))
INSERT [dbo].[users] ([id], [name], [email], [phone], [username], [password], [created]) VALUES (6, N'Ngân Mai', N'12@hcmute.edu.vn', N'0865824801', N'ngan', N'123', CAST(N'2021-12-14' AS Date))
INSERT [dbo].[users] ([id], [name], [email], [phone], [username], [password], [created]) VALUES (8, N'Nguyễn Trúc', N'thanhtrucpn@hcmute.vn', N'1111', N'tuc', N'123', CAST(N'2021-12-14' AS Date))
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__admin__F3DBC5725B855194]    Script Date: 12/18/2021 9:48:43 PM ******/
ALTER TABLE [dbo].[admin] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E61647C2E7BB1]    Script Date: 12/18/2021 9:48:43 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__F3DBC5729469C01F]    Script Date: 12/18/2021 9:48:43 PM ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ordered]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ordered]  WITH CHECK ADD FOREIGN KEY([transaction_id])
REFERENCES [dbo].[transactions] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([catalog_id])
REFERENCES [dbo].[catalog] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[review]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
ON DELETE CASCADE
GO
USE [master]
GO
ALTER DATABASE [Cosmetics] SET  READ_WRITE 
GO
