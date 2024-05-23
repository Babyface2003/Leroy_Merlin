CREATE TABLE Flights (
    icao24 VARCHAR(10) PRIMARY KEY,
    callsign VARCHAR(10),
    origin_country VARCHAR(50),
    last_contact INT,
    longitude DOUBLE,
    latitude DOUBLE,
    baro_altitude DOUBLE,
    on_ground BOOLEAN,
    velocity DOUBLE,
    true_track DOUBLE,
    vertical_rate DOUBLE,
    sensors VARCHAR(50),
    geo_altitude DOUBLE,
    squawk VARCHAR(10),
    spi BOOLEAN,
    position_source INT
);
