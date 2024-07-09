package com.gameplay.gameplaybackend.dtos

data class UpdateGameRequestDto (
    val id:Long,
    val name:String,
    val imageUrl:String
)