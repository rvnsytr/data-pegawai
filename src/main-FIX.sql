WITH hirarki AS (
    -- Anchor: start from every position
    SELECT
        hwdp.*,
        0 AS lvl,
        kode_posisi AS root_posisi
    FROM view_hirarki_with_dp hwdp

    UNION ALL

    -- Recursive: go upward toward TOP
    SELECT
        parent.*,
        h.lvl + 1,
        h.root_posisi
    FROM view_hirarki_with_dp parent
    JOIN hirarki h ON h.kode_posisi_superior = parent.kode_posisi
),

flattened AS (
    SELECT
        root_posisi,

        -- lvl0 (self)
        MAX(CASE WHEN lvl = 0 THEN nik END) AS nik,
        MAX(CASE WHEN lvl = 0 THEN nama_pegawai END) AS nama_pegawai,
        MAX(CASE WHEN lvl = 0 THEN nopeg_sk END) AS nopeg_sk,
        MAX(CASE WHEN lvl = 0 THEN email END) AS email,
        MAX(CASE WHEN lvl = 0 THEN jabatan END) AS jabatan,
        MAX(CASE WHEN lvl = 0 THEN level_jabatan END) AS level_jabatan,
        MAX(CASE WHEN lvl = 0 THEN kode_posisi END) AS kode_posisi,
        MAX(CASE WHEN lvl = 0 THEN posisi_id_sap END) AS posisi_id_sap,
        MAX(CASE WHEN lvl = 0 THEN kode_satker END) AS kode_satker,
        MAX(CASE WHEN lvl = 0 THEN kode_posisi_superior END) AS kode_posisi_superior,
        MAX(CASE WHEN lvl = 0 THEN posisi_id_sap_superior END) AS posisi_id_sap_superior,

        -- lvl1
        MAX(CASE WHEN lvl = 1 THEN nik END) AS nik1,
        MAX(CASE WHEN lvl = 1 THEN nama_pegawai END) AS nama_pegawai1,
        MAX(CASE WHEN lvl = 1 THEN nopeg_sk END) AS nopeg_sk1,
        MAX(CASE WHEN lvl = 1 THEN email END) AS email1,
        MAX(CASE WHEN lvl = 1 THEN jabatan END) AS jabatan1,
        MAX(CASE WHEN lvl = 1 THEN level_jabatan END) AS level_jabatan1,
        MAX(CASE WHEN lvl = 1 THEN kode_posisi END) AS kode_posisi1,
        MAX(CASE WHEN lvl = 1 THEN posisi_id_sap END) AS posisi_id_sap1,
        MAX(CASE WHEN lvl = 1 THEN kode_satker END) AS kode_satker1,
        MAX(CASE WHEN lvl = 1 THEN kode_posisi_superior END) AS kode_posisi_superior1,
        MAX(CASE WHEN lvl = 1 THEN posisi_id_sap_superior END) AS posisi_id_sap_superior1,

        -- lvl2
        MAX(CASE WHEN lvl = 2 THEN nik END) AS nik2,
        MAX(CASE WHEN lvl = 2 THEN nama_pegawai END) AS nama_pegawai2,
        MAX(CASE WHEN lvl = 2 THEN nopeg_sk END) AS nopeg_sk2,
        MAX(CASE WHEN lvl = 2 THEN email END) AS email2,
        MAX(CASE WHEN lvl = 2 THEN jabatan END) AS jabatan2,
        MAX(CASE WHEN lvl = 2 THEN level_jabatan END) AS level_jabatan2,
        MAX(CASE WHEN lvl = 2 THEN kode_posisi END) AS kode_posisi2,
        MAX(CASE WHEN lvl = 2 THEN posisi_id_sap END) AS posisi_id_sap2,
        MAX(CASE WHEN lvl = 2 THEN kode_satker END) AS kode_satker2,
        MAX(CASE WHEN lvl = 2 THEN kode_posisi_superior END) AS kode_posisi_superior2,
        MAX(CASE WHEN lvl = 2 THEN posisi_id_sap_superior END) AS posisi_id_sap_superior2,

        -- lvl3 (TOP)
        MAX(CASE WHEN lvl = 3 THEN nik END) AS nik3,
        MAX(CASE WHEN lvl = 3 THEN nama_pegawai END) AS nama_pegawai3,
        MAX(CASE WHEN lvl = 3 THEN nopeg_sk END) AS nopeg_sk3,
        MAX(CASE WHEN lvl = 3 THEN email END) AS email3,
        MAX(CASE WHEN lvl = 3 THEN jabatan END) AS jabatan3,
        MAX(CASE WHEN lvl = 3 THEN level_jabatan END) AS level_jabatan3,
        MAX(CASE WHEN lvl = 3 THEN kode_posisi END) AS kode_posisi3,
        MAX(CASE WHEN lvl = 3 THEN posisi_id_sap END) AS posisi_id_sap3,
        MAX(CASE WHEN lvl = 3 THEN kode_satker END) AS kode_satker3,
        MAX(CASE WHEN lvl = 3 THEN kode_posisi_superior END) AS kode_posisi_superior3,
        MAX(CASE WHEN lvl = 3 THEN posisi_id_sap_superior END) AS posisi_id_sap_superior3
    FROM hirarki
    GROUP BY root_posisi
)

SELECT * FROM flattened;
