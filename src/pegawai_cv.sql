USE tmp_data_pegawai;

CREATE OR ALTER VIEW view_pegawai_cv AS
SELECT
    dp.nik,
    dp.nopeg_sk,
    dp.nama_pegawai,
    'data pribadi' AS tipe,

    -- data pribadi columns
    dp.kategori, dp.ee_group, dp.ee_subgroup, dp.mpl, dp.level_jabatan,
    dp.start_date, dp.end_date, dp.masuk_kerja, dp.masa_kerja, dp.rentang_kerja,
    dp.cuti_besar, dp.pensiun, dp.tenure_pwc, dp.tenure_danantara,
    dp.org_unit_id_sap, dp.direktorat, dp.department, dp.divisi, dp.subdivisi,
    dp.section, dp.subsection, dp.cost_center,
    dp.physical_location, dp.lokasi_kerja,

    dp.tempat_lahir, dp.tanggal_lahir, dp.tanggal_menikah, dp.jenis_kelamin,
    dp.golongan_darah, dp.agama, dp.marital_status, dp.tanggungan,
    dp.email, dp.no_hp,
    dp.umur, dp.umur_pwc, dp.umur_mind_id, dp.umur_danantara,
    dp.no_ktp, dp.no_npwp, dp.no_bpjs, dp.no_bp_pegawai,
    dp.dplk_no1, dp.dplk_no2, dp.gdp,

    -- jabatan
    NULL AS kode_posisi,
    NULL AS posisi_id_sap,
    NULL AS jabatan,
    NULL AS jabatan_start_date,
    NULL AS jabatan_end_date,

    -- alamat
    NULL AS jenis_alamat,
    NULL AS alamat,
    NULL AS kota,
    NULL AS kode_provinsi,
    NULL AS provinsi,
    NULL AS alamat_start_date,
    NULL AS alamat_end_date,

    -- keluarga
    NULL AS subtype_family,
    NULL AS tipe_keluarga,
    NULL AS nama_keluarga,
    NULL AS tanggal_lahir_keluarga,
    NULL AS gender_keluarga,
    NULL AS nik_pasangan,
    NULL AS status_keluarga,
    NULL AS keluarga_start_date,
    NULL AS keluarga_end_date,

    -- pendidikan
    NULL AS tipe_pendidikan,
    NULL AS level_pendidikan,
    NULL AS kode_pendidikan,
    NULL AS kejurusan,
    NULL AS institute,
    NULL AS pendidikan_saat_hiring,
    NULL AS pendidikan_start_date,
    NULL AS pendidikan_end_date

FROM data_pribadi dp

UNION ALL

SELECT
    j.nik,
    j.nopeg_sk,
    j.nama_pegawai,
    'jabatan' AS tipe,

    -- data pribadi
    NULL,NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,
    NULL,NULL,
    NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,NULL,
    NULL,NULL,
    NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,

    -- jabatan
    j.kode_posisi,
    j.posisi_id_sap,
    j.jabatan,
    j.start_date,
    j.end_date,

    -- alamat
    NULL,NULL,NULL,NULL,NULL,NULL,NULL,

    -- keluarga
    NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,

    -- pendidikan
    NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL
FROM jabatan j

UNION ALL

SELECT
    a.nik,
    a.nopeg_sk,
    a.nama_pegawai,
    'alamat' AS tipe,

    -- data pribadi
    NULL,NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,
    NULL,NULL,
    NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,NULL,
    NULL,NULL,
    NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,

    -- jabatan
    NULL,NULL,NULL,NULL,NULL,

    -- alamat
    a.jenis_alamat,
    a.alamat,
    a.kota,
    a.kode_provinsi,
    a.provinsi,
    a.start_date,
    a.end_date,

    -- keluarga
    NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,

    -- pendidikan
    NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL
FROM alamat a

UNION ALL

SELECT
    k.nik,
    k.nopeg_sk,
    k.nama_pegawai,
    'keluarga' AS tipe,

    -- data pribadi
    NULL,NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,
    NULL,NULL,
    NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,NULL,
    NULL,NULL,
    NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,

    -- jabatan
    NULL,NULL,NULL,NULL,NULL,

    -- alamat
    NULL,NULL,NULL,NULL,NULL,NULL,NULL,

    -- keluarga
    k.subtype_family,
    k.tipe_keluarga,
    k.nama_keluarga,
    k.tanggal_lahir,
    k.jenis_kelamin,
    k.nik_pasangan,
    k.status,
    k.start_date,
    k.end_date,

    -- pendidikan
    NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL
FROM keluarga k

UNION ALL

SELECT
    p.nik,
    p.nopeg_sk,
    p.nama_pegawai,
    'pendidikan' AS tipe,

    -- data pribadi
    NULL,NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,
    NULL,NULL,
    NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,NULL,
    NULL,NULL,
    NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,NULL,
    NULL,NULL,NULL,

    -- jabatan
    NULL,NULL,NULL,NULL,NULL,

    -- alamat
    NULL,NULL,NULL,NULL,NULL,NULL,NULL,

    -- keluarga
    NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,

    -- pendidikan
    p.tipe,
    p.level_pendidikan,
    p.kode_pendidikan,
    p.kejurusan,
    p.institute,
    p.pendidikan_saat_hiring,
    p.start_date,
    p.end_date
FROM pendidikan p;
GO
