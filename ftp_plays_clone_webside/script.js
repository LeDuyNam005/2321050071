let danhSachPhim = [
    {
        id: 1,
        
        tenPhim: "Mưa đỏ",
        namPhatHanh: 2025,
        tuoi: 16,
        thoiLuong: '2h',
        quocGia: "Việt Nam",
        poster: "images/muado_poster2.jpg",
        theLoai: "Phim chiếu rạp"
    },
    {
        id: 2,
        trailer:'https://www.youtube.com/watch?v=MjxPoqCvvVs',
        tenPhim: "Hai Muối ",
        namPhatHanh: 2024,
        tuoi: 14,
        thoiLuong: '1.6h',
        quocGia: "Việt Nam",
        poster: "images/phim-ngang/640wx396h-2muoi.jpg",
        theLoai: "Phim chiếu rạp"
    },
    {
        id: 3,
        trailer:'https://www.youtube.com/watch?v=jluSu8Rw6YE',
        tenPhim: "Bố già ",
        namPhatHanh: 2021,
        tuoi: 12,
        thoiLuong: '1.5h',
        quocGia: "Việt Nam",
        poster: "images/phim-ngang/bogia.jpg",
        theLoai: "Phim chiếu rạp"
    },
    {
        id: 4,
        trailer:'https://www.youtube.com/watch?v=QJ8E9R70csY',
        tenPhim: "Cô dâu hào môn ",
        namPhatHanh: 2024,
        tuoi: 16,
        thoiLuong: '1.8h',
        quocGia: "Việt Nam",
        poster: "images/phim-ngang/codauhaomon.jpg",
        theLoai: "Phim chiếu rạp"
    },
    {
        id: 5,
        trailer:'https://www.youtube.com/watch?v=Yz96EBNwMGw',
        tenPhim: "Mai ",
        namPhatHanh: 2024,
        tuoi: 18,
        thoiLuong: '1.9h',
        quocGia: "Việt Nam",
        poster: "images/phim-ngang/mai.jpg",
        theLoai: "Phim chiếu rạp"
    },
    {
        id: 6,
        trailer:'https://www.youtube.com/watch?v=qbioI9M6Ho0',
        tenPhim: "Ngôi nhà bươm bướm ",
        namPhatHanh: 2019,
        tuoi: 16,
        thoiLuong: '1.6h',
        quocGia: "Việt Nam",
        poster: "images/phim-ngang/buom.jpg",
        theLoai: "Phim chiếu rạp"
    }

];
let phimHienTai = danhSachPhim[0];
let banner  =document.getElementsByClassName("banner")[0];

function chonPhim(idPhim){
    for (let i = 0; i< danhSachPhim.length; i ++){
        if(danhSachPhim[i].id === idPhim){
            banner.src =danhSachPhim[i].poster ;
            document.getElementById('nam').innerHTML=danhSachPhim[i].namPhatHanh ;
            document.getElementById('tuoi').innerHTML=danhSachPhim[i].tuoi ;
            document.getElementById('time').innerHTML=danhSachPhim[i].thoiLuong ;
            document.getElementById('xem').href='';
            document.getElementById('trailer').href=danhSachPhim[i].trailer;

        }
    }
}