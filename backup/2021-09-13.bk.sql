# Dump of access_list 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS access_list;
CREATE TABLE access_list (
  access_key char(32) NOT NULL,
  access_name varchar(256) NOT NULL,
  access_detail text NOT NULL,
  access_class int(11) NOT NULL,
  access_status tinyint(1) NOT NULL,
  PRIMARY KEY (access_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO access_list VALUES("21adef826d326d4bae44eb0c9e19b8b1","แจ้งซ่อมฝ่ายสารสนเทศ","service",0,1);
INSERT INTO access_list VALUES("295744c466c17b46170f88b5c1b9104d","รายการสินทรัพย์ IT","asset_it",0,0);
INSERT INTO access_list VALUES("50bdda2d8d544cb7d195ba85cfc37edb","งานติดตามประจำสัปดาห์","mb_task",0,2);
INSERT INTO access_list VALUES("a9b2d4fb55890e95a4c0d8f1150ddd5e","แสดงกราฟรายงาน","report",0,1);
INSERT INTO access_list VALUES("f1344bc0fb9c5594fa0e3d3f37a56957","พนักงาน","employee",0,1);



# Dump of access_user 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS access_user;
CREATE TABLE access_user (
  access_key char(32) NOT NULL,
  user_key char(32) NOT NULL,
  access_status tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO access_user VALUES("f1344bc0fb9c5594fa0e3d3f37a56957","6102dffc6c359d7584e559a061283aa3",1);
INSERT INTO access_user VALUES("295744c466c17b46170f88b5c1b9104d","6102dffc6c359d7584e559a061283aa3",1);
INSERT INTO access_user VALUES("21adef826d326d4bae44eb0c9e19b8b1","6102dffc6c359d7584e559a061283aa3",1);
INSERT INTO access_user VALUES("50bdda2d8d544cb7d195ba85cfc37edb","ce63f18f7cf0a712fd4a2f47bc9ae14c",1);
INSERT INTO access_user VALUES("f1344bc0fb9c5594fa0e3d3f37a56957","ce63f18f7cf0a712fd4a2f47bc9ae14c",1);
INSERT INTO access_user VALUES("295744c466c17b46170f88b5c1b9104d","ce63f18f7cf0a712fd4a2f47bc9ae14c",1);
INSERT INTO access_user VALUES("21adef826d326d4bae44eb0c9e19b8b1","ce63f18f7cf0a712fd4a2f47bc9ae14c",1);
INSERT INTO access_user VALUES("a9b2d4fb55890e95a4c0d8f1150ddd5e","ce63f18f7cf0a712fd4a2f47bc9ae14c",1);
INSERT INTO access_user VALUES("f1344bc0fb9c5594fa0e3d3f37a56957","0f8a08fec826a7acad5362a9a852b9c9",1);
INSERT INTO access_user VALUES("21adef826d326d4bae44eb0c9e19b8b1","0f8a08fec826a7acad5362a9a852b9c9",1);
INSERT INTO access_user VALUES("a9b2d4fb55890e95a4c0d8f1150ddd5e","0f8a08fec826a7acad5362a9a852b9c9",1);



# Dump of backup_logs 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS backup_logs;
CREATE TABLE backup_logs (
  backup_key varchar(32) NOT NULL,
  backup_file varchar(256) NOT NULL,
  backup_date timestamp NOT NULL DEFAULT current_timestamp(),
  user_key char(32) NOT NULL,
  PRIMARY KEY (backup_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;






# Dump of branch 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS branch;
CREATE TABLE branch (
  id int(11) NOT NULL AUTO_INCREMENT,
  branch_name varchar(255) DEFAULT NULL COMMENT 'ชื่อสาขา',
  status int(2) NOT NULL DEFAULT 1 COMMENT '1 ปกติ 0 ไม่แสดง ',
  show_it int(1) NOT NULL DEFAULT 1 COMMENT '1 แสดง 0 ไม่แสดง',
  show_asset int(1) NOT NULL DEFAULT 2 COMMENT '1 แสดง 0 ไม่แสดง',
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;



INSERT INTO branch VALUES(1,"สาขา 1",1,1,2);
INSERT INTO branch VALUES(2,"สาขา 2",1,1,2);
INSERT INTO branch VALUES(3,"21",2,1,2);



# Dump of card_for_ex 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS card_for_ex;
CREATE TABLE card_for_ex (
  id int(255) NOT NULL AUTO_INCREMENT,
  card_info_key varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  card_date_ex date DEFAULT NULL,
  status int(1) NOT NULL DEFAULT 1,
  date_time timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






# Dump of card_info 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS card_info;
CREATE TABLE card_info (
  card_key char(32) NOT NULL,
  card_code varchar(16) DEFAULT NULL,
  card_customer_name varchar(64) DEFAULT NULL,
  asset_code varchar(100) DEFAULT NULL,
  card_company varchar(255) DEFAULT NULL,
  card_branch varchar(100) DEFAULT NULL,
  card_location varchar(255) DEFAULT NULL,
  card_customer_phone varchar(128) DEFAULT NULL,
  card_customer_email varchar(128) DEFAULT NULL,
  card_note text DEFAULT NULL COMMENT 'ชื่อเครื่อง',
  card_equipment varchar(100) DEFAULT NULL,
  card_brand varchar(50) DEFAULT NULL,
  card_model varchar(100) DEFAULT NULL,
  card_serial varchar(50) DEFAULT NULL,
  card_sum varchar(100) DEFAULT NULL COMMENT 'จำนวนอุปกรณ์',
  card_date_buy date NOT NULL COMMENT 'วันที่ซื้อ',
  card_ex varchar(20) DEFAULT NULL COMMENT 'ระยะเวลารับประกัน',
  card_date_ex date DEFAULT NULL,
  ck_license int(2) DEFAULT NULL,
  license_name varchar(200) DEFAULT NULL,
  license_key varchar(200) DEFAULT NULL,
  p_ck_license int(2) DEFAULT NULL COMMENT 'Program License',
  p_license_name varchar(200) DEFAULT NULL COMMENT 'Program Name',
  p_license_key varchar(200) DEFAULT NULL COMMENT 'Program Key',
  card_pic varchar(100) DEFAULT NULL,
  card_price varchar(50) DEFAULT NULL,
  card_done_aprox date NOT NULL COMMENT 'วันที่คืน วันที่ใช้งาน',
  user_key varchar(32) DEFAULT NULL,
  user_update varchar(32) DEFAULT NULL,
  card_status varchar(32) DEFAULT NULL,
  card_insert date NOT NULL,
  card_delete int(2) NOT NULL DEFAULT 1 COMMENT '1 use 0 del',
  PRIMARY KEY (card_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO card_info VALUES("5ebee4b2cb71dd9889b56b53786140b5","CBM6ZJAK","ce63f18f7cf0a712fd4a2f47bc9ae14c","NTP-NB","1","1","Rama3","+66939406155","kongkiat.0174@gmail.com","EW","1","DELL","D001","DSS","1","2021-03-07","1 ปี","2021-03-28",0,"Windows 10 Pro",NULL,0,"Office 2013",NULL,"CBM6ZJAK-1609154220364.jpg","2,500.00","2021-03-07","ce63f18f7cf0a712fd4a2f47bc9ae14c","ce63f18f7cf0a712fd4a2f47bc9ae14c","9ba0f256a5f620136568c6b47dcb24bd","2021-03-01",1);



# Dump of card_item 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS card_item;
CREATE TABLE card_item (
  item_key char(32) NOT NULL,
  card_key varchar(32) DEFAULT NULL,
  item_number int(11) DEFAULT NULL,
  item_name varchar(128) DEFAULT NULL,
  item_note text DEFAULT NULL,
  item_price_aprox float DEFAULT NULL,
  item_insert timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (item_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;






# Dump of card_pic 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS card_pic;
CREATE TABLE card_pic (
  pic_key varchar(50) NOT NULL,
  card_key varchar(100) NOT NULL,
  pic_name varchar(255) NOT NULL,
  pic_status int(1) DEFAULT 1,
  date_time timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (pic_key),
  KEY card_key (card_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;






# Dump of card_status 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS card_status;
CREATE TABLE card_status (
  cstatus_key char(32) NOT NULL,
  card_key varchar(32) DEFAULT NULL,
  card_status varchar(32) DEFAULT NULL,
  card_status_note text DEFAULT NULL,
  user_key varchar(32) DEFAULT NULL,
  cstatus_insert timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (cstatus_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO card_status VALUES("8653c513c8337c35b2e8540b164e58e1","5ebee4b2cb71dd9889b56b53786140b5","9ba0f256a5f620136568c6b47dcb24bd","สำรอง","ce63f18f7cf0a712fd4a2f47bc9ae14c","2021-06-26 15:09:41");



# Dump of card_type 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS card_type;
CREATE TABLE card_type (
  ctype_key char(32) NOT NULL,
  ctype_name varchar(128) NOT NULL,
  ctype_color varchar(16) NOT NULL,
  ctype_status tinyint(1) NOT NULL DEFAULT 1,
  ctype_use int(1) NOT NULL DEFAULT 3 COMMENT '1 = it, 2 asset, 3 All',
  ctype_insert timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (ctype_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO card_type VALUES("02b5a3574052961b5336356a9a634d05","รอคืนเครื่องสำรอง/Waiting Return","#02790a",1,3,"2021-01-13 00:17:03");
INSERT INTO card_type VALUES("27e87048f9283b6e13347df4388c98e9","กำลังส่งเครื่องสำรอง/Sending Spart part","#dc88e2",1,3,"2021-01-13 00:17:52");
INSERT INTO card_type VALUES("2e34609794290a770cb0349119d78d21","ใช้งานปกติ","#26eb15",1,3,"2018-12-08 13:47:10");
INSERT INTO card_type VALUES("3b2bd9e319992d5b63bfbbd7301b6882","รอดำเนินการสั่งซื้ออุปกรณ์/On Purchasing Process","#bc680f",1,3,"2020-02-18 11:45:58");
INSERT INTO card_type VALUES("47ea92cfc142a08b40abe2ddbf8837a8","กำลังซ่อม/On Processing","#fff500",1,3,"2018-12-08 13:48:29");
INSERT INTO card_type VALUES("57995055c28df9e82476a54f852bd214","ยกเลิกการแจ้ง/Cancel Ticket","#ff0000",1,3,"2018-12-08 13:49:07");
INSERT INTO card_type VALUES("5b93205f13e238f5a1904e095016e81f","คืนแล้ว","#100ceb",1,3,"2019-05-23 15:36:24");
INSERT INTO card_type VALUES("5cafc78523f4f5e4812f9545b2ba5ae7","แจ้งดำเนินการอีกครั้ง/Replay later","#ff000b",1,3,"2020-02-17 13:59:03");
INSERT INTO card_type VALUES("9ba0f256a5f620136568c6b47dcb24bd","เครื่องสำรอง/Spare Part","#ed4e09",1,3,"2018-12-08 13:54:34");
INSERT INTO card_type VALUES("befb5e146e599a9876757fb18ce5fa2e","รับดำเนินการ/Ticket Recieved","#38c7d8",1,3,"2020-02-04 15:10:13");
INSERT INTO card_type VALUES("f2c50a9a3e802c7be809f7f506b2b46a","รอเปลี่ยนอะไหล่/Waiting Spare Part","#ebae13",1,3,"2018-12-08 13:51:30");



# Dump of company 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS company;
CREATE TABLE company (
  id int(11) NOT NULL AUTO_INCREMENT,
  company_name varchar(255) DEFAULT NULL COMMENT 'ชื่อบริษัท',
  cp_status int(2) NOT NULL DEFAULT 1 COMMENT '1 ปกติ 0 ลบ',
  show_it int(1) NOT NULL DEFAULT 1 COMMENT '1 แสดง 0 ไม่แสดง',
  show_asset int(1) NOT NULL DEFAULT 2 COMMENT '1 แสดง 0 ไม่แสดง',
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;



INSERT INTO company VALUES(1,"GDC/PRC",1,1,2);
INSERT INTO company VALUES(2,"บริษัท ทดสอบ 2 จำกัด",1,1,2);
INSERT INTO company VALUES(4,"Test",2,1,2);
INSERT INTO company VALUES(5,"Test2",2,1,2);
INSERT INTO company VALUES(6,"Test3",2,1,2);



# Dump of department_name 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS department_name;
CREATE TABLE department_name (
  id int(11) NOT NULL AUTO_INCREMENT,
  department_name varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'ชื่อแผนก',
  department_status int(1) NOT NULL DEFAULT 1 COMMENT '1 use 0 del',
  PRIMARY KEY (id) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



INSERT INTO department_name VALUES(1,"Management",1);
INSERT INTO department_name VALUES(2,"Finance",1);
INSERT INTO department_name VALUES(5,"Human Resource Management",1);
INSERT INTO department_name VALUES(11,"Graphic &amp;amp; Design",1);
INSERT INTO department_name VALUES(18,"Purchasing",2);
INSERT INTO department_name VALUES(20,"Warehouse &amp; Logistics",2);
INSERT INTO department_name VALUES(26,"Marketing",1);
INSERT INTO department_name VALUES(36,"Front Office",1);
INSERT INTO department_name VALUES(43,"Operation Management",1);
INSERT INTO department_name VALUES(45,"IT Support",1);
INSERT INTO department_name VALUES(48,"-",2);
INSERT INTO department_name VALUES(51,"Engineer",1);
INSERT INTO department_name VALUES(53,"Graphic",2);
INSERT INTO department_name VALUES(54," Kitchen Team",1);
INSERT INTO department_name VALUES(55,"Accounting",1);
INSERT INTO department_name VALUES(56,"Iventory",2);
INSERT INTO department_name VALUES(58,"CTW",2);
INSERT INTO department_name VALUES(59,"a",2);
INSERT INTO department_name VALUES(60,"Casino",1);
INSERT INTO department_name VALUES(61,"Security",1);
INSERT INTO department_name VALUES(62,"Food &amp;amp; Beverage",1);
INSERT INTO department_name VALUES(63,"Transport",1);
INSERT INTO department_name VALUES(64,"Grand Residence",1);
INSERT INTO department_name VALUES(65,"House Keeping",1);



# Dump of device_type 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS device_type;
CREATE TABLE device_type (
  id int(11) NOT NULL AUTO_INCREMENT,
  device_type varchar(45) DEFAULT NULL COMMENT 'หมวดหมู่อุปกรณ์',
  device_status int(1) NOT NULL DEFAULT 1 COMMENT '1 use 0 del',
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;



INSERT INTO device_type VALUES(1,"PC (คอมพิวเตอร์ตั้งโต๊ะ)",1);
INSERT INTO device_type VALUES(2,"Monitor (จอคอมพิวเตอร์)",1);
INSERT INTO device_type VALUES(3,"Notebook",1);
INSERT INTO device_type VALUES(4,"PC (All in one)",1);
INSERT INTO device_type VALUES(6,"Mobile",1);
INSERT INTO device_type VALUES(7,"Printer laser (เครื่องปริ้นเอกสารชนิดผง)",1);
INSERT INTO device_type VALUES(8,"Hub",1);
INSERT INTO device_type VALUES(9,"Power Amp",1);
INSERT INTO device_type VALUES(10,"Speaker (ลำโพง)",1);
INSERT INTO device_type VALUES(11,"HDMI Extender",1);
INSERT INTO device_type VALUES(12,"Brightsign",1);
INSERT INTO device_type VALUES(13,"Projector",1);
INSERT INTO device_type VALUES(14,"Scanner",1);
INSERT INTO device_type VALUES(15,"RACK",1);
INSERT INTO device_type VALUES(16,"UPS",1);
INSERT INTO device_type VALUES(17,"Camera CCTV",1);
INSERT INTO device_type VALUES(18,"Digital Video Recorder",1);
INSERT INTO device_type VALUES(19,"ETC",1);
INSERT INTO device_type VALUES(20,"External Harddisk",1);
INSERT INTO device_type VALUES(21,"Android Box",1);
INSERT INTO device_type VALUES(22,"iMac",1);
INSERT INTO device_type VALUES(23,"Accessories",1);
INSERT INTO device_type VALUES(24,"IPAD",1);
INSERT INTO device_type VALUES(25,"สแตนขาตั้ง IPAD",1);
INSERT INTO device_type VALUES(26,"สายชาร์จ IPAD",1);
INSERT INTO device_type VALUES(27,"หัวแปลง USB LAN For IPAD",1);
INSERT INTO device_type VALUES(28,"Tablet",1);
INSERT INTO device_type VALUES(29,"เครื่องปริ้นใบเสร็จ",1);
INSERT INTO device_type VALUES(30,"เครื่องปริ้นในครัว",1);
INSERT INTO device_type VALUES(31,"Printer Injek (เครื่องปริ้นเอกสารเติมน้ำหมึก)",1);
INSERT INTO device_type VALUES(32,"สายชาร์จโน๊ตบุ๊ค",1);
INSERT INTO device_type VALUES(33,"Battery Notebook",1);
INSERT INTO device_type VALUES(34,"สายชาร์จ Tablet",1);
INSERT INTO device_type VALUES(35,"Mikrotik",1);
INSERT INTO device_type VALUES(36,"UniFi UAP",1);
INSERT INTO device_type VALUES(37,"เครื่องสแกนนิ้ว",1);
INSERT INTO device_type VALUES(38,"เครื่องถ่ายเอกสาร",1);
INSERT INTO device_type VALUES(39,"โทรศัพท์ 02",1);
INSERT INTO device_type VALUES(40,"เคส",1);
INSERT INTO device_type VALUES(41,"อื่นๆ",1);



# Dump of employee 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS employee;
CREATE TABLE employee (
  card_key char(32) NOT NULL,
  title_name int(2) DEFAULT NULL,
  name varchar(150) DEFAULT NULL,
  lastname varchar(255) DEFAULT NULL,
  user_position varchar(100) DEFAULT NULL COMMENT 'ตำแหน่ง',
  user_department varchar(100) DEFAULT NULL COMMENT 'แผนก',
  department_id int(11) NOT NULL COMMENT 'บริษัทอิงจาก company',
  em_status int(2) NOT NULL DEFAULT 1 COMMENT '1 ปกติ 0 ลบ',
  date_create datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (card_key)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



INSERT INTO employee VALUES("ce63f18f7cf0a712fd4a2f47bc9ae14c",1,"ผู้ดูแล","ระบบ","IT","45",1,1,"2020-12-11 11:52:57");
INSERT INTO employee VALUES("1d981e47f5ad141573972981228ff719",5,"User","User","General Manager2","1",2,0,"2021-09-13 12:13:53");
INSERT INTO employee VALUES("6102dffc6c359d7584e559a061283aa3",1,"เจ้าหน้าที่","เจ้าหน้าที่","IT","45",1,1,"2021-02-18 19:48:59");
INSERT INTO employee VALUES("6b45d93fd17e46642822b921a2c0490e",5,"Sakchai","Nimdee","IT Director","45",1,1,"2021-09-10 10:37:05");
INSERT INTO employee VALUES("a134ff7da2793aa9fe40807ceaa76ddc",5,"ทดสอบ","Test","Secretary","1",1,1,"2021-09-10 11:13:02");
INSERT INTO employee VALUES("0f8a08fec826a7acad5362a9a852b9c9",5,"SREESOPON","PEUNGNU","ITM","45",1,1,"2021-09-10 11:52:07");
INSERT INTO employee VALUES("495f9422f4535f297070f191f2d86ce6",4,"fo","office","FO Team","36",1,1,"2021-09-13 12:14:09");
INSERT INTO employee VALUES("0b361318ce011cf280dcb1666366d3f3",4,"็HK","office","Secretary","65",1,1,"2021-09-13 12:17:44");
INSERT INTO employee VALUES("4e8617310a94ca7a188ca08096a50eac",4,"ENG","Office","Secretary","51",1,1,"2021-09-13 12:14:57");
INSERT INTO employee VALUES("57c058510745a772e659b8c87b461f7c",4,"Casino","Office","Secretary","60",1,1,"2021-09-13 12:15:10");
INSERT INTO employee VALUES("0554d7bed333bd2c10a0460987821fec",4,"VIP","Office","Secretary","43",1,1,"2021-09-13 12:19:09");
INSERT INTO employee VALUES("3a427c1c3667583f00afd36d6e6a52ea",4,"HR","Office","Secretary","5",1,1,"2021-09-13 12:20:09");
INSERT INTO employee VALUES("a4783cff0a1f50e1ab3a3f5ff9f04331",4,"Accouting","Office","Secretary","2",1,1,"2021-09-13 12:21:01");
INSERT INTO employee VALUES("12e326c5ffc11e6004c51a411d3d4ec2",4,"Maketting","Office","Secretary","26",1,1,"2021-09-13 12:23:34");
INSERT INTO employee VALUES("a34f44aad5d05e664fc99babd38244a4",4,"F&amp;amp;B","Office","Secretary","62",1,1,"2021-09-13 12:24:39");
INSERT INTO employee VALUES("d7dc317e3f0af0ff2cf20a711ec34f2c",4,"KC","Office","Secretary","62",1,1,"2021-09-13 12:25:58");
INSERT INTO employee VALUES("d92673f179a14e69f329d07a43d5eec1",4,"Security","Office","Secretary","61",1,1,"2021-09-13 12:26:56");
INSERT INTO employee VALUES("a4ca6bec3d8fd3d121a71493a45ad9ec",4,"Transport","Office","Secretary","63",1,1,"2021-09-13 12:27:52");
INSERT INTO employee VALUES("97eacefa54562d4a83d5d1a1295949c5",4,"Grand Residence","Office","Secretary","64",1,1,"2021-09-13 12:29:15");



# Dump of list 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS list;
CREATE TABLE list (
  id int(3) unsigned NOT NULL AUTO_INCREMENT,
  cases varchar(64) NOT NULL,
  menu varchar(64) NOT NULL,
  pages varchar(128) NOT NULL,
  case_status tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;



INSERT INTO list VALUES(1,"setting","setting","settings/setting.php",1);
INSERT INTO list VALUES(2,"employee","employee","employee/index.php",1);
INSERT INTO list VALUES(4,"card_all_status","asset_it","asset_it/card_all_status.php",1);
INSERT INTO list VALUES(5,"case_all_service","service","service/case_all_service.php",1);
INSERT INTO list VALUES(8,"setting_users","setting","settings/setting_users.php",1);
INSERT INTO list VALUES(9,"setting_backup","setting","settings/setting_backup.php",1);
INSERT INTO list VALUES(10,"setting_info","setting","settings/setting_info.php",1);
INSERT INTO list VALUES(11,"setting_system","setting","settings/setting_system.php",1);
INSERT INTO list VALUES(12,"setting_user_access","setting","settings/setting_user_access.php",1);
INSERT INTO list VALUES(13,"administrator_access_list","setting","administrator/administrator_access_list.php",1);
INSERT INTO list VALUES(14,"administrator_cases","setting","administrator/administrator_cases.php",1);
INSERT INTO list VALUES(15,"administrator_menus","setting","administrator/administrator_menus.php",1);
INSERT INTO list VALUES(16,"administrator_modules","setting","administrator/administrator_modules.php",1);
INSERT INTO list VALUES(17,"administrator_helper","seting","administrator/administrator_helper.php",1);
INSERT INTO list VALUES(18,"show_work","service","service/show_work.php",1);
INSERT INTO list VALUES(19,"case_all_company","service","service/case_all_company.php",1);
INSERT INTO list VALUES(20,"service","service","service/index.php",1);
INSERT INTO list VALUES(26,"setting_card_status","setting","settings/setting_card_status.php",1);
INSERT INTO list VALUES(29,"administrator_log","setting","administrator/administrator_log.php",1);
INSERT INTO list VALUES(30,"show_cancel","service","service/show_cancel.php",1);
INSERT INTO list VALUES(31,"show_cancel_user","service","service/show_cancel_user.php",1);
INSERT INTO list VALUES(41,"view_info","setting","settings/view_info.php",1);
INSERT INTO list VALUES(44,"setting_services","setting","settings/setting_services.php",1);
INSERT INTO list VALUES(45,"asset_it","asset_it","asset_it/index.php",1);
INSERT INTO list VALUES(46,"asset_it_create_detail","asset_it","asset_it/asset_it_create_detail.php",1);
INSERT INTO list VALUES(48,"setting_app","setting","settings/setting_app.php",1);
INSERT INTO list VALUES(49,"report_it","service","service/report.php",1);
INSERT INTO list VALUES(50,"case_all_department","service","service/case_all_department.php",1);
INSERT INTO list VALUES(59,"add_detail","asset_it","asset_it/wait_detail.php",1);
INSERT INTO list VALUES(60,"report","report","report/index.php",1);



# Dump of logs 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS logs;
CREATE TABLE logs (
  log_key varchar(16) NOT NULL,
  log_date timestamp NOT NULL DEFAULT current_timestamp(),
  log_ipaddress varchar(32) NOT NULL,
  log_text varchar(256) NOT NULL,
  log_user varchar(32) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;



INSERT INTO logs VALUES("24276d9fb43ec3a0","2021-09-05 23:33:05","119.76.34.95","superadmin เข้าสู่ระบบ.","ce63f18f7cf0a712fd4a2f47bc9ae14c");
INSERT INTO logs VALUES("9b046c2a620b3aba","2021-09-05 23:34:07","119.76.34.95","superadmin ออกจากระบบ.","ce63f18f7cf0a712fd4a2f47bc9ae14c");
INSERT INTO logs VALUES("e92b7e206a4668a0","2021-09-08 22:49:21","110.169.10.255","superadmin เข้าสู่ระบบ.","ce63f18f7cf0a712fd4a2f47bc9ae14c");
INSERT INTO logs VALUES("cf9ee64a3ea5710b","2021-09-08 22:50:25","110.169.10.255","superadmin ออกจากระบบ.","ce63f18f7cf0a712fd4a2f47bc9ae14c");
INSERT INTO logs VALUES("4b6d70f87e949354","2021-09-08 22:54:01","110.169.10.255","superadmin เข้าสู่ระบบ.","ce63f18f7cf0a712fd4a2f47bc9ae14c");
INSERT INTO logs VALUES("8ec9fdaf9da9b990","2021-09-10 09:16:12","124.122.84.76","superadmin เข้าสู่ระบบ.","ce63f18f7cf0a712fd4a2f47bc9ae14c");
INSERT INTO logs VALUES("fd69daf5e38c2811","2021-09-10 09:16:48","103.146.44.62","superadmin เข้าสู่ระบบ.","ce63f18f7cf0a712fd4a2f47bc9ae14c");
INSERT INTO logs VALUES("689d101c34958bcb","2021-09-10 09:23:16","103.146.44.60","superadmin เข้าสู่ระบบ.","ce63f18f7cf0a712fd4a2f47bc9ae14c");
INSERT INTO logs VALUES("6564a06db5129715","2021-09-10 10:53:51","103.146.44.62","superadmin เข้าสู่ระบบ.","ce63f18f7cf0a712fd4a2f47bc9ae14c");
INSERT INTO logs VALUES("026b2d3a9510ecf8","2021-09-10 11:21:41","103.146.44.62","staff เข้าสู่ระบบ.","a134ff7da2793aa9fe40807ceaa76ddc");
INSERT INTO logs VALUES("08fa607f5006a6a4","2021-09-10 11:47:21","103.146.44.62","superadmin เข้าสู่ระบบ.","ce63f18f7cf0a712fd4a2f47bc9ae14c");
INSERT INTO logs VALUES("42ed57959ad2ca98","2021-09-10 11:50:15","103.146.44.62","superadmin เข้าสู่ระบบ.","ce63f18f7cf0a712fd4a2f47bc9ae14c");
INSERT INTO logs VALUES("cc4f7ae2a5161cc9","2021-09-13 09:04:27","103.146.44.62","superadmin เข้าสู่ระบบ.","ce63f18f7cf0a712fd4a2f47bc9ae14c");
INSERT INTO logs VALUES("ecb1045d8aa6d52a","2021-09-13 11:51:37","103.146.44.62","superadmin เข้าสู่ระบบ.","ce63f18f7cf0a712fd4a2f47bc9ae14c");



# Dump of logs_keep 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS logs_keep;
CREATE TABLE logs_keep (
  ls_key char(150) NOT NULL,
  ls_text varchar(150) NOT NULL,
  ls_user varchar(150) NOT NULL,
  ls_date timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO logs_keep VALUES("a555d19c67044225","ออกรายงานแจ้งซ่อม","ce63f18f7cf0a712fd4a2f47bc9ae14c","2021-09-08 22:54:08");



# Dump of members_prefix 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS members_prefix;
CREATE TABLE members_prefix (
  prefix_code int(3) unsigned NOT NULL AUTO_INCREMENT,
  prefix_key varchar(32) NOT NULL,
  prefix_title varchar(64) NOT NULL,
  prefix_status tinyint(1) NOT NULL,
  prefix_insert timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (prefix_code)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;



INSERT INTO members_prefix VALUES(1,"00d3ee50b62c10ee1f590819a045ea47","นาย",1,"2019-01-04 15:22:28");
INSERT INTO members_prefix VALUES(2,"2f9f2c0fc106a86ea7cb3bca1a28de00","นางสาว",1,"2019-01-04 15:24:28");
INSERT INTO members_prefix VALUES(3,"b69fcedf741f32260fb2323fe8fdc9dc","นาง",1,"2019-01-04 15:26:28");
INSERT INTO members_prefix VALUES(4,"c50c44364721dd2fd78c9809ba63348b","ส่วนกลาง",1,"2019-04-20 16:39:01");
INSERT INTO members_prefix VALUES(5,"07e6dad4c35626e2eef6879f9e6bc224","Mr.",1,"2019-09-25 14:31:01");
INSERT INTO members_prefix VALUES(6,"7bb3cfcdc10f0830609626871f48a2e1","Miss.",1,"2019-09-25 14:31:15");
INSERT INTO members_prefix VALUES(7,"92fffc8038fb8082d8f3286cc95d68e3","ว่าง",1,"2020-01-28 16:13:04");
INSERT INTO members_prefix VALUES(8,"7f183ddcb3abf3cefdda95a434ba0d3a"," -",1,"2020-02-05 10:52:45");



# Dump of menus 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS menus;
CREATE TABLE menus (
  menu_key char(32) NOT NULL,
  menu_icon varchar(256) NOT NULL,
  menu_name varchar(128) NOT NULL COMMENT '<span class="pull-right"><span class="badge" id="card_count"></span></span>',
  menu_case varchar(128) NOT NULL,
  menu_link varchar(256) NOT NULL,
  menu_status tinyint(1) NOT NULL,
  menu_sorting int(11) NOT NULL,
  PRIMARY KEY (menu_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO menus VALUES("21adef826d326d4bae44eb0c9e19b8b1","fa-laptop-medical","แจ้งซ่อมฝ่ายสารสนเทศ","service","?p=service",1,2);
INSERT INTO menus VALUES("2309e0cdb2c541bf7cb8ef0dee7b7eba","fa-cogs","ตั้งค่า","setting","?p=setting",1,98);
INSERT INTO menus VALUES("295744c466c17b46170f88b5c1b9104d","fa-address-card","รายการสินทรัพย์ IT","asset_it","?p=asset_it",0,3);
INSERT INTO menus VALUES("50bdda2d8d544cb7d195ba85cfc37edb","mb-home","งานติดตามประจำสัปดาห์","mb_task","?p=mb_task",2,6);
INSERT INTO menus VALUES("a16043256ea5ca0ea86995e2b69ec238","fa-home","หน้าแรก","","index.php",1,1);
INSERT INTO menus VALUES("a9b2d4fb55890e95a4c0d8f1150ddd5e","fa-chart-bar","แสดงกราฟรายงาน","report","?p=report",1,5);
INSERT INTO menus VALUES("c6c8729b45d1fec563f8453c16ff03b8","fa-sign-out-alt","ออกจากระบบ","logout","../core/logout.core.php",1,99);
INSERT INTO menus VALUES("f1344bc0fb9c5594fa0e3d3f37a56957","fa-users","พนักงาน","employee","?p=employee",1,4);



# Dump of os_system 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS os_system;
CREATE TABLE os_system (
  id int(2) NOT NULL,
  os_name varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






# Dump of problem_comment 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS problem_comment;
CREATE TABLE problem_comment (
  ID int(6) NOT NULL AUTO_INCREMENT,
  ticket varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  admin_update varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  card_status varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  comment varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  price varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  date datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;






# Dump of problem_list 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS problem_list;
CREATE TABLE problem_list (
  ID int(5) NOT NULL AUTO_INCREMENT,
  ticket varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  department varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  company varchar(10) CHARACTER SET utf8 DEFAULT NULL,
  user_key varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  se_id int(5) DEFAULT NULL,
  se_li_id int(5) DEFAULT NULL,
  se_other varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  se_asset varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  pic_before varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  pic_after varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  se_namecall varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  se_location varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  se_price varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  card_status varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  date date DEFAULT NULL,
  date_update date DEFAULT '0000-00-00',
  admin_update varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  time_start time DEFAULT NULL,
  time_update time DEFAULT NULL,
  PRIMARY KEY (ID)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;



INSERT INTO problem_list VALUES(1,"IT2021-09-10-W01","1","1","a134ff7da2793aa9fe40807ceaa76ddc",8,157,"No backup",NULL,NULL,NULL,NULL,NULL,NULL,NULL,"2021-09-10","0000-00-00",NULL,"11:46:13",NULL);



# Dump of service 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS service;
CREATE TABLE service (
  se_id int(11) NOT NULL AUTO_INCREMENT,
  se_sort int(3) DEFAULT NULL,
  se_name varchar(200) NOT NULL,
  se_group varchar(100) DEFAULT NULL,
  se_status int(1) NOT NULL DEFAULT 1,
  data_time datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (se_id)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;



INSERT INTO service VALUES(1,1,"อุปกรณ์ (Hardware)","1",0,"2021-09-10 10:20:31");
INSERT INTO service VALUES(2,2,"โปรแกรม (Software)","1",0,"2021-09-10 10:28:16");
INSERT INTO service VALUES(3,3,"ระบบเครือข่าย (Network)","1",0,"2021-09-10 10:28:22");
INSERT INTO service VALUES(4,4,"สิทธิ์ใช้งานระบบ (Authorization)","1",0,"2021-09-10 10:14:41");
INSERT INTO service VALUES(5,6,"อื่นๆ (Other)","1",1,"2021-02-17 18:31:37");
INSERT INTO service VALUES(6,5,"ยืมอุปกรณ์ IT","1",0,"2021-09-10 10:32:03");
INSERT INTO service VALUES(7,1,"New User/Email","1",1,"2021-09-10 10:16:34");
INSERT INTO service VALUES(8,1,"Hardware Problem","1",1,"2021-09-10 10:20:56");
INSERT INTO service VALUES(9,1,"Relocate IT Equipments","1",1,"2021-09-10 10:26:21");
INSERT INTO service VALUES(10,1,"New Install IT Equipment","1",1,"2021-09-10 10:29:13");



# Dump of service_list 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS service_list;
CREATE TABLE service_list (
  se_li_id int(11) NOT NULL AUTO_INCREMENT,
  se_id int(11) NOT NULL,
  se_li_name varchar(200) NOT NULL,
  se_li_status int(1) NOT NULL DEFAULT 1,
  data_time datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (se_li_id,se_id)
) ENGINE=InnoDB AUTO_INCREMENT=169 DEFAULT CHARSET=utf8;



INSERT INTO service_list VALUES(1,1,"คอมพิวเตอร์เปิดไม่ติด/Computer Error",1,"2021-09-10 09:59:13");
INSERT INTO service_list VALUES(2,1,"Monitor - หน้าจอไม่มีภาพขึ้น, หน้าจอภาพเป็นเส้น, หน้าจอเสีย",1,"2020-05-15 15:52:27");
INSERT INTO service_list VALUES(3,1,"Printer - ปริ้นส์ไม่ออก, ปริ้นส์แล้วตัวหนังสือขาด ตกหล่น, ไม่ดึงกระดาษ, รหัสปริ้นหาย, หมึกหมด",1,"2020-05-15 15:52:27");
INSERT INTO service_list VALUES(4,1,"UPS  Not Backup- ไม่สำรองไฟ, เปิดไม่ติด, ขอเปลี่ยน, ขอเพิ่ม",1,"2021-09-10 10:05:15");
INSERT INTO service_list VALUES(5,1,"Printer Scanner - สแกนไม่ได้, ไม่มีแสกน",1,"2020-05-15 15:52:27");
INSERT INTO service_list VALUES(6,2,"Ms Word, Ms Excel เปิดไม่ขึ้น ค้าง ช้า",0,"2021-09-10 10:15:20");
INSERT INTO service_list VALUES(7,2,"Express ใช้งานไม่ได้ , Error ",0,"2021-09-10 10:13:10");
INSERT INTO service_list VALUES(8,2,"Browser Chrome, เปิดไม่ขึ้น ค้าง",1,"2020-05-15 15:52:27");
INSERT INTO service_list VALUES(9,3,"อินเตอร์เน็ทช้า/Internet Not Working",1,"2021-09-10 10:15:11");
INSERT INTO service_list VALUES(10,4,"ขอสิทธิ์การใช้งานระบบใหม่ , ยกเลิกสิทธิ์การใช้งานระบบ , เปลี่ยนแปลงสิทธิ์การใช้งาน",1,"2020-05-15 15:52:27");
INSERT INTO service_list VALUES(11,4,"ขอสิทธิ์การใช้ E-Mail , ยกเลิกสิทธิ์การใช้ E-Mail , เปลี่ยนแปลงสิทธิ์ E-Mail",1,"2020-05-15 15:52:27");
INSERT INTO service_list VALUES(99,1,"เครื่องปริ้นในครัว ปริ้นไม่ได้ , เปิดไม่ติด",1,"2021-01-12 22:35:37");
INSERT INTO service_list VALUES(100,2,"อื่น ๆ",0,"2021-09-10 10:14:33");
INSERT INTO service_list VALUES(101,3,"อื่น ๆ",1,"2020-05-15 15:52:27");
INSERT INTO service_list VALUES(102,4,"อื่น ๆ",1,"2020-05-15 15:52:27");
INSERT INTO service_list VALUES(109,1,"Keyboard, Mouse - ชำรุด, ค้าง, ขอเพิ่ม - เปลี่ยนใหม่",1,"2020-05-15 15:52:27");
INSERT INTO service_list VALUES(110,2,"ขอติดตั้งโปรแกรม, อัพเดตโปรแกรม, โปรแกรมค้าง ช้า",1,"2020-05-15 15:52:27");
INSERT INTO service_list VALUES(111,4,"ขอปลดล็อค Youtube, G-mail",1,"2020-05-15 15:52:27");
INSERT INTO service_list VALUES(113,1,"อุปกรณ์ IPAD สายชาร์จ,หัวชาร์จแบต ขาด ชำรุด",0,"2021-09-10 10:03:10");
INSERT INTO service_list VALUES(114,1,"ชุดอุปกรณ์ Tablet สายชาร์จ , หัวชาร์จ ขาด ชำรุด",0,"2021-09-10 10:03:05");
INSERT INTO service_list VALUES(115,1,"Office Printer Errror",1,"2021-09-10 10:03:33");
INSERT INTO service_list VALUES(116,1,"ขาตั้ง IPAD ชำรุด",0,"2021-09-10 10:01:02");
INSERT INTO service_list VALUES(117,1,"Notebook หน้าจอแตก , บานพับหัก ",0,"2021-09-10 10:01:34");
INSERT INTO service_list VALUES(118,6,"ขอยืมเครื่องสำรอง Notebook",1,"2021-01-12 22:48:02");
INSERT INTO service_list VALUES(119,6,"ขอยืมเครื่องสำรอง เครื่องปริ้นในครัว",1,"2021-01-12 22:48:24");
INSERT INTO service_list VALUES(120,6,"ขอยืมเครื่องสำรอง เครื่องปริ้นบิล",1,"2021-01-12 22:48:14");
INSERT INTO service_list VALUES(121,6,"ขอยืมเครื่องสำรอง เครื่องปริ้นเอกสาร",1,"2021-01-12 22:50:04");
INSERT INTO service_list VALUES(122,1,"Router , Hub ดับ , เสีย",1,"2021-01-12 22:51:20");
INSERT INTO service_list VALUES(123,1,"Wifi No Signal",1,"2021-09-10 10:00:46");
INSERT INTO service_list VALUES(124,1,"เครื่องสแกนนิ้ว/Finger Sacan/ Face Scan",1,"2021-09-10 09:58:00");
INSERT INTO service_list VALUES(134,1,"Internet not Working",1,"2021-09-10 09:59:53");
INSERT INTO service_list VALUES(139,2,"Winspeed ขึ้นไม่เชื่อมต่อฐานข้อมูล",0,"2021-09-10 10:11:15");
INSERT INTO service_list VALUES(140,2,"Winspeed เด้งหลุด , Error , ค้าง",0,"2021-09-10 10:13:33");
INSERT INTO service_list VALUES(141,2,"Cloud ไม่อัพเดทข้อมูล , ข้อมูลหาย",0,"2021-09-10 10:13:26");
INSERT INTO service_list VALUES(142,2,"โปรแกรมสแกนนิ้ว เปิดไม่ได้ , ข้อมูลไม่อัพเดท , ข้อมูลหาย",1,"2021-01-12 23:27:54");
INSERT INTO service_list VALUES(143,2,"Email ใช้งานไม่ได้ , หาย , ส่งไม่สำเร็จ , แจ้ง Email เต็ม , Ms Outlook เปิดไม่ขึ้น",1,"2021-01-12 23:32:48");
INSERT INTO service_list VALUES(144,2,"Prosoft Fixed Assets ขึ้นภาษาต่างด้าว , Winspeed ขึ้นภาษาต่างด้าว",1,"2021-01-12 23:38:07");
INSERT INTO service_list VALUES(145,2,"Prosoft Fixed Assets เชื่อมต่อไม่ได้ , Error",1,"2021-01-12 23:38:42");
INSERT INTO service_list VALUES(146,2,"BPlus Error , ค้าง , ช้า",0,"2021-09-10 10:07:31");
INSERT INTO service_list VALUES(147,2,"Windows Error",1,"2021-01-12 23:42:59");
INSERT INTO service_list VALUES(148,1,"อื่นๆ",1,"2021-01-12 23:48:25");
INSERT INTO service_list VALUES(149,6,"อื่นๆ",1,"2021-01-12 23:48:45");
INSERT INTO service_list VALUES(150,2,"Check SCM /New User Request",1,"2021-09-10 10:12:52");
INSERT INTO service_list VALUES(151,7,"New Email",1,"2021-09-10 10:17:07");
INSERT INTO service_list VALUES(152,7,"New Check SCM User",1,"2021-09-10 10:17:30");
INSERT INTO service_list VALUES(153,7,"New Comanche User",1,"2021-09-10 10:17:58");
INSERT INTO service_list VALUES(154,7,"New User Other Soffware",1,"2021-09-10 10:19:50");
INSERT INTO service_list VALUES(155,8,"Computer Error, cannot turning on",1,"2021-09-10 10:21:46");
INSERT INTO service_list VALUES(156,8,"Monitor error, No Picture",1,"2021-09-10 10:22:22");
INSERT INTO service_list VALUES(157,8,"UPS Error , not backup",1,"2021-09-10 10:23:18");
INSERT INTO service_list VALUES(158,8,"Other Hardware Error",1,"2021-09-10 10:24:10");
INSERT INTO service_list VALUES(159,9,"Moving Computer or Telephone",1,"2021-09-10 10:27:16");
INSERT INTO service_list VALUES(160,9,"Moving CCTV Camera",1,"2021-09-10 10:27:41");
INSERT INTO service_list VALUES(161,9,"Moving Other Equipments",1,"2021-09-10 10:31:49");
INSERT INTO service_list VALUES(162,10,"Install New Computer/Telephone/Monitor/UPS",1,"2021-09-10 10:29:55");
INSERT INTO service_list VALUES(163,10,"Install CCTV Camera",1,"2021-09-10 10:30:13");
INSERT INTO service_list VALUES(164,8,"CCTV Camera",1,"2021-09-10 10:30:44");
INSERT INTO service_list VALUES(165,8,"CCTV DVR/NVR",1,"2021-09-10 10:31:05");
INSERT INTO service_list VALUES(166,8,"CCTV Cable",1,"2021-09-10 10:31:21");
INSERT INTO service_list VALUES(167,8,"Printer Error",1,"2021-09-10 10:33:10");
INSERT INTO service_list VALUES(168,8,"Printer ink refill",1,"2021-09-10 10:33:32");



# Dump of system_alert 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS system_alert;
CREATE TABLE system_alert (
  alert_key char(150) NOT NULL,
  alert_line_token char(150) DEFAULT NULL,
  alert_mail_server varchar(255) DEFAULT NULL,
  alert_mail_user varchar(100) DEFAULT NULL,
  alert_mail_pass varchar(50) DEFAULT NULL,
  alert_mail_get varchar(50) DEFAULT NULL,
  PRIMARY KEY (alert_key)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO system_alert VALUES("cd5fe35c5af97026fd4efdfe4afd4376","ebukAPTkeYjIeGx8tDUZ49arAcuUxUcOiypOXGScfv2","mail.grandexclusive.com","asst.itmgr@grandexclusive.com","5570sREE","asst.itmgr@grandexclusive.com");



# Dump of system_info 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS system_info;
CREATE TABLE system_info (
  site_key char(32) NOT NULL,
  site_logo varchar(256) NOT NULL,
  site_favicon varchar(256) NOT NULL,
  site_name varchar(255) DEFAULT NULL,
  site_color_form varchar(255) DEFAULT NULL,
  site_color_name varchar(255) DEFAULT NULL,
  time_zone varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



INSERT INTO system_info VALUES("8f411b77c389d5de467af8f2c0e91cda","1519913221439.png","1519913221439.png","Service System IT Grand Exclusive","#030e44","#15aaf6","Asia/Bangkok");



# Dump of user 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS user;
CREATE TABLE user (
  id int(11) NOT NULL AUTO_INCREMENT,
  user_key char(32) NOT NULL,
  name varchar(64) NOT NULL,
  lastname varchar(64) DEFAULT NULL,
  username varchar(64) NOT NULL,
  password varchar(32) NOT NULL DEFAULT '81dc9bdb52d04dc20036dbd8313ed055',
  user_photo varchar(128) NOT NULL DEFAULT 'noimg.jpg',
  user_class tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=user,2=admin,3=super admin',
  user_status tinyint(1) NOT NULL DEFAULT 1,
  email varchar(128) DEFAULT NULL,
  data_time datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (id)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;



INSERT INTO user VALUES(1,"ce63f18f7cf0a712fd4a2f47bc9ae14c","ผู้ดูแล","ระบบ","superadmin","81dc9bdb52d04dc20036dbd8313ed055","noimg.jpg",3,1,"it@it.com","2021-02-10 17:05:12");
INSERT INTO user VALUES(2,"1d981e47f5ad141573972981228ff719","User","User","user","81dc9bdb52d04dc20036dbd8313ed055","noimg.jpg",1,0,"kongkiat.0174@gmail.com","2021-09-13 12:13:53");
INSERT INTO user VALUES(3,"6102dffc6c359d7584e559a061283aa3","เจ้าหน้าที่","เจ้าหน้าที่","admin","81dc9bdb52d04dc20036dbd8313ed055","noimg.jpg",2,1,"admin@helpdesk.com","2021-02-18 19:49:12");
INSERT INTO user VALUES(4,"6b45d93fd17e46642822b921a2c0490e","Sakchai","Nimdee","ITD","092251c6685da1f6a7e55781b5e22dd6","noimg.jpg",3,1,"itd@grandexclusive.com","2021-09-10 11:53:59");
INSERT INTO user VALUES(5,"a134ff7da2793aa9fe40807ceaa76ddc","ทดสอบ","Test","staff","81dc9bdb52d04dc20036dbd8313ed055","noimg.jpg",1,1,"staff@gdc.com","2021-09-10 11:13:02");
INSERT INTO user VALUES(6,"0f8a08fec826a7acad5362a9a852b9c9","SREESOPON","PEUNGNU","sreesopon","bc8102c6f52fd750eaaf8458ef23d57a","noimg.jpg",3,1,"asst.itmgr@grandexclusive.com","2021-09-10 11:54:07");
INSERT INTO user VALUES(7,"495f9422f4535f297070f191f2d86ce6","fo","office","fo","81dc9bdb52d04dc20036dbd8313ed055","noimg.jpg",1,1,"fo@grand.com","2021-09-13 11:59:23");
INSERT INTO user VALUES(8,"0b361318ce011cf280dcb1666366d3f3","็HK","office","hk","81dc9bdb52d04dc20036dbd8313ed055","noimg.jpg",1,1,"hk@grand.com","2021-09-13 12:01:17");
INSERT INTO user VALUES(9,"4e8617310a94ca7a188ca08096a50eac","ENG","Office","eng","81dc9bdb52d04dc20036dbd8313ed055","noimg.jpg",1,1,"eng@grand.com","2021-09-13 12:02:25");
INSERT INTO user VALUES(10,"57c058510745a772e659b8c87b461f7c","Casino","Office","casino","81dc9bdb52d04dc20036dbd8313ed055","noimg.jpg",1,1,"casino@grand.com","2021-09-13 12:03:40");
INSERT INTO user VALUES(11,"0554d7bed333bd2c10a0460987821fec","VIP","Office","vip","81dc9bdb52d04dc20036dbd8313ed055","noimg.jpg",1,1,"vip@grand.com","2021-09-13 12:19:09");
INSERT INTO user VALUES(12,"3a427c1c3667583f00afd36d6e6a52ea","HR","Office","hr","81dc9bdb52d04dc20036dbd8313ed055","noimg.jpg",1,1,"hr@grand.com","2021-09-13 12:20:09");
INSERT INTO user VALUES(13,"a4783cff0a1f50e1ab3a3f5ff9f04331","Accouting","Office","ac","81dc9bdb52d04dc20036dbd8313ed055","noimg.jpg",1,1,"ac@grand.com","2021-09-13 12:21:01");
INSERT INTO user VALUES(14,"12e326c5ffc11e6004c51a411d3d4ec2","Maketting","Office","MK","81dc9bdb52d04dc20036dbd8313ed055","noimg.jpg",1,1,"mk@grand.com","2021-09-13 12:23:34");
INSERT INTO user VALUES(15,"a34f44aad5d05e664fc99babd38244a4","F&amp;amp;B","Office","fb","81dc9bdb52d04dc20036dbd8313ed055","noimg.jpg",1,1,"fb@grand.com","2021-09-13 12:24:39");
INSERT INTO user VALUES(16,"d7dc317e3f0af0ff2cf20a711ec34f2c","KC","Office","kc","81dc9bdb52d04dc20036dbd8313ed055","noimg.jpg",1,1,"kc@grand.com","2021-09-13 12:25:58");
INSERT INTO user VALUES(17,"d92673f179a14e69f329d07a43d5eec1","Security","Office","sc","81dc9bdb52d04dc20036dbd8313ed055","noimg.jpg",1,1,"sc@grand.com","2021-09-13 12:26:56");
INSERT INTO user VALUES(18,"a4ca6bec3d8fd3d121a71493a45ad9ec","Transport","Office","ts","81dc9bdb52d04dc20036dbd8313ed055","noimg.jpg",1,1,"ts@grand.com","2021-09-13 12:27:52");
INSERT INTO user VALUES(19,"97eacefa54562d4a83d5d1a1295949c5","Grand Residence","Office","GR","81dc9bdb52d04dc20036dbd8313ed055","noimg.jpg",1,1,"gr@grand.com","2021-09-13 12:29:15");



# Dump of user_online 
# Dump DATE : 13-Sep-2021

DROP TABLE IF EXISTS user_online;
CREATE TABLE user_online (
  osession varchar(128) CHARACTER SET utf8 NOT NULL DEFAULT '',
  user_key varchar(32) CHARACTER SET utf8 NOT NULL,
  otime int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



INSERT INTO user_online VALUES("95522vphtn7a7tbgki5envcgs4","85dc6d4bd6e7189330a9e2b7b39408c2",1566376833);



