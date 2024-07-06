package com.gameplay.gameplaybackend.models

import jakarta.persistence.*

@Entity
@Table(name = "gameRoom")
class GameRoomModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id:Long = 0
    @Column( name = "id_category",nullable = false)
    val idCategory:Long = 0
    @Column(name = "id_game", nullable = false)
    val idGame:Long = 0
    @Column(name = "date", nullable = false)
    val date:String = ""
    @Column(name = "description", nullable = false)
    val description:String = ""

}