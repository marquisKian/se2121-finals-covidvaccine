CREATE FUNCTION location_vaccinations (
  location_name VARCHAR(50),
  given_date VARCHAR(10)
)
RETURNS VOID
LANGUAGE plpgsql
AS
$$
DECLARE
  rec record;
BEGIN
  RAISE NOTICE 'For the month of %:', TO_CHAR( TO_TIMESTAMP(given_date, 'YYYY-MM'), 'Month YYYY');
  FOR rec IN 
    SELECT vbm_vaccine, SUM(vbm_total_vaccinations)::BIGINT AS "total_vax_used"
      FROM ( SELECT vbm_vaccine, vbm_total_vaccinations, vbm_location, vbm_date 
            FROM vaccinations_by_manufacturer
           WHERE vbm_location = location_name AND TO_CHAR( TO_TIMESTAMP(given_date, 'YYYY-MM'), 'YYYY MONTH') = TO_CHAR(vbm_date, 'YYYY MONTH')
        GROUP BY vbm_vaccine, vbm_total_vaccinations, vbm_location, vbm_date 
      ) AS nested_query 
    GROUP BY vbm_vaccine 
      LOOP
      RAISE NOTICE ' % has % vaccinations', quote_ident(rec.vbm_vaccine), rec.total_vax_used;
  END LOOP;

    IF NOT FOUND THEN 
      RAISE NOTICE 'Invalid Input: Country or Date is invalid';
    END IF;
END;
$$