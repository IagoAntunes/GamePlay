package com.gameplay.gameplaybackend.models

import jakarta.persistence.*

@Entity
@Table(name = "userTokens")
class UserTokenModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    val id:Long = 0

    @Column(name = "token", nullable = false)
    val token:String = ""

    @Column(name = "user_id", nullable = false)
    val userId:Long = 0
}