TYPE=VIEW
query=select `dvd`.`sewa`.`no_sewa` AS `no_sewa`,`dvd`.`sewa`.`id_dvd` AS `id_dvd`,`dvd`.`sewa`.`judul` AS `judul`,`dvd`.`sewa`.`harga` AS `harga`,`dvd`.`sewa`.`qty` AS `qty`,`dvd`.`sewa`.`tgl_sewa` AS `tgl_sewa`,`dvd`.`dvd`.`stok` AS `stok`,(`dvd`.`sewa`.`harga` * `dvd`.`sewa`.`qty`) AS `jumlah` from (`dvd`.`sewa` join `dvd`.`dvd` on((`dvd`.`sewa`.`id_dvd` = `dvd`.`dvd`.`id_dvd`)))
md5=d4eff626007da4803586e08f4d5c3654
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=2017-12-20 02:49:09
create-version=1
source=SELECT  sewa.no_sewa, sewa.id_dvd, sewa.judul, sewa.harga, sewa.qty, sewa.tgl_sewa, dvd.stok, sewa.harga * sewa.qty AS jumlah\n     FROM sewa \n	JOIN dvd \n     ON sewa.id_dvd = dvd.id_dvd
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `dvd`.`sewa`.`no_sewa` AS `no_sewa`,`dvd`.`sewa`.`id_dvd` AS `id_dvd`,`dvd`.`sewa`.`judul` AS `judul`,`dvd`.`sewa`.`harga` AS `harga`,`dvd`.`sewa`.`qty` AS `qty`,`dvd`.`sewa`.`tgl_sewa` AS `tgl_sewa`,`dvd`.`dvd`.`stok` AS `stok`,(`dvd`.`sewa`.`harga` * `dvd`.`sewa`.`qty`) AS `jumlah` from (`dvd`.`sewa` join `dvd`.`dvd` on((`dvd`.`sewa`.`id_dvd` = `dvd`.`dvd`.`id_dvd`)))
