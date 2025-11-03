let danhSachPhim = [
    {
        id: 1,
        tenPhim: "Mưa đỏ",
        namPhatHanh: 2025,
        tuoi: 16,
        thoiLuong: 2,
        quocGia: "Việt Nam",
        poster: "images/muado_poster2.jpg",
        theLoai: "Phim chiếu rạp"
    },
    {
        id: 2,
        tenPhim: "Hai ",
        namPhatHanh: 2025,
        tuoi: 16,
        thoiLuong: 2,
        quocGia: "Việt Nam",
        poster: "images/film_posters/640wx396h-2muoi.jpg",
        theLoai: "Phim chiếu rạp"
    }

];
let phimHienTai = danhSachPhim[0];
let banner  =document.getElementsByClassName("banner")[0];

function chonPhim(idPhim){
    for (let i = 0; i< danhSachPhim.length; i ++){
        if(danhSachPhim[i].id === idPhim){
            banner.src =danhSachPhim[i].poster ;
        }
    }
}