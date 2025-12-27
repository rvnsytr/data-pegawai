CREATE DATABASE tmp_data_pegawai;

USE tmp_data_pegawai;

CREATE TABLE hirarki
(
    kode_posisi NVARCHAR(50) NOT NULL,
    posisi_id_sap NVARCHAR(50) NOT NULL PRIMARY KEY,
    position_title NVARCHAR(255) NOT NULL,
    deskripsi_jabatan NVARCHAR(MAX) NOT NULL,

    kode_satker NVARCHAR(20),
    org_unit_id NVARCHAR(50) NOT NULL,
    org_unit_title NVARCHAR(255) NOT NULL,

    kode_posisi_superior NVARCHAR(50) NOT NULL,
    posisi_id_sap_superior NVARCHAR(50) NOT NULL,
    position_superior_title NVARCHAR(255),

    kode_satker_superior NVARCHAR(20),
    org_unit_id_superior NVARCHAR(50),
    org_unit_superior_title NVARCHAR(255),
);

CREATE TABLE data_pribadi
(
    nik NVARCHAR(20) NOT NULL PRIMARY KEY,
    nopeg_sk NVARCHAR(20) NOT NULL,
    nama_pegawai NVARCHAR(255) NOT NULL,

    kategori NVARCHAR(30),
    ee_group NVARCHAR(20),
    ee_subgroup NVARCHAR(20),
    mpl NVARCHAR(20),

    start_date DATE,
    end_date DATE,
    masuk_kerja DATE,
    masa_kerja INT,
    rentang_kerja NVARCHAR(20),
    cuti_besar DATE,
    pensiun DATE,
    tenure_pwc NVARCHAR(20),
    tenure_danantara NVARCHAR(20),

    kode_satker NVARCHAR(20),
    satker NVARCHAR(255),
    org_unit_id_sap NVARCHAR(20),
    direktorat NVARCHAR(255),
    department NVARCHAR(255),
    divisi NVARCHAR(255),
    subdivisi NVARCHAR(255),
    section NVARCHAR(255),
    subsection NVARCHAR(255),
    cost_center NVARCHAR(30),

    kode_posisi NVARCHAR(50),
    posisi_id_sap NVARCHAR(50),
    jabatan NVARCHAR(255),
    level_jabatan NVARCHAR(20),
    physical_location NVARCHAR(100),
    lokasi_kerja NVARCHAR(100),

    tempat_lahir NVARCHAR(100),
    tanggal_lahir DATE,
    tanggal_menikah DATE,
    jenis_kelamin CHAR(1),  -- 'L' | 'P'
    -- gender NVARCHAR(8),  -- 'Male' | 'Female'
    golongan_darah NVARCHAR(5),
    agama NVARCHAR(50),
    marital_status NVARCHAR(30),
    tanggungan INT,

    email NVARCHAR(255),
    no_hp NVARCHAR(30),

    umur INT,
    umur_pwc NVARCHAR(20),
    umur_mind_id NVARCHAR(20),
    umur_danantara NVARCHAR(20),

    no_ktp NVARCHAR(30),
    no_npwp NVARCHAR(30),
    no_bpjs NVARCHAR(30),
    no_bp_pegawai NVARCHAR(30),

    dplk_no1 NVARCHAR(30),
    dplk_no2 NVARCHAR(30),
    gdp NVARCHAR(10),

    CONSTRAINT fk__data_pribadi_posisi_id_sap FOREIGN KEY (posisi_id_sap) REFERENCES hirarki(posisi_id_sap)
);

CREATE TABLE jabatan
(
    nik NVARCHAR(20) NOT NULL,
    nopeg_sk NVARCHAR(20),
    nama_pegawai NVARCHAR(255),

    tipe NVARCHAR(20),

    kode_posisi NVARCHAR(50),
    posisi_id_sap NVARCHAR(50),
    jabatan NVARCHAR(255),

    start_date DATE,
    end_date DATE,

    CONSTRAINT fk_jabatan_nik FOREIGN KEY (nik) REFERENCES data_pribadi(nik)
)

CREATE TABLE alamat
(
    nik NVARCHAR(20) NOT NULL,
    nopeg_sk NVARCHAR(20),
    nama_pegawai NVARCHAR(255),

    jenis_alamat NVARCHAR(20),

    alamat NVARCHAR(MAX),
    kota NVARCHAR(100),
    kode_provinsi NVARCHAR(10),
    provinsi NVARCHAR(100),

    start_date DATE,
    end_date DATE,

    CONSTRAINT fk_alamat_nik FOREIGN KEY (nik) REFERENCES data_pribadi(nik)
);

CREATE TABLE keluarga
(
    nik NVARCHAR(20) NOT NULL,
    nopeg_sk NVARCHAR(20),
    nama_pegawai NVARCHAR(255),

    subtype_family NVARCHAR(10),
    tipe_keluarga NVARCHAR(100),
    nama_keluarga NVARCHAR(255),
    tanggal_lahir DATE,
    jenis_kelamin CHAR(1),

    nik_pasangan NVARCHAR(20),
    status NVARCHAR(50),

    start_date DATE,
    end_date DATE,

    CONSTRAINT fk_keluarga_nik FOREIGN KEY (nik) REFERENCES data_pribadi(nik)
);

CREATE TABLE pendidikan
(
    nik NVARCHAR(20) NOT NULL,
    nopeg_sk NVARCHAR(20),
    nama_pegawai NVARCHAR(255),

    tipe NVARCHAR(20),

    level_pendidikan NVARCHAR(30),
    kode_pendidikan NVARCHAR(20),
    kejurusan NVARCHAR(255),
    institute NVARCHAR(255),
    pendidikan_saat_hiring NVARCHAR(30),

    start_date DATE,
    end_date DATE,

    CONSTRAINT fk_pendidikan_nik FOREIGN KEY (nik) REFERENCES data_pribadi(nik)
);
