package com.gameplay.gameplaybackend.dtos

data class GameDto(
    val id:Long,
    val name:String,
    val description:String,
    val imageUrl: String ,
    val bannerUrl:String
)