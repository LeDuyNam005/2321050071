<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>phim thể loại</title>
</head>
<body>
    <div style="display: flex; justify-content: space-between; align-items: center;">
        <h1>Phim thể loại</h1>
    </div>

    <table border=1>
        <tr>
            <th>Tên phim</th>
            <th>thể loại</th> 
            <th>Chức năng</th>
        </tr>
        <?php
        include("connect.php");
        $sql = "SELECT ptl.*, tl.ten_the_loai, p.ten_phim FROM phim_the_loai ptl JOIN the_loai tl ON ptl.the_loai_id = tl.id JOIN phim p ON ptl.phim_id = p.id";
        $result = mysqli_query($conn, $sql);
        while ($row = mysqli_fetch_assoc($result)) {
            ?>
            <tr>
                <td><?php echo $row["ten_phim"] ?></td>
                <td><?php echo $row["ten_the_loai"] ?></td>
                
                <td class="chuc-nang">
                    <a class="btn sua" href="index.php?page_layout=capnhattheloai&id=<?php echo $row["id"] ?>">Cập nhật</a>
                    <a class="btn xoa" href="xoatheloai.php?id=<?php echo $row["id"] ?>">Xóa</a>
                </td>
            </tr>
        <?php } ?>
    </table>
</body>
</html>