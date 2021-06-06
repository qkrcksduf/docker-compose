DROP TABLE IF EXISTS model;
DROP TABLE IF EXISTS model_type;

CREATE TABLE model_type (
    model_type_id   UUID      DEFAULT uuid_generate_v4(),
    model_type_name VARCHAR(15)                         NOT NULL,
    join_date       TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modify_date     TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    description     VARCHAR(250),
    CONSTRAINT pk_model_type PRIMARY KEY (model_type_id)
);

ALTER TABLE model_type
    ADD CONSTRAINT uk_model_type_model_type_name UNIQUE (model_type_name);


CREATE TABLE model (
    model_id      UUID      DEFAULT uuid_generate_v4(),
    model_name    VARCHAR(30)                         NOT NULL,
    join_date     TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modify_date   TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    model_type_id UUID                                NOT NULL,
    description   VARCHAR(250),
    CONSTRAINT pk_model PRIMARY KEY (model_id)
);

ALTER TABLE model
    ADD CONSTRAINT uk_model_model_name UNIQUE (model_name);
ALTER TABLE model
    ADD CONSTRAINT fk_model_model_type_id FOREIGN KEY (model_type_id) REFERENCES model_type;

COMMIT;