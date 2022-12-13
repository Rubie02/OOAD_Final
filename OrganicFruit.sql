CREATE DATABASE OFruit
GO
USE OFruit
GO

--TABLES
CREATE TABLE [dbo].[Review] 
(
	id int IDENTITY(1,1) primary key,
	product_id int not null foreign key references Products(productId) on delete cascade,
	name nvarchar(50) not null,
	email nvarchar(50) not null,
	content nvarchar(4000) not null,
	created date ,
)
GO

CREATE TABLE [dbo].[Blogs](
	[blogId] [int] IDENTITY(1,1) NOT NULL,
	[details] [nvarchar](max) NULL,
	[blogName] [nvarchar](50) NULL,
	[blogImage] [nchar](500) NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[blogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[Categories](
	[cateId] [int] IDENTITY(1,1) NOT NULL,
	[blogId] [int] NULL,
	[cateName] [nvarchar](50) NULL,
	[description] [nvarchar](500) NULL,
	[cateImage] [nvarchar](500) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[cateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Customers](
	[cusId] [int] IDENTITY(1,1) NOT NULL,
	[cusName] [nvarchar](50) NULL,
	[cusAddress] [nvarchar](50) NULL,
	[cusPhoneNumber] [nchar](10) NOT NULL,
	[rank] [int] NULL,
	[username] [nchar](30) NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[cusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Employees](
	[employeeId] [int] IDENTITY(1,1) NOT NULL,
	[employeeName] [nvarchar](50) NOT NULL,
	[employeeAddress] [nvarchar](50) NULL,
	[employeePhoneNumber] [nchar](10) NOT NULL,
	[salary] [int] NULL,
	[hireDate] [datetime] NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[employeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[OrderDetails](
	[odId] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[unitPrice] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[discount] [float] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[odId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Orders](
	[orderId] [int] IDENTITY(1,1) NOT NULL,
	[cusId] [int] NOT NULL,
	[orderDate] [datetime] NULL,
	[employeeId] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Products](
	[productId] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](50) NOT NULL,
	[supId] [int] NULL,
	[cateId] [int] NULL,
	[information] [nvarchar](500) NULL,
	[price] [float] NOT NULL,
	[MGF] [date] NULL,
	[EXP] [date] NULL,
	[productImage] [nvarchar](500) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[productId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Accounts](
	[username] [nchar](30) NOT NULL,
	[password] [nchar](30) NOT NULL,
	[type] [int] NOT NULL,
	[email] [nchar](50) NULL,
 CONSTRAINT [PK_Registers] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Suppliers](
	[supId] [int] IDENTITY(1,1) NOT NULL,
	[supName] [nvarchar](50) NULL,
	[supAddress] [nvarchar](50) NULL,
	[supPhoneNumber] [nchar](10) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[supId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Ràng buộc khóa ngoại và khóa chính

ALTER TABLE dbo.Customers ADD FOREIGN KEY(username) REFERENCES dbo.Accounts(username)

ALTER TABLE dbo.Orders ADD FOREIGN KEY(cusId) REFERENCES dbo.Customers(cusId)
ALTER TABLE dbo.Orders ADD FOREIGN KEY(employeeId) REFERENCES dbo.Employees(employeeId)

ALTER TABLE dbo.OrderDetails ADD FOREIGN KEY(productId) REFERENCES dbo.Products(productId)
ALTER TABLE dbo.OrderDetails ADD FOREIGN KEY(orderId) REFERENCES dbo.Orders(orderId)

ALTER TABLE dbo.Products ADD FOREIGN KEY(supId) REFERENCES dbo.Suppliers(supId)
ALTER TABLE dbo.Products ADD FOREIGN KEY(cateId) REFERENCES dbo.Categories(cateId)

ALTER TABLE dbo.Categories ADD FOREIGN KEY(blogId) REFERENCES dbo.Blogs(blogId)
GO 

-- 1 is admin, 0 is customer
INSERT INTO Accounts(username, password, type, email) VALUES(N'hoai', N'1',1, N'hoai123@gmail.com') 
INSERT INTO Accounts(username, password, type, email) VALUES(N'luong', N'1',1, N'luong123@gmail.com')
INSERT INTO Accounts(username, password, type, email) VALUES(N'hien', N'1',1, N'hien123@gmail.com')
INSERT INTO Accounts(username, password, type, email) VALUES(N'bach', N'1',1, N'bach123@gmail.com')
INSERT INTO Accounts(username, password, type, email) VALUES(N'bao', N'1',0, N'bao456@gmail.com')
INSERT INTO Accounts(username, password, type, email) VALUES(N'vu', N'1',0, N'vu456@gmail.com')
INSERT INTO Accounts(username, password, type, email) VALUES(N'thuy', N'1',0, N'thuy456@gmail.com')
SELECT * FROM Accounts
UPDATE Accounts SET username=N'vu', password=1, type=0, email=N'vuvuvu@gmail.com' WHERE username=N'vu'

INSERT INTO Blogs(details, blogName, blogImage) VALUES(N'Rau củ là các loại thực vật đã bị biến đổi để thích ứng với việc dự trữ chất dinh dưỡng để cây phát triển. Các loại củ thường dùng làm thực phẩm cho con người phải kể đến như: củ khoai lang, củ cà rốt, củ su, củ khoai môn, khoai tây, củ dền,...', N'Rau củ là gì?', N'https://images.baodantoc.vn/uploads/2021/Th%C3%A1ng%209/Ng%C3%A0y_16/Thanh/3538_Rau_1.jpg') 
INSERT INTO Blogs(details, blogName, blogImage) VALUES(N'Trái cây là một trong những loại thực phẩm cần có trong chế độ ăn uống lành mạnh, không chỉ đa dạng, có nguồn vitamin dồi dào mà trái cây còn giúp cơ thể ngăn ngừa những tác động xấu đến sức khoẻ. Vì thế, bổ sung trái cây vào khẩu phần ăn hằng ngày bên cạnh rau xanh, củ quả là điều vô cùng quan trọng.', N'Trái cây', N'https://vinmec-prod.s3.amazonaws.com/images/20210606_142636_766862_tre-nen-an-qua-gi.max-1800x1800.jpg') 
INSERT INTO Blogs(details, blogName, blogImage) VALUES(N'Rau lá là loại thực vật dùng làm thực phẩm cho con người nhưng chủ yếu sử dụng các loại lá trong món ăn. Rau lá, rau sống là những loại rau rất phổ biến bởi giá trị dinh dưỡng cao, dễ tìm mua, dễ ăn mà giá cả lại bình dân phù hợp với nhu cầu của nhiều gia đình.', N'Rau lá', N'http://hn.check.net.vn/data/product/mainimages/original/product9707.jpg') 
SELECT * FROM Blogs
UPDATE Blogs SET details=N'hao', blogName=N'shang', blogImage=N'nhi' WHERE blogId=N'1005'

INSERT INTO Categories(blogId, cateName, description, cateImage) VALUES(1, N'Rau củ', N'Rau củ là các loại thực vật đã bị biến đổi để thích ứng với việc dự trữ chất dinh dưỡng để cây phát triển.', N'https://images.baodantoc.vn/uploads/2021/Th%C3%A1ng%209/Ng%C3%A0y_16/Thanh/3538_Rau_1.jpg')
INSERT INTO Categories(blogId, cateName, description, cateImage) VALUES(2, N'Trái cây', N'Trái cây là một trong những loại thực phẩm cần có trong chế độ ăn uống lành mạnh, không chỉ đa dạng, có nguồn vitamin dồi dào mà trái cây còn giúp cơ thể ngăn ngừa những tác động xấu đến sức khoẻ.', N'https://vinmec-prod.s3.amazonaws.com/images/20210606_142636_766862_tre-nen-an-qua-gi.max-1800x1800.jpg')
INSERT INTO Categories(blogId, cateName, description, cateImage) VALUES(3, N'Rau lá', N'Rau lá là loại thực vật dùng làm thực phẩm cho con người nhưng chủ yếu sử dụng các loại lá trong món ăn.', N'http://hn.check.net.vn/data/product/mainimages/original/product9707.jpg')
SELECT * FROM Categories

INSERT INTO Suppliers(supName, supAddress, supPhoneNumber) VALUES(N'Nông Sản Thành Nam', N'Bình Dương', N'0985331366')
INSERT INTO Suppliers(supName, supAddress, supPhoneNumber) VALUES(N'Nông Sản Thái Thịnh', N'Đắk Nông', N'0965749966')
INSERT INTO Suppliers(supName, supAddress, supPhoneNumber) VALUES(N'Nông Sản Galaxy Agro', N'Hồ Chí Minh', N'0983373877')
SELECT * FROM Suppliers

INSERT INTO Products(productName, supId, cateId, information, price, mgf, exp, productImage)
VALUES(N'Xà lách lô lô xanh gói 500g', 1, 3, N'Rau xà lách lô lô xanh của Bách hóa Xanh được trồng tại Lâm Đồng và đóng gói theo những tiêu chuẩn nghiêm ngặt, bảo đảm các tiêu chuẩn xanh - sach.', 19900, GETDATE(), GETDATE()+1, N'https://as1.ftcdn.net/v2/jpg/03/02/70/54/1000_F_302705472_xJOS4fp5RpCug4d8zumIjI9meAx8XpOL.jpg')
INSERT INTO Products(productName, supId, cateId, information, price, mgf, exp, productImage)
VALUES(N'Rau mồng tơi baby gói 300g', 1, 3, N'Rau mồng tơi là loại rau có hàm lượng calo và chất béo thấp, nhưng lại chứa lượng lớn vitamin, khoáng chất thiết yếu và các hợp chất chống oxy hóa giúp cho quá trình tiêu hóa diễn ra hiệu quả hơn và ngăn ngừa các vấn đề về đường ruột.', 13500, GETDATE(), GETDATE()+1, N'https://t4.ftcdn.net/jpg/02/49/93/33/240_F_249933303_rB82fjbNuZdT3444cZfutFG1Wau0T1VA.jpg')
INSERT INTO Products(productName, supId, cateId, information, price, mgf, exp, productImage)
VALUES(N'Táo Diva mini New Zealand hộp 1kg', 2, 2, N'Táo Diva mini là trái cây được nhập khẩu trực tiếp từ New Zealand. Táo Diva có màu đỏ đậm, xem lẫn các sắc vàng nhìn vô cùng bắt mắt và hấp dẫn.', 62000, GETDATE(), GETDATE()+1, N'https://t4.ftcdn.net/jpg/00/94/82/05/240_F_94820552_qU4QTqejyRdOZaeH4fFaSbKL4U0XeooL.jpg')
INSERT INTO Products(productName, supId, cateId, information, price, mgf, exp, productImage)
VALUES(N'Bưởi năm roi trái từ 1.3kg - 1.4kg', 2, 2, N'Bưởi năm roi là một trong những trái cây đặc sản nổi tiếng của Việt Nam. Bưởi có mùi hương thanh mát, lúc ăn bạn sẽ cảm nhận được sự hoà quyện xen lẫn giữa vị chua và vị ngọt. Bưởi 5 roi không chỉ ngon mà còn nhiều dưỡng chất tốt cho sức khoẻ, hệ miễn dịch và phù hợp cho người giảm cân và tiểu đường', 45000, GETDATE(), GETDATE()+1, N'https://img.freepik.com/free-photo/cutted-half-fresh-grapefruit-put-dark-background_1150-28082.jpg?w=996&t=st=1670293643~exp=1670294243~hmac=a33b14719907863174ead295a2b26653bae544cb1fde23b518590b3ac7cb95a3')
INSERT INTO Products(productName, supId, cateId, information, price, mgf, exp, productImage)
VALUES(N'Cà rốt Đà Lạt túi 500g', 3, 1, N'Cà rốt Đà Lạt là một loại củ rất quen thuộc trong các món ăn của người Việt. Cà rốt có hàm lượng chất dinh dưỡng và vitamin A cao, được xem là nguyên liệu cần thiết cho các món ăn dặm của trẻ nhỏ, giúp trẻ sáng mắt và cung cấp nguồn chất xơ dồi dào.', 16900, GETDATE(), GETDATE()+1, N'https://t4.ftcdn.net/jpg/00/53/09/51/240_F_53095132_RYsAcP3cQ72jM84ibY2FGCCAe9K14CiM.jpg')
INSERT INTO Products(productName, supId, cateId, information, price, mgf, exp, productImage)
VALUES(N'Khoai lang Nhật túi 1kg', 3, 1, N'Khoai lang Nhật trồng tại Lâm Đồng là món ăn được rất nhiều người yêu thích, được trồng và có củ quanh năm, ngon nhất là khi được nướng lên trên một bếp than đổ hồng.', 33000, GETDATE(), GETDATE()+1, N'https://t3.ftcdn.net/jpg/02/24/91/94/240_F_224919459_G08KXCX5Z67CvFXTwRxzYzk9vYVyBG1I.jpg')
INSERT INTO Products(productName, supId, cateId, information, price, mgf, exp, productImage)
VALUES(N'Củ cải trắng 500g', 3, 1, N'Củ cải trắng trồng ở Đà Lạt là một loại rau củ vừa có thể dùng để làm thực phẩm, vừa có thể sử dụng để làm dầu hạt cải. Củ cải trắng chứa rất nhiều vitamin và khoáng chất, tốt cho cơ thể. Một vài công dụng của củ cải trắng có thể kể đến như: giảm cân, hỗ trợ hệ tiêu hoá, tăng cường miễn dịch,...', 8500, GETDATE(), GETDATE()+1, N'https://img.freepik.com/free-photo/stack-white-radishes-marble-surface_114579-47937.jpg?w=996&t=st=1670294389~exp=1670294989~hmac=cda7c38d205c1e92af78c12df3f63daf6c17e31d734005adebf917b6a237df96')
INSERT INTO Products(productName, supId, cateId, information, price, mgf, exp, productImage)
VALUES(N'Dưa leo 500g',1,3,N'Dưa leo trái lớn tươi ngon, được trồng và thu hoạch đảm bảo chất lượng, an toàn cho sức khỏe người sử dụng. Trong dưa leo chứa nhiều chất xơ, vitamin C, E, K, magie,...dễ ăn, dễ phối trộn với các món ăn khác, tốt sức khỏe vừa mang lại hiệu quả làm đẹp rất tốt',9500,GETDATE(),GETDATE()+1,N'https://t3.ftcdn.net/jpg/00/79/37/28/240_F_79372833_XC4hnS9JJOQH9srNJiOb9dKqXO6ASYOq.jpg')
INSERT INTO Products(productName, supId, cateId, information, price, mgf, exp, productImage)
VALUES(N'Cà chua bi hộp 300g',2,1,N'Cà chua bi được trồng ở Lâm Đồng là loại thực phẩm dinh dưỡng, tốt cho sức khỏe được nhiều người chọn lựa. Cà chua bi to trái, căng mọng có thể dùng ăn chơi hoặc là nguyên liệu cho những món ăn ngon khác. Cà chua bi giúp đẹp da, sáng mắt là thực phẩm nên sử dụng thường xuyên.',14200,GETDATE(),GETDATE()+1,N'https://t3.ftcdn.net/jpg/02/65/95/86/240_F_265958692_tQES2ut4UbCH75PjiMGEDAtKvwBuOux8.jpg')
INSERT INTO Products(productName, supId, cateId, information, price, mgf, exp, productImage)
VALUES(N'Rau má gói 200g',1,3,N'Rau má tươi ngon vô cùng, nấu được nhiều món ngon và mang lại nhiều lợi ích hữu dụng trong làm đẹp mà chị em nào cũng thích. Rau má xay sinh tố thì mát, đẹp da, rau má đắp mặt nạ thì giúp trị mụn, có thể nói đây là món rau không thể thiếu trong bếp của các chị em.',9500,GETDATE(),GETDATE()+1,N'https://t3.ftcdn.net/jpg/00/93/76/88/240_F_93768806_gvgKsIrKZdURxM0d25Y6W0cFsS9aRFYy.jpg')
INSERT INTO Products(productName, supId, cateId, information, price, mgf, exp, productImage)
VALUES(N'Cải thìa 300g',2,3,N'Cải thìa baby là giống rau được nuôi trồng và đóng gói theo những tiêu chuẩn nghiêm ngặt, bảo đảm các tiêu chuẩn xanh - sạch, chất lượng và an toàn với người dùng. Cải thìa nhỏ giòn ngọt, chứa nhiều chất xơ nên thường được dùng để luộc hoặc xào để giữ được độ tươi ngon nhất cho rau.',13700,GETDATE(),GETDATE()+1,N'https://t3.ftcdn.net/jpg/04/37/86/36/240_F_437863668_QoFTi0PrnzxIwQ1TTPg2Ae1dW5K2G1SW.jpg')
INSERT INTO Products(productName, supId, cateId, information, price, mgf, exp, productImage)
VALUES(N'Súp lơ xanh 300g',2,3,N'Súp lơ xanh còn gọi là bông cải xanh, nó thuộc loài cải bắp dại, có hoa lớn ở đầu và được sử dụng làm rau. Nó rất tốt cho sức khỏe, chúng chứa nhiều vitamin A, C và E hơn các loại rau củ xanh khác, giúp bổ sung dinh dưỡng và tăng cường sức đề kháng cho cơ thể. ',23000,GETDATE(),GETDATE()+1,N'https://t3.ftcdn.net/jpg/01/98/71/84/240_F_198718474_qji1GoXe6cFyP6QRfBaHmvVvvQMFrTgY.jpg')
INSERT INTO Products(productName, supId, cateId, information, price, mgf, exp, productImage)
VALUES(N'Rau muống hạt baby 300g',2,3,N'Rau muống hạt baby là rau non nên có độ giòn, ngọt hơn so với rau muống thông thường, quy trình trồng nghiêm ngặt, đảm bảo an toàn và chất lượng đến tay người tiêu dùng. Rau muống hạt baby có hàm lượng chất dinh dưỡng cao, đặc biệt là sắt và chất xơ, thường được dùng để luộc, xào,...',13700,GETDATE(),GETDATE()+1,N'https://t3.ftcdn.net/jpg/00/80/75/16/240_F_80751657_V8p8f8tnJoVl78Vdd0zzYulc2GrwOzlk.jpg')
INSERT INTO Products(productName, supId, cateId, information, price, mgf, exp, productImage)
VALUES(N'Chuối già Nam Mỹ 1kg',3,2,N'Loại chuối già được nhiều khách hàng ưa chuộng. Chuối chứa nhiều chất dinh dưỡng như kali, chất xơ, vitamin,... Chuối ăn ngon nhất khi chín vàng, trên vỏ bắt đầu có đốm nâu, khi đó chuối sẽ rất ngọt...Cam kết đúng khối lượng, bao bì kín đáo, an toàn và bảo đảm hợp vệ sinh.',28000,GETDATE(),GETDATE()+1,N'https://t4.ftcdn.net/jpg/00/81/63/27/240_F_81632784_dywiaX7xqRp7KDqMluwgqlkykvz3aK03.jpg')
INSERT INTO Products(productName, supId, cateId, information, price, mgf, exp, productImage)
VALUES(N'Thanh long ruột đỏ 1.5kg',3,2,N'Thanh long ruột đỏ là trái cây có vẻ ngoài bóng bẩy đẹp mắt bên trong là thịt quả lòng đỏ vô cùng hấp dẫn. Thanh long ngon nhất khi vỏ màu đỏ đậm, quả chắc sẽ rất ngọt và mọng nước. Thanh long ruột đỏ chất lượng, bao bì sạch sẽ vệ sinh',31300,GETDATE(),GETDATE()+1,N'https://t4.ftcdn.net/jpg/03/10/48/41/240_F_310484158_aLPT0Xo54zk0WWTJrQhZ5ARtKWYX9F9Z.jpg')
INSERT INTO Products(productName, supId, cateId, information, price, mgf, exp, productImage)
VALUES(N'Kiwi vàng Zespri hộp 500g',3,2,N'Kiwi vàng Zespri là loại trái cây Siêu dưỡng chất với hơn 20 loại Vitamin và khoáng chất thiết yếu, cần thiết cho sức khoẻ. Đạt tiêu chuẩn xuất khẩu toàn cầu với chất lượng đồng đều, nhập khẩu từ Newzealand. Kiwi Vàng Zespri mọng nước, có vị chua ngọt thanh mát, trái càng chín thì độ ngọt càng cao.',89000,GETDATE(),GETDATE()+1,N'https://t3.ftcdn.net/jpg/02/61/79/90/240_F_261799003_cJgPc7AVsYPWvCRyaPdYjyskQG9fnmlG.jpg')
SELECT * FROM Products

INSERT INTO Review(product_id,name,email,content,created) 
	VALUES (10,'Kim Vy','kimvy@gmail.com',N'An toàn, sạch sẽ!','2022-10-10');
INSERT INTO review(product_id,name,email,content,created) 
	VALUES (9,'Kim Vy','kimvy@gmail.com',N'Sản phẩm chất lượng','2022-10-11');
INSERT INTO review(product_id,name,email,content,created) 
	VALUES (12,'Kim Vy','kimvy@gmail.com',N'Ngon, lần sau tôi sẽ mua tiếp','2022-10-12');
SELECT * FROM Review

INSERT INTO Customers(cusName, cusAddress, cusPhoneNumber, rank, username) VALUES(N'Huynh Gia Bao', N'HCM', N'0324342564', 0, N'bao')
INSERT INTO Customers(cusName, cusAddress, cusPhoneNumber, rank, username) VALUES(N'Dang Nguyen Vu', N'HCM', N'0343458193', 1, N'vu')
INSERT INTO Customers(cusName, cusAddress, cusPhoneNumber, rank, username) VALUES(N'Ho Bich Thuy', N'HCM', N'0923485325', 2, N'thuy')
SELECT * FROM Customers

INSERT INTO Employees(employeeName, employeeAddress, employeePhoneNumber, salary, hireDate) VALUES(N'Bach', N'DN', N'0293423452', 10000000, N'2022-12-4')
INSERT INTO Employees(employeeName, employeeAddress, employeePhoneNumber, salary, hireDate) VALUES(N'Hoai', N'PY', N'0293423452', 10000000, N'2022-12-4')
INSERT INTO Employees(employeeName, employeeAddress, employeePhoneNumber, salary, hireDate) VALUES(N'Luong', N'BT', N'0293423452', 10000000, N'2022-12-4')
INSERT INTO Employees(employeeName, employeeAddress, employeePhoneNumber, salary, hireDate) VALUES(N'Hien', N'QN', N'0293423452', 10000000, N'2022-12-4')
SELECT * FROM Employees

INSERT INTO Orders(orderId , cusId, orderDate, employeeId) VALUES(3, 1, GETDATE(), 1)
INSERT INTO Orders(cusId, orderDate, employeeId) VALUES(2, GETDATE(), 1)
UPDATE Orders set cusId=2, orderDate=GETDATE() WHERE orderId=2
DELETE FROM Orders WHERE orderId=2
SELECT orderId, orderDate, Customers.cusId, cusAddress, cusPhoneNumber, username, rank
FROM Orders INNER JOIN  Customers ON Orders.cusId=Customers.cusId
WHERE orderId=3
SELECT * FROM Orders
SELECT * FROM OrderDetails

INSERT INTO OrderDetails(orderId, productId, unitPrice, quantity, discount)
VALUES(2, 1, 14000, 2, 0)
INSERT INTO OrderDetails(orderId, productId, unitPrice, quantity, discount)
VALUES(3, 3, 16000, 2, 0)
UPDATE OrderDetails SET orderId=3, productId=2, unitPrice=14500, quantity=3
WHERE odId=3
SELECT * FROM OrderDetails
DELETE FROM OrderDetails WHERE odID=4

SELECT odId, quantity, unitPrice, Orders.orderId, Orders.orderDate, Products.productName, Products.price, Products.productImage
FROM OrderDetails INNER JOIN Orders ON OrderDetails.orderId=Orders.orderId
INNER JOIN Products ON OrderDetails.productId=Products.productId
WHERE OrderDetails.odId=2