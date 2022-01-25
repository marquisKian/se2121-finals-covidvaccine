
CREATE DATABASE covid_db;

CREATE TABLE locations(

    loc_name VARCHAR(50) NOT NULL,
    loc_iso_code VARCHAR(40) PRIMARY KEY
);

CREATE TABLE vaccines (

    vac_name VARCHAR(50) PRIMARY KEY
);

CREATE TABLE vaccinations_by_manufacturer (

    vbm_id BIGSERIAL PRIMARY KEY,
    vbm_location VARCHAR(100) NOT NULL,
    vbm_date DATE NOT NULL,
    vbm_vaccine VARCHAR(50) NOT NULL,
    vbm_total_vaccinations VARCHAR NOT NULL

);


CREATE TABLE vaccines_by_location (

    vbl_id BIGSERIAL PRIMARY KEY,
    vbl_location VARCHAR(100) NOT NULL,
    vbl_iso_code VARCHAR(20) NOT NULL,
    vbl_vaccines TEXT NOT NULL,
    vbl_last__observation_date DATE NOT NULL,
    vbl_source_name VARCHAR(100) NOT NULL,
    vbl_source_website VARCHAR(300)

);


