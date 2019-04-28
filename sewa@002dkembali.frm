TYPE=VIEW
query=(select `dvd`.`sewa`.`no_sewa` AS `no_sewa`,`dvd`.`sewa`.`id_dvd` AS `id_dvd`,`dvd`.`sewa`.`judul` AS `judul`,`dvd`.`sewa`.`qty` AS `qty`,`dvd`.`sewa`.`harga` AS `harga`,`dvd`.`sewa`.`tgl_sewa` AS `tgl_sewa`,`dvd`.`sewa`.`nama_petugas` AS `nama_petugas`,`dvd`.`sewa`.`nama_penyewa` AS `nama_penyewa` from (`dvd`.`sewa` join `dvd`.`kembali` on((`dvd`.`sewa`.`no_sewa` = `dvd`.`kembali`.`no_sewa`))))
md5=1b9a365198fd73e77f51e6897cb91066
updatable=1
algorithm=0
definer_user=root
definer_host=localhost
suid=2
with_check_option=0
timestamp=2017-12-17 17:52:01
create-version=1
source=(SELECT sewa.no_sewa, sewa.id_dvd, sewa.judul, sewa.qty, sewa.harga, sewa.tgl_sewa, sewa.nama_petugas, sewa.nama_penyewa\nFROM sewa INNER JOIN kembali\nON sewa.no_sewa=kembali.no_sewa)
client_cs_name=latin1
connection_cl_name=latin1_swedish_ci
view_body_utf8=(select `dvd`.`sewa`.`no_sewa` AS `no_sewa`,`dvd`.`sewa`.`id_dvd` AS `id_dvd`,`dvd`.`sewa`.`judul` AS `judul`,`dvd`.`sewa`.`qty` AS `qty`,`dvd`.`sewa`.`harga` AS `harga`,`dvd`.`sewa`.`tgl_sewa` AS `tgl_sewa`,`dvd`.`sewa`.`nama_petugas` AS `nama_petugas`,`dvd`.`sewa`.`nama_penyewa` AS `nama_penyewa` from (`dvd`.`sewa` join `dvd`.`kembali` on((`dvd`.`sewa`.`no_sewa` = `dvd`.`kembali`.`no_sewa`))))
