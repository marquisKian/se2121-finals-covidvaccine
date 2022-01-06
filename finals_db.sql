

CREATE TABLE locations (

    loc_iso_code TEXT PRIMARY KEY,
    loc_name VARCHAR(50)
);

COPY locations FROM 'C:\Users\Kian\Documents\GitHub\se2121-finals-covidvaccine\covid-19-data-master\public\data\vaccinations' DELIMITER ',' CSV;


CREATE TABLE  vaccinations_by_manufacturer (

    vbm_id INT PRIMARY KEY,
    vbm_location VARCHAR(30) NOT NULL,
    vbm_date DATE NOT NULL,
    vbm_vaccine VARCHAR(20) NOT NULL,
    vbm_total_vaccinations  INT NOT NULL
);

COPY vaccinations_by_manufacturer FROM 'C:\Users\Kian\Documents\GitHub\se2121-finals-covidvaccine\covid-19-data-master\public\data\vaccinations' DELIMITER',' CSV;


CREATE TABLE vaccines (

    vac_name TEXT PRIMARY KEY;
);

COPY vaccines FROM 'C:\Users\Kian\Documents\GitHub\se2121-finals-covidvaccine\covid-19-data-master\public\data\vaccinations' DELIMITER ',' CSV;

CREATE TABLE vaccinations_by_location (
    vbl_id SERIAL, 
    vbl_last__observation_date DATE,
    vbl_source_name VARCHAR(100),
    vbl_source_website VARCHAR(100)
);

COPY vaccinations_by_manufacturer FROM 'C:\Users\Kian\Documents\GitHub\se2121-finals-covidvaccine\covid-19-data-master\public\data\vaccinations' DELIMITER',' CSV;




