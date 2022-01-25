CREATE PROCEDURE insert_vbl_to_locations()
LANGUAGE plpgsql

AS
$$
BEGIN
    INSERT INTO locations (loc_iso_code, loc_name)
    SELECT DISTINCT vbl_iso_code, vbl_location
    FROM vaccines_by_location

    COMMIT;

END;
$$ 