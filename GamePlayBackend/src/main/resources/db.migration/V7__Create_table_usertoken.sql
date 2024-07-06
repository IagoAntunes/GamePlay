CREATE TABLE userToken (
   id BIGINT AUTO_INCREMENT PRIMARY KEY,
   token VARCHAR(255) NOT NULL,
   id_user BIGINT NOT NULL,
   CONSTRAINT fk_usertoken_users FOREIGN KEY (id_user) REFERENCES users(id),
);