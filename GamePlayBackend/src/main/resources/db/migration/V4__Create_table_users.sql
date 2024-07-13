CREATE TABLE users (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  id_role BIGINT NOT NULL,
  CONSTRAINT fk_users_roles FOREIGN KEY (id_role) REFERENCES roles(id)
);