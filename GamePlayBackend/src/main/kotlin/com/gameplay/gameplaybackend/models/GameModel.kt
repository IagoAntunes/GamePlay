package com.gameplay.gameplaybackend.models

import jakarta.persistence.*

@Entity
@Table(name= "games")
class GameModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id:Long = 0
    @Column(nullable = false, name = "name")
    val name:String = ""
    @Column(nullable = false, name =  "image_url")
    val imageUrl: String = ""

}