DROP TABLE IF EXISTS account_group;
DROP TABLE IF EXISTS account;
DROP TABLE IF EXISTS groups;

CREATE TABLE account (
    account_id   UUID,
    username     VARCHAR(15)                           NOT NULL,
    account_name VARCHAR(30)                           NOT NULL,
    password     VARCHAR(255)                          NOT NULL,
    email        VARCHAR(50)                           NOT NULL,
    join_date    TIMESTAMP   DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modify_date  TIMESTAMP   DEFAULT CURRENT_TIMESTAMP NOT NULL,
    account_role VARCHAR(10) DEFAULT 'ROLE_USER'       NOT NULL,
    description  VARCHAR(250),
    CONSTRAINT pk_account PRIMARY KEY (account_id)
);

ALTER TABLE account
    ADD CONSTRAINT uk_account_username UNIQUE (username);
ALTER TABLE account
    ADD CONSTRAINT uk_account_email UNIQUE (email);


CREATE TABLE groups (
    group_id    UUID,
    group_name  VARCHAR(30)                         NOT NULL,
    join_date   TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modify_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    description VARCHAR(250),
    CONSTRAINT pk_groups PRIMARY KEY (group_id)
);

ALTER TABLE groups
    ADD CONSTRAINT uk_groups_name UNIQUE (group_name);


CREATE TABLE account_group (
    account_group_id UUID,
    account_id       UUID,
    group_id         UUID,
    group_role       VARCHAR(255) NOT NULL,
    CONSTRAINT pk_account_group PRIMARY KEY (account_group_id)
);

ALTER TABLE account_group
    ADD CONSTRAINT fk_account_group_account_id FOREIGN KEY (account_id) REFERENCES account;
ALTER TABLE account_group
    ADD CONSTRAINT fk_account_group_group_id FOREIGN KEY (group_id) REFERENCES groups;
ALTER TABLE account_group
    ADD CONSTRAINT uk_account_id_group_id UNIQUE (account_id, group_id);
