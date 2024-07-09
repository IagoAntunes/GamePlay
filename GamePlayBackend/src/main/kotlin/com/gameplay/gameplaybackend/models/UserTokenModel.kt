package com.gameplay.gameplaybackend.models

import jakarta.persistence.*

@Entity
@Table(name = "userTokens")
class UserTokenModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id:Long = 0

    @Column(name = "token", nullable = false)
    var token:String = ""

    @Column(name = "user_id", nullable = false)
    var userId:Long = 0
}