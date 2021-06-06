DROP TABLE IF EXISTS cnc;

CREATE TABLE cnc (
    cnc_id      UUID       DEFAULT uuid_generate_v4(),
    cnc_serial  VARCHAR(30)                          NOT NULL,
    cnc_name    VARCHAR(30)                          NOT NULL,
    location    VARCHAR(30)                          NOT NULL,
    status      VARCHAR(8) DEFAULT 'INSTALL'         NOT NULL,
    ip_address  VARCHAR(40),
    join_date   TIMESTAMP  DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modify_date TIMESTAMP  DEFAULT CURRENT_TIMESTAMP NOT NULL,
    group_id    UUID                               NOT NULL,
    description VARCHAR(250),
    CONSTRAINT pk_cnc PRIMARY KEY (cnc_id)
);

ALTER TABLE cnc
    ADD CONSTRAINT uk_cnc_cnc_serial UNIQUE (cnc_serial);
ALTER TABLE cnc
    ADD CONSTRAINT uk_cnc_cnc_name UNIQUE (cnc_name);
ALTER TABLE cnc
    ADD CONSTRAINT uk_cnc_ip_address UNIQUE (ip_address);

COMMIT;