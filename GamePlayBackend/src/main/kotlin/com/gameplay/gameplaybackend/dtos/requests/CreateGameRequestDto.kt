package com.gameplay.gameplaybackend.dtos.requests

data class CreateGameRequestDto (
    val name:String,
    val description:String,
    val imageUrl:String,
    val bannerUrl:String
)