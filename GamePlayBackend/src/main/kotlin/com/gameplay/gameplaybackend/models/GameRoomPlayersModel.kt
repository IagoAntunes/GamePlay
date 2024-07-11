package com.gameplay.gameplaybackend.models

import com.fasterxml.jackson.annotation.JsonBackReference
import com.fasterxml.jackson.annotation.JsonIgnore
import jakarta.persistence.*

@Entity
@Table(name = "gameroomplayers")
class GameRoomPlayersModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id:Long = 0
    @Column(name = "id_user", nullable = false)
    var idUser:Long = 0
    @Column(name = "id_game_room", nullable = false)
    var idGameRoom:Long = 0

    @ManyToOne
    @JoinColumn(name = "id_user", insertable = false, updatable = false)
    lateinit var user:UserModel


    @ManyToOne
    @JoinColumn(name = "id_game_room", insertable = false, updatable = false)
    @JsonIgnore
    lateinit var gameRoom:GameRoomModel
}