DROP TABLE IF EXISTS sensing_event_sourcing;

CREATE TABLE sensing_event_sourcing
(
    sensing_id    UUID,
    sensor_id     UUID                                NOT NULL,
    sensing_time  TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    sensing_value JSONB                               NOT NULL,
    environment_value JSONB                               NOT NULL,
    CONSTRAINT pk_sensing_event_sourcing PRIMARY KEY (sensing_id)
);

COMMIT;
