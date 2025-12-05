<?php
    include "connect.php";
    $id = $_GET['id'];
     $sql1 = "DELETE FROM phim_the_loai WHERE the_loai_id = $id";
    mysqli_query($conn, $sql1);

    // Sau đó mới xóa thể loại
    $sql2 = "DELETE FROM the_loai WHERE id = $id";
    mysqli_query($conn, $sql2);
    mysqli_close($conn);
    header("location: index.php?page_layout=theloai");
?>