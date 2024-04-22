
create database HUNGVU_SPORT
CREATE TABLE Category (
    category_id INT IDENTITY(1,1) PRIMARY KEY,
    category_name VARCHAR(255),
    description TEXT
);


CREATE TABLE Product (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    product_name VARCHAR(255),
    description TEXT,
    category_id INT,
    price DECIMAL(10, 2),
    quantity_available INT,
	img VARCHAR(100)
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);
ALTER TABLE Product
ALTER COLUMN product_name NVARCHAR(MAX);

CREATE TABLE Users (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(100),
    Role VARCHAR(10) NOT NULL CHECK (Role IN ('customer', 'admin')),
	FirstName VARCHAR(100),
	 LastName VARCHAR(100),
	 Address VARCHAR(100),
	 Phone VARCHAR(100),
	 img VARCHAR(100)
);




CREATE TABLE OrderTable (
    order_id INT  IDENTITY(1,1) PRIMARY KEY,
    customer_id INT,
    order_date DATETIME,
    total_amount DECIMAL(10, 2),
    status VARCHAR(50),
    FOREIGN KEY (customer_id) REFERENCES Users(user_id)
);

CREATE TABLE Order_Item (
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10, 2),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES OrderTable(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);


CREATE TABLE Review (
    review_id INT IDENTITY(1,1) PRIMARY KEY,
    product_id INT,
    customer_id INT,
    rating INT,
    comment TEXT,
    review_date DATETIME,
    FOREIGN KEY (product_id) REFERENCES Product(product_id),
    FOREIGN KEY (customer_id) REFERENCES Users(user_id)
);

	-- Inserting sample product
INSERT INTO [dbo].[Category]
           ([category_name]
           ,[description])
     VALUES
           ('Football  shoes' ,'Description of football shoes '),         
		       ('Volleyball shoes','Description of Volleyball shoes'),
		       ('Badminton shoes','Description of badminton shoes') ,
			   ('Soccer ball','Description of ball') ,
			   ('Volleyball','Description of ball') ,
			    ('Badminton racket','Description of ball');
INSERT INTO [dbo].[Product]
           ([product_name]
           ,[description]
           ,[category_id]
           ,[price]
           ,[quantity_available],[img])
     VALUES
           ('MIZUNO ALPHA PRO AS', 'Giày đá bóng sân cỏ nhân tạo Mizuno Alpha Pro As, đệm giảm chấn, cổ thấp, form vừa vặn, trọng lượng nhẹ, êm ái, công nghệ cao cấp', 1, 300, 75,'img/football2a.jpg'),
		   ('MONARCIDA NEO SALA PRO TF', 'ày đá bóng sân cỏ nhân tạo Mizuno Monarcida Neo Sala Pro TF, da cao cấp, đệm giảm chấn, êm ái, co giãn tốt, chính hãng', 1, 300, 75,'img/football3a.jpg'),
		    ('MONARCIDA NEO SALA PRO TF', 'ày đá bóng sân cỏ nhân tạo Mizuno Monarcida Neo Sala Pro TF, da cao cấp, đệm giảm chấn, êm ái, co giãn tốt, chính hãng', 1, 300, 75,'img/football3a.jpg'),
		    ('MONARCIDA NEO SALA PRO TF', 'ày đá bóng sân cỏ nhân tạo Mizuno Monarcida Neo Sala Pro TF, da cao cấp, đệm giảm chấn, êm ái, co giãn tốt, chính hãng', 1, 300, 75,'img/football3a.jpg')
		   INSERT INTO [dbo].[Product]
           ([product_name]
           ,[description]
           ,[category_id]
           ,[price]
           ,[quantity_available],[img])
     VALUES
		   ('CLAW EL 2', 'Wave Claw 2 có thiết kế mạnh mẽ nhưng không kém phần tinh tế, mang hơi hướng trẻ trung và năng động với nhiều màu sắc nổi bật.', 3, 250, 75,'img/cl1.jpg'),
		   ('GATE SKY ', '- Mizuno Enerzy: Chất liệu đế giữa đặc biệt nhằm giảm trọng lượng giày cầu lông Mizuno Wave Claw 3 và hạn chế quà trình mài mòn, biến dạng sau thời gian sử dụng lâu.', 3, 300, 75,'img/cl2.jpg'),
		    (' PLUS 4', '- Mizuno Enerzy: Chất liệu đế giữa đặc biệt nhằm giảm trọng lượng giày cầu lông Mizuno Wave Claw 3 và hạn chế quà trình mài mòn, biến dạng sau thời gian sử dụng lâu.', 3, 200, 75,'img/cl3.jpg'),
			 ('  FANG', '- Mizuno Enerzy: Chất liệu đế giữa đặc biệt nhằm giảm trọng lượng giày cầu lông Mizuno Wave Claw 3 và hạn chế quà trình mài mòn, biến dạng sau thời gian sử dụng lâu.', 3, 300, 75,'img/cl4.jpg'),
			  ('ZERO 2', '- Mizuno Enerzy: Chất liệu đế giữa đặc biệt nhằm giảm trọng lượng giày cầu lông Mizuno Wave Claw 3 và hạn chế quà trình mài mòn, biến dạng sau thời gian sử dụng lâu.', 3, 400, 75,'img/cl5.jpg'),
			    ('DYNABLITZ', '- Mizuno Enerzy: Chất liệu đế giữa đặc biệt nhằm giảm trọng lượng giày cầu lông Mizuno Wave Claw 3 và hạn chế quà trình mài mòn, biến dạng sau thời gian sử dụng lâu.',3, 400, 75,'img/cl6.jpg'),
  ('THUNDER BLADE', '- Mizuno Enerzy: Chất liệu đế giữa đặc biệt nhằm giảm trọng lượng giày cầu lông Mizuno Wave Claw 3 và hạn chế quà trình mài mòn, biến dạng sau thời gian sử dụng lâu.', 3, 400, 75,'img/cl7.jpg'),
    ('Z MID', '- Mizuno Enerzy: Chất liệu đế giữa đặc biệt nhằm giảm trọng lượng giày cầu lông Mizuno Wave Claw 3 và hạn chế quà trình mài mòn, biến dạng sau thời gian sử dụng lâu.', 3,400, 75,'img/cl8.jpg')
		   INSERT INTO [dbo].[Product]
           ([product_name]
           ,[description]
           ,[category_id]
           ,[price]
           ,[quantity_available],[img])
     VALUES
		   ('WAVE FANG PRO', '* Mizuno Intercool: Hệ thống lỗ thoáng khí ở đế giày giúp người đi luôn cảm thấy khô thoáng, thoải mái.', 3, 200, 100,'img/badminton1.jpg'),
		   ('THUNDER BLADE Z', '- TPU Stabilizer: Công nghệ áp dụng ở giữa thân giày, mang lại cảm giác vừa vặn cho lòng bàn chân, thoải mái hơn khi di chuyển thi đấu trong thời gian dài.', 3, 200, 10,'img/badminton2.jpg'),    
		   ('WAVE THUNDERSTORM', ' Thiết kế mới ấn tượng với các họa tiết trải dài theo thân giày, mang tới vẻ ngoài tinh tế và nổi bật. ', 3, 200, 100,'img/badminton3.jpg')
		   INSERT INTO [dbo].[Product]
           ([product_name]
           ,[description]
           ,[category_id]
           ,[price]
           ,[quantity_available],[img])
     VALUES
		     ('Quả Bóng 2030 Gerustar ', 'Quả bóng Futsal 2030 Gerustar dán sử dụng chất liệu da PU', 4, 50, 100,'img/bong1.jpg'),
			   ('Quả Bóng Đá AKpro AF3600', 'quả bóng đá AKpro AF3600 số 5 được sản xuất bằng công nghệ ACENTECpro hiện đại nhất với chất liệu da PU có độ nảy ổn định, bóng êm, hướng bay chuẩn, khả năng chống thấm nước tương đối tốt', 4, 600, 100,'img/bong2.jpg'),
			     ('Quả Bóng In Đ UHV 1.02', 'Bóng Động Lực UHV 1.02D đạt tiêu chuẩn thi đấu, được ưu chuộng sử dụng cho các giải đấu phong trào',4, 200, 100,'img/bong3.jpg')
				 INSERT INTO [dbo].[Product]
           ([product_name]
           ,[description]
           ,[category_id]
           ,[price]
           ,[quantity_available],[img])
     VALUES
				   ('Bóng chuyền Thăng Long VB7000', 'Banh bóng chuyền thi đấu da Nhật VB7000 chính hãng Thăng Long được may cực chắc chắn, tròn đều từ chất liệu da PU nhung cho độ nảy chính xác. Quả bóng giữ hơi tốt và tạo cảm giác êm tay khi chơi.', 5, 1000, 100,'img/chuyen1.jpg'),
				   ('Bóng chuyền Thăng Long PVC5020', 'Banh bóng chuyền thi đấu da Nhật PVC5020 chính hãng Thăng Long được may cực chắc chắn', 5, 1200, 100,'img/chuyen2.jpg'),
				   ('Bóng chuyền Thăng Long PVC5030X', 'Banh bóng chuyền thi đấu da Nhật  PVC5030X chính hãng Thăng Long được may cực chắc chắn', 5, 3200, 100,'img/chuyen3.jpg')
				   INSERT INTO [dbo].[Product]
           ([product_name]
           ,[description]
           ,[category_id]
           ,[price]
           ,[quantity_available],[img])
     VALUES
				   ('VỢT CẦU LÔNG MIZUNO TACHYON 9.8', ' Mizuno Wave Drive 0 là phiên bản đặc biệt kỷ niệm 20 năm đầu tiên được sở hữu da thật của dòng giày bóng bàn Wave Drive.', 6, 1200, 100,'img/vot1.jpg'),
				   ('VỢT CẦU LÔNG PROTOTYPE X-1.1', ' Prototype X-1.1 là dòng vợt có cấu trúc dạng sóng rất đặc biệt trên khung vợt, hỗ trợ lực tốt trong các cú đánh', 6, 2200, 100,'img/vot2.jpg'),
				   ('VỢT CẦU LÔNG JPX 8.1 PRO', ' JPX 8.1 PRO là phiên bản nâng cấp của dòng JPX 8.1, phù hợp với những tay vợt có lối chơi sức mạnh, tấn công vũ bão ', 6, 6200, 100,'img/vot3.jpg')


          
           
  

INSERT INTO [dbo].[Users]
           ([username]
           ,[password]
           ,[Role]
           ,[FirstName]
           ,[LastName]
           ,[Address]
           ,[Phone]
           ,[img])
     VALUES    ( 'customer1', 'password123', 'customer','Hung','Quang','Nghe An','0987654352','defaultImg.jpg'),
    ( 'customer2', 'securepass', 'customer','Quyang','Tuan','Ha noi','0987654352','defaultImg.jpg'),
    ( 'admin1', 'adminpass', 'admin','So','Thuan',' Hai phong','0987654352','defaultImg.jpg'),
    ( 'admin2', 'adm!n@pass', 'admin','yen','Quy','Quang Ninh','0987654352','defaultImg.jpg');
           (<username, varchar(50),>
           ,<password, varchar(100),>
           ,<Role, varchar(10),>
           ,<FirstName, varchar(100),>
           ,<LastName, varchar(100),>
           ,<Address, varchar(100),>
           ,<Phone, varchar(100),>
           ,<img, varchar(100),>)
GO


	
	INSERT INTO [dbo].[Order_Item] ([order_id], [product_id], [quantity], [price])
VALUES 
    (1, 3, 8, 1200),
    (2, 4, 5, 800),
    (3, 5, 20, 1500),
    (4, 6, 15, 900),
    (5, 7, 10, 1100),
    (6, 8, 18, 1300),
    (7, 9, 25, 1700),
    (8, 10, 7, 950),
    (9, 11, 30, 1800);


	INSERT INTO [dbo].[OrderTable] ([customer_id], [order_date], [total_amount], [status])
VALUES
    (1, '2024-03-11', 50.00, 'Pending'),
    (2, '2024-03-10', 75.50, 'Pending'),
    (3, '2024-03-09', 100.25, 'Pending'),
    (4, '2024-03-08', 120.75, 'Pending'),
    (1, '2024-03-07', 80.00, 'Pending'),
    (2, '2024-03-06', 60.50, 'Pending'),
    (3, '2024-03-05', 90.25, 'Pending'),
    (4, '2024-03-04', 110.75, 'Pending'),
    (1, '2024-03-03', 70.00, 'Pending'),
    (2, '2024-03-02', 85.50, 'Pending');
	INSERT INTO [dbo].[OrderTable] ([customer_id], [order_date], [total_amount], [status])
VALUES
    (1, DATEADD(month, -1, GETDATE()), 50.00, 'Pending'),
    (2, DATEADD(month, -2, GETDATE()), 75.50, 'Pending'),
    (3, DATEADD(month, -3, GETDATE()), 100.25, 'Pending'),
    (4, DATEADD(month, -4, GETDATE()), 120.75, 'Pending'),
    (1, DATEADD(month, -5, GETDATE()), 80.00, 'Pending'),
    (2, DATEADD(month, -6, GETDATE()), 60.50, 'Pending'),
    (3, DATEADD(month, -7, GETDATE()), 90.25, 'Pending'),
    (4, DATEADD(month, -8, GETDATE()), 110.75, 'Pending'),
    (1, DATEADD(month, -9, GETDATE()), 70.00, 'Pending'),
    (2, DATEADD(month, -10, GETDATE()), 85.50, 'Pending');

	SELECT product_id, SUM(quantity) AS total_quantity
FROM Order_Item
GROUP BY product_id;
select * from Product 

DELETE FROM Product
WHERE product_name IS NULL;
