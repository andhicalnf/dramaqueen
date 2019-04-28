TYPE=TRIGGERS
triggers='CREATE DEFINER=`root`@`localhost` TRIGGER `dvd`.`stokUpdate` AFTER INSERT on `dvd`.`dvd`\nFOR EACH ROW BEGIN\nUPDATE dvd\nINNER JOIN sewa ON (dvd.id_dvd = sewa.id_dvd)\nSET\n dvd.stok = (dvd.stok - sewa.qty)\nWHERE \n dvd.id_dvd = \'".$id_dvd."\';  \nEND'
sql_modes=0
definers='root@localhost'
client_cs_names='latin1'
connection_cl_names='latin1_swedish_ci'
db_cl_names='latin1_swedish_ci'
created=151327382476
