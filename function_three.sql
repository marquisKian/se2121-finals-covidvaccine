CREATE FUNCTION vaccines_each_month_info()
   RETURNS TABLE (
       iso_code VARCHAR(10),
       vax_month TIMESTAMP WITH TIME ZONE,
       vax_name TEXT
   )
   LANGUAGE plpgsql
AS
$$
BEGIN
RETURN QUERY
SELECT loc_iso_code, each_month, vaxx_each_month
    FROM (
        SELECT each_month, loc, STRING_AGG("vaccines", ', ') AS "vaxx_each_month"
        FROM 
        ( SELECT vbm_location AS loc, DATE_TRUNC('month', vbm_date) as each_month
            FROM vaccinations_by_manufacturer
        GROUP BY DATE_TRUNC('month', vbm_date), vaccines, vbm_location
        ORDER BY vbm_location, DATE_TRUNC('month', vbm_date )) AS inner_nest
    GROUP BY each_month, loc
    ORDER BY loc ) AS outer_nest;


END;
$$

