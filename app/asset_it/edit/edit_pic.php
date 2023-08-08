<?php
session_start();
error_reporting(0);
require("../../../core/config.core.php");
require("../../../core/connect.core.php");
require("../../../core/functions.core.php");
$getdata = new clear_db();
$connect = $getdata->my_sql_connect(DB_HOST, DB_USERNAME, DB_PASSWORD, DB_NAME);
$userdata = $getdata->my_sql_query($connect, NULL, "user", "user_key='" . $_SESSION['ukey'] . "'");
mysqli_set_charset($connect, "utf8");

$getuse_detail = $getdata->my_sql_query($connect, NULL, "card_info", "card_key='" . htmlspecialchars($_GET['key']) . "'");
?>
<div class="modal-body">
    <div class="form-group row">
        <div class="col-md-3">
            <label for="card_code">Code Asset</label>
            <input type="text" name="card_code" id="card_code" readonly class="form-control input-sm" value="<?php echo @$getuse_detail->card_code; ?>">
        </div>
        <div class="col-md-3">
            <label for="asset_code">รหัสสินทรัพย์</label>
            <input type="text" name="asset_code" id="asset_code" class="form-control input-sm" required value="<?php echo @$getuse_detail->asset_code ?>" readonly>
            <div class="invalid-feedback">
                ระบุ รหัสสินทรัพย์.
            </div>
        </div>
        <div class="col-md-3">
            <label for="card_location">สถานที่ติดตั้ง</label>
            <input type="text" name="edit_card_location" id="card_location" class="form-control input-sm" placeholder="Asset location" required disabled value="<?php echo $getuse_detail->card_location; ?>">
            <div class="invalid-feedback">
                ระบุ สถานที่ติดตั้ง.
            </div>
        </div>
        <div class="col-md-3">
            <label for="edit_card_cus_name">ชื่อและนามสกุลผู้ใช้งาน</label>
            <select name="edit_card_cus_name" id="edit_card_cus_name" class="form-control select2bs4 input-sm" disabled>
                <option value="">--- เลือกข้อมูล ---</option>
                <?php
                $getgroup = $getdata->my_sql_select($connect, NULL, "employee", "card_key <> 'hidden' AND em_status = '1' ORDER BY title_name");
                while ($showgroup = mysqli_fetch_object($getgroup)) {
                    if ($showgroup->card_key == $getuse_detail->card_customer_name) {
                        echo '<option value="' . $showgroup->card_key . '" selected>' . @prefixConvertor($showgroup->title_name) . '&nbsp;' . $showgroup->name . '&nbsp;' . $showgroup->lastname . '</option>';
                    } else {
                        echo '<option value="' . $showgroup->card_key . '">' . @prefixConvertor($showgroup->title_name) . '&nbsp;' . $showgroup->name . '&nbsp;' . $showgroup->lastname . '</option>';
                    }
                }
                ?>
            </select>
        </div>
    </div>
    <hr>
    <div class="form-group row">
        <div class="col-12">
            <label for="asset_pic">รูปภาพ</label>
            <input type="file" name="asset_pic_edit" id="asset_pic" class="form-control input-sm">
        </div>
    </div>
    <div class="form-group">
        <input name="card_key" value="<?php echo @htmlspecialchars($_GET['key']); ?>" hidden>
        <input name="asset_pic_edit_log" value="<?php echo $getuse_detail->card_pic; ?>" hidden>
        <input name="user_update" value="<?php echo @$userdata->user_key; ?>" hidden>

    </div>