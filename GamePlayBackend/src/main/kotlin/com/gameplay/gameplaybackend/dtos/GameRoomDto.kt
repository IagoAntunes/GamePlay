package com.gameplay.gameplaybackend.dtos
data class GameRoomDto(
    val id:Long,
    val date:String,
    val description:String,
    val idGame:Long,
    val category: CategoryDto,
    val userOwner:UserDto?,
    val game:GameDto,
    var listPlayers: List<GameRoomPlayersDto>
)