CREATE FUNCTION top_10_vax ()
    RETURNS VOID
LANGUAGE plpgsql
AS
$$
DECLARE
recc record;
var_counter INT := 1;
BEGIN
    FOR recc IN (SELECT vbm_location AS loc,
        TO_CHAR(vbm_date, 'YYYY-MM-DD') AS vaccination_date,
        SUM(vbm_total_vaccinations) AS vbm_total_vaccinations
        FROM vaccinations_by_manufacturer
        GROUP BY loc, vaccination_date
        ORDER BY vbm_total_vaccinations DESC
        LIMIT 10)
    LOOP
        RAISE NOTICE 'Top % - & with % vccinations on %' ,  var_counter, recc.vbm_total_vaccinations, recc.vaccination_date;
            var_counter := var_counter + 1;
        END LOOP;
END;
$$