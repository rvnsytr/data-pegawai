USE tmp_data_pegawai;

CREATE OR ALTER VIEW view_data_pribadi AS
SELECT
    dp.nik,
    dp.nopeg_sk,
    dp.nama_pegawai,

    dp.kategori,
    dp.ee_group,
    dp.ee_subgroup,
    dp.mpl,
    dp.level_jabatan,

    dp.start_date,
    dp.end_date,
    dp.masuk_kerja,
    dp.masa_kerja,
    dp.rentang_kerja,
    dp.cuti_besar,
    dp.pensiun,
    dp.tenure_pwc,
    dp.tenure_danantara,

    -- dp.kode_satker,
    -- dp.satker,
    dp.org_unit_id_sap,
    dp.direktorat,
    dp.department,
    dp.divisi,
    dp.subdivisi,
    dp.section,
    dp.subsection,
    dp.cost_center,

    -- dp.kode_posisi,
    -- dp.posisi_id_sap,
    -- dp.jabatan,
    dp.physical_location,
    dp.lokasi_kerja,

    dp.tempat_lahir,
    dp.tanggal_lahir,
    dp.tanggal_menikah,
    dp.jenis_kelamin,
    dp.golongan_darah,
    dp.agama,
    dp.marital_status,
    dp.tanggungan,

    dp.email,
    dp.no_hp,

    dp.umur,
    dp.umur_pwc,
    dp.umur_mind_id,
    dp.umur_danantara,

    dp.no_ktp,
    dp.no_npwp,
    dp.no_bpjs,
    dp.no_bp_pegawai,

    dp.dplk_no1,
    dp.dplk_no2,
    dp.gdp,

    h.kode_posisi,
    h.posisi_id_sap,
    COALESCE(h.position_title, dp.jabatan) AS jabatan,
    h.deskripsi_jabatan,

    h.kode_satker,
    h.org_unit_id,
    h.org_unit_title as satker
FROM data_pribadi dp
LEFT JOIN hirarki h
ON dp.posisi_id_sap = h.posisi_id_sap;

CREATE OR ALTER VIEW view_jabatan AS
SELECT
    dp.nik,
    dp.nopeg_sk,
    dp.nama_pegawai,

    j.tipe,

    h.kode_posisi,
    h.posisi_id_sap,
    COALESCE(h.position_title, j.jabatan) AS jabatan,

    j.start_date,
    j.end_date
FROM jabatan j
LEFT JOIN hirarki h
    ON j.kode_posisi = h.kode_posisi
    AND j.posisi_id_sap = h.posisi_id_sap
LEFT JOIN data_pribadi dp
    ON j.nik = dp.nik;

CREATE OR ALTER VIEW view_alamat AS
SELECT
    dp.nik,
    dp.nopeg_sk,
    dp.nama_pegawai,

    a.jenis_alamat,

    a.alamat,
    a.kota,
    a.kode_provinsi,
    a.provinsi,

    a.start_date,
    a.end_date
FROM alamat a
LEFT JOIN data_pribadi dp
    ON a.nik = dp.nik;

CREATE OR ALTER VIEW view_keluarga AS
SELECT
    dp.nik,
    dp.nopeg_sk,
    dp.nama_pegawai,

    k.subtype_family,
    k.tipe_keluarga,
    k.nama_keluarga,
    k.tanggal_lahir,
    k.jenis_kelamin,

    k.nik_pasangan,
    k.status,

    k.start_date,
    k.end_date
FROM keluarga k
LEFT JOIN data_pribadi dp
    ON k.nik = dp.nik;

CREATE OR ALTER VIEW view_pendidikan AS
SELECT
    dp.nik,
    dp.nopeg_sk,
    dp.nama_pegawai,

    p.tipe,

    p.level_pendidikan,
    p.kode_pendidikan,
    p.kejurusan,
    p.institute,
    p.pendidikan_saat_hiring,

    p.start_date,
    p.end_date
FROM pendidikan p
LEFT JOIN data_pribadi dp
    ON p.nik = dp.nik;

