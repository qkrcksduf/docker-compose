DROP TABLE IF EXISTS actuating_event_sourcing;

CREATE TABLE actuating_event_sourcing (
    actuating_id UUID,
    actuator_id UUID NOT NULL,
    actuating_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    actuating_value VARCHAR(250) NOT NULL,
    result VARCHAR(250) DEFAULT 'RUNNING' NOT NULL,
    CONSTRAINT pk_actuating_event_sourcing PRIMARY KEY (actuating_id)
);

COMMIT;
