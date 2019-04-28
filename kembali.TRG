TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `pengembalian_dvd` AFTER INSERT ON `kembali` FOR EACH ROW BEGIN\n	UPDATE dvd SET stok=stok+NEW.qty\n    WHERE  id_dvd = NEW.id_dvd;\nEND'
sql_modes=1436549152
definers='root@localhost'
client_cs_names='utf8mb4'
connection_cl_names='utf8mb4_unicode_ci'
db_cl_names='latin1_swedish_ci'
created=151345900220
