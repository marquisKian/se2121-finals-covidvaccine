CREATE PROCEDURE update_vaccination_number(
    additional_vaccinations INT,
    vaccine VARCHAR(50),
    location VARCHAR(90),
    date DATE
)
LANGUAGE plpgsql

AS
$$
BEGIN
    UPDATE vaccinations_by_manufacturer
    SET vbm_total_vaccinations = additional_vaccinations
    WHERE vbm_location = locations AND vbm_vaccine = vaccine AND vbm_date = date;
    COMMIT;
END;
$$
