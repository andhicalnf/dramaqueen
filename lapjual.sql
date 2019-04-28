
CREATE
    /*[ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]
    [DEFINER = { user | CURRENT_USER }]
    [SQL SECURITY { DEFINER | INVOKER }]*/
    VIEW `dvd`.`lapjual` 
    AS
    SELECT  sewa.no_sewa, sewa.id_dvd, sewa.judul, sewa.harga, sewa.qty, sewa.tgl_sewa, dvd.stok, sewa.harga * sewa.qty AS jumlah
     FROM sewa 
	JOIN dvd 
     ON sewa.id_dvd = dvd.id_dvd;