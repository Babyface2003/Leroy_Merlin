# Leroy_Merlin
На основании опросов выяснилось, что посетители магазина часто сетуют на нехватку консультантов в торговых залах. 
Какие метрики эффективности для директора магазина вы могли бы привести в качестве подспорья в этом вопросе?

1)Среднее время обслуживания клиентов - чтобы понять, насколько быстро консультанты справляются с обслуживанием.
2)Количество обслуженных клиентов на одного консультанта - для оценки рабочей нагрузки на консультантов.
3)Уровень удовлетворенности клиентов - можно собирать через опросы или обратную связь.
4)Время ожидания клиентов - сколько времени клиенты ждут до того, как их обслужит консультант.
5)Плотность клиентов на квадратный метр в разные часы - чтобы понять пиковые часы и дни, когда требуется больше консультантов.

№3.1
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


№3.2
https://opensky-network.org/api/states/all
Предоставляет информацию о находящихся в воздухе самолетах в режиме реального времени.

Запрос:
Method: GET
Parameters: None
Ответ:
time: UNIX timestamp of the data snapshot
states: List of aircraft states
Поля состояния самолетов:
icao24: Unique ICAO 24-bit address of the aircraft
callsign: Flight identifier
origin_country: Country of aircraft registration
last_contact: UNIX timestamp of last received message
longitude: WGS-84 longitude
latitude: WGS-84 latitude
baro_altitude: Barometric altitude in meters
on_ground: Boolean indicating if the aircraft is on the ground
velocity: Velocity over ground in m/s
true_track: True track in degrees
vertical_rate: Vertical rate in m/s
sensors: Serial numbers of sensors that received the message
geo_altitude: Geometric altitude in meters
squawk: Transponder code
spi: Special Position Indicator
position_source: Position source (0=ADS-B, 1=ASTERIX, 2=MLAT)

№3.3 Файл

