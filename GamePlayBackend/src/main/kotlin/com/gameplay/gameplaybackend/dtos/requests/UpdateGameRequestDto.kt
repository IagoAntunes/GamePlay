package com.gameplay.gameplaybackend.dtos.requests

data class UpdateGameRequestDto (
    val id:Long,
    val name:String,
    val imageUrl:String
)