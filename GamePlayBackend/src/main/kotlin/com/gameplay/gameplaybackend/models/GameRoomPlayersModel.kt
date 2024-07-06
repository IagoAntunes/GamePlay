package com.gameplay.gameplaybackend.models

import jakarta.persistence.*

@Entity
@Table(name = "gameRoomPlayers")
class GameRoomPlayersModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id:Long = 0
    @Column(name = "id_user", nullable = false)
    val idUser:Long = 0
    @Column(name = "id_game_room", nullable = false)
    val idGameRoom:Long = 0
}