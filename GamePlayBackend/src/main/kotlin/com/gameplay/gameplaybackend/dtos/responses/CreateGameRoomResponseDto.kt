package com.gameplay.gameplaybackend.dtos.responses

data class CreateGameRoomResponseDto (
    val date:String,
    val description:String,

    val idGame:Long,
    val idCategory:Long,
    val idUserOwner:Long
)