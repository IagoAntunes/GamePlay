package com.gameplay.gameplaybackend.models

import jakarta.persistence.*

@Entity
@Table(name= "games")
class GameModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id:Long = 0
    @Column(nullable = false, name = "name")
    var name:String = ""
    @Column(nullable = false, name = "description")
    var description:String = ""
    @Column(nullable = false, name =  "image_url")
    var imageUrl: String = ""
    @Column(nullable = false, name =  "banner_url")
    var bannerUrl: String = ""

}