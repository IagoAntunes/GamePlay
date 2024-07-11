package com.gameplay.gameplaybackend.dtos.requests

data class CreateGameRoomRequestDto(
    val date:String,
    val description:String,

    val idGame:Long,
    val idCategory:Long,
    val idUserOwner:Long
)