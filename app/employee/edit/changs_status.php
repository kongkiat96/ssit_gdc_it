<?php
session_start();
error_reporting(0);
require("../../../core/config.core.php");
require("../../../core/connect.core.php");
require("../../../core/functions.core.php");
$getdata = new clear_db();
$connect = $getdata->my_sql_connect(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);
mysqli_set_charset($connect, "utf8");


?>
<div class="modal-header">
    <h5 class="modal-title font-weight-bold"> ผู้ใช้งานที่ถูกลบ</h5>
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
        <span aria-hidden="true">&times;</span>
    </button>
</div>
<div class="modal-body">
    <div class="form-group">
        <table class="table table-bordered table-hover text-center" width="100%" id="dataTablesFixwidht">
            <thead class="table-info text-center font-weight-bold">
                <tr>
                    <td>#</td>
                    <td>รายชื่อผู้ใช้งาน</td>
                    <td>UserLogin</td>
                    <td>เปลี่ยนแปลง</td>
                </tr>
            </thead>
            <tbody>
                <?php
                $u = 0;
                $getuser = $getdata->my_sql_select($connect, null, "user", "user_status ='0'");

                while ($showuser = mysqli_fetch_object($getuser)) {
                    $u++;
                ?>
                    <tr>
                        <td><?php echo $u; ?></td>
                        <td><?php echo @getemployee($showuser->user_key); ?></td>
                        <td><?php echo @Userlogin($showuser->user_key); ?></td>
                        <td><?php
                            if (@$showuser->user_status == 1) {
                                echo '<button type="button" class="btn btn-success btn-sm" id="btn-' . @$showuser->user_key . '" onclick="changeUserStatus(\'' . @$showuser->user_key . '\');"><i class="fa fa-unlock-alt" id="icon-' . @$showuser->user_key . '"></i> <span id="text-' . @$showuser->user_key . '">แสดง</span></button>';
                            } else {
                                echo '<button type="button" class="btn btn-danger btn-sm" id="btn-' . @$showuser->user_key . '" onclick="changeUserStatus(\'' . @$showuser->user_key . '\');"><i class="fa fa-lock" id="icon-' . @$showuser->user_key . '"></i> <span id="text-' . @$showuser->user_key . '">ปิดใช้งาน</span></button>';
                            }
                            ?></td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>

    </div>
</div>

<script>
    $(document).ready(function() {

        $('#dataTablesFixwidht', '').dataTable({
            "autoWidth": false,
            "ordering": false,
        });
    });
</script>