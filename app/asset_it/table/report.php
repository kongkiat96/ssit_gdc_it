<?php

if (isset($_POST['export'])) {

    if ($_POST['department'] != NULL) {
        $department = $_POST['department'];
        $get = $getdata->my_sql_select($connect, NULL, "employee", "user_department = '$department'");
        while ($show = mysqli_fetch_object($get)) {
            $getexport = $getdata->my_sql_select($connect, NULL, "card_info", "card_customer_name = '" . $show->card_key . "' AND card_delete = '1' ORDER BY card_equipment", "card_key");

            $getdate_start = dateOnlyConvertor($getexport->card_date_ex);
            $getdate_end = dateOnlyConvertor($getexport->card_date_ex);
            $day_use = (int)datediff($getdate_start, $getdate_end) + 1;
            $date_total = 365 - $day_use;

            $originalDate = $getexport->card_date_ex;
            $newDate1 = date("d-m-Y", strtotime($originalDate));

            $originalDate2 = $getexport->card_date_ex;
            $newDate2 = date("d-m-Y", strtotime($originalDate2));


            // Variables Date
            $start_date = $newDate1;
            $expire_date = $newDate2;
            $today_date = date("d-m-Y");

            /* Start Date */
            $start_explode = explode("-", $start_date);
            $start_day = $start_explode[0];
            $start_month = $start_explode[1];
            $start_year = $start_explode[2];

            /* Expire Date */
            $expire_explode = explode("-", $expire_date);
            $expire_day = $expire_explode[0];
            $expire_month = $expire_explode[1];
            $expire_year = $expire_explode[2];

            /* Today Date */
            $today_explode = explode("-", $today_date);
            $today_day = $today_explode[0];
            $today_month = $today_explode[1];
            $today_year = $today_explode[2];

            $start = gregoriantojd($start_month, $start_day, $start_year);
            $expire = gregoriantojd($expire_month, $expire_day, $expire_year);
            $today = gregoriantojd($today_month, $today_day, $today_year);

            $date_current = $expire - $today; //หาวันที่ยังเหลืออยู่
        }
    } else {
        $getexport = $getdata->my_sql_select($connect, NULL, "card_info", "card_key <> 'hidden' ORDER BY card_equipment DESC");
    }


    $log_key = substr(md5(time("now")), 8, 16);
    $getdata->my_sql_insert($connect, "logs_keep", "
    ls_key = '" . $log_key . "',
    ls_text = 'ออกรายงานสินทรัพย์ IT',
    ls_user = '" . $_SESSION['ukey'] . "'
    ");
}
?>

<div class=" card-default text-center">
    <form method="post" action="<?php echo $SERVER_NAME; ?>" class="needs-validation" novalidate id="waitsave" require>

        <div class="form-group row">

            <div class="col-12">
                <label for="department">ค้นหาแผนก</label>
                <select name="department" id="department" class="form-control select2bs4" style="width: 100%;">
                    <option value="" selected>--- เลือกข้อมูล ---</option>
                    <?php
                    $getdepart = $getdata->my_sql_select($connect, NULL, "department_name", "department_status = '1' ORDER BY id ASC");
                    while ($show = mysqli_fetch_object($getdepart)) {
                        echo '<option value="' . $show->id . '">' . $show->department_name . '</option>';
                    }
                    ?>
                </select>
            </div>

        </div>


        <?php if (isset($_POST['export'])) { ?>

            <button class="ladda-button btn btn-primary btn-square btn-ladda bg-danger" onclick="reloadPage()" data-style="expand-left">
                <span class="fas fa-trash-alt"> ล้างค่า</span>
                <span class="ladda-spinner"></span>
            </button>

            <button class="ladda-button btn btn-primary btn-square btn-ladda bg-info" data-style="expand-left" type="submit" name="export">
                <span class="fas fa-filter"> ค้นหา</span>
                <span class="ladda-spinner"></span>
            </button>
        <?php } else { ?>

            <button class="ladda-button btn btn-primary btn-square btn-ladda bg-info" data-style="expand-left" type="submit" name="export">
                <span class="fas fa-filter"> ค้นหา</span>
                <span class="ladda-spinner"></span>
            </button>
        <?php } ?>

    </form>
</div>

<?php if (isset($_POST['export'])) { ?>

    <div class="card">
        <div class="card-body">
            <div class="responsive-data-table">

                <table id="ForExport" class="table dt-responsive nowrap hover" style="font-family: sarabun; font-size: 14px;
    text-align: center;" width="100%">
                    <thead class="font-weight-bold">
                        <tr>
                            <td>ลำดับ</td>

                            <td>รหัสสินทรัพย์</td>
                            <td>ผู้ใช้งาน</td>
                            <td>บริษัท / สังกัด</td>
                            <td>แผนก</td>
                            <td>เบอร์โทร</td>
                            <td>สถานที่ติดตั้ง</td>
                            <td>สาขา</td>
                            <td>สินทรัพของบริษัท</td>
                            <td>ชื่อเครื่อง</td>
                            <td>อุปกรณ์</td>
                            <td>ราคา</td>
                            <td>ยี่ห้อ</td>
                            <td>รุ่น</td>
                            <td>ลิขสิทธิ์ (Windows)</td>
                            <td>ลิขสิทธิ์ (Program)</td>
                            <td>วันที่ซื้อ</td>
                            <td>จำนวนวันคงเหลือรับประกัน</td>
                            <td>วันที่ใช้งาน</td>
                            <td>สถานะ</td>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $i = 0;

                        while ($show_total = mysqli_fetch_object($getexport)) {

                            $getdate_start = dateOnlyConvertor($show_total->card_date_ex);
                            $getdate_end = dateOnlyConvertor($show_total->card_date_ex);
                            $day_use = (int)datediff($getdate_start, $getdate_end) + 1;
                            $date_total = 365 - $day_use;

                            $originalDate = $show_total->card_date_ex;
                            $newDate1 = date("d-m-Y", strtotime($originalDate));

                            $originalDate2 = $show_total->card_date_ex;
                            $newDate2 = date("d-m-Y", strtotime($originalDate2));


                            // Variables Date
                            $start_date = $newDate1;
                            $expire_date = $newDate2;
                            $today_date = date("d-m-Y");

                            /* Start Date */
                            $start_explode = explode("-", $start_date);
                            $start_day = $start_explode[0];
                            $start_month = $start_explode[1];
                            $start_year = $start_explode[2];

                            /* Expire Date */
                            $expire_explode = explode("-", $expire_date);
                            $expire_day = $expire_explode[0];
                            $expire_month = $expire_explode[1];
                            $expire_year = $expire_explode[2];

                            /* Today Date */
                            $today_explode = explode("-", $today_date);
                            $today_day = $today_explode[0];
                            $today_month = $today_explode[1];
                            $today_year = $today_explode[2];

                            $start = gregoriantojd($start_month, $start_day, $start_year);
                            $expire = gregoriantojd($expire_month, $expire_day, $expire_year);
                            $today = gregoriantojd($today_month, $today_day, $today_year);

                            $date_current = $expire - $today; //หาวันที่ยังเหลืออยู่


                            $i++; ?>
                            <tr>
                                <td><?php echo $i; ?></td>
                                <td>
                                    <?php
                                    if (@$show_total->asset_code != NULL) {
                                        echo @$show_total->asset_code;
                                    } else {
                                        echo '<span class="badge badge-warning">ไม่ระบุ</span>';
                                    }
                                    ?>
                                </td>
                                <td><?php echo @getemployee($show_total->card_customer_name); ?></td>
                                <td><?php echo @getemployee_company($show_total->card_customer_name); ?></td>
                                <td><?php echo @getemployee_department($show_total->card_customer_name); ?></td>
                                <td><?php echo $show_total->card_customer_phone; ?></td>
                                <td><?php echo @$show_total->card_location; ?></td>
                                <td><?php echo @prefixConvertorbranch($show_total->card_branch); ?></td>
                                <td><?php echo @prefixConvertorCompany($show_total->card_company); ?></td>
                                <td><?php echo $show_total->card_note; ?></td>
                                <td><?php echo @prefixConvertorequipment($show_total->card_equipment); ?></td>
                                <td class="text-center"><?php echo $show_total->card_price; ?></td>
                                <td class="text-center"><?php echo $show_total->card_brand; ?></td>
                                <td class="text-center"><?php echo $show_total->card_model; ?></td>
                                <td>
                                    <?php if ($show_total->ck_license == 1) {
                                        echo '<span class="badge badge-success" style="color:#FFF;">มีลิขสิทธิ์</span>';
                                    } else {
                                        echo '<span class="badge badge-danger" style="color:#FFF;">ไม่มีลิขสิทธิ์</span>';
                                    } ?>
                                </td>
                                <td>
                                    <?php if ($show_total->p_ck_license == 1) {
                                        echo '<span class="badge badge-success" style="color:#FFF;">มีลิขสิทธิ์</span>';
                                    } else {
                                        echo '<span class="badge badge-danger" style="color:#FFF;">ไม่มีลิขสิทธิ์</span>';
                                    } ?>
                                </td>
                                <td><?php echo @dateConvertor($show_total->card_date_buy); ?></td>
                                <td><?php echo $date_current; ?> วัน</td>
                                <td><?php echo @dateConvertor($show_total->card_done_aprox); ?></td>
                                <td><?php echo @cardStatus($show_total->card_status); ?></td>

                            </tr>
                        <?php
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

<?php } ?>