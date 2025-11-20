CREATE DATABASE IF NOT EXISTS quan_ly_web_phim;
USE quan_ly_web_phim;

CREATE TABLE IF NOT EXISTS vai_tro (
    id            INT PRIMARY KEY,
    ten_vai_tro   VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS nguoi_dung (
    id              INT PRIMARY KEY,
    ten_dang_nhap   VARCHAR(50),
    mat_khau        VARCHAR(50),
    ho_ten          VARCHAR(50),
    email           VARCHAR(50),
    sdt             VARCHAR(10),
    vai_tro_id      INT,
    ngay_sinh       DATE,
    FOREIGN KEY (vai_tro_id) REFERENCES vai_tro(id)
);

CREATE TABLE IF NOT EXISTS quoc_gia (
    id            INT PRIMARY KEY,
    ten_quoc_gia  VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS the_loai (
    id            INT PRIMARY KEY,
    ten_the_loai  VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS dien_vien (
    id            INT PRIMARY KEY,
    ho_ten        VARCHAR(50),
    quoc_gia_id   INT,
    FOREIGN KEY (quoc_gia_id) REFERENCES quoc_gia(id)
);

CREATE TABLE IF NOT EXISTS dao_dien (
    id            INT PRIMARY KEY,
    ho_ten        VARCHAR(50),
    quoc_gia_id   INT,
    FOREIGN KEY (quoc_gia_id) REFERENCES quoc_gia(id)
);

CREATE TABLE IF NOT EXISTS phim (
    id               INT PRIMARY KEY,
    ten_phim         VARCHAR(100),
    dao_dien_id      INT,
    nam_phat_hanh    INT,
    poster           VARCHAR(255),
    quoc_gia_id      INT,
    so_tap           INT,
    trailer          VARCHAR(255),
    mo_ta            TEXT,
    FOREIGN KEY (dao_dien_id) REFERENCES dao_dien(id),
    FOREIGN KEY (quoc_gia_id) REFERENCES quoc_gia(id)
);

CREATE TABLE IF NOT EXISTS phim_dien_vien (
    id            INT PRIMARY KEY,
    phim_id       INT,
    dien_vien_id  INT,
    FOREIGN KEY (phim_id)      REFERENCES phim(id),
    FOREIGN KEY (dien_vien_id) REFERENCES dien_vien(id)
);

CREATE TABLE IF NOT EXISTS phim_the_loai (
    id            INT PRIMARY KEY,
    phim_id       INT,
    the_loai_id   INT,
    FOREIGN KEY (phim_id)     REFERENCES phim(id),
    FOREIGN KEY (the_loai_id) REFERENCES the_loai(id)
);

CREATE TABLE IF NOT EXISTS tap_phim (
    id           INT PRIMARY KEY,
    so_tap       INT,
    tieu_de      VARCHAR(100),
    phim_id      INT,
    thoiLuong    FLOAT,
    trailer      VARCHAR(255),
    FOREIGN KEY (phim_id) REFERENCES phim(id)
);

INSERT INTO vai_tro (id, ten_vai_tro) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Staff')
ON DUPLICATE KEY UPDATE ten_vai_tro = VALUES(ten_vai_tro);

INSERT INTO quoc_gia (id, ten_quoc_gia) VALUES
(1, 'Việt Nam'),(2, 'Mỹ'),(3, 'Hàn Quốc'),(4, 'Nhật Bản'),(5, 'Trung Quốc'),
(6, 'Anh'),(7, 'Pháp'),(8, 'Ý'),(9, 'Úc'),(10, 'Canada'),
(11, 'Tây Ban Nha'),(12, 'Đức'),(13, 'Thái Lan'),(14, 'Singapore'),(15, 'Philippines'),
(16, 'Mexico'),(17, 'Brazil'),(18, 'Ấn Độ'),(19, 'Thổ Nhĩ Kỳ'),(20, 'UAE'),
(21, 'Hồng Kông'),(22, 'Malaysia'),(23, 'Indonesia'),(24, 'Thụy Điển'),(25, 'Thụy Sỹ'),
(26, 'Đan Mạch'),(27, 'Hà Lan'),(28, 'New Zealand'),(29, 'Nga'),(30, 'Ba Lan')
ON DUPLICATE KEY UPDATE ten_quoc_gia = VALUES(ten_quoc_gia);

INSERT INTO nguoi_dung (id,ten_dang_nhap,mat_khau,ho_ten,email,sdt,vai_tro_id,ngay_sinh) VALUES
(1,'duongtrannhat','123456','Dương Trần Nhật','duongtrannhat@gmail.com','0981112233',2,'2001-02-11'),
(2,'duongvuonganh','123456','Dương Vũ Anh','duongvuonganh@gmail.com','0982223344',2,'2002-06-21'),
(3,'tranvuhai','123456','Trần Vũ Hải','tranvuhai@gmail.com','0983334455',2,'1999-12-01'),
(4,'buingocbich','123456','Bùi Ngọc Bích','buingongocbich@gmail.com','0984445566',2,'2000-05-20'),
(5,'phamquocbinh','123456','Phạm Quốc Bình','phamquocbinh@gmail.com','0985556677',2,'2001-09-15'),
(6,'nguyenvanchung','123456','Nguyễn Văn Chung','nguyenvanchung@gmail.com','0986667788',2,'2002-04-03'),
(7,'hoangmanhcuong','123456','Hoàng Mạnh Cường','hoangmanhcuong@gmail.com','0987778899',2,'2001-10-10'),
(8,'ngohoangduong','123456','Ngô Hoàng Dương','ngohoangduong@gmail.com','0988889900',2,'2003-07-07'),
(9,'phamvandai','123456','Phạm Văn Đại','phamvandai@gmail.com','0971112233',2,'2000-11-30'),
(10,'nguyendinhdat','123456','Nguyễn Đình Đạt','nguyendinhdat@gmail.com','0972223344',2,'1998-03-19'),
(11,'phamdduc','123456','Phạm Đức','phamdduc@gmail.com','0973334455',2,'2001-06-18'),
(12,'vutrungduc','123456','Vũ Trung Đức','vutrungduc@gmail.com','0974445566',2,'2002-01-02'),
(13,'phamhuonggiang','123456','Phạm Hương Giang','phamhuonggiang@gmail.com','0975556677',2,'2004-09-09'),
(14,'phamquanghau','123456','Phạm Quang Hậu','phamquanghau@gmail.com','0976667788',2,'2003-02-22'),
(15,'tranvanhiep','123456','Trần Văn Hiệp','tranvanhiep@gmail.com','0977778899',2,'2001-08-14'),
(16,'nguyenvanhoang','123456','Nguyễn Văn Hoàng','nguyenvanhoang@gmail.com','0978889900',2,'2000-05-05'),
(17,'phamquochoang','123456','Phạm Quốc Hoàng','phamquochoang@gmail.com','0961112233',2,'2002-12-12'),
(18,'phamthihue','123456','Phạm Thị Huế','phamthihue@gmail.com','0962223344',2,'2004-03-13'),
(19,'tranconghung','123456','Trần Công Hùng','tranconghung@gmail.com','0963334455',2,'1999-07-25'),
(20,'daothehuy','123456','Đào Thế Huy','daothehuy@gmail.com','0964445566',2,'2003-10-01'),
(21,'doquanghuy','123456','Đỗ Quang Huy','doquanghuy@gmail.com','0965556677',2,'2002-06-06'),
(22,'phamquanghuy','123456','Phạm Quang Huy','phamquanghuy@gmail.com','0951112233',2,'2001-09-27'),
(23,'phamthanhkhang','123456','Phạm Thành Khang','phamthanhkhang@gmail.com','0952223344',2,'2004-01-29'),
(24,'buivankhiem','123456','Bùi Văn Khiêm','buivankhiem@gmail.com','0953334455',2,'2000-04-10'),
(25,'nguyentienkhoi','123456','Nguyễn Tiến Khởi','nguyentienkhoi@gmail.com','0954445566',2,'2003-06-16'),
(26,'dotrungkien','123456','Đỗ Trung Kiên','dotrungkien@gmail.com','0955556677',2,'1999-08-20'),
(27,'vuonghalinh','123456','Vương Hà Linh','vuonghalinh@gmail.com','0941112233',2,'2004-11-11'),
(28,'daoquangloc','123456','Đào Quang Lộc','daoquangloc@gmail.com','0942223344',2,'2001-12-30'),
(29,'ngogialoc','123456','Ngô Gia Lộc','ngogialoc@gmail.com','0943334455',2,'2000-01-17'),
(30,'buivanmanh','123456','Bùi Văn Mạnh','buivanmanh@gmail.com','0944445566',2,'2002-09-03');

INSERT INTO the_loai (id, ten_the_loai) VALUES
(1,'Hành động'),(2,'Tình cảm'),(3,'Hài hước'),(4,'Kinh dị'),(5,'Tâm lý'),
(6,'Viễn tưởng'),(7,'Hoạt hình'),(8,'Phiêu lưu'),(9,'Chiến tranh'),(10,'Bí ẩn'),
(11,'Hình sự'),(12,'Tài liệu'),(13,'Gia đình'),(14,'Âm nhạc'),(15,'Thể thao'),
(16,'Khoa học'),(17,'Lịch sử'),(18,'Chính kịch'),(19,'Thần thoại'),(20,'Cổ trang'),
(21,'Võ thuật'),(22,'Sitcom'),(23,'Trinh thám'),(24,'Zombie'),(25,'Ma cà rồng'),
(26,'Siêu anh hùng'),(27,'Thảm họa'),(28,'Cyberpunk'),(29,'Robot'),(30,'Học đường')
ON DUPLICATE KEY UPDATE ten_the_loai = VALUES(ten_the_loai);

INSERT INTO dien_vien (id, ho_ten, quoc_gia_id) VALUES
(1,'Lý Hải',1),(2,'Ngô Thanh Vân',1),(3,'Trấn Thành',1),(4,'Lee Min Ho',3),
(5,'Kim Tae Ri',3),(6,'Song Joong Ki',3),(7,'Tom Holland',2),(8,'Chris Evans',2),
(9,'Scarlett Johansson',2),(10,'Keanu Reeves',2),(11,'James McAvoy',6),
(12,'Emma Watson',6),(13,'Daniel Radcliffe',6),(14,'Takeshi Kitano',4),
(15,'Sato Takeru',4),(16,'Jackie Chan',21),(17,'Châu Tinh Trì',21),
(18,'Triệu Lệ Dĩnh',5),(19,'Dương Mịch',5),(20,'Phạm Băng Băng',5),
(21,'Mario Maurer',13),(22,'Mark Prin',13),(23,'Li Bingbing',5),(24,'Jason Statham',6),
(25,'Vin Diesel',2),(26,'Gal Gadot',2),(27,'Dwayne Johnson',2),(28,'Zoe Saldana',2),
(29,'Chris Pratt',2),(30,'Ryan Reynolds',2)
ON DUPLICATE KEY UPDATE ho_ten = VALUES(ho_ten);

INSERT INTO dao_dien (id, ho_ten, quoc_gia_id) VALUES
(1,'Victor Vũ',1),(2,'Charlie Nguyễn',1),(3,'Lý Hải',1),(4,'Park Chan Wook',3),
(5,'Bong Joon Ho',3),(6,'Christopher Nolan',6),(7,'James Cameron',2),
(8,'Steven Spielberg',2),(9,'Zack Snyder',2),(10,'Denis Villeneuve',6),
(11,'Quentin Tarantino',2),(12,'Guy Ritchie',6),(13,'Peter Jackson',28),
(14,'George Lucas',2),(15,'Jon Favreau',2),(16,'Taika Waititi',28),
(17,'Rian Johnson',2),(18,'Wes Anderson',2),(19,'Hayao Miyazaki',4),
(20,'Makoto Shinkai',4),(21,'Trương Nghệ Mưu',5),(22,'Vương Gia Vệ',21),
(23,'Jordan Peele',2),(24,'Ridley Scott',6),(25,'Patty Jenkins',2),
(26,'J.J. Abrams',2),(27,'James Wan',13),(28,'Ngô Kinh',5),(29,'Michael Bay',2),(30,'David Fincher',2)
ON DUPLICATE KEY UPDATE ho_ten = VALUES(ho_ten);

INSERT INTO phim (id, ten_phim, dao_dien_id, nam_phat_hanh, poster, quoc_gia_id, so_tap, trailer, mo_ta) VALUES
(1,'Avengers: Endgame',9,2019,'poster1.jpg',2,1,'trailer1.mp4','Phim siêu anh hùng.'),
(2,'Inception',6,2010,'p2.jpg',6,1,'t2.mp4','Giấc mơ trong giấc mơ.'),
(3,'Parasite',5,2019,'p3.jpg',3,1,'t3.mp4','Gia đình ký sinh.'),
(4,'Harry Potter 1',10,2001,'p4.jpg',6,1,'t4.mp4','Pháp sư nhí.'),
(5,'Fast & Furious 7',24,2015,'p5.jpg',2,1,'t5.mp4','Đua xe hành động.'),
(6,'The Hobbit',13,2012,'p6.jpg',28,3,'t6.mp4','Phiêu lưu.'),
(7,'Interstellar',6,2014,'p7.jpg',2,1,'t7.mp4','Không gian & thời gian.'),
(8,'The Conjuring',27,2013,'p8.jpg',2,1,'t8.mp4','Kinh dị tâm linh.'),
(9,'The Ring',19,2002,'p9.jpg',4,1,'t9.mp4','Ma ám.'),
(10,'Titanic',7,1997,'p10.jpg',2,1,'t10.mp4','Tình cảm bi thương.'),
(11,'La La Land',18,2016,'p11.jpg',2,1,'t11.mp4','Âm nhạc, tình cảm.'),
(12,'John Wick',10,2014,'p12.jpg',2,1,'t12.mp4','Sát thủ trả thù.'),
(13,'Guardians of Galaxy',15,2014,'p13.jpg',2,1,'t13.mp4','Vũ trụ Marvel.'),
(14,'Doctor Strange',26,2016,'p14.jpg',2,1,'t14.mp4','Pháp sư Marvel.'),
(15,'One Piece Film Red',19,2022,'p15.jpg',4,1,'t15.mp4','Anime.'),
(16,'Your Name',20,2016,'p16.jpg',4,1,'t16.mp4','Lãng mạn anime.'),
(17,'Dune',10,2021,'p17.jpg',6,1,'t17.mp4','Sci-fi tương lai.'),
(18,'Spider-Man Homecoming',7,2017,'p18.jpg',2,1,'t18.mp4','Siêu anh hùng.'),
(19,'Deadpool',30,2016,'p19.jpg',2,1,'t19.mp4','Hài siêu anh hùng.'),
(20,'The Godfather',30,1972,'p20.jpg',2,1,'t20.mp4','Mafia.'),
(21,'Shutter Island',30,2010,'p21.jpg',2,1,'t21.mp4','Tâm lý, bí ẩn.'),
(22,'Transformers 1',29,2007,'p22.jpg',2,1,'t22.mp4','Robot chiến đấu.'),
(23,'Mắt Biếc',1,2019,'p23.jpg',1,1,'t23.mp4','Tình cảm Việt Nam.'),
(24,'Bẫy Ngọt Ngào',2,2022,'p24.jpg',1,1,'t24.mp4','Tâm lý.'),
(25,'Lật Mặt 6',3,2023,'p25.jpg',1,1,'t25.mp4','Hành động Việt Nam.'),
(26,'Train to Busan',27,2016,'p26.jpg',5,1,'t26.mp4','Zombie.'),
(27,'Squid Game',5,2021,'p27.jpg',3,9,'t27.mp4','Trò chơi sinh tồn.'),
(28,'The Witcher',30,2020,'p28.jpg',6,2,'t28.mp4','Viễn tưởng.'),
(29,'Avatar',7,2009,'p29.jpg',2,1,'t29.mp4','Sci-fi.'),
(30,'The Matrix',30,1999,'p30.jpg',2,1,'t30.mp4','Cyberpunk.')
ON DUPLICATE KEY UPDATE ten_phim = VALUES(ten_phim);

INSERT INTO phim_dien_vien (id, phim_id, dien_vien_id) VALUES
(1,1,7),(2,2,11),(3,3,6),(4,4,12),(5,5,25),
(6,6,29),(7,7,7),(8,8,30),(9,9,14),(10,10,9),
(11,11,12),(12,12,10),(13,13,29),(14,14,26),(15,15,23),
(16,16,18),(17,17,11),(18,18,7),(19,19,30),(20,20,30),
(21,21,11),(22,22,24),(23,23,1),(24,24,2),(25,25,3),
(26,26,6),(27,27,5),(28,28,29),(29,29,28),(30,30,30)
ON DUPLICATE KEY UPDATE phim_id = VALUES(phim_id);

INSERT INTO phim_the_loai (id, phim_id, the_loai_id) VALUES
(1,1,26),(2,2,10),(3,3,18),(4,4,16),(5,5,1),
(6,6,8),(7,7,6),(8,8,4),(9,9,4),(10,10,2),
(11,11,14),(12,12,1),(13,13,26),(14,14,16),(15,15,7),
(16,16,2),(17,17,6),(18,18,26),(19,19,3),(20,20,11),
(21,21,10),(22,22,29),(23,23,2),(24,24,5),(25,25,1),
(26,26,24),(27,27,18),(28,28,6),(29,29,6),(30,30,28)
ON DUPLICATE KEY UPDATE phim_id = VALUES(phim_id);

INSERT INTO tap_phim (id, so_tap, tieu_de, phim_id, thoiLuong, trailer) VALUES
(1,1,'Tập 1 - Avengers: Endgame',1,180,'trailer1.mp4'),
(2,1,'Tập 1 - Inception',2,148,'t2.mp4'),
(3,1,'Tập 1 - Parasite',3,132,'t3.mp4'),
(4,1,'Tập 1 - Harry Potter 1',4,152,'t4.mp4'),
(5,1,'Tập 1 - Fast & Furious 7',5,137,'t5.mp4'),
(6,1,'Tập 1 - The Hobbit',6,170,'t6.mp4'),
(7,2,'Tập 2 - The Hobbit',6,161,'t6.mp4'),
(8,3,'Tập 3 - The Hobbit',6,164,'t6.mp4'),
(9,1,'Tập 1 - Interstellar',7,169,'t7.mp4'),
(10,1,'Tập 1 - The Conjuring',8,112,'t8.mp4'),
(11,1,'Tập 1 - The Ring',9,115,'t9.mp4'),
(12,1,'Tập 1 - Titanic',10,195,'t10.mp4'),
(13,1,'Tập 1 - La La Land',11,128,'t11.mp4'),
(14,1,'Tập 1 - John Wick',12,101,'t12.mp4'),
(15,1,'Tập 1 - Guardians of Galaxy',13,121,'t13.mp4'),
(16,1,'Tập 1 - Doctor Strange',14,115,'t14.mp4'),
(17,1,'Tập 1 - One Piece Film Red',15,115,'t15.mp4'),
(18,1,'Tập 1 - Your Name',16,112,'t16.mp4'),
(19,1,'Tập 1 - Dune',17,155,'t17.mp4'),
(20,1,'Tập 1 - Spider-Man Homecoming',18,133,'t18.mp4'),
(21,1,'Tập 1 - Deadpool',19,108,'t19.mp4'),
(22,1,'Tập 1 - The Godfather',20,175,'t20.mp4'),
(23,1,'Tập 1 - Shutter Island',21,138,'t21.mp4'),
(24,1,'Tập 1 - Transformers 1',22,143,'t22.mp4'),
(25,1,'Tập 1 - Mắt Biếc',23,100,'t23.mp4'),
(26,1,'Tập 1 - Bẫy Ngọt Ngào',24,95,'t24.mp4'),
(27,1,'Tập 1 - Lật Mặt 6',25,110,'t25.mp4'),
(28,1,'Tập 1 - Train to Busan',26,118,'t26.mp4'),
(29,1,'Tập 1 - Squid Game',27,55,'t27.mp4'),
(30,2,'Tập 2 - Squid Game',27,56,'t27.mp4'),
(31,3,'Tập 3 - Squid Game',27,54,'t27.mp4'),
(32,4,'Tập 4 - Squid Game',27,53,'t27.mp4'),
(33,5,'Tập 5 - Squid Game',27,57,'t27.mp4'),
(34,6,'Tập 6 - Squid Game',27,63,'t27.mp4'),
(35,7,'Tập 7 - Squid Game',27,58,'t27.mp4'),
(36,8,'Tập 8 - Squid Game',27,61,'t27.mp4'),
(37,9,'Tập 9 - Squid Game',27,65,'t27.mp4');
