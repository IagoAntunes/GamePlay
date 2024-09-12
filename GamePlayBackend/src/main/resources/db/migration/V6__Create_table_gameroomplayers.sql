CREATE TABLE gameroomplayers (
          id BIGINT AUTO_INCREMENT PRIMARY KEY,
          id_user BIGINT NOT NULL,
          id_game_room BIGINT NOT NULL,
      CONSTRAINT fk_gameRoomPlayer_user FOREIGN KEY (id_user) REFERENCES users(id),
      CONSTRAINT fk_gameRoomPlayer_gameRoom FOREIGN KEY (id_game_room) REFERENCES gameroom(id)
);
