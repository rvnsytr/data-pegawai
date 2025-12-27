USE tmp_data_pegawai;

CREATE OR ALTER VIEW view_base_hirarki AS
SELECT
    dp.nik,
    dp.nama_pegawai,
    dp.nopeg_sk,
    dp.email,

    h.position_title as jabatan,
    dp.level_jabatan,

    h.kode_satker,
    h.kode_posisi,
    h.posisi_id_sap,
    h.kode_posisi_superior,
    h.posisi_id_sap_superior
FROM view_data_pribadi dp
RIGHT JOIN hirarki h
ON dp.kode_posisi = h.kode_posisi
    AND dp.posisi_id_sap = h.posisi_id_sap;

CREATE OR ALTER PROCEDURE get_all_hirarki
AS
BEGIN
    DROP TABLE IF EXISTS #hr;

    WITH hirarki AS (
        SELECT
            hwdp.posisi_id_sap AS root,
            hwdp.*,
            0 AS lvl
        FROM view_base_hirarki hwdp

        UNION ALL

        SELECT
            h.root,
            parent.*,
            h.lvl + 1
        FROM view_base_hirarki parent
        JOIN hirarki h ON h.kode_posisi_superior = parent.kode_posisi
    )

    SELECT * INTO #hr FROM hirarki;

    DECLARE @maxlvl INT;
    SELECT @maxlvl = MAX(lvl) FROM #hr;

    DECLARE @sql NVARCHAR(MAX) = N'SELECT';
    DECLARE @i INT = 0;
    DECLARE @suffix VARCHAR(10)

    WHILE @i <= @maxlvl
    BEGIN
        SET @suffix = CASE WHEN @i = 0 THEN '' ELSE CAST(@i AS VARCHAR) END;

        SET @sql += '
            MAX(CASE WHEN lvl = ' + CAST(@i AS VARCHAR) + ' THEN nik END) AS nik' + @suffix + ',
            MAX(CASE WHEN lvl = ' + CAST(@i AS VARCHAR) + ' THEN nama_pegawai END) AS nama_pegawai' + @suffix + ',
            MAX(CASE WHEN lvl = ' + CAST(@i AS VARCHAR) + ' THEN nopeg_sk END) AS nopeg_sk' + @suffix + ',
            MAX(CASE WHEN lvl = ' + CAST(@i AS VARCHAR) + ' THEN email END) AS email' + @suffix + ',
            MAX(CASE WHEN lvl = ' + CAST(@i AS VARCHAR) + ' THEN jabatan END) AS jabatan' + @suffix + ',
            MAX(CASE WHEN lvl = ' + CAST(@i AS VARCHAR) + ' THEN kode_satker END) AS kode_satker' + @suffix + ',
            MAX(CASE WHEN lvl = ' + CAST(@i AS VARCHAR) + ' THEN level_jabatan END) AS level_jabatan' + @suffix + ',

            MAX(CASE WHEN lvl = ' + CAST(@i AS VARCHAR) + ' THEN kode_posisi END) AS kode_posisi' + @suffix + ',
            MAX(CASE WHEN lvl = ' + CAST(@i AS VARCHAR) + ' THEN posisi_id_sap END) AS posisi_id_sap' + @suffix + ',
            MAX(CASE WHEN lvl = ' + CAST(@i AS VARCHAR) + ' THEN kode_posisi_superior END) AS kode_posisi_superior' + @suffix + ',
            MAX(CASE WHEN lvl = ' + CAST(@i AS VARCHAR) + ' THEN posisi_id_sap_superior END) AS posisi_id_sap_superior' + @suffix + ',';

        SET @i += 1;
    END;

    SET @sql = LEFT(@sql, LEN(@sql)-1);
    SET @sql += ' FROM #hr GROUP BY root ORDER BY root';

    EXEC sp_executesql @sql;

    DROP TABLE IF EXISTS #hr;
END
GO

CREATE OR ALTER VIEW view_hirarki AS
WITH hirarki AS (
    SELECT
        hwdp.posisi_id_sap AS anchor,
        hwdp.*,
        0 AS lvl
    FROM view_base_hirarki hwdp

    UNION ALL

    SELECT
        h.anchor,
        parent.*,
        h.lvl + 1
    FROM view_base_hirarki parent
    JOIN hirarki h ON h.kode_posisi_superior = parent.kode_posisi
)
SELECT * FROM (
    SELECT
        MAX(CASE WHEN lvl = 0 THEN nik END) AS nik,
        MAX(CASE WHEN lvl = 0 THEN nama_pegawai END) AS nama_pegawai,
        MAX(CASE WHEN lvl = 0 THEN nopeg_sk END) AS nopeg_sk,
        MAX(CASE WHEN lvl = 0 THEN email END) AS email,
        MAX(CASE WHEN lvl = 0 THEN jabatan END) AS jabatan,
        MAX(CASE WHEN lvl = 0 THEN level_jabatan END) AS level_jabatan,
        MAX(CASE WHEN lvl = 0 THEN kode_satker END) AS kode_satker,
        MAX(CASE WHEN lvl = 0 THEN kode_posisi END) AS kode_posisi,
        MAX(CASE WHEN lvl = 0 THEN posisi_id_sap END) AS posisi_id_sap,
        MAX(CASE WHEN lvl = 0 THEN kode_posisi_superior END) AS kode_posisi_superior,
        MAX(CASE WHEN lvl = 0 THEN posisi_id_sap_superior END) AS posisi_id_sap_superior,

        MAX(CASE WHEN lvl = 1 THEN nik END) AS nik1,
        MAX(CASE WHEN lvl = 1 THEN nama_pegawai END) AS nama_pegawai1,
        MAX(CASE WHEN lvl = 1 THEN nopeg_sk END) AS nopeg_sk1,
        MAX(CASE WHEN lvl = 1 THEN email END) AS email1,
        MAX(CASE WHEN lvl = 1 THEN jabatan END) AS jabatan1,
        MAX(CASE WHEN lvl = 1 THEN level_jabatan END) AS level_jabatan1,
        MAX(CASE WHEN lvl = 1 THEN kode_satker END) AS kode_satker1,
        MAX(CASE WHEN lvl = 1 THEN kode_posisi END) AS kode_posisi1,
        MAX(CASE WHEN lvl = 1 THEN posisi_id_sap END) AS posisi_id_sap1,
        MAX(CASE WHEN lvl = 1 THEN kode_posisi_superior END) AS kode_posisi_superior1,
        MAX(CASE WHEN lvl = 1 THEN posisi_id_sap_superior END) AS posisi_id_sap_superior1,

        MAX(CASE WHEN lvl = 2 THEN nik END) AS nik2,
        MAX(CASE WHEN lvl = 2 THEN nama_pegawai END) AS nama_pegawai2,
        MAX(CASE WHEN lvl = 2 THEN nopeg_sk END) AS nopeg_sk2,
        MAX(CASE WHEN lvl = 2 THEN email END) AS email2,
        MAX(CASE WHEN lvl = 2 THEN jabatan END) AS jabatan2,
        MAX(CASE WHEN lvl = 2 THEN level_jabatan END) AS level_jabatan2,
        MAX(CASE WHEN lvl = 2 THEN kode_satker END) AS kode_satker2,
        MAX(CASE WHEN lvl = 2 THEN kode_posisi END) AS kode_posisi2,
        MAX(CASE WHEN lvl = 2 THEN posisi_id_sap END) AS posisi_id_sap2,
        MAX(CASE WHEN lvl = 2 THEN kode_posisi_superior END) AS kode_posisi_superior2,
        MAX(CASE WHEN lvl = 2 THEN posisi_id_sap_superior END) AS posisi_id_sap_superior2,

        MAX(CASE WHEN lvl = 3 THEN nik END) AS nik3,
        MAX(CASE WHEN lvl = 3 THEN nama_pegawai END) AS nama_pegawai3,
        MAX(CASE WHEN lvl = 3 THEN nopeg_sk END) AS nopeg_sk3,
        MAX(CASE WHEN lvl = 3 THEN email END) AS email3,
        MAX(CASE WHEN lvl = 3 THEN jabatan END) AS jabatan3,
        MAX(CASE WHEN lvl = 3 THEN level_jabatan END) AS level_jabatan3,
        MAX(CASE WHEN lvl = 3 THEN kode_satker END) AS kode_satker3,
        MAX(CASE WHEN lvl = 3 THEN kode_posisi END) AS kode_posisi3,
        MAX(CASE WHEN lvl = 3 THEN posisi_id_sap END) AS posisi_id_sap3,
        MAX(CASE WHEN lvl = 3 THEN kode_posisi_superior END) AS kode_posisi_superior3,
        MAX(CASE WHEN lvl = 3 THEN posisi_id_sap_superior END) AS posisi_id_sap_superior3,

        MAX(CASE WHEN lvl = 4 THEN nik END) AS nik4,
        MAX(CASE WHEN lvl = 4 THEN nama_pegawai END) AS nama_pegawai4,
        MAX(CASE WHEN lvl = 4 THEN nopeg_sk END) AS nopeg_sk4,
        MAX(CASE WHEN lvl = 4 THEN email END) AS email4,
        MAX(CASE WHEN lvl = 4 THEN jabatan END) AS jabatan4,
        MAX(CASE WHEN lvl = 4 THEN level_jabatan END) AS level_jabatan4,
        MAX(CASE WHEN lvl = 4 THEN kode_satker END) AS kode_satker4,
        MAX(CASE WHEN lvl = 4 THEN kode_posisi END) AS kode_posisi4,
        MAX(CASE WHEN lvl = 4 THEN posisi_id_sap END) AS posisi_id_sap4,
        MAX(CASE WHEN lvl = 4 THEN kode_posisi_superior END) AS kode_posisi_superior4,
        MAX(CASE WHEN lvl = 4 THEN posisi_id_sap_superior END) AS posisi_id_sap_superior4,

        MAX(CASE WHEN lvl = 5 THEN nik END) AS nik5,
        MAX(CASE WHEN lvl = 5 THEN nama_pegawai END) AS nama_pegawai5,
        MAX(CASE WHEN lvl = 5 THEN nopeg_sk END) AS nopeg_sk5,
        MAX(CASE WHEN lvl = 5 THEN email END) AS email5,
        MAX(CASE WHEN lvl = 5 THEN jabatan END) AS jabatan5,
        MAX(CASE WHEN lvl = 5 THEN level_jabatan END) AS level_jabatan5,
        MAX(CASE WHEN lvl = 5 THEN kode_satker END) AS kode_satker5,
        MAX(CASE WHEN lvl = 5 THEN kode_posisi END) AS kode_posisi5,
        MAX(CASE WHEN lvl = 5 THEN posisi_id_sap END) AS posisi_id_sap5,
        MAX(CASE WHEN lvl = 5 THEN kode_posisi_superior END) AS kode_posisi_superior5,
        MAX(CASE WHEN lvl = 5 THEN posisi_id_sap_superior END) AS posisi_id_sap_superior5,

        MAX(CASE WHEN lvl = 6 THEN nik END) AS nik6,
        MAX(CASE WHEN lvl = 6 THEN nama_pegawai END) AS nama_pegawai6,
        MAX(CASE WHEN lvl = 6 THEN nopeg_sk END) AS nopeg_sk6,
        MAX(CASE WHEN lvl = 6 THEN email END) AS email6,
        MAX(CASE WHEN lvl = 6 THEN jabatan END) AS jabatan6,
        MAX(CASE WHEN lvl = 6 THEN level_jabatan END) AS level_jabatan6,
        MAX(CASE WHEN lvl = 6 THEN kode_satker END) AS kode_satker6,
        MAX(CASE WHEN lvl = 6 THEN kode_posisi END) AS kode_posisi6,
        MAX(CASE WHEN lvl = 6 THEN posisi_id_sap END) AS posisi_id_sap6,
        MAX(CASE WHEN lvl = 6 THEN kode_posisi_superior END) AS kode_posisi_superior6,
        MAX(CASE WHEN lvl = 6 THEN posisi_id_sap_superior END) AS posisi_id_sap_superior6,

        MAX(CASE WHEN lvl = 7 THEN nik END) AS nik7,
        MAX(CASE WHEN lvl = 7 THEN nama_pegawai END) AS nama_pegawai7,
        MAX(CASE WHEN lvl = 7 THEN nopeg_sk END) AS nopeg_sk7,
        MAX(CASE WHEN lvl = 7 THEN email END) AS email7,
        MAX(CASE WHEN lvl = 7 THEN jabatan END) AS jabatan7,
        MAX(CASE WHEN lvl = 7 THEN level_jabatan END) AS level_jabatan7,
        MAX(CASE WHEN lvl = 7 THEN kode_satker END) AS kode_satker7,
        MAX(CASE WHEN lvl = 7 THEN kode_posisi END) AS kode_posisi7,
        MAX(CASE WHEN lvl = 7 THEN posisi_id_sap END) AS posisi_id_sap7,
        MAX(CASE WHEN lvl = 7 THEN kode_posisi_superior END) AS kode_posisi_superior7,
        MAX(CASE WHEN lvl = 7 THEN posisi_id_sap_superior END) AS posisi_id_sap_superior7,

        MAX(CASE WHEN lvl = 8 THEN nik END) AS nik8,
        MAX(CASE WHEN lvl = 8 THEN nama_pegawai END) AS nama_pegawai8,
        MAX(CASE WHEN lvl = 8 THEN nopeg_sk END) AS nopeg_sk8,
        MAX(CASE WHEN lvl = 8 THEN email END) AS email8,
        MAX(CASE WHEN lvl = 8 THEN jabatan END) AS jabatan8,
        MAX(CASE WHEN lvl = 8 THEN level_jabatan END) AS level_jabatan8,
        MAX(CASE WHEN lvl = 8 THEN kode_satker END) AS kode_satker8,
        MAX(CASE WHEN lvl = 8 THEN kode_posisi END) AS kode_posisi8,
        MAX(CASE WHEN lvl = 8 THEN posisi_id_sap END) AS posisi_id_sap8,
        MAX(CASE WHEN lvl = 8 THEN kode_posisi_superior END) AS kode_posisi_superior8,
        MAX(CASE WHEN lvl = 8 THEN posisi_id_sap_superior END) AS posisi_id_sap_superior8
    FROM hirarki
    GROUP BY anchor
) AS result;