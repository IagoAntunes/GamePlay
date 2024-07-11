package com.gameplay.gameplaybackend.dtos

import com.gameplay.gameplaybackend.models.GameRoomPlayersModel
import jakarta.persistence.*

data class GameRoomRelationPlayerDto (
    val id:Long = 0,
    val idCategory:Long = 0,
    var idGame:Long = 0,
    var date:String = "",
    var description:String = ""
    )