CREATE TABLE gameRoom (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  id_category BIGINT NOT NULL,
  id_game BIGINT NOT NULL,
  date VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  CONSTRAINT fk_gameRoom_category FOREIGN KEY (id_category) REFERENCES categories(id),
  CONSTRAINT fk_gameRoom_game FOREIGN KEY (id_game) REFERENCES games(id)
);