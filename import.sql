

COPY vaccines_by_location ( vbl_location, vbl_iso_code, vbl_vaccines, vbl_last__observation_date, vbl_source_name, vbl_source_website )
FROM 'C:\Users\Kian\Desktop\sql\locations.csv' 
WITH CSV HEADER;



COPY vaccinations_by_manufacturer ( vbm_location, vbm_date, vbm_vaccine, vbm_total_vaccinations )
FROM 'C:\Users\Kian\Desktop\sql\vaccinations-by-manufacturer.csv' 
WITH CSV HEADER;