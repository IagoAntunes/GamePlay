package com.gameplay.gameplaybackend.dtos

import com.fasterxml.jackson.annotation.JsonIgnore
import com.gameplay.gameplaybackend.models.GameRoomModel
import com.gameplay.gameplaybackend.models.UserModel
import jakarta.persistence.*

data class GameRoomPlayersDto (
    val id:Long = 0,
    val user: UserDto
)