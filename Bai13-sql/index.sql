CREATE DATABASE  IF NOT EXISTS quan_ly_phim_webfpt_clone;
USE quan_ly_phim_webfpt_clone;

CREATE TABLE IF NOT EXISTS the_loai(
	id VARCHAR(100) PRIMARY KEY NOT NULL,
    ten_the_loai VARCHAR(100)
    
);
CREATE TABLE IF NOT EXISTS phim(
	id VARCHAR(100) PRIMARY KEY NOT NULL,
    ten_phim VARCHAR(100),
    dao_dien_id INT,
    nam_phat_hanh YEAR,
    id_the_loai VARCHAR(100),
    thoi_luong INT,
    poster varchar,
    FOREIGN KEY (id_the_loai) REFERENCES the_loai(id)
);
CREATE TABLE IF NOT EXISTS nguoi_dung(
	id VARCHAR(100) PRIMARY KEY NOT NULL,
    ho_ten VARCHAR(50),
    ten_dang_nhap VARCHAR(100),
    mat_khau  VARCHAR(50),
    email VARCHAR(50),
    sdt VARCHAR(10),
    quyen_id INT,
    ngay_sinh DATETIME
);
CREATE TABLE quyen(
	id varchar(50),
    ten_quyen varchar(20)
);
CREATE TABLE phim_dien_vien(
	id int,
    phim_id int
    
);