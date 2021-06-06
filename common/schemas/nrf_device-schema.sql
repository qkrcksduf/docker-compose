DROP TABLE IF EXISTS actuator;
DROP TABLE IF EXISTS sensor;
DROP TABLE IF EXISTS device;

CREATE TABLE device (
    device_id     UUID       DEFAULT uuid_generate_v4(),
    device_serial VARCHAR(30)                          NOT NULL,
    device_name   VARCHAR(30)                          NOT NULL,
    device_type   VARCHAR(255)                         NOT NULL,
    location      VARCHAR(30)                          NOT NULL,
    status        VARCHAR(8) DEFAULT 'INSTALL'         NOT NULL,
    battery       INTEGER    DEFAULT 100               NOT NULL,
    ip_address    VARCHAR(40)                          NOT NULL,
    join_date     TIMESTAMP  DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modify_date   TIMESTAMP  DEFAULT CURRENT_TIMESTAMP NOT NULL,
    cnc_id        UUID                                 NOT NULL,
    protocol      VARCHAR(4)                           NOT NULL,
    sleep         BOOLEAN                              NOT NULL,
    description   VARCHAR(250),
    CONSTRAINT pk_device PRIMARY KEY (device_id)
);

ALTER TABLE device
    ADD CONSTRAINT uk_device_device_serial UNIQUE (device_serial);
ALTER TABLE device
    ADD CONSTRAINT uk_device_device_name UNIQUE (device_name);
ALTER TABLE device
    ADD CONSTRAINT uk_device_ip_address UNIQUE (ip_address);

CREATE TABLE sensor (
    sensor_id     UUID      DEFAULT uuid_generate_v4(),
    sensor_serial VARCHAR(30)                         NOT NULL,
    sensor_name   VARCHAR(30)                         NOT NULL,
    join_date     TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modify_date   TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    model_id      UUID,
    device_id     UUID                                NOT NULL,
    description   VARCHAR(250),
    CONSTRAINT pk_sensor PRIMARY KEY (sensor_id)
);

ALTER TABLE sensor
    ADD CONSTRAINT uk_sensor_sensor_serial UNIQUE (sensor_serial);
ALTER TABLE sensor
    ADD CONSTRAINT uk_sensor_sensor_name UNIQUE (sensor_name);
ALTER TABLE sensor
    ADD CONSTRAINT fk_sensor_device_id FOREIGN KEY (device_id) REFERENCES device;


CREATE TABLE actuator (
    actuator_id     UUID      DEFAULT uuid_generate_v4(),
    actuator_serial VARCHAR(30)                         NOT NULL,
    actuator_name   VARCHAR(30)                         NOT NULL,
    join_date       TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modify_date     TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    model_id        UUID                                NOT NULL,
    device_id       UUID                                NOT NULL,
    description     VARCHAR(250),
    CONSTRAINT pk_actuator PRIMARY KEY (actuator_id)
);

ALTER TABLE actuator
    ADD CONSTRAINT uk_actuator_actuator_serial UNIQUE (actuator_serial);
ALTER TABLE actuator
    ADD CONSTRAINT uk_actuator_actuator_name UNIQUE (actuator_name);
ALTER TABLE actuator
    ADD CONSTRAINT fk_sensor_device_id FOREIGN KEY (device_id) REFERENCES device;

commit;