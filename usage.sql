USE tmp_data_pegawai;

-- Data Pribadi
SELECT * FROM view_data_pribadi;

-- Jabatan
SELECT * FROM view_jabatan;

-- Alamat
SELECT * FROM view_alamat;

-- Keluarga
SELECT * FROM view_keluarga;

-- Pendidikan
SELECT * FROM view_pendidikan;

-- Hirarki
SELECT * FROM view_hirarki;     -- ? View: Fix 8 Level Column

EXEC get_all_hirarki;           -- ? Procedure: Dynamic Column

-- Pegawai CV
SELECT * FROM view_pegawai_cv;