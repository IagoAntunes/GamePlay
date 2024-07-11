package com.gameplay.gameplaybackend.dtos

data class EnterGameRoomRequestDto(
    val idGameRoom: Long,
    val idUser: Long
)