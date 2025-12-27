USE tmp_data_pegawai;

INSERT INTO hirarki
    (kode_posisi, posisi_id_sap, position_title, deskripsi_jabatan, kode_satker, org_unit_id, org_unit_title, kode_posisi_superior, posisi_id_sap_superior, position_superior_title, kode_satker_superior, org_unit_id_superior, org_unit_superior_title)
VALUES
('300', '10000002', 'Direktur Keuangan dan Manajemen Risiko', 'Direktur Keuangan dan Manajemen Risiko', '3000', '30000002', 'Direktorat Keuangan dan Manajemen Risiko', 'TOP', '10000002', NULL, NULL, NULL, NULL),
('331000000N', '10002384', 'ERP Implementation Project Head', 'ERP Implementation Project Head', '3060', '30000019', 'ERP Implementation Project', '300', '10002384', NULL, '-','30000002', 'Direktorat Keuangan dan Manajemen Risiko'),
('331100000N', '10002386', 'ERP Integration Head', 'ERP Integration Head', '3060', '30000074', 'ERP Integration', '331000000N', '10002386', NULL, '3060','30000019', 'ERP Implementation Project'),
('331110000N', '10001546', 'Senior ERP Integration Specialist', 'Senior ERP Integration Specialist', '3060', '30000074', 'ERP Integration', '331100000N', '10001546', NULL, '3060','30000019', 'ERP Implementation Project'),
('331110000N', '10001547', 'Senior ERP Integration Specialist', 'Senior ERP Integration Specialist', '3060', '30000074', 'ERP Integration', '331100000N', '10001547', NULL, '3060','30000019', 'ERP Implementation Project'),
('331110000N', '10001548', 'Senior ERP Integration Specialist', 'Senior ERP Integration Specialist', '3060', '30000074', 'ERP Integration', '331100000N', '10001548', NULL, '3060','30000019', 'ERP Implementation Project'),
('331110000N', '10001549', 'Senior ERP Integration Specialist', 'Senior ERP Integration Specialist', '3060', '30000074', 'ERP Integration', '331100000N', '10001549', NULL, '3060','30000019', 'ERP Implementation Project'),
('331110000N', '10001550', 'Senior ERP Integration Specialist', 'Senior ERP Integration Specialist', '3060', '30000074', 'ERP Integration', '331112222N', '1555555555', NULL, '-','33333333','ERP Implementation Project');

INSERT INTO data_pribadi
    (
        nik, nama_pegawai, nopeg_sk,
        kategori, ee_group, ee_subgroup, mpl, level_jabatan,
        start_date, end_date, masuk_kerja, masa_kerja, rentang_kerja, cuti_besar, pensiun, tenure_pwc, tenure_danantara,
        kode_satker, satker, org_unit_id_sap, direktorat, department, divisi, subdivisi, section, subsection, cost_center,
        kode_posisi, posisi_id_sap, jabatan, physical_location, lokasi_kerja,
        tempat_lahir, tanggal_lahir, tanggal_menikah, jenis_kelamin, golongan_darah, agama, marital_status, tanggungan,
        email, no_hp,
        umur, umur_pwc, umur_mind_id, umur_danantara,
        no_ktp, no_npwp, no_bpjs, no_bp_pegawai,
        dplk_no1, dplk_no2, gdp
    )
VALUES
    (
        '00030557', 'Budi Hartono', '7394130557',
        'Gen X', '1', '15', 'M20', '3',
        '2025-01-01', '9999-12-31', '1994-10-01', 30, '26-30', '2029-10-01', '2023-01-01', '25-30', '≥25',
        '3060', 'Proyek Impl. ERP', '30000074', 'Direktorat Keuangan dan Manajemen Risiko', 'ERP Implementation', 'ERP Implementation Project', NULL, NULL, NULL, 'ZERP001',
        '331110000N', '10001546', 'Sr. ERP Integration Spc.', 'Tanjung Enim', 'GUBA',
        'Palembang', '1973-12-24', '1999-02-10', 'L', 'O', 'Islam', 'Kawin', 3,
        'bhartono@bukitasam.co.id', '081234567890',
        51, '51-56', '51-56', '51-56',
        '1234567890123450', '123456789012345', '0001234567890', 'BPJSPG001',
        'DPLK1234567', NULL, NULL
    ),

    -- Dummy Data
    (
        '00010001', 'Anton Prabowo', '7394100001',
        'Baby Boomer', '1', '20', 'M25', '1',
        '2020-01-01', '9999-12-31', '1990-06-15', 35, '31-35', '2030-06-15', '2028-01-01', '≥25', '≥25',
        '3000', 'Direktorat Keu. & MR', '30000002', 'Direktorat Keuangan dan Manajemen Risiko', NULL, NULL, NULL, NULL, NULL, 'ZDIR001',
        '300', '10000002', 'Direktur Keuangan & MR', 'Jakarta HQ', 'Jakarta',
        'Surabaya', '1965-11-02', '1992-08-07', 'L', 'A', 'Islam', 'Kawin', 3,
        'anton.prabowo@bukitasam.co.id', '081200000001',
        60, '≥56', '≥56', '≥56',
        '1111000000000001', '12.345.678.9-000.111', '0001112223334', 'BPJS-DIR001',
        'DPLK-DIR001', NULL, NULL
    ),
    (
        '00020002', 'Maya Lestari', '7394200002',
        'Gen X', '1', '18', 'M22', '2',
        '2021-03-01', '9999-12-31', '2005-09-20', 19, '16-20', '2030-09-20', '2045-01-01', '15-20', '≥15',
        '3060', 'Proyek Impl. ERP', '30000019', 'Direktorat Keuangan dan Manajemen Risiko', 'ERP Implementation Project', NULL, NULL, NULL, NULL, 'ZERP-H001',
        '331000000N', '10002384', 'ERP Implementation Project Head', 'Tanjung Enim', 'GUBA',
        'Yogyakarta', '1980-03-14', '2007-07-10', 'P', 'B', 'Islam', 'Kawin', 2,
        'maya.lestari@bukitasam.co.id', '081200000002',
        45, '41-45', '41-45', '41-45',
        '2222000000000002', '98.765.432.1-222.333', '1112223334445', 'BPJS-ERP-H001',
        'DPLK-ERP-H001', NULL, NULL
    ),
    (
        '00030003', 'Rama Wijaya', '7394300003',
        'Millennial', '1', '17', 'M20', '2',
        '2022-06-01', '9999-12-31', '2010-04-12', 14, '11-15', '2027-04-12', '2050-01-01', '10-15', '10-15',
        '3060', 'ERP Integration', '30000074', 'Direktorat Keuangan dan Manajemen Risiko', 'ERP Integration', NULL, NULL, NULL, NULL, 'ZERP-H002',
        '331100000N', '10002386', 'ERP Integration Head', 'Tanjung Enim', 'GUBA',
        'Padang', '1987-09-05', '2016-12-01', 'L', 'O', 'Islam', 'Kawin', 1,
        'rama.wijaya@bukitasam.co.id', '081200000003',
        38, '36-40', '36-40', '36-40',
        '3333000000000003', '77.555.444.2-999.000', '2223334445556', 'BPJS-ERP-H002',
        'DPLK-ERP-H002', NULL, NULL
    ),
    (
        '00030558', 'Siti Aminah', '7394130558',
        'Gen X', '1', '15', 'M20', '3',
        '2025-01-01', '9999-12-31', '1995-11-15', 29, '26-30', '2029-11-15', '2024-01-01', '25-30', '≥25',
        '3060', 'Proyek Impl. ERP', '30000074', 'Direktorat Keuangan dan Manajemen Risiko', 'ERP Implementation', 'ERP Implementation Project', NULL, NULL, NULL, 'ZERP002',
        '331110000N', '10001549', 'Sr. ERP Integration Spc.', 'Tanjung Enim', 'GUBA',
        'Palembang', '1975-05-30', '2000-06-20', 'P', 'A', 'Islam', 'Kawin', 2,
        'siti.aminah@bukitasam.co.id', '081234567891',
        49, '46-50', '46-50', '46-50',
        '1234567890123451', '123456789012346', '0001234567891', 'BPJSPG002',
        'DPLK1234568', NULL, NULL
    );

INSERT INTO jabatan
    (nik, tipe, nopeg_sk, nama_pegawai, kode_posisi, posisi_id_sap, jabatan, start_date, end_date)
VALUES
    ('00030557', 'jabatan', '7394130557', 'Budi Hartono', '331110000N', '10001546', 'Sr. ERP Integration Spc.', '2025-01-01', '9999-12-31'),
    ('00030557', 'jabatan', '7394130557', 'Budi Hartono', NULL, NULL, 'Spesialis Aplikasi Si SDM Muda', '2025-01-01', '9999-12-31'),
    ('00030557', 'jabatan', '7394130557', 'Budi Hartono', NULL, NULL, 'Juru Reparasi Listrik', '2025-01-01', '9999-12-31'),
    ('00030557', 'jabatan', '7394130557', 'Budi Hartono', NULL, NULL, 'Spesialis Lan Dan Wan', '2025-01-01', '9999-12-31'),
    ('00030557', 'jabatan', '7394130557', 'Budi Hartono', NULL, NULL, 'Am Administrasi Kepegawaian', '2025-01-01', '9999-12-31'),
    ('00030557', 'jabatan', '7394130557', 'Budi Hartono', NULL, NULL, 'Am Administrasi Kepegawaian', '2025-01-01', '9999-12-31'),
    ('00030557', 'jabatan', '7394130557', 'Budi Hartono', NULL, NULL, 'Am Administrasi Kepegawaian', '2025-01-01', '9999-12-31'),
    ('00030557', 'jabatan', '7394130557', 'Budi Hartono', NULL, NULL, 'Sr. Erp Integration Spc.', '2025-01-01', '9999-12-31'),
    ('00030557', 'jabatan', '7394130557', 'Budi Hartono', NULL, NULL, 'Spesialis Sistem Muda', '2025-01-01', '9999-12-31'),
    ('00030557', 'jabatan', '7394130557', 'Budi Hartono', NULL, NULL, 'Juru Reparasi Listrik', '2025-01-01', '9999-12-31'),
    ('00030557', 'jabatan', '7394130557', 'Budi Hartono', NULL, NULL, 'Senior Specialist Erp', '2025-01-01', '9999-12-31'),
    ('00030557', 'jabatan', '7394130557', 'Budi Hartono', NULL, NULL, 'Spesialis Sistem', '2025-01-01', '9999-12-31'),
    ('00030557', 'jabatan', '7394130557', 'Budi Hartono', NULL, NULL, 'Spesialis Aplikasi Si Sdm Muda', '2025-01-01', '9999-12-31'),
    ('00030557', 'jabatan', '7394130557', 'Budi Hartono', NULL, NULL, 'Calon Pegawai/Mulai Kerja', '2025-01-01', '9999-12-31');

INSERT INTO alamat
    (nik, nopeg_sk, nama_pegawai, jenis_alamat, alamat, kota, kode_provinsi, provinsi, start_date, end_date)
VALUES
    ('00030557', '7394130557', 'Budi Hartono', '1', 'Jl. Tanjung Enim No.1', 'Muara Enim', '11', 'Sumatera Selatan', '2024-01-01', '9999-12-31');

INSERT INTO keluarga
    (nik, nopeg_sk, nama_pegawai, subtype_family, tipe_keluarga, nama_keluarga, tanggal_lahir, jenis_kelamin, nik_pasangan, status, start_date, end_date)
VALUES
    ('00030557', '7394130557', 'Budi Hartono', '1', 'Pasangan (Istri/Suami)', 'Ana Trisnawani', '1980-10-14', 'P', '00030999', '1 Class 1', '1975-02-10', '9999-12-31'),
    ('00030557', '7394130557', 'Budi Hartono', '2', 'Anak', 'M. Farel Asyrofi', '2001-10-30', 'L', NULL, '3 Class 3', '2000-01-01', '9999-12-31'),
    ('00030557', '7394130557', 'Budi Hartono', '2', 'Anak', 'Muhammad Fadil Gymnastiar', '2005-06-18', 'L', NULL, '1 Class 1', '2022-01-01', '9999-12-31'),
    ('00030557', '7394130557', 'Budi Hartono', '2', 'Anak', 'Zaskya Aisyah', '2008-08-16', 'P', NULL, '1 Class 1', '2024-01-01', '9999-12-31'),
    ('00030557', '7394130557', 'Budi Hartono', '12', 'Ibu', 'Nurbaiti', '1932-12-31', 'P', NULL, '3 Class 3', '1950-01-01', '9999-12-31'),
    ('00030557', '7394130557', 'Budi Hartono', '22', 'Mertua Perempuan', 'Maimunah', '1932-12-31', 'P', NULL, '3 Class 3', '1960-01-01', '9999-12-31'),
    ('00030557', '7394130557', 'Budi Hartono', '21', 'Mertua Laki', 'M Syafe''i', '1927-12-31', 'L', NULL, '3 Class 3', '1961-01-01', '9999-12-31'),
    ('00030557', '7394130557', 'Budi Hartono', '11', 'Ayah', 'Usman', '1927-12-31', 'L', NULL, '3 Class 3', '1962-01-01', '9999-12-31');

INSERT INTO pendidikan
    (nik, nopeg_sk, nama_pegawai, tipe, level_pendidikan, kode_pendidikan, kejurusan, institute, pendidikan_saat_hiring, start_date, end_date)
VALUES
    ('00030557', '7394130557', 'Budi Hartono', 'PENDIDIKAN', 'S2', 'QEM00', 'Manajemen', 'UI', NULL, '2005-01-01', '2007-10-31'),
    ('00030557', '7394130557', 'Budi Hartono', 'PENDIDIKAN', 'S1', 'QEM00', 'Manajemen', 'STIE', 'S1', '2000-01-01', '2004-10-31');